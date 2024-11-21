document.addEventListener("DOMContentLoaded", () => {
    const menuBtn = document.querySelector(".navbar-menu-btn");
    const header = document.querySelector("header");
  
    // Toggle header visibility
    menuBtn.addEventListener("click", () => {
      header.classList.toggle("active"); 
      menuBtn.classList.toggle("active"); 
    });
  });
  