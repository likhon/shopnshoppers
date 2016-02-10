<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->

<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php
    $theme_options = $this->config->get('bs_general');
$bs_additional = $this->config->get('bs_additional');

$theme_colors = $this->config->get('bs_colors');
    $theme_products = $this->config->get('bs_products');
    $theme_skin = $this->config->get('bs_theme');
    function Hex2RGB($color){$color=str_replace("#","",$color);if(strlen($color)!=6){return array(0,0,0);}$rgb=array();for($x=0;$x<3;$x++){$rgb[$x]=hexdec(substr($color,(2*$x),2));}return $rgb;}
?>

<!--common_styles-->
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/common_styles.css" rel="stylesheet">
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/chosen.css" rel="stylesheet">
<!--common_styles-->

<!-- LAYOUT CSS SETTINGS -->
<?php if (isset($theme_options["layout_skin"])) : ?>
<?php switch($theme_options["layout_skin"]): ?>
<?php case "skin_creative" : ?>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style-creative.css" rel="stylesheet">
<?php break;?>
<?php case "skin_lifestore" : ?>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style-bioproduct.css" rel="stylesheet">
<?php break;?>
<?php case "skin_medstore" : ?>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style-medstore.css" rel="stylesheet">
<?php break;?>
<?php case "skin_cosmetic" : ?>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style-cosmetic.css" rel="stylesheet">
<?php break;?>
<?php default : ?>
<link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/style-creative.css" rel="stylesheet">
<?php endswitch;?>
<?php endif; ?>

<!--[if IE 9 ]><link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/styleie9.css" rel="stylesheet"> <![endif]-->
<!--[if lte IE 8 ]> <link href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/styleie8.css" rel="stylesheet"> <script src="js/html5.js"></script><![endif]-->
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/modernizr-2.6.2.min.js"></script>


<?php if (isset($theme_colors["captions_font"])&& $theme_colors["captions_font"] !== '-') : ?>
    <link href='//fonts.googleapis.com/css?family=<?php echo str_replace(' ', '+', $theme_colors["captions_font"]); ?>:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>
<?php endif; ?>
<?php if (isset($theme_colors["price_font"]) && $theme_colors["price_font"] !== '-') : ?>
    <link href='//fonts.googleapis.com/css?family=<?php echo str_replace(' ', '+', $theme_colors["price_font"]); ?>:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>
<?php endif; ?>

<?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') : ?>
<!-- GOOGLE FONTS -->
<link href='//fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet'>
<?php endif; ?>
<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_medstore') : ?>
<!-- GOOGLE FONTS -->
<link href='//fonts.googleapis.com/css?family=Merriweather:400,900,900italic,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<?php endif; ?>

<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic') : ?>
<!--GOOGLE FONTS-->
<link href='//fonts.googleapis.com/css?family=Allura' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Sintony:400,700' rel='stylesheet' type='text/css'>
<?php endif; ?>

<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />


<!--[if lte IE 8 ]>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/html5.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script src="//css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->



<!--[if !IE]><!--><script>if(/*@cc_on!@*/false){document.documentElement.className+='ie10';}</script><!--<![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" /><![endif]-->
<!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">DD_belatedPNG.fix('#logo img');</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>

    <!-- changing options from admin panel-->
<style type="text/css">

<?php if ($theme_products["product_catalog_mode"] == 'enable' ): ?>
    .cart_module{display:none}
    .form-search-wrapper{margin-right:0}
<?php endif; ?>

<?php if (isset($theme_products["rollover_effect"]) && $theme_products["rollover_effect"] == '2' ) : ?>
    .bestseller_slider .product .product-image-wrapper{position: relative}
    .product.hover .sticker_new_top_left, .product.hover .sticker_new_top_right, .product.hover .sticker_new_bottom_left, .product.hover .sticker_new_bottom_right, .product.hover .sticker_option_top_right, .product.hover .sticker_option_top_left, .product.hover .sticker_option_bottom_left, .product.hover .sticker_option_bottom_right, .product.hover .sticker_onsale_top_left, .product.hover .sticker_onsale_top_right, .product.hover .sticker_onsale_bottom_left, .product.hover .sticker_onsale_bottom_right{
        display: block;!important;
        z-index: 999
    }
    .product .product-image-wrapper a .view2 img{width:100%}
    .product .product-image-wrapper a{perspective: 600px}
    .product .product-image-wrapper a .view1 {
        backface-visibility: hidden;
        transform: rotateX(0deg) rotateY(0deg);
        transform-style: preserve-3d;
        transition: all 0.3s linear 0s;
        -webkit-transition: all .2s linear;
        transition: all .3s linear;
        -webkit-transform: rotateX(0deg) rotateY(0deg);
        -webkit-transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
        -o-transition:all .2s linear;
        -ms-transition:all .2s linear;
        -moz-transition:all .2s linear;
        -webkit-transition:all .2s linear;
        transition:all .3s linear;
        -webkit-transform:rotateX(0deg) rotateY(0deg);
        -webkit-transform-style:preserve-3d;
        -webkit-backface-visibility:hidden;
        -moz-transform:rotateX(0deg) rotateY(0deg);
        -moz-transform-style:preserve-3d;
        -moz-backface-visibility:hidden
    }
    .product .product-image-wrapper a:hover .view1{
        transform: rotateY(180deg);
        -webkit-transform:rotateY(180deg);
        -moz-transform:rotateY(180deg)
    }
    .product .product-image-wrapper a .view2{
        backface-visibility: hidden;
        left: 0;
        margin: 5px;
        position: absolute;
        top: 0;
        transform: rotateY(-180deg);
        transform-style: preserve-3d;
        transition: all 0.3s linear 0s;
        z-index: 100;
        -webkit-transition: all .4s linear;
        transition: all .3s linear;
        -webkit-transform: rotateY(-180deg);
        -webkit-transform-style: preserve-3d;
        -webkit-backface-visibility: hidden;
        -o-transition:all .4s linear;
        -ms-transition:all .4s linear;
        -moz-transition:all .4s linear;
        -webkit-transition:all .4s linear;
        transition:all .3s linear;
        -webkit-transform:rotateY(-180deg);
        -webkit-transform-style:preserve-3d;
        -webkit-backface-visibility:hidden;
        -moz-transform:rotateY(-180deg);-moz-transform-style:preserve-3d;
        -moz-backface-visibility:hidden
    }
    .product .product-image-wrapper a:hover .view2 {
        position: absolute;
        transform: rotateX(0deg) rotateY(0deg);
        z-index: 100;
        -webkit-transform:rotateX(0deg) rotateY(0deg);
        -moz-transform:rotateX(0deg) rotateY(0deg)
    }
    .product .product-image-wrapper{overflow:hidden}
    .product .hoveronly {display:none}
    .product:hover .hoveronly{display:block}
    .product .product-tocart{right:5px}
    .product-tocart .product-link a{clear:both;float:right}
    .sale_discount{bottom:0;right:5px}


<?php endif; ?>


/* general tab */
<?php if (isset($theme_options["footerinfo"]) && $theme_options["footerinfo"] == 'disable' ) :  ?>
    .line.delimeter_footer{display:none !important}
<?php endif; ?>

<?php if (!empty($theme_options["bgimage"])) : ?>
	body{
        background-image: url("image/<?php echo $theme_options["bgimage"]; ?>");
        background-repeat:<?php echo $theme_options["bgimage_mode"]; ?>;
        background-position:center center;
    }
<?php endif; ?>
/* end general tab */

/* Colors,backgrounds,fonts tab */

        /* theme color*/
			h4 [class^="flaticon-"], h4 [class*=" icon-"],
             h2 span, h2 a.active,
             h2 [class^="flaticon-"], h2 [class*=" icon-"],
             .custom_color, a .custom_color,
             a:hover .custom_color, a.custom_color:hover,
             .nav-list li li a:hover,
             .listing_header_row1 a[class^="flaticon-"].active,
             .listing_header_row1 a[class*=" icon-"].active,
             .listing_header_row1 a[class^="flaticon-"]:hover,
             .listing_header_row1 a[class*=" icon-"]:hover,
             #header.header_v_2 #nav li.level1 > a:hover,
             .product-img-box .more-views li i,
             #content .cart-info .quantity a, .rating strong i,.twit a,
             #footer_bottom i:hover,
             .sidebar_categories_collapsed li div:hover a,
             .sidebar_categories_collapsed li a:hover,.styled-list li:before,.color, .color:hover,.infobox .icon,
             .nonactive a.btn.rounded[class*=" icon-"]:hover,
             .infobox .icon,.dropcap.color,a.btn.rounded[class^="flaticon-"], a.btn.rounded[class*=" icon-"],.nonactive a.btn.rounded[class^="flaticon-"]:hover:after,.nonactive a.btn.rounded[class*=" icon-"]:hover:after,.nonactive i.btn.rounded[class^="flaticon-"]:hover:after,.nonactive i.btn.rounded[class*=" icon-"]:hover:after,.nonactive a.btn.rounded, .nonactive a.btn.rounded:before,.nonactive a.btn.rounded[class^="flaticon-"]:after,.nonactive a.btn.rounded[class*=" icon-"]:after,.nonactive a.btn.rounded[class^="flaticon-"]:hover:after,.nonactive a.btn.rounded[class^=" icon-"]:hover:after,.nonactive a.btn.rounded[class^="flaticon-"]:hover,.nonactive a.btn.rounded[class*=" icon-"]:hover,
             .color-box a.btn.rounded, .color-box a.btn.rounded:before, .color-box a.btn.rounded[class^="flaticon-"]:after, .color-box a.btn.rounded[class*=" icon-"]:after, .color-box a.btn.rounded[class^="flaticon-"]:hover:after, .color-box a.btn.rounded[class^=" icon-"]:hover:after, .color-box a.btn.rounded[class^="flaticon-"]:hover, .color-box a.btn.rounded[class*=" icon-"]:hover,
             .new_style,.product .product-tocart a,.post-meta,
             .es-nav a.btn, .flex-direction-nav a, .flexslider.banners .flex-direction-nav a, .flexslider.vertical .flex-direction-nav a, .jcarousel-container a.jcarousel-next, .jcarousel-container a.jcarousel-prev,
             .carousel-testimonials .quotes,.tp-rightarrow.default i,.carousel-testimonials .flexslider .flex-direction-nav a i:before,
             .listing_header_row1 a[class^="icon-"].active,.listing_header_row1 a[class^="icon-"]:hover,.pagination .links b,.tp-leftarrow.default i,
             .carousel-testimonials .flexslider .flex-direction-nav a i:before,.product-img-box .jcarousel-item i,
             h3 span.theme_color,#cart .heading a.btn{
<?php if (!empty($theme_skin["general_themecolor"]) ) { ?>
color: <?php echo $theme_skin["general_themecolor"]; ?> !important;
<?php }  ?>
            }

