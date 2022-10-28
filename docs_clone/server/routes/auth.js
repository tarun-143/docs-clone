const express=require('express');
const Router=express.Router();
const signUpUser=require('../controllers/auth')
Router.post('/signup' ,signUpUser);
module.exports=Router;