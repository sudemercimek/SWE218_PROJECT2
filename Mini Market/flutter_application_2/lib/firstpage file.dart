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
      // Redirect to main page or do other actions
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
      // Redirect to main page or do other actions
    })
    .catch(function(error) {
      // Error occurred
      var errorMessage = error.message;
      message.textContent = errorMessage;
    });
}