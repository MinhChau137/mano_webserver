import db from "../models/index"

function convertJSON(arr1, arr2) {
    const obj = {};
    arr1.forEach((Curr_element, index) => {
        obj[Curr_element] = arr2[index]
    })
    return obj;
};


const createNewSFC = async(data) => {
    return new Promise(async(resolve, reject) => {
        try {
            await db.SFC.create({
                idSFC: data.idsfc,
                services: (data.service).toString(),
                node: (data.node).toString(),
                // route: data.route,
                port: JSON.stringify(convertJSON(data.service, data.port))
            })
            resolve('ok create a new sfc successed')
        } catch (e) {
            reject(e);
        }
    })

}

const getData = () => {
    return new Promise(async(resolve, reject) => {
        try {
            const SFCs = db.SFC.findAll({
                raw: true,
            });
            resolve(SFCs)
        } catch (e) {
            reject(e)
        }
    })
}

const getSFCById = (idsfc) => {
    return new Promise(async(resolve, reject) => {
        try {
            const sfc = await db.SFC.findOne({
                where: { idSFC: idsfc },
                raw: true
            })
            if (sfc) {
                resolve(sfc);
            } else {
                resolve({});
            }
        } catch (e) {
            reject(e);
        }
    })
}


const updateSFC = (data) => {
    return new Promise(async(resolve, reject) => {
        try {
            let sfc = await db.SFC.findOne({ where: { idSFC: data.idsfc } })
            if (sfc) {
                sfc.idSFC = data.idsfc;
                sfc.services = (data.service).toString();
                sfc.node = (data.node.toString());
                sfc.port = JSON.stringify(convertJSON(data.service, data.port));
                sfc.route = data.route;
                await sfc.save();
                let allDataUpdated = await db.SFC.findAll({ raw: true });
                resolve(allDataUpdated);
            } else {
                resolve();
            }
        } catch (e) {
            reject(e);
        }
    })
}

const deleteSFCById = (id) => {
    return new Promise(async(resolve, reject) => {
        try {
            let sfc = await db.SFC.findOne({ where: { idSFC: id } })
            if (sfc) {
                await sfc.destroy()
            }
            resolve();

        } catch (e) {
            reject(e);
        }
    })
}

function removeItemOnce(arr, index) {
    if (index > -1) {
        arr.splice(index, 1);
    }
    return arr;
}

function removeItemInObj(obj, item) {
    delete(obj[item]);
    return obj;
}
const deleteServiceByName = (id, name) => {
    return new Promise(async(resolve, reject) => {
        try {
            let sfc = await db.SFC.findOne({
                where: {
                    idSFC: id
                }
            })
            if (sfc) {
                let services = sfc.services.split(",");
                let node = sfc.node.split(",")
                if (services.length > 1) {
                    services.map(async(e, i) => {
                        if (e == name) {
                            sfc.services = (removeItemOnce(services, i)).toString();

                            sfc.node = (removeItemOnce(node, i)).toString();

                            sfc.port = JSON.stringify(removeItemInObj(JSON.parse(sfc.port), e));
                            await sfc.save();
                            let allDataUpdated = await db.SFC.findAll({ raw: true });
                            resolve(allDataUpdated);
                        }
                    })
                } else {
                    await sfc.destroy()
                    let allDataUpdated = await db.SFC.findAll({ raw: true });
                    resolve(allDataUpdated);
                }
            }
        } catch (e) {
            reject(e);
        }
    })
}

module.exports = {
    createNewSFC: createNewSFC,
    getData: getData,
    getSFCById: getSFCById,
    updateSFC: updateSFC,
    deleteSFCById: deleteSFCById,
    deleteServiceByName: deleteServiceByName,
}