const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    username: {
      type: String,
      required: [true, "Please add the username"]
    },
    email: {
      type: String,
      required: [true, "Please add the email address"],
      unique: [true, "Email address is already taken"]
    },
    password: {
      type: String,
      required: [true, "Please add password"]
    },
    phone_num: { 
      type: Number, 
      required: [true, "Please enter your phone number"],
      unique: [true, "This number is already used"]
    },
    otp: { type: String, required: false }, // เก็บ OTP ล่าสุด
    otpExpires: { type: Date, required: false }, // เวลาหมดอายุของ OTP
    isVerified: { type: Boolean, default: false } // สถานะยืนยันบัญชี
}, { timestamps: true });

module.exports = mongoose.model('User', UserSchema);