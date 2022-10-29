// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
// Back To Top
var $backToTop = $(".back-to-top");
$backToTop.hide();

$(window).on("scroll", function () {
  if ($(this).scrollTop() > 100) {
    $backToTop.fadeIn();
  } else {
    $backToTop.fadeOut();
  }
});

$backToTop.on("click", function (e) {
  $("html, body").animate({ scrollTop: 0 }, 100);
});

// Responsive search category on list product pages
let toggleBtn = document.querySelector("#navbar-toggle");
let collapse = document.querySelector("#navbar-collapse");

if(toggleBtn != null) {
    toggleBtn.onclick = () => {
        collapse.classList.toggle("hidden");
        collapse.classList.toggle("flex");
    };
}

// Active Sidebar li
// const a = document.querySelectorAll(".accordion-body ul li a");
// [...a].forEach((item) =>
//   item.addEventListener("click", (event) => {
//     [...a].forEach((item) => item.classList.remove("is-active"));
//     event.currentTarget.classList.add("is-active");
//   })
// );

const sideBarBtn = document.querySelector(".bar-icon");
const navbarAdmin = document.querySelector(".main-content-admin");
const sidebarAdmin = document.querySelector("#sidebar-nav");
// const toStart = document.querySelector(".toStart");
// console.log(toStart);
sideBarBtn?.addEventListener("click", () => {
  sidebarAdmin.classList.toggle("sidebarPosition");
  navbarAdmin.classList.toggle("toStart");
  navbarAdmin.classList.toggle("toEnd");
  // sidebarAdmin.style.position = "unset";
  // navbarAdmin.classList.toggle('toEnd');
});

