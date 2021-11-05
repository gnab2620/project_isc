/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function addProduct() {
    if (document.getElementById("value").innerHTML.endsWith("Hide")) {
        document.getElementById("value").innerHTML = "Add more product";
        document.getElementById("addProduct").style.display = "none";
    } else {
        document.getElementById("value").innerHTML = "Hide";
        document.getElementById("addProduct").style.display = "block";
    }
}


if (document.getElementById("username") !== null) {
    document.getElementById("re-js").style.display = "block";
}

function feedback() {
    try {
        var productID = document.getElementById("productID").value;
    } catch (e) {
    }
    var titel = document.getElementById("titleFB").value;
    var content = document.getElementById("contentFB").value;
    if (titel === "" || content === "") {
        document.getElementById("notyFail").style.display = "block";
        document.getElementById("notyFail").style.color = "red";

    } else {
        document.getElementById("checkFB").style.display = "none";
        document.getElementById("sendFB").style.display = "block";
        document.getElementById("titleFB").setAttribute("readonly", true); //to  enable readonly
        document.getElementById("contentFB").setAttribute("readonly", true); //to  enable readonly
//        document.getElementById('TextBoxID').readOnly = false;   //to  disable readonly
    }

}
function notiy() {
    alert("SEND FEEDBACK SUCCESSFULL");
}
function notiy2() {
    alert("ORDER SUCCESSFULL");
}
function checkinputNumber() {
    var a = document.getElementsByClassName("abc");
    for (var i = 0, max = a.length; i < max; i++) {
        alert(a[i].style.display);
    }
}
function  Feedbackad() {
    if (document.getElementById("innerValue").innerHTML === "SHOW FEEDBACK") {
        document.getElementById("innerValue").innerHTML = "HIDE"
        document.getElementById("fb").style.display = "block";
    } else {
        document.getElementById("innerValue").innerHTML = "SHOW FEEDBACK"
        document.getElementById("fb").style.display = "none";
    }

}
function  Feedback2ad() {
    if (document.getElementById("innerValue2").innerHTML === "SHOW FEEDBACK") {
        document.getElementById("innerValue2").innerHTML = "HIDE"
        document.getElementById("fb2").style.display = "block";
    } else {
        document.getElementById("innerValue2").innerHTML = "SHOW FEEDBACK"
        document.getElementById("fb2").style.display = "none";
    }
}
function checkinfoOrder() {
    if (document.getElementById("reciever").value === "" ||
            document.getElementById("phone").value === "" ||
            document.getElementById("address").value === "") {
        document.getElementById("notyFail").style.display = "block";
    } else {
        document.getElementById("checkOD").style.display = "none";
        document.getElementById("sendOD").style.display = "block";
    }

}
function cforder() {
    if (document.getElementById("cforder").innerHTML === "ORDER") {
        document.getElementById("cforder").innerHTML = "HIDE";
        document.getElementById("tableif").style.display = "Block";
    } else {
        document.getElementById("cforder").innerHTML = "ORDER";
        document.getElementById("tableif").style.display = "none"
    }

}
function showlistOrder() {
//    if (document.getElementById("listorder").innerHTML !== "Hide") {
//        document.getElementById("listorder").innerHTML = "Hide";
//    } else {
//        document.getElementById("listorder").innerHTML = "Show List";
//    }
    alert(1);
}

