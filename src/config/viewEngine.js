import express from "express";

const configViewEngine = (app) => {
    app.use(express.static("./src/public"));
    app.use('/css', express.static(__dirname + 'public/css'))
    app.set("view engine", "ejs");
    app.set("views", "./src/views");
}

module.exports = configViewEngine;