<?php if (!empty($theme_skin["general_themecolor"]) ) : ?>
			a.small_icon_color i,#topline,
                                                      .nav-tabs > li > a:hover, .nav-tabs > .active > a, .nav-tabs > .active > a:hover,
                                                      .direction-nav a:hover,
                                                      .htabs a.selected,
                                                      .tp-loader,
                                                      #menu > ul > li:hover > a,
                                                      .product-shop .add-to-cart .qty input#increase, .product-shop .add-to-cart .qty input#decrease,
                                                      input[disabled]#button-shipping,
                                                      .es-carousel .product-link .icon-heart:before, .es-carousel .product-link .icon-popup:before,
                                                      .featured_slider .product-link .icon-heart:before, .featured_slider .product-link .icon-popup:before,
                                                      .product-grid .product-link .icon-heart:before,
                                                      .product-grid .product-link .icon-popup:before,
                                                      .sale_discount,
                                                      a.quickview:hover,
                                                      .quickviewblock .product-link .icon-heart:before,
                                                      .quickviewblock .product-link .icon-popup:before,
                                                      .tp-bannertimer,
                                                      .category-list a:hover,
                                                      .countdown_inner,
                                                      .quick_button_add,
                                                      .squared.icon-color[class^="flaticon-"], .squared.icon-color[class*=" icon-"],
                                                      .progress .bar,.color_mark, .dropcap.dark,#dark_theme #cart .badge,
                                                      .flexslider.banners .flex-direction-nav a:hover, .progress .bar, .color_mark, .dropcap.dark, .sale_discount, .quick_button_add, a.quickview:hover, .tp-bannertimer, .category-list a:hover, .quickviewblock .product-link .icon-heart:before, .quickviewblock .product-link .icon-popup:before, input[disabled]#button-shipping,.product_sticker_new,
                                                      .jcarousel-container a.btn:hover,.carousel-testimonials .flexslider .flex-direction-nav a:hover,
                                                      .promo_box div,button, .button {
                                                          background-color: <?php echo $theme_skin["general_themecolor"]; ?>!important;
                                                      }

.nav-list > li > a:hover,.form-search button.btn,
.form-mail button.btn,#cart .heading a.btn,.preview .col-2 .wrapper-hover,
#footer_line, .footer_bottom_normal_mode,#footer_button,
.shopping_cart_mini .button:hover,
a.btn.rounded[class^="flaticon-"]:hover:after,
a.btn.rounded[class*=" icon-"]:hover:after,
i.btn.rounded[class^="flaticon-"]:hover:after,
i.btn.rounded[class*=" icon-"]:hover:after,
#nav > li:hover > a,
.custom_blocks a.btn.rounded[class^="flaticon-"]:hover:after,
.custom_blocks a.btn.rounded[class*=" icon-"]:hover:after,
a.btn.rounded[class^="flaticon-"]:hover:after,
a.btn.rounded[class*=" icon-"]:hover:after,
i.btn.rounded[class^="flaticon-"]:hover:after,
i.btn.rounded[class*=" icon-"]:hover:after,
.product-tocart a.btn.rounded[class^="flaticon-"]:after, .product-tocart a.btn.rounded[class*=" icon-"]:after, .product-tocart i.btn.rounded[class^="flaticon-"]:after, .product-tocart i.btn.rounded[class*=" icon-"]:after,
.color-box,.font-404, .btn-middle, .price-table.active .price-table-price{
    background: <?php echo $theme_skin["general_themecolor"]; ?>!important;
}

#login-box .line,
#nav > li > ul, #nav li:hover .menu_custom_block,
#header.header_v_2 #nav li.level1:hover,
.box-wrapper .line,
.cloud-zoom-lens,
.custom_blocks a.btn.rounded[class^="flaticon-"]:hover,
.custom_blocks a.btn.rounded[class*=" icon-"]:hover,
.custom_blocks a.btn.rounded[class^="flaticon-"]:hover:after,
.custom_blocks a.btn.rounded[class*=" icon-"]:hover:after,
a.btn.rounded[class^="flaticon-"]:hover:after,
a.btn.rounded[class*=" icon-"]:hover:after,
i.btn.rounded[class^="flaticon-"]:hover:after,
i.btn.rounded[class*=" icon-"]:hover:after,
a.btn.rounded[class^="flaticon-"]:hover,
a.btn.rounded[class*=" icon-"]:hover,
i.btn.rounded[class^="flaticon-"]:hover,
i.btn.rounded[class*=" icon-"]:hover, .product-img-box .more-views li i,
.product-tocart a.btn.rounded[class^="flaticon-"]:after, .product-tocart a.btn.rounded[class*=" icon-"]:after, .product-tocart i.btn.rounded[class^="flaticon-"]:after, .product-tocart i.btn.rounded[class*=" icon-"]:after,
.product-tocart a.btn.rounded[class^="flaticon-"], .product-tocart a.btn.rounded[class*=" icon-"], .product-tocart i.btn.rounded[class^="flaticon-"], .product-tocart i.btn.rounded[class*=" icon-"],
a.btn.icon-5x.rounded[class^="flaticon-"], a.btn.icon-5x.rounded[class*=" icon-"],.price-table.active,.price-table.active .price-table-price,
a.btn.icon-5x.rounded[class^="flaticon-"], a.btn.icon-5x.rounded[class*=" icon-"], a.btn.icon-4x.rounded[class^="flaticon-"], a.btn.icon-4x.rounded[class*=" icon-"], a.btn.icon-3x.rounded[class^="flaticon-"], a.btn.icon-3x.rounded[class*=" icon-"], a.btn.icon-5x.rounded[class^="flaticon-"], a.btn.icon-5x.rounded[class*=" icon-"],
.custom_blocks a.btn.rounded[class^="flaticon-"]:hover, .custom_blocks a.btn.rounded[class*=" icon-"]:hover, .price-table.active .price-table-title, .price-table.active .price-table-price{
    border-color: <?php echo $theme_skin["general_themecolor"]; ?>!important;
}
#menu > ul > li > div{border-top-color: <?php echo $theme_skin["general_themecolor"]; ?>!important}
.htabs{border-bottom-color:<?php echo $theme_skin["general_themecolor"]; ?>!important}
.blockquote.style1{border-left-color:<?php echo $theme_skin["general_themecolor"]; ?> !important;}

