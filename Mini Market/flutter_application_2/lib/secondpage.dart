// Initialize Firebase
var firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "YOUR_AUTH_DOMAIN",
  projectId: "YOUR_PROJECT_ID",
  storageBucket: "YOUR_STORAGE_BUCKET",
  messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  appId: "YOUR_APP_ID"
};

firebase.initializeApp(firebaseConfig);

// Get references to HTML elements
var emailInput = document.getElementById("email");
var passwordInput = document.getElementById("password");
var loginBtn = document.getElementById("login");
var signupBtn = document.getElementById("signup");
var message = document.getElementById("message");
var categoriesContainer = document.getElementById("categories");
var productsContainer = document.getElementById("products");

// Add event listeners to buttons
loginBtn.addEventListener("click", login);
signupBtn.addEventListener("click", signup);

// Login function
function login() {
  var email = emailInput.value;
  var password = passwordInput.value;

  firebase.auth().signInWithEmailAndPassword(email, password)
    .then(function(userCredential) {
      // Successful login
      var user = userCredential.user;
      message.textContent = "Logged in successfully!";
      showCategories();
    })
    .catch(function(error) {
      // Error occurred
      var errorMessage = error.message;
      message.textContent = errorMessage;
    });
}

// Signup function
function signup() {
  var email = emailInput.value;
  var password = passwordInput.value;

  firebase.auth().createUserWithEmailAndPassword(email, password)
    .then(function(userCredential) {
      // Successful signup
      var user = userCredential.user;
      message.textContent = "Account created successfully!";
      showCategories();
    })
    .catch(function(error) {
      // Error occurred
      var errorMessage = error.message;
      message.textContent = errorMessage;
    });
}

// Show categories
function showCategories() {
  // Clear products container
  productsContainer.innerHTML = "";

  // Display categories
  var categories = ["Electronics", "Clothing", "Groceries", "Books"];
  categoriesContainer.innerHTML = "";
  categories.forEach(function(category) {
    var categoryElement = document.createElement("div");
    categoryElement.textContent = category;
    categoryElement.classList.add("category");
    categoryElement.addEventListener("click", function() {
      showProducts(category);
    });
    categoriesContainer.appendChild(categoryElement);
  });
}

// Show products for a category
function showProducts(category) {
  // Clear products container
  productsContainer.innerHTML = "";

  // Fetch products from database or API
  var products = [
    { name: "Product 1", image: "product1.jpg", price: "$10.99" },
    { name: "Product 2", image: "product2.jpg", price: "$19.99" },
    { name: "Product 3", image: "product3.jpg", price: "$14.99" },
    // Add more products here
  ];

  // Display products
  products.forEach(function(product) {
    var productElement = document.createElement("div");
    var imageElement = document.createElement("img");
    imageElement.src = product.image;
    var nameElement = document.createElement("div");
    nameElement.textContent = product.name;
    var priceElement = document.createElement("div");
    priceElement.textContent = product.price;

    productElement.appendChild(imageElement);
    productElement.appendChild(nameElement);
    productElement.appendChild(priceElement);
    productsContainer.appendChild(productElement);
  });
}