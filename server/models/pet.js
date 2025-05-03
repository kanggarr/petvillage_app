const mongoose = require('mongoose');

const PetSchema = new mongoose.Schema({
  name: String,
  type: String,
  breed: String,
  age: Number,
  description: String,
});

module.exports = mongoose.model('Pet', PetSchema);
