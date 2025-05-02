const asyncHandler = require("express-async-handler");
const jwt = require("jsonwebtoken");

const logoutUser = asyncHandler(async (req, res) => {
  // Clear the token from client-side storage
  res.clearCookie("token");
  res.json({ message: "Logout successful" });
});

module.exports = { logoutUser };