.product-tocart a.btn.rounded[class^="flaticon-"], .product-tocart a.btn.rounded[class*=" flaticon-"], .product-tocart i.btn.rounded[class^="flaticon-"], .product-tocart i.btn.rounded[class*=" flaticon-"], .price-table.active{
    border:3px solid <?php echo $theme_skin["general_themecolor"]; ?> !important;
}
.nivo-directionNav a.btn.rounded[class^="flaticon-"]:hover:after, .nivo-directionNav a.btn.rounded[class*=" flaticon-"]:hover:after, .loader-slider, .custom_blocks a.btn.rounded[class^="flaticon-"]:hover:after, .custom_blocks a.btn.rounded[class*=" flaticon-"]:hover:after, .product-tocart a.btn.rounded[class^="flaticon-"]:after, .product-tocart a.btn.rounded[class*=" flaticon-"]:after, .product-tocart i.btn.rounded[class^="flaticon-"]:after, .product-tocart i.btn.rounded[class*=" flaticon-"]:after, .custom_blocks a.btn.rounded[class^="flaticon-"]:hover:after, .custom_blocks a.btn.rounded[class*=" flaticon-"]:hover:after, .color-box, .squared.icon-color[class^="flaticon-"], .squared.icon-color[class*=" flaticon-"], .font-404, .btn-middle, .price-table.active .price-table-price, a.btn.rounded[class^="flaticon-"]:hover:after, a.btn.rounded[class*=" flaticon-"]:hover:after, i.btn.rounded[class^="flaticon-"]:hover:after, i.btn.rounded[class*=" flaticon-"]:hover:after{
    background:<?php echo $theme_skin["general_themecolor"]; ?> !important;
}
.flexslider.banners{
    border-bottom-color:<?php echo $theme_skin["general_themecolor"]; ?> !important;
}
.tab-content{
    border-top-color:<?php echo $theme_skin["general_themecolor"]; ?> !important;
}
a.small_icon_color:hover i,.pagination .links b,#topline .fadelink > a{
    border:1px solid <?php echo $theme_skin["general_themecolor"]; ?> !important;
}
.preview{border:5px solid <?php echo $theme_skin["general_themecolor"]; ?> !important;}

<?php endif; ?>
        /* end theme color*/

        /* theme hover color*/
			.shoppingcart:hover .fadelink span a,
             button:hover,
             .button:hover,
             .form-mail button.btn:hover
			.shopping_cart_mini .button:hover,
             .mini-cart-info .button:hover,
             button:hover, .button:hover,
             a.small_icon_color:hover i,
             input[type="button"]:hover,
             input.button:hover,
             input.button.hover,
             input[type="file"],
             input:hover.button,
             .product-shop .add-to-cart button.btn-cart:hover,
             .product-shop .add-to-cart .qty input#increase:hover,
             .product-shop .add-to-cart .qty input#decrease:hover,
             input[disabled]#button-shipping:hover,
             .quick_button_add:hover,
             .squared.icon-color[class^="flaticon-"]:hover, .squared.icon-color[class*=" icon-"]:hover,

             button:hover{
                 <?php if (!empty($theme_colors["general_themehover"]) ) : ?>
             background-color:<?php echo $theme_colors["general_themehover"]?>!important;
                 <?php endif; ?>
             }
#content .cart-info .quantity a:hover, .form-search .btn:hover i, #cart a.btn:hover i,#cart .heading a.btn:hover{
    <?php if (!empty($theme_colors["general_themehover"]) ) : ?>
color:<?php echo $theme_colors["general_themehover"]?> !important
<?php endif; ?>
}
.form-search input.search-query:hover, #right_toolbar .form-search input.search-query:hover{
    border-color:<?php echo $theme_colors["general_themehover"]?> !important
}

    /* end theme hover color*/


    /* Input hover color*/
<?php if (!empty($theme_colors["general_input"]) ) : ?>
	textarea:focus, input[type="text"]:focus, input[type="password"]:focus, input[type="datetime"]:focus, input[type="datetime-local"]:focus, input[type="date"]:focus, input[type="month"]:focus, input[type="time"]:focus, input[type="week"]:focus, input[type="number"]:focus, input[type="email"]:focus, input[type="url"]:focus, input[type="search"]:focus, input[type="tel"]:focus, input[type="color"]:focus, .uneditable-input:focus {
        border-color: <?php echo $theme_colors["general_input"]?>!important;
    }
<?php endif; ?>

/* text color */

        <?php if (!empty($theme_colors["general_text"]) ) : ?>
			body,
            h1,h2, h3,h4, .twit .icon,
			.success, .warning, .attention, .information,
			#topline,
			select, textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input,
            .product-small .product-price,.product .product-price span.old, .product .product-price-regular span.old, .preview .product-price span.old, .preview .product-price-regular span.old,
			#header #cart .content,
			#header #cart .content,
			.mini-cart-info td,
			#footer_bottom .noHover span.text, #footer_bottom .noHover span.text span,
			.product-shop .old-price .price, .product-listing .old-price .price,
			.product-shop .price-box .price-tax,
			.product-shop .price-box .reward,
			.product-shop .price-box .discount,
			.product-shop .options,.product-listing.product-list .list_description,
			.product-info .cart .minimum,
			.attribute thead td, .attribute thead tr td:first-child,
			.attribute td, .product-listing .price-box, .product-list .price-tax,#topline .phone span,.flexslider .slides > li,.carousel-testimonials .flexslider p span,
            .product .product-price,table.form > * > * > td,.block .block-title{
				color: <?php echo $theme_colors["general_text"]?>!important;
			}
        <?php endif; ?>

/* Link Color */
        <?php if (!empty($theme_colors["general_link"]) ) : ?>
			a,
			#topline a,
			.dd1 .ddTitle span.ddTitleText, .dd2 .ddTitle span.ddTitleText,
			.shopping_cart_mini .product-detailes .product-name,
			.mini-cart-info .product-detailes .product-name,
			.product .product-link span,
			.preview .product-link span,
			.twit a,#footer_bottom .noHover span.text span,
            .google_map small a{
				color: <?php echo $theme_colors["general_link"]?>!important;
			}
        <?php endif; ?>


/* Link hover Color */
        <?php if (!empty($theme_colors["general_linkhover"]) ) : ?>
			a:hover,
			#topline a:hover,
			.dd1 .ddTitle span.ddTitleText:hover, .dd2 .ddTitle span.ddTitleText:hover,
			.shopping_cart_mini .product-detailes .product-name:hover,
			.mini-cart-info .product-detailes .product-name:hover,
			.product .product-link span:hover,
			.preview .product-link span:hover,#footer_bottom .footer_social_icons a:hover i,
			.twit a:hover,#footer_bottom .noHover a:hover span.text span,
			#menu > ul > li > a:hover, .google_map small a:hover{
				color: <?php echo $theme_colors["general_linkhover"]?>!important;
			}
        <?php endif; ?>


/* Background Color */
        <?php if (!empty($theme_colors["general_bgcolor"]) ) : ?>
			body{background-color: <?php echo $theme_colors["general_bgcolor"]?>!important}
        <?php endif; ?>

/* Header TopLine: Text Color  */
        <?php if (!empty($theme_colors["topline_text"]) ) : ?>
			#topline{color: <?php echo $theme_colors["topline_text"]?>!important}
        <?php endif; ?>

/* Header TopLine: Link Color  */
        <?php if (!empty($theme_colors["topline_link"]) ) : ?>
			#topline a,.dd1 .ddTitle span.ddTitleText, .dd2 .ddTitle span.ddTitleText{
                color: <?php echo $theme_colors["topline_link"]?>!important;
            }
        <?php endif; ?>

/* Header TopLine: Link hover Color  */
        <?php if (!empty($theme_colors["topline_linkhover"]) ) : ?>
			#topline a:hover,
			.dd1 .ddTitle span.ddTitleText:hover,
			.dd2 .ddTitle span.ddTitleText:hover{
                color: <?php echo $theme_colors["topline_linkhover"]?>!important;
            }
        <?php endif; ?>

