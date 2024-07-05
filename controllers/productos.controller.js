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
    const {id_Menu} = req.params;

    const sql = "SELECT * FROM productos WHERE id_Menu = ?";
    db.query(sql, [id_Menu] , (error, rows) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }
        if (rows.length ===  0) {
            console.log('Producto no encontrado para id_Menu:', id_Menu);
            return res.status(404).json({message: "No existe el producto"});
        }
        console.log('Producto encontrado:', rows[0]);
        res.json(rows[0]);
    });
};

const store = (req, res) =>{
    const { Nombre, Precio, id_Categoria } = req.body;

    const sql = "INSERT INTO productos (Nombre, Precio, id_Categoria) VALUES (?, ?, ?)";
    db.query(sql, [Nombre, Precio, id_Categoria ] , (error, result) => { 
        if (error){
        console.log(error);
        return res.status(500).json({error : "Intente más tarde"});
        }

        const producto = {...req.body, id : result.insertId};
        res.json(producto);
    });
};

const update = (req, res) =>{
    const { id_Menu } = req.params;
    const { Nombre, Precio, id_Categoria } = req.body;

    const sql = "UPDATE productos SET Nombre = ? , Precio = ? , id_Categoria = ? WHERE id_Menu = ?";
    db.query(sql, [Nombre, Precio, id_Categoria, id_Menu] , (error, result) => { 
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