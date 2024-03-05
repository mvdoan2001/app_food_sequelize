import sequelize from '../models/connect.js';
import initModels from '../models/init-models.js';
import { responseApi } from '../config/response.js'
import { dataToken } from '../config/jwt.js';

const model = initModels(sequelize);

const getListLikeUser = async (req, res) => {
    let { resId } = req.params;
    let data = await model.like_res.findAll({
        where: {
            res_id: resId
        },
        include: ["user"]
    })
    responseApi(res, 200, data, 'Thành công!')
};

const getListLikeRes = async (req, res) => {
    let { token } = req.headers;
    let decode = dataToken(token);
    let { userId } = decode;
    // let { userId } = req.params;

    let data = await model.like_res.findAll({
        where: {
            user_id: userId
        },
        include: ["re"]
    });

    responseApi(res, 200, data, 'Thành Công!')
};

const likeAndDislike = async (req, res) => {
    let { resId, userId } = req.body;
    // let { token } = req.headers;
    // let decode = dataToken(token)
    // let { userId } = token

    let data = await model.like_res.findOne({
        where: {
            res_id: resId,
            user_id: userId
        }
    });

    let newLike = {
        res_id: resId,
        user_id: userId,
        date_like: new Date(),
        isLike: true
    };

    if (data) {
        if (data.dataValues.isLike) {
            await model.like_res.update({
                ...data, isLike: 0
            }, {
                where: {
                    like_res_id: data.dataValues.like_res_id
                }
            });
            responseApi(res, 200, data, 'Unlike thành công ');
            return
        } else {
            await model.like_res.update({
                ...data, isLike: 1
            }, {
                where: {
                    like_res_id: data.dataValues.like_res_id
                }
            });
            responseApi(res, 200, data, 'Like thành công')
        }
    } else{
        await model.like_res.create(newLike)
        responseApi(res, 200, data, 'Like thành công')
    }


};

const getListRateUser = async (req, res) => {
    let { resId } = req.params;

    let data = await model.rate_res.findAll({
        where: {
            res_id: resId
        },
        include: ["user"]
    });

    responseApi(res, 200, data, 'Thành công')
};

const getListRateRes = async (req, res) => {
    let { userId } = req.body;

    // let { token } = req.headers;
    // let decode = dataToken(token);
    // let { userId } = decode

    let data = await model.rate_res.findAll({
        where: {
            user_id: userId
        },
        include: ["re"]
    });
    responseApi(res, 200, data, 'Thành công')
};

const createRated = async (req, res) => {
    let { resId, userId, amount } = req.body;

    // let { token } = req.headers;
    // let decode = dataToken(token);
    // let { userId } = decode

    let newRated = {
        user_id: userId,
        res_id: resId,
        amount: amount,
        date_rate: new Date()
    };

    await model.rate_res.create(newRated)
    responseApi(res, 200, '', 'Thành Công!');
};




export {
    getListLikeUser,
    getListLikeRes,
    likeAndDislike,
    getListRateUser,
    getListRateRes,
    createRated
}