/* Header TopLine: Background Color  */
        <?php if (!empty($theme_colors["topline_bgcolor"]) ) : ?>
			#topline{background: <?php echo $theme_colors["topline_bgcolor"]?>!important}
        <?php endif; ?>

/* Header TopLine: Shadow */
        <?php if (!empty($theme_colors["topline_shadow"]) && $theme_colors["topline_shadow"] == 'disable' ) : ?>
			#topline{box-shadow:none!important;}
        <?php endif; ?>

/* Header TopLine: topline phonecolor  */
        <?php if (!empty($theme_colors["topline_phonecolor"]) ) : ?>
			#topline .phone span{color: <?php echo $theme_colors["topline_phonecolor"]?>!important}
        <?php endif; ?>

/* Header dd boxes: link color  */
        <?php if (!empty($theme_colors["dd_ink"]) ) : ?>
			#topline .fadelink a,
			#topline .dd_select_wrapper_language span,
			#topline .dd_select_wrapper_currency span{
                color: <?php echo $theme_colors["dd_ink"]?>!important;
            }
        <?php endif; ?>

/* Header dd boxes: link hover color  */
        <?php if (!empty($theme_colors["dd_linkhover"]) ) : ?>
			#topline .fadelink a:hover,
			#topline .dd_select_wrapper_language span:hover,
			#topline .dd_select_wrapper_currency span:hover{
                color: <?php echo $theme_colors["dd_linkhover"]?>!important;
            }
        <?php endif; ?>

/* Header dd boxes: Background color  */
        <?php if (!empty($theme_colors["dd_bgcolor"]) ) : ?>
			#topline .fadelink > a,
			#topline .fadelink .ul_wrapper ul,
			.dd1 .ddTitle, .dd2 .ddTitle,
			.dd1 .ddChild, .dd2 .ddChild{
                background-color: <?php echo $theme_colors["dd_bgcolor"]?>
            }
        <?php endif; ?>
/* Header dd boxes: Border color  */
        <?php if (!empty($theme_colors["dd_border"]) ) : ?>
			#topline .fadelink > a,
			#topline .fadelink .ul_wrapper ul,
			.dd1 .ddTitle, .dd2 .ddTitle,
			.dd1 .ddChild, .dd2 .ddChild{
                border:1px solid <?php echo $theme_colors["dd_border"]?>;
				border-radius:3px
            }
        <?php endif; ?>
/* Header dd boxes: Arrow Image */


/* Header / Navigation: text color  */
        <?php if (!empty($theme_colors["headernav_text"]) ) : ?>
			.form-search input.search-query,
			#header #cart .empty,
			#header #cart .content .inner-wrapper,
			.mini-cart-info td,
            .shopping_cart_mini .product-detailes .product-price, .mini-cart-info .product-detailes .product-price,
            #nav #menu_custom_block .col-third, #nav #menu_custom_block h1, #nav li.category_desc_in_menu{
                color: <?php echo $theme_colors["headernav_text"]?>!important
            }
        <?php endif; ?>

/* Header / Navigation: Link Color (level_0)  */
        <?php if (!empty($theme_colors["headernav_link"]) ) : ?>
			#nav > li > a, #nav li.level1 > a, #nav li.level2 > a{
                color: <?php echo $theme_colors["headernav_link"]?>!important
            }
        <?php endif; ?>
/* Header / Navigation: Link hover Color (level_0)  */
        <?php if (!empty($theme_colors["headernav_linkhover"]) ) : ?>
			#nav > li > a:hover, #nav li.level1 > a:hover, #nav li.level2 > a:hover{
                color: <?php echo $theme_colors["headernav_linkhover"]?>!important
            }
        <?php endif; ?>
/* Header / Navigation: Header background color  */
        <?php if (!empty($theme_colors["header_bgcolor"]) ) : ?>
			#header{background-color: <?php echo $theme_colors["header_bgcolor"]?>!important}
        <?php endif; ?>
/* Header / Navigation: Blocks background color */
        <?php if (!empty($theme_colors["headernav_bgcolor"]) ) : ?>
			#nav > li > ul, #nav li:hover .menu_custom_block,
			#header #cart .content .inner-wrapper, .dchild, .cdchild{
                background-color: <?php echo $theme_colors["headernav_bgcolor"]?>!important
            }
            #header #cart .content .inner-wrapper{
                border: 1px solid <?php echo $theme_colors["headernav_bgcolor"]?>!important
            }
        <?php endif; ?>
/* Header / Navigation: Background Image */
        <?php if (!empty($theme_colors["headernav_image"]) ) : ?>
			#header{
                background-image:url("image/<?php echo $theme_colors["headernav_image"]?>")!important;
				background-position:center;
            }
        <?php endif; ?>
/* Header / Navigation: Search decoration in header */
        <?php if (!empty($theme_colors["headernav_search_decoration"]) ) : ?>
			.form-search-wrapper{
                background-image:url("image/<?php echo $theme_colors["headernav_search_decoration"]?>")!important;
				background-position:0 0;
                background-repeat: no-repeat;
				margin-top: -25px;
				padding-top: 25px;
            }
        <?php endif; ?>
/* Header / Navigation: Search decoration position */
        <?php if (!empty($theme_colors["headernav_search_decoration_position"]) ) : ?>
			.form-search-wrapper{
				margin-top: -<?php echo $theme_colors["headernav_search_decoration_position"]?>px;
				padding-top: <?php echo $theme_colors["headernav_search_decoration_position"]?>px;
            }
        <?php endif; ?>


/* Content: Text Color  */
        <?php if (!empty($theme_colors["content_text"]) ) : ?>
			#content{color: <?php echo $theme_colors["content_text"]?>}
        <?php endif; ?>
/* Content: Link Color  */
        <?php if (!empty($theme_colors["content_link"]) ) : ?>
			#content a,#collapsed-menu .nav-header a, #collapsed-menu a,#collapsed-menu li.active > label > a{color: <?php echo $theme_colors["content_link"]?>}
        <?php endif; ?>
/* Content: Link hover Color  */
        <?php if (!empty($theme_colors["content_linkhover"]) ) : ?>
			#content a:hover,#collapsed-menu .nav-header a:hover, #collapsed-menu a:hover,#collapsed-menu li.active > label > a:hover{color: <?php echo $theme_colors["content_linkhover"]?>}
        <?php endif; ?>
/* Content: Background Color  */
        <?php if (!empty($theme_colors["content_bgcolor"]) ) : ?>
        #content{background:none}
        #content, section.all_pages,section.slider{background-color: <?php echo $theme_colors["content_bgcolor"]?>!important}
        <?php endif; ?>

/* Content: Background image */
<?php if (!empty($theme_colors["content_bg"])) : ?>
	#content, section.all_pages,section.slider{
        background-image: url("image/<?php echo $theme_colors["content_bg"]; ?>");
        background-repeat:<?php echo $theme_colors["content_bg_mode"]; ?>;
        background-position:top center;
    }
<?php endif; ?>
/* Content: Product block border color */
        <?php if (!empty($theme_colors["product_border"]) ) :$temp = Hex2RGB($theme_colors["product_border"]);?>
		.preview{box-shadow: 0px 0px 4px rgba(<?php echo $temp[0]?>, <?php echo $temp[1]?>, <?php echo $temp[2]?>, 0.27)}
        .preview{border:5px solid <?php echo $theme_colors["product_border"]; ?>}
        .preview .col-2 .wrapper-hover{background:<?php echo $theme_colors["product_border"]; ?>}
        <?php endif; ?>
/* Content: Product block shadow */
        <?php if (!empty($theme_colors["product_shadow"]) && $theme_colors["product_shadow"] == 'disable' ) : ?>
			.preview{box-shadow:none!important}
        <?php endif; ?>
/* Content: Image rollover mode */
        <?php if (!empty($theme_colors["product_image_rollover"]) && $theme_colors["product_image_rollover"] == 'simple' ) : ?>
			.preview .col-1{display:none!important;}
        <?php endif; ?>
/* Content: Image rollover disable */
        <?php if (!empty($theme_colors["product_image_rollover"]) && $theme_colors["product_image_rollover"] == 'none' ) : ?>
			.preview{display:none!important;}
			.product.hover .product_sticker,
			.product.hover .product_sticker_new, .product .product-tocart{display: block!important;}
            .sale_discount{right:50px;bottom:50px;z-index:999}
        <?php endif; ?>



