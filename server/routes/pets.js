// server.js หรือ routes/pets.js
const express = require('express');
const router = express.Router();
const Pet = require('../models/Pet'); // สมมติใช้ mongoose

// ตัวอย่าง endpoint: /pets?type=สุนัข
router.get('/pets', async (req, res) => {
  try {
    const { type } = req.query;

    let filter = {};
    if (type) {
      filter.type = type;
    }

    const pets = await Pet.find(filter);
    res.json(pets);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;
