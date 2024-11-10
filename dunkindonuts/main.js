// Get elements
const navToggle = document.getElementById('nav-toggle');
const navList = document.getElementById('nav-list');

// Toggle the 'active' class on the nav list when the toggle button is clicked
navToggle.addEventListener('click', function() {
  navList.classList.toggle('active');
});
