//INICIO VALIDACIONES DE MODAL INGREDIENTE

// Función para validar el formulario de 
// registro de ingrediente
function registroingrediente(){
    
    var nombre = document.getElementById('ingredientenuevo').value;
    var precio = document.getElementById('precionuevo').value;
    var cantidad = document.getElementById('cantidadnueva').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("ingredientenuevo").focus();
        
    }else if(precio=="" || !(precio.match(numeros)) || precio<0 || precio>100000 || precio==0){
        alert("El precio de ingrediente es inválido");
        document.getElementById("precionuevo").focus();
        
    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000 || cantidad==0){
        alert("La cantidad de ingrediente es inválida");
        document.getElementById("cantidadnueva").focus();
     
    }else{
        document.ingredienteregistro.submit();

    }

}


// Función para validar el formulario de 
// edición de ingrediente
function editingrediente(){
    
    var nombre = document.getElementById('ingredientecambio').value;
    var precio = document.getElementById('preciocambio').value;
    var cantidad = document.getElementById('cantidadcambio').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_ing_modif").focus();
        

    }else if(precio=="" || !(precio.match(numeros)) || precio<0 || precio>100000 || precio==0){
        alert("El precio de ingrediente es inválido");
        document.getElementById("precio_ing_modif").focus();
        

    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000 || cantidad==0){
        alert("La cantidad de ingrediente es inválida");
        document.getElementById("cant_ing_modif").focus();
        
    
    }else{
        document.ingredienteedicion.submit();

    }

}

//FIN VALIDACIONES MODAL INGREDIENTE






//INICIO VALIDACIONES DE MODAL RECETA

// Función para validar el formulario de 
// registro de receta
function registroreceta(){
    
    var nombre = document.getElementById('nom_rec_new').value;
    var cantidad = document.getElementById('cant_rec_new').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de la receta es inválido");
        document.getElementById("nom_rec_new").focus();
        return false;
        
    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000){
        alert("La cantidad de la receta es inválida");
        document.getElementById("cant_rec_new").focus();
        return false;
        
        
        
    
    }else{

        document.registroreceta.submit();

    }

}


// Función para validar el formulario de 
// edición de receta
function editreceta(){
    
    var nombre = document.getElementById('nom_rec_modif').value;
    var cantidad = document.getElementById('cant_rec_modif').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de la receta es inválido");
        document.getElementById("nom_rec_modif").focus();
        
        return false;

    }
    if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000){
        alert("La cantidad de la receta es inválida");
        document.getElementById("cant_rec_modif").focus();
        
        return false;
    
    }else{

        document.edicionreceta.submit();

    }

}


// Función para validar el formulario de 
// INGRESAR INGREDIENTE en RECETA
function anidaringredienterec(){
    
    var nombre = document.getElementById('nom_ing_newrec').value;
    var cantidad = document.getElementById('cant_ing_newrec').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_ing_newrec").focus();
        
    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000){
        alert("La cantidad de ingrediente es inválida");
        document.getElementById("cant_ing_newrec").focus();
        
    
    }else{
        document.anidaringredienteform.submit();

    } 

}


// Función para validar el formulario de 
// editar ingrediente en RECETA
function editaringredienterec(){
    
    var nombre = document.getElementById('nom_ing_newrec').value;
    var cantidad = document.getElementById('cant_ing_newrec').value; 


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_ing_newrec").focus();
        
    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>1000){
        alert("La cantidad de ingrediente es inválida");
        document.getElementById("cant_ing_newrec").focus();
        
    
    }else{
        document.anidaringredienteform.submit();

    } 

}
//FIN VALIDACIONES DE MODAL RECETA


//INICIO VALIDACION DE MODAL MENU


// Función para validar el formulario de 
// registro de ARTICULO DE MENU
function registroartmenu(){
    
    var nombre = document.getElementById('nom_menu_new').value;
    var precio = document.getElementById('precio_menu_new').value;


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_menu_new").focus();
        
    }else if(precio=="" || !(precio.match(numeros)) || precio<0 || precio>100000){
        alert("El precio de ingrediente es inválido");
        document.getElementById("precio_menu_new").focus();
        

    }else{
        document.ingredienteform.submit();

    }

}


// Función para validar el formulario de 
// ANIDAR RECETA A ARTICULO DE MENU
function anidarrecetamenu(){
    
    var nombre = document.getElementById('nom_rec_newmenu').value;
    var precio = document.getElementById('cant_rec_newmenu').value;


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_rec_newmenu").focus();
        
    }else if(precio=="" || !(precio.match(numeros)) || precio<0 || precio>100000){
        alert("El precio de ingrediente es inválido");
        document.getElementById("cant_rec_newmenu").focus();
        

    }else{
        document.anidarrecetaform.submit();

    }

}


