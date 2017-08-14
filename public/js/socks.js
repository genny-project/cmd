/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//var request = new Request('http://localhost:8080/graphql', {
//	method: 'POST', 
//	mode: 'cors', 
//	redirect: 'follow',
//	headers: new Headers({
//		'Content-Type': 'application/json'
//	}),
//        body: JSON.stringify({
//		"query":"{person{name }}"	
//        })
//});
//
//// Now use it!
//fetch(request).then(function() {console.log("jsdhfsdhnfjsdjaklfjskdlngjibdsg") });


var eb = new EventBus("http://localhost:8081/eventbus");

eb.onopen = function() {

  // set a handler to receive a message
  eb.registerHandler('address.outbound', function(error, message) {
    console.log(error); 
    console.log('received a message: ' + JSON.stringify(message));
    console.log(message);
    console.log("sdfsdlkjfsdjfsdfjsdkjfjsdlfljd");
    document.getElementById("hola").innerHTML = message.body.header1;
    var para = document.createElement("p");
    var node = document.createTextNode("This is new.");
    para.appendChild(node);

    var element = document.getElementById("div1");
    element.appendChild(para);
  });

  // send a message
  

}

var y = function(){
    eb.publish('address.inbound', {"query":"{person{name }}"});
}

