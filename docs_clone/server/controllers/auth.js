const User=require('../models/user');
const {StatusCodes}=require('http-status-codes');
const signUpUser=async (req,res)=>{
    try {
        const {email,name,profilePic}=req.body;
        const user=await User.findOne({email});
        if(!user){
            const newUser= await User.create({email,name,profilePic});
            res.status(StatusCodes.CREATED).json({user:newUser});
        }
        res.status(StatusCodes.OK).json({user});
    } catch (error) {
        console.log(error);
    }
}
module.exports=signUpUser;