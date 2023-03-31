'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.createTable('SFCs', {
            id: {
                allowNull: false,
                autoIncrement: true,
                primaryKey: true,
                type: Sequelize.INTEGER
            },
            idSFC: {
                type: Sequelize.STRING
            },
            services: {
                type: Sequelize.STRING
            },
            node: {
                type: Sequelize.STRING
            },
            route: {
                type: Sequelize.JSON
            },
            port: {
                type: Sequelize.JSON
            }
        });
    },
    async down(queryInterface, Sequelize) {
        await queryInterface.dropTable('SFCs');
    }
};