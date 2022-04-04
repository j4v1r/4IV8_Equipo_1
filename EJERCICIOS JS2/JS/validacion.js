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

function problema3n(){
    /*Determinar la cantidad de dinero que recibirá un trabajador por 
    concepto de horas extras. Cuando exceden 40, el resto son hrs extras.
    Las primeras 8hrs extras se pagan al doble, después de esas 48 hrs
    las demás se pagan al triple*/

    var validar =   /^[+]?([0-9]+(?:[\.][0-9]*)?|\.[0-9]+)$/;

    var horas = document.getElementById('horas').value;
    var sueldo = document.getElementById('sueldo').value;

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

        Document.querySelector('#resul3').textContent = "El salario a recibir es " + resul

    }else{

        alert("Introduzca únicamente números");

    }
    
}
