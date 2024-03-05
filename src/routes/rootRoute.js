import express from 'express';
import resRoute from './resRoute.js';
import userRoute from './userRoute.js';


const rootRoute = express.Router();

rootRoute.use("/res", resRoute);
rootRoute.use("/user", userRoute)

export default rootRoute;