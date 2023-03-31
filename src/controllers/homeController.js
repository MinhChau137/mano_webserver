import db from '../models/index';
import CRUDSFC from '../services/CRUDSFC';

const createSFC = async(req, res) => {
    try {
        let data = await CRUDSFC.getData()
        return res.render('createSFC.ejs', { data: data });
    } catch (e) {
        console.log(e)
    }
}

const postSFC = async(req, res) => {
    await CRUDSFC.createNewSFC(req.body);
    let data = await CRUDSFC.getData()
    return res.render('getData.ejs', { data: data })
}
const getData = async(req, res) => {
    let data = await CRUDSFC.getData()
    return res.render('getData.ejs', { data: data })

}

const getEditSFC = async(req, res) => {
    const idsfc = req.query.idsfc;
    if (idsfc == "ALL") {
        let data = await CRUDSFC.getData()
        return res.render('editPage.ejs', { data: data })
    } else {
        if (idsfc) {
            let sfcData = await CRUDSFC.getSFCById(idsfc);
            return res.render('editSFC.ejs', { data: sfcData });
        } else {
            return res.send('sfc not found')
        }
    }
}
const putSFC = async(req, res) => {
    const data = req.body;
    const dataUpdated = await CRUDSFC.updateSFC(data);
    return res.render('getData.ejs', { data: dataUpdated })
}

const deleteSFC = async(req, res) => {
    const idsfc = req.query.idsfc;
    if (idsfc == "ALL") {
        let data = await CRUDSFC.getData()
        return res.render('editPage.ejs', { data: data })
    } else {
        if (idsfc) {
            await CRUDSFC.deleteSFCById(idsfc);
            let data = await CRUDSFC.getData()
            return res.render('editPage.ejs', { data: data })
        } else {
            return res.send("sfc not found")
        }
    }
}
const deleteService = async(req, res) => {
    const idsfc = req.query.idsfc;
    const namesv = req.query.namesv;
    let data = await CRUDSFC.deleteServiceByName(idsfc, namesv);
    return res.render('editPage.ejs', { data: data });
    // return res.send("deleted")
}
module.exports = {
    createSFC: createSFC,
    postSFC: postSFC,
    getData: getData,
    getEditSFC: getEditSFC,
    putSFC: putSFC,
    deleteSFC: deleteSFC,
    deleteService: deleteService
}