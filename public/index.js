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
          productDescription: ""
        }
      ],
      searchName: "",
      sortAttribute: "name"
    };
  },
  created: function() {
    axios.get('/products').then(function(response) {
      this.products = response.data;
    }.bind(this));
  },
  methods: {
    validName: function(inputProduct) {
      var isValidName = inputProduct.name.toLowerCase().includes(this.searchName.toLowerCase());
      return isValidName;
    },
    sortByAttribute: function(inputAttribute) {
      this.sortAttribute = inputAttribute;
    }
  },
  computed: {
    sortedProducts: function() {
      return this.products.sort(function(product1, product2) {
        return product1[this.sortAttribute].localeCompare(product2[this.sortAttribute]);
      }.bind(this));
    }
  }
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
        .post("/users", params)
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

var EditProductPage = {
  template: "#edit-product-page",
  data: function() {
    return {
      product: {},
      errors: []
    };
  },
  methods: {
    editProduct: function() {
      var params = {
        name: this.product.name,
        price: this.product.price,
        image: this.product.image,
        description: this.product.description
      };
      axios
        .patch("/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    axios.get('/products/' + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  }
};

var ShowProductPage = {
  template: "#show-product-page",
  data: function() {
    return {
      product: {}
    };
  },
  created: function() {
    axios.get('/products/' + this.$route.params.id).then(function(response) {
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/:id/edit", component: EditProductPage},
    { path: "/products/new", component: NewProductPage },
    { path: "/products/:id", component: ShowProductPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});