/***************** Captions font */
        <?php if (!empty($theme_colors["captions_font"]) ) : ?>
            h1, h2, h3, h4,
			#content h1, #content h2, #content h3, #content h4,
			.nav-list li a, #nav > li > a,
			.block .block-title,
			.accordion-heading,
            button, .button,
            #footer_popup h3, #footer_popup h4,
            button.button-2x, .button.button-2x,
            button.button-3x, .button.button-3x,
            .checkout-heading,
            .box-heading, .custom_blocks .box_infobanners .text a{
                font-family:<?php echo $theme_colors["captions_font"]?>;
            }
        <?php endif; ?>

/* Captions color */
        <?php if (!empty($theme_colors["captions_text"]) ) : ?>
			h1, h2, h3, h4,
			#content h1, #content h2, #content h3, #content h4,
			.block .block-title,
			.accordion-heading,
			.checkout-heading,
			#footer_popup h3,
			#footer_popup h4,
			.box-heading{
                color: <?php echo $theme_colors["captions_text"]?>!important;
            }
        <?php endif; ?>


/**************** Footer info: text Color  */
        <?php if (!empty($theme_colors["footerinfo_text"]) ) : ?>
			.carousel-testimonials .flexslider{color: <?php echo $theme_colors["footerinfo_text"]?>!important}
        <?php endif; ?>
/* Footer info: link Color  */
        <?php if (!empty($theme_colors["footerinfo_link"]) ) : ?>
			.carousel-testimonials a{color: <?php echo $theme_colors["footerinfo_link"]?>!important}
        <?php endif; ?>

/* Footer info: Captions Color  */
        <?php if (!empty($theme_colors["footerinfo_captions"]) ) : ?>
             #content .carousel-testimonials h1,#content .carousel-testimonials h2,#content .carousel-testimonials h3,#content .carousel-testimonials h4{color: <?php echo $theme_colors["footerinfo_captions"]?>!important}
        <?php endif; ?>
/* Footer info: Bold Text Color  */
        <?php if (!empty($theme_colors["footerinfo_bold"]) ) : ?>
			.carousel-testimonials .flexslider p span{color: <?php echo $theme_colors["footerinfo_bold"]?>!important}
        <?php endif; ?>
/* Footer info: Background Color  */
        <?php if (!empty($theme_colors["footerinfo_bgcolor"]) ) : ?>
            .carousel-testimonials .flexslider{background-color: <?php echo $theme_colors["footerinfo_bgcolor"]?>;opacity:0.85}
        <?php endif; ?>

/***************** Footer: text Color  */
        <?php if (!empty($theme_colors["footer_text"]) ) : ?>
			#footer_bottom, #footer_bottom span,
			.footer_dark_skin_wrapper #footer_bottom,
            .footer_dark_skin_wrapper #footer_bottom span.text, .footer_dark_skin_wrapper #footer_bottom span{
                color: <?php echo $theme_colors["footer_text"]?>!important
            }
        <?php endif; ?>
/* Footer: link Color  */
        <?php if (!empty($theme_colors["footer_link"]) ) : ?>
			#footer_bottom a, #footer_bottom .custom_color{color: <?php echo $theme_colors["footer_link"]?>!important}
        <?php endif; ?>
/* Footer: link hover Color  */
        <?php if (!empty($theme_colors["footer_link_hover"]) ) : ?>
			#footer_bottom a:hover, #footer_bottom .custom_color:hover{color: <?php echo $theme_colors["footer_link_hover"]?>!important}
        <?php endif; ?>
/* Footer: Background Color  */
        <?php if (!empty($theme_colors["footer_bgcolor"]) ) : ?>
			#footer_line, .footer_dark_skin_wrapper,
            #footer_line.footer_line_normal_bg .footer_light_skin_wrapper{background-color: <?php echo $theme_colors["footer_bgcolor"]?>}
        <?php endif; ?>

/***************** Footer popup: text Color  */
        <?php if (!empty($theme_colors["footerpopup_text"]) ) : ?>
			#footer_popup, .footer_popup_dark{color: <?php echo $theme_colors["footerpopup_text"]?>!important}
        <?php endif; ?>
/* Footer popup: captions Color  */
        <?php if (!empty($theme_colors["footerpopup_captions"]) ) : ?>
			#footer_popup h3, .footer_popup_dark h3{color: <?php echo $theme_colors["footerpopup_captions"]?>!important}
        <?php endif; ?>
/* Footer popup: link Color  */
        <?php if (!empty($theme_colors["footerpopup_link"]) ) : ?>
			#footer_popup a, .footer_popup_dark a{color: <?php echo $theme_colors["footerpopup_link"]?>!important}
        <?php endif; ?>
/* Footer popup: link hover Color  */
        <?php if (!empty($theme_colors["footerpopup_linkhover"]) ) : ?>
			#footer_popup a:hover,.footer_popup_dark a:hover{color: <?php echo $theme_colors["footerpopup_linkhover"]?>!important}
        <?php endif; ?>
/* Footer popup: Background Color and Background Transparency  */
        <?php if (!empty($theme_colors["footerpopup_bgcolor"]) ) {
			$temp_popup = Hex2RGB($theme_colors["footerpopup_bgcolor"]);
				if (!empty($theme_colors["footerpopup_bgtrans"]) ) {
        ?>
        #footer_popup, .footer_popup_dark{
            background-color: <?php echo $theme_colors["footerpopup_bgcolor"]; ?>;
            background-color: rgba(<?php echo $temp_popup[0]?>, <?php echo $temp_popup[1]?>, <?php echo $temp_popup[2]?>, <?php echo $theme_colors["footerpopup_bgtrans"]?>)
		}
        <?php
			} else {
		?>

            #footer_popup, .footer_popup_dark{
                background-color: <?php echo $theme_colors["footerpopup_bgcolor"]; ?>;
                background-color: rgba(<?php echo $temp_popup[0]?>, <?php echo $temp_popup[1]?>, <?php echo $temp_popup[2]?>, 0.85)
			}

<?php
				}
			}
?>

/*************************** prices: Price Font */
        <?php if (!empty($theme_colors["price_font"]) && $theme_colors["price_font"] !== '-' ) : ?>
			.product .product-price,
			.preview .product-price,
            .product-small .product-price,
            .product-small .product-price span.old,
			.product .product-price-regular .price-new,
			.preview .product-price-regular .price-new,
			.product-shop .price-box,
			.product-shop .special-price .price,
			.product-listing .price-box,
			.product-list .product-price-regular .price-new,.product .product-price span.new,.product .product-price .product-price-regular .old,
            .product-shop .old-price .price{
                font-family: <?php echo $theme_colors["price_font"]?>!important
            }
        <?php endif; ?>
/* prices: Regular price Color */
        <?php if (!empty($theme_colors["price_regular"]) ) : ?>
			.product .product-price,
			.preview .product-price,
			.product-shop .price-box,
			.product-listing .price-box,
            .box-product .price,
            .wishlist-info .price,
            .compare-info .price-regular{
                color: <?php echo $theme_colors["price_regular"]?>!important
            }
        <?php endif; ?>
/* prices: New special price color */
        <?php if (!empty($theme_colors["price_new"]) ) : ?>
			.product .product-price-regular .price-new,
			.preview .product-price-regular .price-new,
			.product-shop .special-price .price,
			.product-list .product-price-regular .price-new,
            .box-product .price-new,
            .wishlist-info .price b, .compare-info .price-new,.product .product-price span.new{
                color: <?php echo $theme_colors["price_new"]?>!important
            }
        <?php endif; ?>
/* prices: Old price color */
        <?php if (!empty($theme_colors["price_old"]) ) : ?>
			.product .product-price .product-price-regular .old,
			.preview .product-price .product-price-regular .old,

			.product-shop .old-price .price,
			.product-list .product-price-regular .old,
            .box-product .price-old,
            .wishlist-info .price s, .compare-info .price-old{
                color: <?php echo $theme_colors["price_old"]?>!important
            }
        <?php endif; ?>

/* Delimiter Content Image */
<?php if (!empty($theme_colors["delimeter_content"]) ) : ?>
    .line.delimeter_content{
       background: url("image/<?php echo $theme_colors["delimeter_content"]?>") repeat-x 0 0;
       border: medium none;
       height: 40px;
       margin: 5px 0;
    }
<?php endif; ?>

