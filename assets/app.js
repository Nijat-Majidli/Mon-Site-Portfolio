/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.scss';

import './styles/responsive-design.scss';

// start the Stimulus application
import './bootstrap';

// loads the jquery package from node_modules
import $, { event } from 'jquery';



// Les codes Menu Hamburger de navbar
let menuHamburger = document.getElementById("menuHamburger");

menuHamburger.addEventListener("click", Show); 

function Show()
{
    let elements = document.querySelectorAll('.item');

    for (let elem in elements) 
    {
        if(elements[elem].style.visibility=='hidden')
        {
            elements[elem].style.visibility='visible';
        }
        else
        {
            elements[elem].style.visibility='hidden';
        }
    }
}


// Les code page template -> index.html.twig
$(function()
{
    let description =  document.getElementsByClassName("proDesc"); 
    let allDescriptions = [];
    $.each(description, function(key, value) 
    {   
        allDescriptions[key]=value.innerText;
        let text = value.innerText ;
        let shortText = text.slice(0, 150);
        
        $("#proDesc"+key).html(shortText);
        $("#readNext"+key).css({"visibility":"visible", "position":"relative"});
        
    });

    $(".suite a").on("click", function(event)
    {
        $("#"+event.target.id).css({"visibility":"hidden", "position":"absolute"});
        $("#reduceText"+event.target.className).css({"visibility":"visible", "position":"relative"});
        
        $.each(allDescriptions, function(key, value)
        {  
            if(parseInt(key)==event.target.className)
            {
                $("#proDesc"+event.target.className).html(value);
            }
        });
    });
  
    $(".reduire a").on("click", function(event)
    {
        $("#"+event.target.id).css({"visibility":"hidden", "position":"absolute"});
        $("#readNext"+event.target.className).css({"visibility":"visible", "position":"relative"});
        
        $.each(allDescriptions, function(key, value)
        {
            if(parseInt(key)==event.target.className)
            {
                let text = value;
                let shortText = text.slice(0, 150);
                $("#proDesc"+event.target.className).html(shortText);
            }
        });
    }); 
})