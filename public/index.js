/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [ 
        {
          productName: "",
          productPrice: "",
          productImage: "",
          productDescription: "",
          productSupplierId: ""
        }
      ]

    };
  },
  created: function() {
    axios.get('/products').then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      image: "",
      description: "",
      supplierId: "",
      errors: []
    };
  },
  methods: {
    addProduct: function() {
      var params = {
        name: this.name,
        price: this.price,
        image: this.image,
        description: this.description,
        supplier_id: this.supplierId
      };
      axios
        .post("/products/", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/products/new", component: NewProductPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});