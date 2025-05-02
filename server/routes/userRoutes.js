const express = require('express');
const router = express.Router();
const validateToken = require("../middleware/validateTokenHandler");
const User = require('../models/user'); // <-- ใช้ schema เดิมของคุณ

// สร้างผู้ใช้ใหม่
router.post('/', async (req, res) => {
  try {
    const newUser = new User(req.body);
    const savedUser = await newUser.save();
    res.status(201).json(savedUser);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// ดึงผู้ใช้ทั้งหมด
router.get('/', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