/* Delimiter footer Image */
<?php if (!empty($theme_colors["footer_delimeter"]) ) : ?>
    .line, .line1, .promo_box{
        background: url("image/<?php echo $theme_colors["footer_delimeter"]?>") repeat-x 0 0;
        border: medium none;
        height: 40px;
    }
<?php endif; ?>

<?php if (!empty($theme_colors["sale_label_bg"]) ) : ?>
    .label_sale{background-color:<?php echo $theme_colors["sale_label_bg"]?>}
<?php endif; ?>

<?php if (!empty($theme_colors["new_label_bg"]) ) : ?>
     .label_new{background-color:<?php echo $theme_colors["new_label_bg"]?>}
<?php endif; ?>


    /********************************* end Colors,backgrounds,fonts tab *********************/

/* reset colors changes*/

    #back-top a{color: #8A8A8A!important}




#header #cart .heading a.btn i,.cart-info tbody .quantity a[class^="flaticon-"],.cart-info tbody .quantity a[class*=" icon-"]{background:none !important}
.jcarousel-container a.btn:hover i,
.flex-direction-nav a:hover, .flexslider.banners .flex-direction-nav a:hover
{color:#fff !important}
.add-to-links a.small_icon_color:hover i{border:none !important}


                                                                                                                                                                                                                                                                                          <?php if (isset($theme_options["layout_skin"])) : ?>
<?php switch($theme_options["layout_skin"]): ?>
<?php case "skin_lifestore" : ?>
.carousel-testimonials .flexslider .flex-direction-nav a:hover i:before{color:#fff !important}
<?php break;?>
<?php case "skin_medstore" : ?>
.carousel-testimonials .flexslider .flex-direction-nav a:hover i:before{<?php if (!empty($theme_skin["general_themecolor"]) ) : ?>color: <?php echo $theme_skin["general_themecolor"]; ?> !important;<?php endif; ?>}
<?php break;?>
<?php endswitch;?>
<?php endif; ?>

/* reset colors changes*/



</style>
    <!-- end changing options from admin panel  -->

<!--custom css changes-->
<?php if (isset($theme_options["css_file"]) && $theme_options["css_file"] == 'A' ) : ?>
<link type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/custom.css" rel="stylesheet" />
<link type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/bootstrap/css/bootstrap.css" rel="stylesheet" />
<?php endif; ?>
<!--end custom css changes-->

<?php echo $google_analytics; ?>

</head>
<?php
if (isset($this->request->get['route'])) {
$route = $this->request->get['route'];
} else {
$route = 'common/home';
}
$layout_id = 0;
if (substr($route, 0, 16) == 'product/category' && isset($this->request->get['path'])) {
$path = explode('_', (string)$this->request->get['path']);
$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
}
if (substr($route, 0, 16) == 'product/product' && isset($this->request->get['product_id'])) {
$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
}
if (substr($route, 0, 16) == 'product/information' && isset($this->request->get['information_id'])) {
$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
}
if (!$layout_id) { $layout_id = $this->model_design_layout->getLayout($route); }
if (!$layout_id) { $layout_id = $this->config->get('config_layout_id'); }

?>
<body class="shop <?php echo($layout_id == 1 ? 'index_page' : 'none_index_page'); ?> layout_<?php echo $layout_id; ?>" <?php echo (isset($theme_options["layout_skin"]) ? 'id='.$theme_options["layout_skin"] : ''); ?>>
<!--scripts-->
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/chosen.jquery.js"></script>

<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>

<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/bootstrap/js/bootstrap.min.js"></script>


<?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') { ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/jquery-transit-modified.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/layerslider.transitions.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/layerslider.kreaturamedia.jquery.js"></script>
<?php } else { ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js_slider/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js_slider/jquery.themepunch.revolution.min.js"></script>
<?php } ?>

<?php if (isset($theme_options["layout_skin"])) : ?>
<?php switch($theme_options["layout_skin"]): ?>
<?php case "skin_creative" : ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/layerslider_ini_creative.js"></script>
<?php break;?>
<?php case "skin_lifestore" : ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js_slider/revolution_ini.js"></script>
<?php break;?>
<?php case "skin_medstore" : ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js_slider/revolution_ini_medstore.js"></script>
<?php break;?>
<?php case "skin_cosmetic" : ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js_slider/revolution_ini_cosmetic.js"></script>
<?php break;?>
<?php default : ?>
<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/layerslider_ini_creative.js"></script>
<?php endswitch;?>
<?php endif; ?>


<?php switch($theme_options["layout_skin"]): ?>
<?php case "skin_creative" : ?>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/theme_scripts_creative.js"></script>
<?php break;?>
<?php case "skin_lifestore" : ?>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/theme_scripts.js"></script>
<?php break;?>
<?php case "skin_medstore" : ?>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/theme_scripts_medstore.js"></script>
<?php break;?>
<?php case "skin_cosmetic" : ?>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/theme_scripts_cosmetic.js"></script>
<?php break;?>
<?php default : ?>
<script src="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/js/theme_scripts_creative.js"></script>
<?php endswitch;?>


<!--scripts-->

<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<!--contact map-->
<div id="contact-popup">
    <div class="container">
        <div class="close-popup"><i class="icon-cancel"></i></div>
        <div class="wrapper">
            <div class="logo-invert">
                <?php if ($theme_options["logo_popup"] !== '' ): ?>
                <img class="img-responsive" data-retina="true" width="250" height="85" src="image/<?php echo $theme_options["logo_popup"]; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                <?php endif; ?>
            </div>
        </div>
    </div>

    <?php if (isset($bs_additional["google_map_top"]) && $bs_additional["google_map_top"] !='') : ?>
    <div class="map">
        <?php echo html_entity_decode($bs_additional["google_map_top"], ENT_QUOTES, 'UTF-8'); ?>
    </div>
    <?php endif; ?>
    <!--contact popup html-->
    <?php if (!isset($theme_options["contacts_link_status"]) || $theme_options["contacts_link_status"] !== 'disable' ) :  ?>

    <?php if (isset($theme_options[$lang]["customblock_html"]) && $theme_options[$lang]["customblock_html"] !='') : ?>
    <div class="container">
        <div class="row contact-info">
            <?php echo html_entity_decode($theme_options[$lang]["contactpopup_html"], ENT_QUOTES, 'UTF-8'); ?>
        </div>
    </div>
    <?php endif; ?>
    <?php endif; ?>
    <!--end contact popup html-->
</div>
<!--end contact map-->


<div id="wrap">
<?php if (empty($theme_options["quickpanel"]) || $theme_options["quickpanel"] !== 'disable' ) :  ?>
<div id="right_toolbar" class="hidden-phone hidden-tablet">
    <div>
        <a href="#">
            <?php if ($theme_options["logo_right"] !== '' ): ?>
            <img data-retina="true" width="52" height="142" src="image/<?php echo $theme_options["logo_right"]; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
            <?php endif; ?>
        </a>
    </div>
    <div id="back-top"><a href="#top"><i class="icon-up-2"></i></a> </div>
</div>
<?php endif; ?>


<div class="header-offset">

<?php if (empty($theme_options["headertopline"]) || $theme_options["headertopline"] !== 'disable' ) :  ?>
<?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] != 'skin_medstore') : ?>
<div id="topline">
    <div class="container">
        <div class="wrapper_w">

            <div class="pull-left hidden-phone">
                <div class="phone">
                            <span>
                                <i class="icon-mobile-alt"></i> HOT LINE :
                                <?php
                                    if (!empty($theme_colors["topline_phonenumber"]) ) :
                                        echo $theme_colors["topline_phonenumber"];
                                     endif;
                                ?>
                            </span>
                </div>
            </div>


            <div class="pull-right addit_wrapper">
                <div class="alignright top_panel_left_blocks">
                            <span class="login_social">
                                <?php if (!$logged) { ?>
                                <?php echo '<span class="login_block">'.$text_welcome.'</span>'; ?>
                                <?php } else { ?>
                                <?php echo '<span class="logout_block">'.$text_logged.'</span>'; ?>
                                <?php } ?>
                            </span>
                    <!--
                    <div class="fadelink fadelink_links">
                        <a><?php echo $text_account; ?></a>
                        <div class="ul_wrapper">
                            <ul>
                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                            </ul>
                        </div>
                    </div>
                    -->
                    <?php echo $language; ?>
                    <?php echo $currency; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>
<?php endif; ?>

