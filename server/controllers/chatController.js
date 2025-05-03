const Message = require('../models/Message');

// ส่งข้อความ (เก็บลง MongoDB)
exports.sendMessage = async (req, res) => {
  try {
    const { sender, receiver, message } = req.body;

    const newMessage = new Message({ sender, receiver, message });
    await newMessage.save();

    res.status(201).json(newMessage);
  } catch (err) {
    res.status(500).json({ msg: "Server error" });
  }
};

// ดึงประวัติแชทระหว่างผู้ใช้ 2 คน
exports.getMessages = async (req, res) => {
  try {
    const { user1, user2 } = req.query; // รับ user ID ของคู่สนทนา

    const messages = await Message.find({
      $or: [
        { sender: user1, receiver: user2 },
        { sender: user2, receiver: user1 }
      ]
    }).sort({ createdAt: 1 });

    res.json(messages);
  } catch (err) {
    res.status(500).json({ msg: "Server error" });
  }
};
