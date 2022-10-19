/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.scss';

// start the Stimulus application
import './bootstrap';



// Les codes Menu Hamburger de navbar
let menuHamburger = document.getElementById("#menuHamburger");

menuHamburger.click = addEventListener("click", Show); 

function Show(){
    let element = document.querySelector('#navMenu');

    if(element.style.visibility=='hidden')
    {
        element.style.visibility='visible';
    }
    else
    {
        element.style.visibility='hidden';
    }
}

