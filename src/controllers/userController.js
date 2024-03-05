import { responseApi } from "../config/response.js";
import sequelize from "../models/connect.js";
import initModels from "../models/init-models.js";

const model = initModels(sequelize);

const order = async (req, res) => {

    let { foodId } = req.params;
    let { userId } = req.body;

    // let { token } = req.headers;
    // let decode = dataToken(token);
    // let { userId } = decode

    let data = model.food.findAll({
        where: {
            food_id: foodId
        }
    });

    let newOrder = {
        food_id: foodId,
        user_id: userId,
        amount: Math.floor(Math.random() * 3) + 1,
        code: new Date().getTime()
    }

    if(!data) {
        responseApi(res, 404, '', 'Not Found !')
    } else {
        await model.orders.create(newOrder);
        responseApi(res, 200, '', 'Order thành công')
    }

};

export {
    order
}