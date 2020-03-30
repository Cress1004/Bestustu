// document.addEventListener("turbolinks:load", function(event) { 
//   const callback = function(entries) {
//     entries.forEach(entry => {
//       entry.target.classList.toggle("is-visible");
//     });
//   };
  
//   const observer = new IntersectionObserver(callback);
  
//   const targets = document.querySelectorAll(".show-on-scroll");
//   targets.forEach(function(target) {
//     observer.observe(target);
//   });
// });

document.addEventListener("turbolinks:load", function(event) { 
  var controller = new ScrollMagic.Controller();
  var scene = new ScrollMagic.Scene({
    triggerElement: '.show-on-scroll'
  })
  .setClassToggle('.show-on-scroll','is-visible')
  .addTo(controller)
});

    
 