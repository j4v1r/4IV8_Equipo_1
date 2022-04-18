function problema1n(){
    /*Leer 2 números; si son iguales que los multiplique, 
si el primero es mayor que el segundo que los reste
y si no que los sume*/

    var validar = /^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$/

    var numer1 = document.getElementById('numero1').value;
    var num1 = parseFloat(numer1);

    var numer2 = document.getElementById('numero2').value;
    var num2 = parseFloat(numer2);

    if(numer1=="" || numer2==""){

        alert("Llene todos los campos")

    }else if(numer1.match(validar) && numer2.match(validar)){

        if(num1==num2){

            var total = num1*num2;

        }else if(num1>num2){

            var total = num1-num2;

        }else{

            var total = num1+num2;

        }

        document.getElementById('resul').value = total;

    }else{

        alert("Introduzca únicamente números")
        
    }

}

function problema2(){

    var num1 = document.getElementById("numero1").value;
    var num2 = document.getElementById("numero2").value;
    var num3 = document.getElementById("numero3").value;

    var pnum1 = parseFloat(num1);
    var pnum2 = parseFloat(num2);
    var pnum3 = parseFloat(num3);

    var vnum = /^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$/

    if(num1 == "" || num2 == "" || num3 == ""){
        alert("Debes llenar todos los campos");
    }
    else if(num1.match(vnum) && num2.match(vnum) && num3.match(vnum)){
        var mayor = Math.max(pnum1,pnum2,pnum3);
        document.getElementById("resultado").value="El numero mayor es: " + mayor
    }
    else{
        alert("Ingresa Solo numeros")
    }

}

function problema3n(){
    /*Determinar la cantidad de dinero que recibirá un trabajador por 
    concepto de horas extras. Cuando exceden 40, el resto son hrs extras.
    Las primeras 8hrs extras se pagan al doble, después de esas 48 hrs
    las demás se pagan al triple*/

    var validar =   /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;

    var horas = document.querySelector('#horas').value;
    var sueldo = document.querySelector('#sueldo').value;

    var hrs = parseFloat(horas);
    var sueld = parseFloat(sueldo);

    if(horas=="" || sueldo==""){

        alert("Llene todos los campos")

    }else if(horas.match(validar) && sueldo.match(validar)){

        if(hrs<=40){

            resul = hrs*sueld;
            
        }else if(hrs>40 && hrs<=48){

            resul = (40*sueld) + ((hrs-40)*(2*sueld));

        }else if(hrs>48){

            resul = (40*sueld) + ((8)*(2*sueld)) + ((hrs-48)*(3*sueld));

        }

        document.querySelector('#resul3').textContent = "El salario a recibir es " + resul

    }else{

        alert("Introduzca únicamente números");

    }
    
}

function problema4(){

    var sal = document.querySelector('#salario').value;
    var ant = document.querySelector('#antiguedad').value;

    var psal = parseFloat(sal);
    var pant = parseFloat(ant);

    var vnum1 = /^[0-9]*(\.[0-9]+)?$/
 

    if(sal == "" || ant == ""){
        alert("Debes llenar todos los campos");
    }
    else if(psal < 0){
        alert("Dato de salario invalido")
    }
    else if(pant < 0){
        alert("Dato de antiguedad invalido")
    }
    else if(sal.match(vnum1) || ant.match(vnum1)){
        if(pant < 1){
            var uti = psal*0.05
            document.querySelector("#resultado4").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 1 && pant < 2){
            var uti = psal*0.07
            document.querySelector("#resultado4").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 2 && pant < 5){
            var uti = psal*0.1
            document.querySelector("#resultado4").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 5 && pant < 10){
            var uti = psal*0.15
            document.querySelector("#resultado4").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 10){
            var utilidad = psal*0.2
            document.querySelector('#resultado4').textContent = "La utilidad es de: " + utilidad
        }
        else{
            alert("Datos invalidos")
        }
    }
    else{
        alert("Solo ingresa números")
    }
}
