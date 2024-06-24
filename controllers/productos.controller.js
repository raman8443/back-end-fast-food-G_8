 const db = require("../db/db");


 const index = (req, res) =>{
    const sql = "SELECT * FROM productos";
    db.query(sql, (error, rows) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }

        res.json(rows);
    });
};

const show = (req, res) =>{
    const { id_Menu } = req.params;

    const sql = "SELECT * FROM productos WHERE id_Menu = ?";
    db.query(sql, [id_Menu] , (error, rows) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }
        if (rows.length ===  0) {
            return res.status(404).json({message: "No existe el producto"});
        }

        res.json(rows[0]);
    });
};

const store = (req, res) =>{
    const { Nombre, Precio } = req.body;

    const sql = "INSERT INTO productos (Nombre, Precio) VALUES (?, ?)";
    db.query(sql, [Nombre, Precio ] , (error, result) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }

    // No funciona porque el id no es autoincremental cambiar en la base de datos
        const producto = {...req.body, id : result.insertId};
        res.json(producto);
    });
};

const update = (req, res) =>{
    const { id_Menu } = req.params;
    const { Nombre, Precio } = req.body;

    const sql = "UPDATE productos SET Nombre = ? , Precio = ? WHERE id_Menu = ?";
    db.query(sql, [Nombre, Precio, id_Menu ] , (error, result) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }

        if (result.affectedRows ===  0) {
            return res.status(404).json({message: "No existe el producto"});
        }
        const producto = {...req.body, ...req.params};
        res.json(producto);
    });
};

const destroy = (req, res) => {
    const { id_Menu } = req.params;

    const sql = "DELETE FROM productos WHERE id_Menu = ?";
    db.query(sql, [id_Menu] , (error, result) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }
        if (result.affectedRows ===  0) {
            return res.status(404).json({message: "No existe el producto"});
        }

        res.json({message: "Elemento borrado"});
    });
};


module.exports ={ 
    index,
    show,
    store,
    update,
    destroy,
};