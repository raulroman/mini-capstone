/* global Vue, VueRouter, axios */

var productContainer = document.querySelector(".row");

var productTemplate = document.querySelector("#product-card");


axios.get("http://localhost:3000/products").then(function(response) {
  console.log(response);
  var products = response.data;
  for (var i = 0; i < products.length; i++) {
    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector('.price').innerText = products[i].price;
    productContainer.appendChild(productClone);
  }
});


