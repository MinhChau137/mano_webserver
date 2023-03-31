import express from "express";
import homeController from "../controllers/homeController";

const router = express.Router();
const initWebRoutes = (app) => {
    router.get('/', homeController.getData);
    router.get('/getData', homeController.getData);

    router.get('/createSFC', homeController.createSFC);
    router.post('/postSFC', homeController.postSFC);

    router.get('/editSFC', homeController.getEditSFC);
    router.post('/getData', homeController.putSFC);

    router.get('/deleteSFC', homeController.deleteSFC);
    router.get('/deleteService', homeController.deleteService);

    return app.use("/", router)
}

module.exports = initWebRoutes;