const express = require("express");
const app = express();

const path = require("path");

app.use(express.json());

app.use("/productos", require("./routes/productos.router.js"));


app.use(express.static(path.join(__dirname,"public")));



app.get("/", (req, res)=>{
    res.send("Hola Edu!!!");
});



const PORT = process.env.PORT || 3000;

app.listen(PORT, ()=> console.log(`http://localhost:${PORT}`));