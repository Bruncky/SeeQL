let menu = document.querySelector( "#mySidenav" );
let menuIcon = document.querySelector( "#my-burger-menu" );
 let bodyBackground = document.querySelector( "#body" );
menuIcon.addEventListener( "click",()=> {
  menu.classList.contains('open') ? menu.classList.remove('open') : menu.classList.add('open');
});

