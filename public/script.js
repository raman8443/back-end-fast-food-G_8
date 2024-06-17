
// Menu responsive

const menuCirculo = document.querySelector(".menucirculo")
const navegador = document.querySelector("#nav")

   
menuCirculo.addEventListener("click", () => {
    if (navegador.style.display === "none"){
       navegador.style.display = "block"; 
    } else {
        navegador.style.display = "none"
    };
    
});

//// FORMULARIO VALIDACION
const formulario =document.querySelector("#form_evento")
const validarNombre = document.querySelector("#primerNombre")
const validarMensaje = document.querySelector("#mensaje")
const validarEmail = document.querySelector("#email")

const validar_formulario = (nombre, mensaje, email) => {
    formulario.addEventListener("submit", (event) => {
    event.preventDefault(); 
    let formularioEnviado = true;
    if (nombre.value.trim().length < 3 ||mensaje.value.trim().length < 15 || email.value.trim().length < 3){
        formularioEnviado= false;
        const errorEnvio = document.querySelector(".errorEnvio")
        errorEnvio.textContent = "Nombre o Email invalidos, o , mensaje con menos de quince caracteres"
            setTimeout(()=> {
                errorEnvio.textContent =""
            }, 3000);
    } else {
        alert("Formulario enviado")
    }}
)};

validar_formulario(validarNombre, validarMensaje, validarEmail);



// Menu

let btnMenu = document.getElementById('btnMenu');
let menu = document.getElementById('menu');

btnMenu.addEventListener('click', function(){
   'use strict'; 
    menu.classList.toggle('mostrar');
});