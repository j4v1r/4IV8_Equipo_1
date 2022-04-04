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

function problema4(){

    var sal = document.getElementById("p4-x1").value;
    var ant = document.getElementById("p4-x2").value;

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
            document.getElementById("p4-output").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 1 && pant < 2){
            var uti = psal*0.07
            document.getElementById("p4-output").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 2 && pant < 5){
            var uti = psal*0.1
            document.getElementById("p4-output").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 5 && pant < 10){
            var uti = psal*0.15
            document.getElementById("p4-output").textContent = "La utilidad es de: " + uti
        }
        else if( pant >= 10){
            var uti = psal*0.2
            document.getElementById("p4-output").textContent = "La utilidad es de: " + uti
        }
        else{
            alert("Datos invalidos")
        }
    }
    else{
        alert("Solo ingresa números")
    }
}