import express from 'express';
import { order } from '../controllers/userController.js';
import { midVerifyToken } from '../config/jwt.js';

const userRoute = express.Router();

// Đặt món thêm order
userRoute.post("/order/:foodId", midVerifyToken, order)


export default userRoute;