<!--HEADER-->
<!--SPY PANEL-->
<?php if (empty($theme_options["headerspy"]) || $theme_options["headerspy"] !== 'disable' ) :  ?>
<div id="spy" class="visible-desktop">
    <div class="container">
        <div class="row">
            <div class="span12">
                <nav></nav>
            </div>
            <div class="spy-left">
                <div class="spy_logo"></div>
            </div>
            <div class="spy-right">
                <div class="spyshop_search"></div>
                <div class="spyshop"></div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>
<!--end SPY PANEL-->

<div id="header">

<div class="container">
<div class="wrapper_w">
    <?php if ($logo) { ?>
    <div id="logo">
        <a class="logo_inner" href="<?php echo $home; ?>">
        <img data-retina="true" width="170" height="70"  src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        </a>
    </div>
    <?php } ?>


<?php if ($categories) :

     $nav1 = 0;
     $nav2 = 0;
     $nav3 = 0;
?>
<!-- small menu -->

        <nav class="barred_menu">
            <ul class="nav nav-list">
                <?php $level_count = 1; ?>

                <li class="nav-header">
                    <div class="top_menu" title="see menu">
                        <i class="icon-th"></i>&nbsp;&nbsp;Menu
                        <a class="icon_arrow open_icon_first icon-down pull-right" href="#level1" data-toggle="collapse"></a>
                    </div>
                    <ul class="open_block open_block_first collapse7" id="level1">

                        <li><a class="category_item" href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>

                        <?php foreach ($categories as $category) { ?>
                        <?php $level_count ++; ?>
                        <li>
                            <a class="category_item" href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>

                            <?php if ($category['children']) { ?>
                            <a class="icon_arrow icon_arrow_inner open_icon icon-down " href="#level<?php echo $level_count; ?>" title="" data-toggle="collapse" >
                                &nbsp;
                            </a>

                            <ul class="open_block collapse7" id="level<?php echo $level_count; ?>">
                                <?php
                                        for ($i = 0; $i < count($category['children']);) {
                                            $j = $i + ceil(count($category['children']) / 1);
                                            for (; $i < $j; $i++) {
                                               if (isset($category['children'][$i])) { ?>

                                <li>
                                    <a class="subcategory_item" href="<?php echo $category['children'][$i]['href']; ?>">
                                        <?php echo $category['children'][$i]['name']; ?>
                                    </a>
                                </li>

                                <?php
                                               }
                                            }
                                         }
                                    ?>

                            </ul>

                            <?php } ?>

                        </li>

                        <?php } ?>

                        <!--pages-->
                        <?php if (!isset($theme_options["contacts_link_status"]) || $theme_options["contacts_link_status"] !== 'disable' ) :  ?>
                        <li>
                            <a class="category_item" href="<?php if ($theme_options["contacts_link_url"] !== '' ) {echo $theme_options["contacts_link_url"];} else {echo 'index.php?route=information/contact';} ?>">
                            <?php
             if (isset($theme_options[$lang]["contacts_link_title"]) && $theme_options[$lang]["contacts_link_title"] !== '' ) {
                 echo $theme_options[$lang]["contacts_link_title"];
             } else {echo 'pages';}
         ?>
                            </a>
                            <a class="icon_arrow open_icon icon_arrow_inner icon-down " href="#level_pages" title="" data-toggle="collapse">
                                &nbsp;
                            </a>

                            <!--pages content-->
                            <ul class="open_block collapse7" id="level_pages">
                                <?php
                                        $this->load->model('catalog/information');
                                $informations = $this->model_catalog_information->getInformations();
                                if (isset($informations)) :
                                foreach ($informations as $information) :
                                $information_href = $this->url->link('information/information', 'information_id=' . $information['information_id']);
                                if (isset($theme_options["additional_page_status"])):
                                foreach ($theme_options["additional_page_status"] as $information_id => $information_status) :
                                if ($information_id == $information['information_id'] && $information_status != 0) : ?>
                                <li><a class="subcategory_item" href="<?php echo $information_href; ?>"><?php echo $information['title']; ?></a></li>
                                <?php
                                                        endif;
                                                    endforeach;
                                                 endif;
                                            endforeach;
                                        endif;
                                        ?>

                                <?php if (!isset($theme_options["additional_page_checkout_status"]) || $theme_options["additional_page_checkout_status"] != 0 ) :  ?>
                                <li><a class="subcategory_item" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                                <?php endif; ?>
                                <?php if (!isset($theme_options["additional_page_account_status"]) || $theme_options["additional_page_account_status"] != 0 ) :  ?>
                                <li><a class="subcategory_item" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <?php endif; ?>
                            </ul>
                            <!--pages content-->

                        </li>
                        <?php endif; ?>

                        <!--pages-->


                        <!--second link in top menu-->
                        <?php if (isset($theme_options["customitem_item_status2"]) && $theme_options["customitem_item_status2"] !== 'disable' ) :  ?>
                        <li>
                            <a class="category_item" href="<?php if ($theme_options["customitem_item_url2"] !== '' ) {echo $theme_options["customitem_item_url2"];} else {echo '#';} ?>">
                            <?php
                             if (isset($theme_options[$lang]["customitem_item_title2"]) && $theme_options[$lang]["customitem_item_title2"] !== '' ) {
                                 echo html_entity_decode($theme_options[$lang]["customitem_item_title2"], ENT_QUOTES, 'UTF-8');
                             } else {echo 'BUY NOW<span class="pulse-button">!</span>';}
                        ?>
                            </a>
                        </li>
                        <?php endif; ?>
                        <!--end second link in top menu-->

                        <!-- BLOG LINK -->
                        <?php if (isset($theme_options["blog_link_status"]) && $theme_options["blog_link_status"] !== 'disable' ) :  ?>
                        <li>
                            <a class="category_item" href="<?php if ($theme_options["blog_link_url"] !== '' ) {echo $theme_options["blog_link_url"];} else {echo 'index.php?route=blog/post';} ?>">
                        <span>

                            <?php
                                if (isset($theme_options[$lang]["blog_link_title"]) && $theme_options[$lang]["blog_link_title"] !== '' ) {
                                    echo $theme_options[$lang]["blog_link_title"];
                                } else {echo 'Blog';}
                            ?>

                        </span>
                            </a>
                        </li>
                        <?php endif; ?>




                    </ul>
                </li>
            </ul>
        </nav>


<nav class="hidden-phone main_menu">
    <!--MENU-->

    <ul id="nav" class="menu megamenu">
        <?php if (empty($theme_options["homebutton"]) || $theme_options["homebutton"] !== 'disable' ) :  ?>
        <li class="menu_home_link"><a href="<?php echo $home; ?>"><i class="icon-home"></i></a></li>
        <?php endif; ?>

        <?php if ($categories): ?>
        <?php foreach ($categories as $category) : ?>
        <li class="level0 last parent dropdown menu_catalog_link item_pages">
            <a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
            <!--listing of categories-->
            <?php if ($category['children']) : ?>
            <ul class="level0 level_margin"  style="max-width:600px;">
                <li>
                    <ul class="shadow">
                        <li class="row_middle">
                            <ul class="rows_outer">

                                <li class="">

                                                <?php for ($i = 0; $i < count($category['children']);) { ?>
                                    <ul class="list_in_column menu_row" <?php if ($category['column'] > 1) { ?> style="display:inline-block;max-width:180px" <?php } ?>>
                                                    <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                                    <?php for (; $i < $j; $i++) { ?>
                                                    <?php if (isset($category['children'][$i])) { ?>
                                                    <li class="menu-item"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                                    <?php } ?>
                                                    <?php } ?>
                                                </ul>
                                                <?php } ?>
                                </li>
                            </ul>


                    <?php
                    $products_module_exist = 0;
                    $extensions = $this->model_setting_extension->getExtensions('module');
                    for ($i = 1; $i < count($extensions); $i++) {
                    if ($extensions[$i]["code"] == 'theme_category_custom_block') {
                    $products_module_exist = 1;
                    }
                    }

                    if ($products_module_exist == 1) :


                        if (isset($category["href"])) {
                            $parts = explode('=', (string)$category["href"]);
                        } else {
                            $parts = array();
                        }

                        $category_id = end($parts);
                        if (is_numeric($category_id)) {
                            $category_id = $category_id;
                        } else {
                            $parts = explode('/', (string)$category_id);
                            $query = $this->db->query("SELECT query as query FROM ".DB_PREFIX."url_alias WHERE keyword='".end($parts)."'");
                            $parts = explode('=', (string)$query->row['query']);
                            $category_id = end($parts);
                        }


                    $this->load->model('customisation/bioproduct_products_options');
                    $category_image_top_src = $this->model_customisation_bioproduct_products_options->getAttributeCategories('image_top_src',$category_id);








                    endif;

                    if (isset($category_image_top_src) && $category_image_top_src !='' && $category_image_top_src !='-'):

                    ?>
                    <div class="menu-image-right">
                    <img src="image/data/<?php echo $category_image_top_src; ?>" alt="" />
                    </div>
                    <?php endif; ?>

                        </li>
                    </ul>
                </li>
            </ul>