// Función para validar el formulario de 
// MODIFICAR ARTICULO DE MENU
function modifartmenu(){
    
    var nombre = document.getElementById('nom_menu_modif').value;
    var precio = document.getElementById('precio_menu_modif').value;


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_menu_modif").focus();
        
    }else if(precio=="" || !(precio.match(numeros)) || precio<0 || precio>100000){
        alert("El precio de ingrediente es inválido");
        document.getElementById("precio_menu_modif").focus();
        

    }else{
        document.modifmenuform.submit();

    }

}








// Función para validar el formulario de 
// MODIFICAR RECETA ANIDADA A ARTICULO DE MENU
function modifrecetamenu(){
    
    var nombre = document.getElementById('nom_rec_modifmenu').value;
    var cantidad = document.getElementById('cant_rec_modifmenu').value;


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(nombre=="" || !(nombre.match(letras)) || nombre.length>30){
        alert("El nombre de ingrediente es inválido");
        document.getElementById("nom_rec_modifmenu").focus();
        
    }else if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>100000){
        alert("La cantidad de ingrediente es inválida");
        document.getElementById("cant_rec_modifmenu").focus();
        

    }else{
        document.modifrecetaform.submit();

    }

}




// Función para validar el formulario de 
// REGISTRO DE INVENTARIO
function registroinvent(){
    
    var cantidad = document.getElementById('cantidadinventarionuevo').value;

    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    
    
    if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>100000 || cantidad==0){
        alert("La cantidad del inventario es inválida");
        document.getElementById("cantidadinventarionuevo").focus();
        

    }else{
        document.inventarioregistro.submit();

    }

}



// Función para validar el formulario de 
// MODIFICAR REGISTRO DE INVENTARIO
function EDICIONREGISTRO(){
    
    var cantidad = document.getElementById('cantidadinventarionuevo').value;


    var letras = /^[a-zA-Z\s]*$/;
    var numeros = /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;
    

    if(cantidad=="" || !(cantidad.match(numeros)) || cantidad<0 || cantidad>100000 || cantidad==0){
        alert("La cantidad del ingrediente es inválida");
        document.getElementById("cantidadinventarionuevo").focus();
        

    }else{
        document.inventarioregistro.submit();

    }

}




//FUNCION PARA VALIDAR EL FORMULARIO
//DE MODIFICAR ADMIN JEFE

function validarEditJefe(){
    //Validar NOMBRE
    if(adminjefe_edit.adminino.value.length < 2 || adminjefe_edit.adminino.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminjefe_edit.adminino.focus();
        return false;
    }

    if (adminjefe_edit.adminino.value.trim() == ""){
        alert("Debe ingresar un valor");
        adminjefe_edit.adminino.focus();
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminjefe_edit.adminino.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminjefe_edit.adminino.focus();
        return false;
    }
    //FIN VALIDAR NOMBRE


    //VALIDAR APPAT
    if(adminjefe_edit.adminiappat.value.length < 2 || adminjefe_edit.adminiappat.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminjefe_edit.adminiappat.focus();
        return false;
    }

    if (adminjefe_edit.adminiappat.value.trim() == ""){
        alert("Debe ingresar un valor");
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminjefe_edit.adminiappat.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminjefe_edit.adminiappat.focus();
        return false;
    }
    //FIN VALIDAR APPAT


    //VALIDAR APMAT
    if(adminjefe_edit.adminiapmat.value.length < 2 || adminjefe_edit.adminiapmat.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminjefe_edit.adminiapmat.focus();
        return false;
    }

    if (adminjefe_edit.adminiapmat.value.trim() == ""){
        alert("Debe ingresar un valor");
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminjefe_edit.adminiapmat.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminjefe_edit.adminiapmat.focus();
        return false;
    }
    //FIN VALIDAR APMAT

    
    //Validar EMAIL
    var verif = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
    var email = document.getElementById('adminico').value;

    if (email.length>60) {
        alert('Digite máximo 100 caracteres')
        .focus();
        return false;
    }

    if (!email.match(verif)){
        alert('La dirección de e-mail es inválida');
        adminjefe_edit.adminico.focus();
        return false;
    }
    //FIN VALIDAR EMAIL





    //VALIDAR EMPRESA
    if(adminjefe_edit.adminiem.value.length < 2 || adminjefe_edit.adminiem.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminjefe_edit.adminiem.focus();
        return false;
    }

    if (adminjefe_edit.adminiem.value.trim() == ""){
        alert("Debe ingresar un valor en el campo Empresa");
        adminjefe_edit.adminiem.focus();
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" "+"1234567890";

    var checkStr = adminjefe_edit.adminiem.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    //FIN VALIDAR EMPRESA

    //VALIDAR PAIS
    var pais = document.getElementById('paises').value;
    if (pais==0) {
        alert("Selecciona tu país hispanohablante");
        paises.focus();
        return false;
    }

    //FIN VALIDAR PAIS

    //VALIDAR TELEFONO
    var checkOK = "0123456789";
    if (adminjefe_edit.adminite.value.trim() == ""){
    alert("Ingresa tu teléfono");
    adminjefe_edit.adminite.focus();
        return false
    }
    var checkStr = adminjefe_edit.adminite.value;

    var allValido = true;

    if(adminjefe_edit.adminite.value.length < 10){
        alert("Escriba por lo menos 10 caracteres");
        adminjefe_edit.adminite.focus();
        return false;
    }

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba únicamente números");
        adminjefe_edit.adminite.focus();
        return false;
    }

    //FIN VALIDAR TELEFONO
}



