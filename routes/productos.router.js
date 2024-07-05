const express = require("express");
const router = express.Router();

const controller = require("../controllers/productos.controller")

router.get("/", controller.index);

router.get("/:id_Menu", controller.show);

router.post("/", controller.store);

router.put("/:id_Menu",controller.update);

router.delete("/:id_Menu", controller.destroy);

module.exports = router;

