const express=require('express');
const mongoose = require('mongoose');
const authRouter=require('./routes/auth')
require('dotenv').config();
const app=express();
app.use(express.json());
app.use('/api/v1',authRouter);
app.get('/',(req,res)=>{
    res.send('Hello')
})
const connectDB=require('./connectDB/connect');
const PORT=process.env.port || 3001;
const start=async ()=>{
    try{
        await connectDB(process.env.MONGO_URI);
        app.listen(PORT,"0.0.0.0",()=>{
            console.log(`connected to port ${PORT}`);
        });
    }
    catch(err){
        console.log(err);
    }
}
start()