//FUNCION PARA VALIDAR EL FORMULARIO
//DE MODIFICAR ADMIN CHEF

function validarEditChef(){
    //Validar NOMBRE
    if(adminchef_edit.nombreem.value.length < 2 || adminchef_edit.nombreem.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminchef_edit.nombreem.focus();
        return false;
    }

    if (adminchef_edit.nombreem.value.trim() == ""){
        alert("Debe ingresar un valor");
        adminchef_edit.nombreem.focus();
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminchef_edit.nombreem.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminchef_edit.nombreem.focus();
        return false;
    }
    //FIN VALIDAR NOMBRE


    //VALIDAR APPAT
    if(adminchef_edit.apattem.value.length < 2 || adminchef_edit.apattem.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminchef_edit.apattem.focus();
        return false;
    }

    if (adminchef_edit.apattem.value.trim() == ""){
        alert("Debe ingresar un valor");
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminchef_edit.apattem.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminchef_edit.apattem.focus();
        return false;
    }
    //FIN VALIDAR APPAT


    //VALIDAR APMAT
    if(adminchef_edit.apmatem.value.length < 2 || adminchef_edit.apmatem.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminchef_edit.apmatem.focus();
        return false;
    }

    if (adminchef_edit.apmatem.value.trim() == ""){
        alert("Debe ingresar un valor");
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" ";

    var checkStr = adminchef_edit.apmatem.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba unicamente letras");
        adminchef_edit.apmatem.focus();
        return false;
    }
    //FIN VALIDAR APMAT

    
    //Validar EMAIL
    var verif = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
    var email = document.getElementById('adminico').value;

    if (email.length>60) {
        alert('Digite máximo 100 caracteres')
        .focus();
        return false;
    }

    if (!email.match(verif)){
        alert('La dirección de e-mail es inválida');
        adminjefe_edit.adminico.focus();
        return false;
    }
    //FIN VALIDAR EMAIL





    //VALIDAR EMPRESA
    if(adminjefe_edit.adminiem.value.length < 2 || adminjefe_edit.adminiem.value.length > 30 ){
        alert('Digite entre dos y 30 caracteres')
        adminjefe_edit.adminiem.focus();
        return false;
    }

    if (adminjefe_edit.adminiem.value.trim() == ""){
        alert("Debe ingresar un valor en el campo Empresa");
        adminjefe_edit.adminiem.focus();
        return false;
    }

    var checkOK = "QWERTYUIOPASDFGHJKLZXCVBNMÑ"
    +"qwertyuiopasdfghjklñzxcvbnm"+" "+"1234567890";

    var checkStr = adminjefe_edit.adminiem.value;

    var allValido = true;

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    //FIN VALIDAR EMPRESA

    //VALIDAR PAIS
    var pais = document.getElementById('paises').value;
    if (pais==0) {
        alert("Selecciona tu país hispanohablante");
        paises.focus();
        return false;
    }

    //FIN VALIDAR PAIS

    //VALIDAR TELEFONO
    var checkOK = "0123456789";
    if (adminjefe_edit.adminite.value.trim() == ""){
    alert("Ingresa tu teléfono");
    adminjefe_edit.adminite.focus();
        return false
    }
    var checkStr = adminjefe_edit.adminite.value;

    var allValido = true;

    if(adminjefe_edit.adminite.value.length < 10){
        alert("Escriba por lo menos 10 caracteres");
        adminjefe_edit.adminite.focus();
        return false;
    }

    for(var i = 0; i < checkStr.length; i++){
        var ch = checkStr.charAt(i);
        for(var j = 0; j < checkOK.length; j++){
            if(ch == checkOK.charAt(j))
            break;
        }
        if(j == checkOK.length){
            allValido = false;
            break;
        }
    }

    if(!allValido){
        alert("Escriba únicamente números");
        adminjefe_edit.adminite.focus();
        return false;
    }

    //FIN VALIDAR TELEFONO
}