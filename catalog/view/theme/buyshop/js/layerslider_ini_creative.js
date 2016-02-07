$(window).load(function() { /* makes sure the whole site is loaded */
    $("#status").fadeOut(); /* will first fade out the loading animation */
    $("#preloader").delay(350).fadeOut("slow"); /* will fade out the white DIV that covers the website. */
});

$(document).ready(function(){
    $('#layerslider').layerSlider({
        thumbnailNavigation : 'hover',
        hoverPrevNext : true,
        keybNav                 : false,
        navPrevNext             : true,
        navStartStop            : false,
        navButtons              : false,
        thumbnailNavigation     : 'disabled',
        pauseOnHover : false,
        showCircleTimer: false,
        skin                    : 'creative',
        skinsPath               : 'image/skins/',
        cbInit      : function(element){
            $('.ls-nav-prev').append('<i class="icon-left-thin"></i>');
            $('.ls-nav-next').append('<i class="icon-right-thin"></i>')
        }
    });


});