'use strict';
const {
    Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class SFC extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
        }
    }
    SFC.init({
        idSFC: DataTypes.STRING,
        services: DataTypes.STRING,
        node: DataTypes.STRING,
        route: DataTypes.JSON,
        port: DataTypes.JSON
    }, {
        sequelize,
        modelName: 'SFC',
        timestamps: false
    });
    return SFC;
};