const { json } = require("express");
const express = require("express");
const bcryptjs= require('bcryptjs');
const jwt = require('jsonwebtoken')
const User = require('../models/user');
const auth = require("../middlewares/auth");



const authRouter = express.Router();

// Signup Route

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// Sing up . Register new users

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
authRouter.post('/api/signup', async (req,res) => {
 try{
    //get data from clinet 
    const {name, email,password} = req.body;
    // post to database
    const existingUser = await User.findOne({email});
if (existingUser) {
    return res.status(400).json({msg: "User with the same email already exist"});

}
hashedPassword= await bcryptjs.hash(password, 8)

let user = new User({

email,
password:hashedPassword,
name,


})
user = await user.save();
res.json(user);
    // retrun the data to the user
} catch (e) {
    res.status(500),json({error: e.message});
}

});

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// Sign iN User Api

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

authRouter.post('/api/signin', async (req,res)=>{

    try {
        const {email, password} = req.body;
        const user= await User.findOne({email});

        if(!user){
            return res.status(400).json({msg: 'User with this email does not exist'});
        }
       const isMatch = await bcryptjs.compare(password, user.password);

       if(!isMatch){
        return res.status(400).json({msg: "User credential does not match . Check your email and passowrd "})
       }
       const token = jwt.sign({id: user._id}, "passwordKey" );

       res.json({token,...user._doc});
    } catch (e) {
            res.status(500),json({error: e.message});

    }


})
// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// Validate User token  api


//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
authRouter.post('/tokenIsValid',  async (req, res) =>{

    try {
        const token = req.header('x-auth-token')
        if(!token) return res.json(false);
       const verified= jwt.verify(token, "passwordKey");
       if(!verified) return res.json(false);
       const user = await User.findById(verified.id)
       if(!user) return res.json(false);
       res.json(true);
    } catch (e) {
        res.status(500).json({error: e.message});
        
    }
});

// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

// Get User data api


//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

authRouter.get('/', auth, async (req,res) =>{
 const user = await User.findById(Req.user);

 res.json({...user._doc, token: req.token });
});

module.exports = authRouter;