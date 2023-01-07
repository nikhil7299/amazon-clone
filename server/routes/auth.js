const express = require('express');
const authRouter = express.Router();
const User = require("../models/user");
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middleware/auth');

//SIGN UP ROUTE
authRouter.post('/api/signup', async (req, res) => {
    try {
        //get data from client
        //post data to DB
        //return that data to the user
        const { name, email, password } = req.body;
        // const existingUser = User.findOne({email : email})
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: "User with same email already exists!" })
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        //8 - hash salt
        let user = new User({
            email,
            password: hashedPassword,
            name,
        });

        user = await user.save();
        //name - required
        //email - required
        //password - required
        //address - default
        //_v - extra
        //_id - extra
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// SIGN IN ROUTE
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        // const user = await User.findOne({email:email});
        if (!user) {
            return res.status(400).json({ msg: "User with this email does not exist!" });

        }
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Incorrect password." });

        }
        const token = jwt.sign({ id: user._id }, "passwordKey");
        res.json({ token, ...user._doc });
        //? ... is object destructuring
        //{
        // 'token':'tokensmthng'
        //  'name':'nikhil'
        //  'email':'nn2@gmail.com'
        // }



    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//GET USER DATA

authRouter.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;


