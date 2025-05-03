const asyncHandler = require("express-async-handler");
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

//@desc Login with email and password
//@route Post /users/login
//@access public
const loginUser = asyncHandler(async (req,res) => {
    try {
        console.log(req.body);
        const {email, password} = req.body;
        const user = await User.findOne({ email });

        if (!user) {
            res.status(404);
            throw new Error("This email address is not registered");
        }

        if(!email || !password) {
            res.status(400);
            throw new Error("All fields are mandatiry!");
        }

        //compare password with hashedpassword
        if(user && (await bcrypt.compare(password, user.password))){
            const accessToken = jwt.sign({
                user: {
                    username: user.username,
                    email: user.email,
                    id: user.id
                }}, 
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: "24h" }
            );
            // const refreshToken = jwt.sign({
            //     user: {
            //         username: user.username,
            //         email: user.email,
            //         id: user.id
            //     }}, 
            // process.env.REFRESH_TOKEN_SECRET,
            // { expiresIn: "1d" }
            // );
            return res.json({token: accessToken});
        }else {
            res.status(401);
            throw new Error("email or password is invalid");
        }
    } catch (error) {
        console.error("Login error:", error);
        res.status(500).json({ error: error.message });
    }
    
});

module.exports = loginUser;