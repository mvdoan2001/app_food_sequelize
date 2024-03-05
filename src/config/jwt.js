import jwt from 'jsonwebtoken';

export const createToken = (data) => jwt.sign(data, "BAO_MAT", { algorithm: 'HS256', expiresIn: '5s' });

export const checkToken = (token) => jwt.verify(token, "BAO_MAT", (err, decode) => err)

export const dataToken = (token) => jwt.decode(token);

export const midVerifyToken = (req, res, next) => {
    let { token } = req.headers;
    let check = checkToken(token)
    if(check == null) {
        next();
    } else {
        responseApi(res, 401, "", check)
    }
};