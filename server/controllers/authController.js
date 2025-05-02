const User = require('../models/user');
const bcrypt = require('bcryptjs');
const sendOtp = require('../utils/sendOtp');

exports.register = async (req, res) => {
  try {
    const { username, email, password, phone_num } = req.body;

    // เช็คอีเมล
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({ msg: "รูปแบบอีเมลไม่ถูกต้อง" });
    }

    // เช็คเบอร์โทรศัพท์ (0x-xxx-xxxx หรือ 0xx-xxx-xxxx)
    const phoneRegex = /^0\d{1}-\d{3}-\d{4}$|^0\d{2}-\d{3}-\d{4}$/;
    if (!phoneRegex.test(phone_num)) {
      return res.status(400).json({ msg: "รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง (เช่น 08-123-4567 หรือ 081-123-4567)" });
    }

    // ตรวจสอบว่าอีเมลนี้มีอยู่แล้วหรือไม่
    let user = await User.findOne({ email });

    if (user) {
      if (user.isVerified) {
        return res.status(400).json({ msg: "Email already registered" });
      }

      return res.status(400).json({ msg: "Email already registered but not verified. Please verify your email." });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    const otpExpires = new Date(Date.now() + 5 * 60 * 1000); // 5 นาที

    user = new User({
      username,
      email,
      password: hashedPassword,
      phone_num,
      otp,
      otpExpires,
      isVerified: false
    });

    await user.save();
    await sendOtp(email, otp);

    res.status(201).json({
      msg: "OTP sent. Please verify your email.",
      email: user.email,       // ส่ง email กลับให้ frontend ไว้ใช้แสดงหรือยืนยัน
      otpExpires: otpExpires   // อาจส่งเวลากำหนดหมดอายุด้วยก็ได้
    });
    
  } catch (err) {
    console.error(err);
    res.status(500).json({ msg: "Server error" });
  }
};

exports.getUsers = async (req, res) => {
    try {
      const users = await User.find().select('-password'); // ซ่อน password
      res.json(users);
    } catch (err) {
      res.status(500).json({ msg: "Server error" });
    }
};

exports.updateUser = async (req, res) => {
    try {
      const { username } = req.body;
      const updatedUser = await User.findByIdAndUpdate(
        req.user.userId,
        { username },
        { new: true, runValidators: true }
      );
  
      if (!updatedUser) return res.status(404).json({ msg: "User not found" });
  
      res.json(updatedUser);
    } catch (err) {
      res.status(500).json({ msg: "Server error" });
    }
};

exports.deleteUser = async (req, res) => {
    try {
      await User.findByIdAndDelete(req.user.userId);
      res.json({ msg: "User deleted successfully" });
    } catch (err) {
      res.status(500).json({ msg: "Server error" });
    }
};

exports.verifyOtp = async (req, res) => {
    try {
      const { email, otp } = req.body;
  
      let user = await User.findOne({ email });
      if (!user) return res.status(400).json({ msg: "User not found" });
  
      if (user.isVerified) return res.status(400).json({ msg: "User already verified" });
  
      if (!user.otp || user.otp !== otp || new Date() > user.otpExpires) {
        return res.status(400).json({ msg: "Invalid or expired OTP" });
      }
  
      // อัปเดตสถานะบัญชีเป็น "Verified"
      user.isVerified = true;
      user.otp = null;
      user.otpExpires = null;
      await user.save();
  
      res.json({ msg: "Email verified successfully" });
    } catch (err) {
      res.status(500).json({ msg: "Server error" });
    }
};

exports.resendOtp = async (req, res) => {
    try {
      const { email } = req.body;
  
      let user = await User.findOne({ email });
      if (!user) return res.status(400).json({ msg: "User not found" });
  
      if (user.isVerified) return res.status(400).json({ msg: "User already verified" });
  
      // สร้าง OTP ใหม่
      const otp = Math.floor(100000 + Math.random() * 900000).toString();
      user.otp = otp;
      user.otpExpires = new Date(Date.now() + 5 * 60 * 1000); // หมดอายุใน 5 นาที
      await user.save();
  
      // ส่ง OTP ใหม่ไปยังอีเมล
      await sendOtp(email, otp);
  
      res.json({ msg: "New OTP sent successfully" });
    } catch (err) {
      res.status(500).json({ msg: "Server error" });
    }
};