const express = require("express");
const router = express.Router();


const productos = 
[{
    id: 1,
    name: "hambuerguesa"
},

{
    id: 2,
    name:"pizza"
}];


router.get("/", (req, res) =>{
    res.json(productos);
})

router.get("/:id", (req, res) =>{
    const { id } = req.params;
    const producto = productos.find((elemento) => elemento.id === parseInt(req.params.id));

    if (!producto) {
        return res.status(404).send({error:"No se encontro el elemento"});
    }

    res.send(producto);
})

router.post("/", (req, res) =>{

    console.log(req.body)
    
    res.status(201).send("post");

});

/* router.put("/:id", req, res){
res.send("...")
}; */
module.exports = router;

