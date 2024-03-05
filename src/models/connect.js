import { Sequelize } from 'sequelize';
import config from '../config/config.js';


const sequelize = new Sequelize(config.database, config.user, config.password, {
    host: config.host,
    port: config.port,
    dialect: config.dialect
}); 

// try {
//     await sequelize.authenticate()
//     console.log("Ok");

// } catch (error) {
//     console.log('err', error);
// }

export default sequelize;