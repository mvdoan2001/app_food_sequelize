import express from 'express';
import { likeAndDislike, createRated, getListLikeRes, getListLikeUser, getListRateRes, getListRateUser } from '../controllers/resController.js';

const resRoute = express.Router();

// Lấy danh sach like theo nhà hàng
resRoute.get("/like-res/:resId", getListLikeUser);

// Lấy danh sach like theo user
// likeRoute.get("/like-user/:userId", getListLikeRes);
resRoute.get("/like-user", getListLikeRes);


// Xử lý like và unlike
resRoute.post("/xu-ly-like", likeAndDislike)

// Lấy danh sách đánh giá theo nhà hàng
resRoute.get("/list-rated/:resId", getListRateUser)

// Lấy danh sách đánh giá theo user
resRoute.get("/list-rated-user", getListRateRes)

// Thêm đánh giá theo userId
resRoute.post("/create-rated", createRated)


export default resRoute;