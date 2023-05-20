// Initialize Firebase and other variables
// ...

// Get references to HTML elements
// ...

// Add event listeners to buttons
// ...

// Login function
// ...

// Signup function
// ...

// Show categories
// ...

// Show products for a category
// ...

// Add product to cart
// ...

// View cart and calculate total cost
// ...

// Submit order
// ...

// Logout function
function logout() {
  firebase.auth().signOut()
    .then(function() {
      // Successful logout
      clearUserCredentials();
      message.textContent = "Logged out successfully!";
    })
    .catch(function(error) {
      // Error occurred
      var errorMessage = error.message;
      message.textContent = errorMessage;
    });
}

// Clear user credentials (optional)
function clearUserCredentials() {
  emailInput.value = "";
  passwordInput.value = "";
}

// Store login information securely (optional)
function storeLoginInfo(email, password) {
  // Use browser storage APIs (e.g., localStorage) or secure storage libraries
  // to securely store the user's login information.
  // ...
}