<?php endif; ?>
            <!--end listing of categories-->

        </li>
<?php endforeach; ?>

        <?php endif; ?>






        <!--PAGES in top menu-->
        <?php if (!isset($theme_options["contacts_link_status"]) || $theme_options["contacts_link_status"] !== 'disable' ) :  ?>
        <li class="item_pages dropdown">
            <a class="level-top" href="<?php if ($theme_options["contacts_link_url"] !== '' ) {echo $theme_options["contacts_link_url"];} else {echo 'index.php?route=information/contact';} ?>">
         <span>
             <?php
                 if (isset($theme_options[$lang]["contacts_link_title"]) && $theme_options[$lang]["contacts_link_title"] !== '' ) {
                     echo $theme_options[$lang]["contacts_link_title"];
                 } else {echo 'pages';}
             ?>
         </span>
            </a>

            <!--pages content-->
            <ul class="level0 one-column">
                <li>
                    <ul class="shadow">
                        <li class="list_column">
                            <ul class="list_in_column">
                                <?php
                                $this->load->model('catalog/information');
                                $informations = $this->model_catalog_information->getInformations();
                                if (isset($informations)) :
                                foreach ($informations as $information) :
                                $information_href = $this->url->link('information/information', 'information_id=' . $information['information_id']);
                                if (isset($theme_options["additional_page_status"])):
                                foreach ($theme_options["additional_page_status"] as $information_id => $information_status) :
                                if ($information_id == $information['information_id'] && $information_status != 0) : ?>
                                <li class="level1"><a href="<?php echo $information_href; ?>"><?php echo $information['title']; ?></a></li>
                                <?php
                                                        endif;
                                                    endforeach;
                                                 endif;
                                            endforeach;
                                        endif;
                                ?>

                                <?php if (!isset($theme_options["additional_page_checkout_status"]) || $theme_options["additional_page_checkout_status"] != 0 ) :  ?>
                                <li class="level1"><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                                <?php endif; ?>
                                <?php if (!isset($theme_options["additional_page_account_status"]) || $theme_options["additional_page_account_status"] != 0 ) :  ?>
                                <li class="level1"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <?php endif; ?>
                            </ul>
                        </li>

                    </ul>
                </li>
            </ul>
            <!--pages content-->


        </li>
        <?php endif; ?>
        <!--PAGES in top menu-->

        <!-- CUSTOM MENU BLOCK -->
        <?php if (isset($theme_options["customblock_status"]) && $theme_options["customblock_status"] !== 'disable' ) :  ?>
        <li id="menu_custom_block" class="level0 parent level-top dropdown">
            <a <?php if ($theme_options["customitem_item_url1"] !== '' ) :?> href="<?php echo $theme_options["customitem_item_url1"]; ?>" <?php endif; ?>>
                                                <span>
                                                    <?php if (isset($theme_options[$lang]["customitem_item_title1"]) && $theme_options[$lang]["customitem_item_title1"] !== '' ) {
                                                        echo $theme_options[$lang]["customitem_item_title1"];
                                                     } else {echo 'Custom Block';}
                                                     ?>
                                                </span>
            </a>

            <?php
                             if (isset($theme_options[$lang]["customblock_html"])) {

                                  $custom_html_output = html_entity_decode($theme_options[$lang]["customblock_html"], ENT_QUOTES, 'UTF-8');

                                  if ($custom_html_output !== '') {
                        ?>

            <ul class="level0 level_width">
                <li>
                    <ul class="shadow">
                        <li class="row_middle">
                            <div class="custom">
                                <div class="row-fluid">
                                    <?php echo $custom_html_output; ?>
                                </div>
                            </div>

                        </li>
                    </ul>
                </li>
            </ul>
            <?php
                                   }
                            }
                        ?>

        </li>
        <?php endif; ?>
        <!-- CUSTOM MENU BLOCK -->


        <!-- BLOG LINK -->
        <?php if (isset($theme_options["blog_link_status"]) && $theme_options["blog_link_status"] !== 'disable' ) :  ?>
        <li>
            <a href="<?php if ($theme_options["blog_link_url"] !== '' ) {echo $theme_options["blog_link_url"];} else {echo 'index.php?route=blog/post';} ?>">
                        <span>

                            <?php
                                if (isset($theme_options[$lang]["blog_link_title"]) && $theme_options[$lang]["blog_link_title"] !== '' ) {
                                    echo $theme_options[$lang]["blog_link_title"];
                                } else {echo 'Blog';}
                            ?>

                        </span>
            </a>
        </li>
        <?php endif; ?>
        <!-- BLOG LINK -->

        <!-- CONTACT LINK -->
        <?php if (isset($theme_options["contact_map_status"]) && $theme_options["contact_map_status"] !== 'disable' ) :  ?>
        <li>
            <a class="contact-button">
                                <?php
                                        if (isset($theme_options[$lang]["contact_map_title"]) && $theme_options[$lang]["contact_map_title"] !== '' ) {
                                            echo $theme_options[$lang]["contact_map_title"];
                                        } else {echo 'CONTACT';}
                                    ?>
            </a>
        </li>
        <?php endif; ?>
        <!-- CONTACT LINK -->



<!--second link in top menu-->
        <?php if (isset($theme_options["customitem_item_status2"]) && $theme_options["customitem_item_status2"] !== 'disable' ) :  ?>
        <li>
            <a class="display_inline_block" href="<?php if ($theme_options["customitem_item_url2"] !== '' ) {echo $theme_options["customitem_item_url2"];} else {echo '#';} ?>">
            <?php
                             if (isset($theme_options[$lang]["customitem_item_title2"]) && $theme_options[$lang]["customitem_item_title2"] !== '' ) {
                                 echo html_entity_decode($theme_options[$lang]["customitem_item_title2"], ENT_QUOTES, 'UTF-8');
                             } else {echo 'BUY NOW<span class="pulse-button">!</span>';}
                        ?>


            </a>

        </li>
        <?php endif; ?>
        <!--end second link in top menu-->

    </ul>

    <!--MENU-->
</nav>

<?php endif; ?>


    <div class="pull-right cart_module">
        <?php echo $cart; ?>
    </div>

<!--new slideLinks-->
<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_medstore') { ?>
<div class="pull-right" id="slideLinks">
    <div class="simplelink fadelink-search">
        <div class="form-search" id="search">
            <input onclick="this.value = '';" type="text" class="search-query" name="search" value="<?php echo $text_search; ?>" />
            <button class="button-search btn"><i class="icon-medstore-search icon-large"></i></button>
        </div>
    </div>
    <div class="fadelink fadelink-links fadelink-account-links">
        <a><i class="icon icon-medstore-businessman"></i><?php echo $text_account; ?><span class="caret"></span></a>
        <div class="ul_wrapper">
            <ul>
                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            </ul>
        </div>
    </div>

    <?php echo $language; ?>
    <?php echo $currency; ?>

</div>
<?php } else { ?>
<div class="pull-right search_module">
    <div class="form-search-wrapper">
        <div class="form-search" id="search">
            <input onclick="this.value = '';" type="text" class="search-query" name="search" value="<?php echo $text_search; ?>" />
            <button class="button-search btn"><i class="icon-search icon-large"></i></button>
        </div>
    </div>
</div>
<?php }  ?>
<!--end slideLinks-->





</div>
</div>
<!--HEADER-->


<div id="notification"></div>

</div>


<?php if(!empty($this->request->get['route']) && $this->request->get['route'] != 'common/home') { ?>

    <section class="all_pages">
        <h2 style="display:none">Home page</h2>
        <div class="container top">
            <div class="<?php echo ($layout_id == 2 ? '' : 'row'); ?>">
    <?php } ?>

