<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>

    <div class="box">

        <div class="heading">
            <h1>Bioproduct theme configuration options</h1>
            <div class="buttons">
                <a onclick="buttonApply();" class="button">Apply Changes</a>
                <a class="button" onclick="$('#form').submit();">Save</a>
                <a href="<?php echo $cancel; ?>" class="button">Cancel</a>
            </div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs">
                <a href="#tab-general" class="display_inline selected">Layout</a>
                <a href="#tab-colors" class="display_inline">Colors,backgrounds,fonts</a>
                <a href="#tab-products" class="display_inline">Products sliders, products listings</a>
                <a href="#tab-flexslider" class="display_inline">Flexslider settings</a>
            </div>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="settingsform">

                <!-------------------------------------tab General---------------------------------->
                <div id="tab-general" class="display_block">

                    <div id="tab-general-sub" class="min_height vtabs">
                        <a href="#tab-general-layout1" class="selected">General</a>
                        <a href="#tab-general-layout2" class="selected">Navigation</a>
                        <a href="#tab-general-layout3" class="">Social accounts</a>
                        <a href="#tab-general-layout4" class="">Additional settings</a>
                    </div>

                    <!--**********subtab general-->
                    <div id="tab-general-layout1" class="margin_left display_block">
                        <table class="form">
                        <tr>
                            <td>Main Layout for all site<br>
                                <span class="help">Choose own layout</span>
                            </td>
                            <td>
                                <select id="bs_general_layout_skin" name="bs_general[layout_skin]" data-active="<?php echo $bs_general['layout_skin']; ?>">
                                    <option value="skin_creative">CREATIVE</option>
                                    <option value="skin_lifestore">LIFESTORE</option>
                                    <option value="skin_medstore">MEDSTORE</option>
                                    <option value="skin_cosmetic">COSMETIC</option>
                                </select>
                            </td>


                        </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Header tool line<br>
                                    <span class="help">Enable/disable Header tool line</span>
                                </td>
                                <td>
                                    <div id="bs_general_headertopline_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[headertopline]" value="enable" id="bs_general_headertopline1">
                                            <label for="bs_general_headertopline1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[headertopline]" value="disable" id="bs_general_headertopline2">
                                            <label for="bs_general_headertopline2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Header Spy Panel<br>
                                    <span class="help">Enable/disable Header Spy Panel</span>
                                </td>
                                <td>
                                    <div id="bs_general_headerspy_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[headerspy]" value="enable" id="bs_general_headerspy1">
                                            <label for="bs_general_headerspy1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[headerspy]" value="disable" id="bs_general_headerspy2">
                                            <label for="bs_general_headerspy2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>Right quick panel<br>
                                    <span class="help">Enable/disable Right quick panel</span>
                                </td>
                                <td>
                                    <div id="bs_general_quickpanel_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[quickpanel]" value="enable" id="bs_general_quickpanel1">
                                            <label for="bs_general_quickpanel1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[quickpanel]" value="disable" id="bs_general_quickpanel2">
                                            <label for="bs_general_quickpanel2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Footer info<br>
                                    <span class="help">Enable/disable Footer info</span>
                                </td>
                                <td>
                                    <div id="bs_general_footerinfo_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[footerinfo]" value="enable" id="bs_general_footerinfo1">
                                            <label for="bs_general_footerinfo1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[footerinfo]" value="disable" id="bs_general_footerinfo2">
                                            <label for="bs_general_footerinfo2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Footer popup<br>
                                    <span class="help">Enable/disable Footer popup</span>
                                </td>
                                <td>
                                    <div id="bs_general_footerpopup_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[footerpopup]" value="enable" id="bs_general_footerpopup1">
                                            <label for="bs_general_footerpopup1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[footerpopup]" value="disable" id="bs_general_footerpopup2">
                                            <label for="bs_general_footerpopup2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>


                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Footer popup display mode:<br>
                                    <span class="help">Choose between slide and normal footer popup display mode</a></span>
                                </td>
                                <td>
                                    <select id="bs_general_footerpopup_mode" name="bs_general[footerpopup_mode]" data-active="<?php echo $bs_general['footerpopup_mode']; ?>">
                                        <option value="slide">Slide block</option>
                                        <option value="normal">Normal display</option>
                                    </select>
                                </td>
                            </tr>








                            <tr>
                                <td>Footer copyright content:<br>
                                    <span class="help">Here you can enter simple text or html content for footer copyright.</td>
                                <td><input class="width_full_padding" name="bs_general[footercopyright]" type="text" value="<?php echo $bs_general['footercopyright']; ?>" />
                                <span class="help" style="padding-left: 10px;line-height: 20px">Or you will see default OpenCart copyright.</span>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Footer payment icons images:<br>
                                    <span class="help">Edit content here or change / add your own images for payment icons</span>
                                </td>
                                <td>
                                    <textarea name="bs_general[footerpayment]" style="width:705px;height: 200px;margin-left: 10px">
                                        <?php echo $bs_general['footerpayment']; ?>
                                    </textarea>
                                    <div style="margin-top: 20px">
                                        <div id="bs_general_footerpayment_status_container">
                                            <div class="f_left">
                                                <input type="radio" name="bs_general[footerpayment_status]" value="enable" id="bs_general_footerpayment_status1">
                                                <label for="bs_general_footerpayment_status1">Enable</label>
                                            </div>
                                            <div class="f_left">
                                                <input type="radio" name="bs_general[footerpayment_status]" value="disable" id="bs_general_footerpayment_status2">
                                                <label for="bs_general_footerpayment_status2">Disable</label>
                                            </div>
                                            <div class="clear_both"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Sidebar <br>
                                    <span class="help">Enable/disable Sidebar on Home Page and in listings</span>
                                </td>
                                <td>
                                    <div id="bs_general_sidebar_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[sidebar]" value="enable" id="bs_general_sidebar1">
                                            <label for="bs_general_sidebar1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[sidebar]" value="disable" id="bs_general_sidebar2">
                                            <label for="bs_general_sidebar2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Logo (Right quick panel):<br>
                                    <span class="help">Upload logo image.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $logo_right_thumb; ?>" alt="" id="logo_right_thumb" />
                                        <input type="hidden" name="bs_general[logo_right]" value="<?php echo $bs_general['logo_right']; ?>" id="logo_right" />
                                        <br />
                                        <a onclick="image_upload('logo_right', 'logo_right_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#logo_right_thumb').attr('src', '<?php echo $no_image; ?>'); $('#logo_right').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background image (all pages):<br>
                                    <span class="help">Upload background image/pattern for all pages.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $bgimage_thumb; ?>" alt="" id="bgimage_thumb" />
                                        <input type="hidden" name="bs_general[bgimage]" value="<?php echo $bs_general['bgimage']; ?>" id="bgimage" />
                                        <br />
                                        <a onclick="image_upload('bgimage', 'bgimage_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#bgimage_thumb').attr('src', '<?php echo $no_image; ?>'); $('#bgimage').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Image display mode:<br>
                                    <span class="help">Set background image display mode</a></span>
                                </td>
                                <td>
                                    <select id="bs_general_bgimage_mode" name="bs_general[bgimage_mode]" data-active="<?php echo $bs_general['bgimage_mode']; ?>">
                                        <option value="no-repeat">No-repeat</option>
                                        <option value="repeat">Repeat</option>
                                    </select>
                                </td>
                             </tr>


                        </table>
                    </div>

                    <!---------------subtab navigation------------------>
                    <div id="tab-general-layout2" class="margin_left display_none">
                        <table class="form">
                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Home button:<br>
                                    <span class="help">Here you can enable / disable home button in top menu.</td>
                                <td>
                                    <div id="bs_general_homebutton_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[homebutton]" value="enable" id="bs_general_homebutton1">
                                            <label for="bs_general_homebutton1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[homebutton]" value="disable" id="bs_general_homebutton2">
                                            <label for="bs_general_homebutton2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            -->
                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Custom blocks in Top Menu's:<br>
                                    <span class="help">Here you can enable / disable custom blocks in categories in Top menu. Content for each block you can add in field "Description" on category editing page.</td>
                                <td>
                                    <div id="bs_general_customs_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customs]" value="1" id="bs_general_customs1">
                                            <label for="bs_general_customs1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customs]" value="0" id="bs_general_customs2">
                                            <label for="bs_general_customs2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            -->
                            <tr>
                                <td>Custom block content:<br>
                                    <span class="help">Here you can enter html content for custom block in top menu.</td>
                                <td>
                                    <?php $module_row = 1; ?>
                                    <div id="language-<?php echo $module_row; ?>" class="htabs">
                                    <?php
                                         foreach ($languages as $language) {
                                    ?>
                                        <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                                <?php echo $language['name']; ?>
                                            </a>
                                        <?php
                                         $module_row++;
                                         }
                                    ?>
                                    </div>
                                    <?php
                                         $module_row = 1;
                                         foreach ($languages as $language) {
                                    ?>
                                            <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                                <table class="form">
                                                    <tr>

                                                        <td class="border_bottom_none">
                                                            <textarea name="bs_general[<?php echo $language['code']; ?>][customblock_html]" id="description<?php echo $language['code']; ?>">
                                                                <?php echo isset($bs_general[$language['code']]) ? $bs_general[$language['code']]['customblock_html'] : ''; ?>
                                                            </textarea>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </div>
                                    <?php
                                         $module_row++;
                                         }
                                    ?>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Custom block:<br>
                                    <span class="help">Here you can enable / disable custom block in top menu.</td>
                                <td>
                                    <div id="bs_general_customblock_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customblock_status]" value="enable" id="bs_general_customblock_status1">
                                            <label for="bs_general_customblock_status1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customblock_status]" value="disable" id="bs_general_customblock_status2">
                                            <label for="bs_general_customblock_status2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Custom menu item - title:<br>
                                    <span class="help">Set menu item title.</span>
                                </td>
                                <td>
                                    <div id="language-2" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-new-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-new-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_general[<?php echo $language['code']; ?>][customitem_item_title1]" type="text" value="<?php echo isset($bs_general[$language['code']]) ? $bs_general[$language['code']]['customitem_item_title1'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                             $module_row++;
                                             }
                                        ?>
                                </td>


                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Custom menu item - url:<br>
                                    <span class="help">Set url for custom menu item (use full url format starting with // for outer links).</span>
                                </td>
                                <td><input class="width_full_padding" name="bs_general[customitem_item_url1]" type="text" value="<?php echo $bs_general['customitem_item_url1']; ?>" /></td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Second custom link in top menu:<br>
                                    <span class="help">Here you can enable / disable second custom link in top menu.</td>
                                <td>
                                    <div id="bs_general_customitem_item_status2_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customitem_item_status2]" value="enable" id="bs_general_customitem_item_status21">
                                            <label for="bs_general_customitem_item_status21">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[customitem_item_status2]" value="disable" id="bs_general_customitem_item_status22">
                                            <label for="bs_general_customitem_item_status22">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Second custom link in top menu - title:<br>
                                    <span class="help">Set menu item title.</span>
                                </td>

                                <td>
                                    <div id="language-3" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-new2-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-new2-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_general[<?php echo $language['code']; ?>][customitem_item_title2]" type="text" value="<?php echo isset($bs_general[$language['code']]) ? $bs_general[$language['code']]['customitem_item_title2'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                             $module_row++;
                                             }
                                        ?>
                                </td>


                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Second custom link in top menu - url:<br>
                                    <span class="help">Set url for second custom link in top menu (use full url format starting with // for outer links).</span>
                                </td>
                                <td><input class="width_full_padding" name="bs_general[customitem_item_url2]" type="text" value="<?php echo $bs_general['customitem_item_url2']; ?>" /></td>
                            </tr>




                            <!---NEW------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Blog in top menu - title:<br>
                                    <span class="help">Set Link Blog title.</span>
                                </td>
                                <td>
                                    <div id="language-blog" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-blog-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-blog-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_general[<?php echo $language['code']; ?>][blog_link_title]" type="text" value="<?php echo isset($bs_general[$language['code']]) ? $bs_general[$language['code']]['blog_link_title'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                             $module_row++;
                                             }
                                        ?>
                                </td>


                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Blog in top menu - url:<br>
                                    <span class="help">Set url for link blog item (use full url format starting with // for outer links).</span>
                                </td>
                                <td><input class="width_full_padding" name="bs_general[blog_link_url]" type="text" value="<?php echo (isset($bs_general['blog_link_url']) ? $bs_general['blog_link_url'] : ''); ?>" /></td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Blog in top menu :<br>
                                    <span class="help">Here you can enable / disable link of blog in top menu.</td>
                                <td>
                                    <div id="bs_general_blog_link_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[blog_link_status]" value="enable" id="bs_general_blog_link_status1">
                                            <label for="bs_general_blog_link_status1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[blog_link_status]" value="disable" id="bs_general_blog_link_status2">
                                            <label for="bs_general_blog_link_status2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!---NEW 02------------------------------------------------------------------------------------>



                            <!--------------------- contacts --------------------------------------------------------------------------->
                            <tr>
                                <td>Link Pages in top menu - title:<br>
                                    <span class="help">Set Link Pages title.</span>
                                </td>
                                <td>
                                    <div id="language-contacts" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-contacts-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-contacts-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_general[<?php echo $language['code']; ?>][contacts_link_title]" type="text" value="<?php echo isset($bs_general[$language['code']]['contacts_link_title']) ? $bs_general[$language['code']]['contacts_link_title'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                         $module_row++;
                                    }
                                    ?>
                                </td>
                            </tr>
                            <tr>
                                <td>Link Pages in top menu - url:<br>
                                    <span class="help">Set url for link pages item, for example, "index.php?route=information/contact"  (use full url format starting with // for outer links).</span>
                                </td>
                                <td><input class="width_full_padding" name="bs_general[contacts_link_url]" type="text" value="<?php echo (isset($bs_general['contacts_link_url']) ? $bs_general['contacts_link_url'] : ''); ?>" /></td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Pages in top menu :<br>
                                    <span class="help">Here you can enable / disable this link in top menu.</td>
                                <td>
                                    <div id="bs_general_contacts_link_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[contacts_link_status]" value="enable" id="bs_general_contacts_link_status1">
                                            <label for="bs_general_contacts_link_status1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[contacts_link_status]" value="disable" id="bs_general_contacts_link_status2">
                                            <label for="bs_general_contacts_link_status2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>Link Contact in top menu display:<br>
                                    <span class="help">Here you can enable / disable this link in top menu.</td>
                                <td>
                                    <div id="bs_general_contact_map_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[contact_map_status]" value="enable" id="bs_general_contact_map_status1">
                                            <label for="bs_general_contact_map_status1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[contact_map_status]" value="disable" id="bs_general_contact_map_status2">
                                            <label for="bs_general_contact_map_status2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Link Contact in top menu - title:<br>
                                    <span class="help">Set Link Pages title.</span>
                                </td>
                                <td>
                                    <div id="language-map" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-map-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-map-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_general[<?php echo $language['code']; ?>][contact_map_title]" type="text" value="<?php echo isset($bs_general[$language['code']]['contact_map_title']) ? $bs_general[$language['code']]['contact_map_title'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                         $module_row++;
                                    }
                                    ?>
                                </td>
                            </tr>


                            <tr>
                                <td style="border:none">
                                    <h1>Links in item "PAGES" in Top Menu</h1>
                                </td>
                            </tr>



                            <?php if (isset($information_pages)) : ?>
                                <?php foreach ($information_pages as $information_page) : ?>
                                    <tr>
                                        <td>
                                            Link: <?php echo $information_page['title']; ?>
                                            <input type="hidden" name="bs_general[additional_page_id][<?php echo $information_page['information_id']; ?>]" value="<?php echo $information_page['information_id']; ?>">
                                        </td>
                                        <td>
                                            <select id="bs_general_additional_page_status<?php echo $information_page['information_id']; ?>" name="bs_general[additional_page_status][<?php echo $information_page['information_id']; ?>]" data-active="<?php echo $bs_general['additional_page_status'][$information_page['information_id']]; ?>">
                                                <option value="1">Enable</option>
                                                <option value="0">Disable</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <script type="text/javascript">
                                        jQuery("#bs_general_additional_page_status<?php echo $information_page['information_id']; ?>").val(jQuery("#bs_general_additional_page_status<?php echo $information_page['information_id']; ?>").data("active")).attr('selected', true);
                                    </script>

                            <?php endforeach; ?>
                            <?php endif; ?>
                            <!--
                            <tr>
                                <td>Link: Contact</td>
                                <td>
                                    <select id="bs_general_additional_page_contact_status" name="bs_general[additional_page_contact_status]" data-active="<?php echo $bs_general['additional_page_contact_status']; ?>">
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Link: Site Map</td>
                                <td>
                                    <select id="bs_general_additional_page_sitemap_status" name="bs_general[additional_page_sitemap_status]" data-active="<?php echo $bs_general['additional_page_sitemap_status']; ?>">
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </td>
                            </tr>
                            -->
                            <tr>
                                <td>Link: Checkout</td>
                                <td>
                                    <select id="bs_general_additional_page_checkout_status" name="bs_general[additional_page_checkout_status]" data-active="<?php echo $bs_general['additional_page_checkout_status']; ?>">
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Link: Account</td>
                                <td>
                                    <select id="bs_general_additional_page_account_status" name="bs_general[additional_page_account_status]" data-active="<?php echo $bs_general['additional_page_account_status']; ?>">
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </td>
                            </tr>

                        <script type="text/javascript">
                            jQuery("#bs_general_additional_page_contact_status").val(jQuery("#bs_general_additional_page_contact_status").data("active")).attr('selected', true);
                            jQuery("#bs_general_additional_page_sitemap_status").val(jQuery("#bs_general_additional_page_sitemap_status").data("active")).attr('selected', true);
                            jQuery("#bs_general_additional_page_checkout_status").val(jQuery("#bs_general_additional_page_checkout_status").data("active")).attr('selected', true);
                            jQuery("#bs_general_additional_page_account_status").val(jQuery("#bs_general_additional_page_account_status").data("active")).attr('selected', true);
                        </script>
                        </table>
                    </div>


                    <!--**********subtab social accounts-->
                    <div id="tab-general-layout3" class="margin_left display_none">
                        <table class="form">
                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Twitter account:<br>
                                    <span class="help">For example, themeforest</span>
                                </td>
                                <td><input name="bs_general[twitter]" type="text" value="<?php echo $bs_general['twitter']; ?>" /></td>
                            </tr>
                            <tr>
                                <td>Facebook profile name:<br>
                                    <span class="help">For example, themeforest</span>
                                </td>
                                <td><input name="bs_general[facebook]" type="text" value="<?php echo $bs_general['facebook']; ?>" /></td>
                            </tr>
                            -->
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Social buttons in the footer:<br>
                                    <span class="help">Edit content here or add your own</span>
                                </td>
                                <td>
                                    <textarea name="bs_general[socials]" style="width:600px;height: 200px">
                                        <?php echo $bs_general['socials']; ?>
                                    </textarea>
                                    <div style="margin-top: 20px">
                                        <div id="bs_general_socials_status_container">
                                            <div class="f_left">
                                                <input type="radio" name="bs_general[socials_status]" value="enable" id="bs_general_socials_status1">
                                                <label for="bs_general_socials_status1">Enable</label>
                                            </div>
                                            <div class="f_left">
                                                <input type="radio" name="bs_general[socials_status]" value="disable" id="bs_general_socials_status2">
                                                <label for="bs_general_socials_status2">Disable</label>
                                            </div>
                                            <div class="clear_both"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>


                        </table>
                    </div>


                    <div id="tab-general-layout4" class="margin_left display_none">
                        <table class="form">
                            <tr>
                                <td>Using custom.css file<br>
                                    <span class="help">Enable/disable custom.css file. <br>(It is located in catalog/view/theme/bioproduct/stylesheet/custom.css)</span>
                                </td>
                                <td>
                                    <div id="bs_general_css_file_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[css_file]" value="D" id="bs_general_css_file2">
                                            <label for="bs_general_css_file2">Disable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_general[css_file]" value="A" id="bs_general_css_file1">
                                            <label for="bs_general_css_file1">Enable</label>
                                        </div>

                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td style="width: 400px">
                                    Google Map code in Contact Page:<br>
                                    <span class="help">Here you can generate your own code for the map.
                                    Please, firstly read details in documentation.</span>
                                </td>
                                <td>
                                    <p>
                                        <textarea name="bs_additional[google_map]" style="width:600px;height: 200px">
                                            <?php echo (isset($bs_additional['google_map']) ? $bs_additional['google_map'] : ''); ?>
                                        </textarea>
                                    </p>
                                    <span class="help">Keep in mind, if you leave this field empty Google Map will not be displayed.</span>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr><td class="border_bottom_none"> <p><h1>Contact Popup Block</h1></p></td></tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Logo (Contact Popup):<br>
                                    <span class="help">Upload logo image.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $logo_popup_thumb; ?>" alt="" id="logo_popup_thumb" />
                                        <input type="hidden" name="bs_general[logo_popup]" value="<?php echo $bs_general['logo_popup']; ?>" id="logo_popup" />
                                        <br />
                                        <a onclick="image_upload('logo_popup', 'logo_popup_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#logo_popup_thumb').attr('src', '<?php echo $no_image; ?>'); $('#logo_popup').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 400px">
                                    Google Map code in Top Contact Popup:<br>
                                    <span class="help">Here you can generate your own code for the map.
                                    Please, firstly read details in documentation.</span>
                                </td>
                                <td>
                                    <p>
                                        <textarea name="bs_additional[google_map_top]" style="width:600px;height: 200px">
                                            <?php echo (isset($bs_additional['google_map_top']) ? $bs_additional['google_map_top'] : ''); ?>
                                        </textarea>
                                    </p>
                                    <span class="help">Keep in mind, if you leave this field empty Google Map will not be displayed.</span>
                                </td>
                            </tr>

                            <tr>
                                <td>Content for Contact Popup:<br>
                                    <span class="help">Here you can enter html content for custom block in top menu.</td>
                                <td>
                                    <?php $module_row = 1; ?>
                                    <div id="language-contactpopup-<?php echo $module_row; ?>" class="htabs">
                                        <?php
                                         foreach ($languages as $language) {
                                    ?>
                                        <a href="#tab-language-contactpopup-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                         $module_row++;
                                         }
                                    ?>
                                    </div>
                                    <?php
                                         $module_row = 1;
                                         foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-contactpopup-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>

                                                <td class="border_bottom_none">
                                                    <textarea name="bs_general[<?php echo $language['code']; ?>][contactpopup_html]" id="description-contactpopup-<?php echo $language['code']; ?>">
                                                        <?php echo isset($bs_general[$language['code']]) ? $bs_general[$language['code']]['contactpopup_html'] : ''; ?>
                                                    </textarea>
                                                </td>

                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                         $module_row++;
                                         }
                                    ?>
                                </td>
                            </tr>




                            <!------------------------------------------------------------------------------------------------>
                            <tr><td class="border_bottom_none"> <p><h1>Width of sliders</h1></p></td></tr>
                            <tr>
                                <td style="width: 400px">
                                FlexSlider:<br>
                                    <span class="help">Choose width of FlexSlider (full, boxed).</a></span>
                                </td>
                                <td>
                                    <select id="bs_additional_flexslider_width" name="bs_additional[flexslider_width]" data-active="<?php echo $bs_additional['flexslider_width']; ?>">
                                        <option value="full_width">Full width of slider</option>
                                        <option value="boxed">Boxed slider</option>
                                    </select>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td style="width: 400px">
                                NivoSlider:<br>
                                    <span class="help">Choose width of NivoSlider (full, boxed).</a></span>
                                </td>
                                <td>
                                    <select id="bs_additional_nivo_width" name="bs_additional[nivo_width]" data-active="<?php echo $bs_additional['nivo_width']; ?>">
                                        <option value="full_width">Full width of slider</option>
                                        <option value="boxed">Boxed slider</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 400px">
                                    Revolution/Layer Slider:<br>
                                    <span class="help">Choose width of Revolution/Layer Slider (full, boxed).</a></span>
                                </td>
                                <td>
                                    <select id="bs_additional_revolution_width" name="bs_additional[revolution_width]" data-active="<?php echo $bs_additional['revolution_width']; ?>">
                                        <option value="full_width">Full width of slider</option>
                                        <option value="boxed">Boxed slider</option>
                                    </select>
                                </td>
                            </tr>

                        </table>
                    </div>

                    <!--*********end subtabs-->
                    <div class="clear_both"></div>



                </div>
                <!-------------------------------------end tab General---------------------------------->

                <!-------------------------------------tab Colors,backgrounds,fonts-->
                <div id="tab-colors" class="display_none">

                    <div id="tab-colors-sub" class="vtabs">
                        <a href="#tabs_colors-sub1" class="selected">General</a>
                        <a href="#tabs_colors-sub2" class="">Captions</a>
                        <a href="#tabs_colors-sub3" class="">Header ToolLine</a>
                        <a href="#tabs_colors-sub4" class="">Drop down boxes (TopLine)</a>
                        <a href="#tabs_colors-sub5" class="">Header / Navigation</a>
                        <a href="#tabs_colors-sub6" class="">Content</a>
                        <a href="#tabs_colors-sub7" class="">Footer Welcome slider</a>
                        <a href="#tabs_colors-sub8" class="">Footer</a>
                        <a href="#tabs_colors-sub9" class="">Footer popup</a>
                        <a href="#tabs_colors-sub10" class="">Price</a>
                    </div>

                    <!--subtabs: General -->
                    <div id="tabs_colors-sub1" class="margin_left display_block">
                        <table class="form form_colors">

                            <tr>
                                <td>Theme color:<br>
                                    <span class="help">This color will be used for buttons and icons.</span>
                                </td>
                                <td>
                                    <input id="bs_theme_general_themecolor" name="bs_theme[general_themecolor]" value="<?php echo $bs_theme['general_themecolor']; ?>" type="text" style="background-color: <?php echo $bs_theme['general_themecolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Theme Hover Color:<br>
                                    <span class="help">Set color for mouse over for buttons and icons.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_themehover" name="bs_colors[general_themehover]" value="<?php echo $bs_colors['general_themehover']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_themehover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Input hover color (focus border):<br>
                                    <span class="help">Set color for input border.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_input" name="bs_colors[general_input]" value="<?php echo $bs_colors['general_input']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_input']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set default text color for all blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_text" name="bs_colors[general_text]" value="<?php echo $bs_colors['general_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set default link color for all blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_link" name="bs_colors[general_link]" value="<?php echo $bs_colors['general_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set default link hover color for all blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_linkhover" name="bs_colors[general_linkhover]" value="<?php echo $bs_colors['general_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for all content.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_general_bgcolor" name="bs_colors[general_bgcolor]" value="<?php echo $bs_colors['general_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['general_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                        </table>
                    </div>
                    <!--end subtabs: General -->

                    <!--subtabs: Captions  -->
                    <div id="tabs_colors-sub2" class="margin_left display_block">
                         <table class="form form_colors">
                            <tr>
                                <td>Font:<br>
                                    <span class="help">Select font which will be used for headings, buttons, block titles etc. Theme use Google font's library. Find out more here - <a target="_blank" href="//www.google.com/fonts/">Google web fonts free library</a></span>
                                </td>

                                <td>
                                    <select id="bs_colors_captions_font" name="bs_colors[captions_font]" data-active="<?php echo $bs_colors['captions_font']; ?>">
                                        <option value="-">Select</option>
                                        <option value="Oswald">Oswald</option>
                                        <option value="Aclonica">Aclonica</option>
                                        <option value="Allan">Allan</option>
                                        <option value="Allerta">Allerta</option>
                                        <option value="Amaranth">Amaranth</option>
                                        <option value="Anton">Anton</option>
                                        <option value="Arimo">Arimo</option>
                                        <option value="Artifika">Artifika</option>
                                        <option value="Arvo">Arvo</option>
                                        <option value="Asset">Asset</option>
                                        <option value="Astloch">Astloch</option>
                                        <option value="Bangers">Bangers</option>
                                        <option value="Bentham">Bentham</option>
                                        <option value="Bevan">Bevan</option>
                                        <option value="Cabin">Cabin</option>
                                        <option value="Calligraffitti">Calligraffitti</option>
                                        <option value="Candal">Candal</option>
                                        <option value="Cantarell">Cantarell</option>
                                        <option value="Cardo">Cardo</option>
                                        <option value="Coda">Coda</option>
                                        <option value="Crushed">Crushed</option>
                                        <option value="Cuprum">Cuprum</option>
                                        <option value="Damion">Damion</option>
                                        <option value="Forum">Forum</option>
                                        <option value="Geo">Geo</option>
                                        <option value="Gruppo">Gruppo</option>
                                        <option value="Inconsolata">Inconsolata</option>
                                        <option value="Judson">Judson</option>
                                        <option value="Jura">Jura</option>
                                        <option value="Kameron">Kameron</option>
                                        <option value="Kenia">Kenia</option>
                                        <option value="Kranky">Kranky</option>
                                        <option value="Kreon">Kreon</option>
                                        <option value="Kristi">Kristi</option>
                                        <option value="Lekton">Lekton</option>
                                        <option value="Limelight">Limelight</option>
                                        <option value="Lobster">Lobster</option>
                                        <option value="Lora">Lora</option>
                                        <option value="Mako">Mako</option>
                                        <option value="MedievalSharp">MedievalSharp</option>
                                        <option value="Megrim">Megrim</option>
                                        <option value="Merriweather">Merriweather</option>
                                        <option value="Metrophobic">Metrophobic</option>
                                        <option value="Michroma">Michroma</option>
                                        <option value="Monofett">Monofett</option>
                                        <option value="Neucha">Neucha</option>
                                        <option value="Neuton">Neuton</option>
                                        <option value="Orbitron">Orbitron</option>
                                        <option value="Pacifico">Pacifico</option>
                                        <option value="Philosopher">Philosopher</option>
                                        <option value="Play">Play</option>
                                        <option value="Puritan">Puritan</option>
                                        <option value="Quattrocento">Quattrocento</option>
                                        <option value="Radley">Radley</option>
                                        <option value="Rokkitt">Rokkitt</option>
                                        <option value="Schoolbell">Schoolbell</option>
                                        <option value="Slackey">Slackey</option>
                                        <option value="Smythe">Smythe</option>
                                        <option value="Sunshiney">Sunshiney</option>
                                        <option value="Syncopate">Syncopate</option>
                                        <option value="Tangerine">Tangerine</option>
                                        <option value="Ubuntu">Ubuntu</option>
                                        <option value="Ultra">Ultra</option>
                                        <option value="Varela">Varela</option>
                                        <option value="Vibur">Vibur</option>
                                        <option value="Wallpoet">Wallpoet</option>
                                        <option value="Zeyada">Zeyada</option>
                                    </select>
                                    <span id="bs_colors_captions_font_preview" style="font-size:30px;line-height: 30px; display:block;padding:8px 0 0 0">Lorem Ipsum Dolor</span>
                                </td>



                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set text color for all captions.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_captions_text" name="bs_colors[captions_text]" value="<?php echo $bs_colors['captions_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['captions_text']; ?>; color: white;">
                                </td>
                            </tr>

                        </table>
                    </div>
                    <!--end subtabs: Captions-->

                    <!--subtabs: tool line  -->
                    <div id="tabs_colors-sub3" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set text color for header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_topline_text" name="bs_colors[topline_text]" value="<?php echo $bs_colors['topline_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['topline_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_topline_link" name="bs_colors[topline_link]" value="<?php echo $bs_colors['topline_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['topline_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set link hover color for header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_topline_linkhover" name="bs_colors[topline_linkhover]" value="<?php echo $bs_colors['topline_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['topline_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_topline_bgcolor" name="bs_colors[topline_bgcolor]" value="<?php echo $bs_colors['topline_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['topline_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!----------------------------------------------------------------------------------------------->
                            <tr>
                                <td>Shadow:<br>
                                    <span class="help">Set bottom shadow for header tool line</span>
                                </td>
                                <td>
                                    <div id="bs_colors_topline_shadow_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_colors[topline_shadow]" value="enable" id="bs_colors_topline_shadow1">
                                            <label for="bs_colors_topline_shadow1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_colors[topline_shadow]" value="disable" id="bs_colors_topline_shadow2">
                                            <label for="bs_colors_topline_shadow2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Phone number:<br>
                                <span class="help">Set phone number in header tool line.</span>
                                </td>
                                <td><input name="bs_colors[topline_phonenumber]" type="text" value="<?php echo $bs_colors['topline_phonenumber']; ?>" /></td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Phone Color:<br>
                                    <span class="help">Set text color for phone number in tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_topline_phonecolor" name="bs_colors[topline_phonecolor]" value="<?php echo $bs_colors['topline_phonecolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['topline_phonecolor']; ?>; color: white;">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!--end subtabs: tool line  -->

                    <!--subtabs: Drop down boxes (TopLine)   -->
                    <div id="tabs_colors-sub4" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for drop down box in header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_dd_ink" name="bs_colors[dd_ink]" value="<?php echo $bs_colors['dd_ink']; ?>" type="text" style="background-color: <?php echo $bs_colors['dd_ink']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>

                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set link hover color for drop down box in header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_dd_linkhover" name="bs_colors[dd_linkhover]" value="<?php echo $bs_colors['dd_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['dd_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for drop down box in header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_dd_bgcolor" name="bs_colors[dd_bgcolor]" value="<?php echo $bs_colors['dd_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['dd_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Border Color:<br>
                                    <span class="help">Set border color for drop down box in header tool line.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_dd_border" name="bs_colors[dd_border]" value="<?php echo $bs_colors['dd_border']; ?>" type="text" style="background-color: <?php echo $bs_colors['dd_border']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr class="display_none">
                                <td>Arrow Image:<br>
                                    <span class="help">Upload arrow image for dropdown boxes.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $dd_arrow_thumb; ?>" alt="" id="dd_arrow_thumb" />
                                        <input type="hidden" name="bs_colors[dd_arrow]" value="<?php echo $bs_colors['dd_arrow']; ?>" id="dd_arrow" />
                                        <br />
                                        <a onclick="image_upload('dd_arrow', 'dd_arrow_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#dd_arrow_thumb').attr('src', '<?php echo $no_image; ?>'); $('#dd_arrow').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <!--end subtabs: Drop down boxes (TopLine)   -->

                    <!--subtabs: Header Navigation   -->
                    <div id="tabs_colors-sub5" class="margin_left display_block">
                        <table class="form form_colors">
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Header text color:<br>
                                    <span class="help">Set color for texts in header blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_headernav_text" name="bs_colors[headernav_text]" value="<?php echo $bs_colors['headernav_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['headernav_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for drop down box (navigation menu, cart) in header.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_headernav_link" name="bs_colors[headernav_link]" value="<?php echo $bs_colors['headernav_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['headernav_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link hover Color:<br>
                                    <span class="help">Set link hover color for drop down box (navigation menu, cart) in header.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_headernav_linkhover" name="bs_colors[headernav_linkhover]" value="<?php echo $bs_colors['headernav_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['headernav_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Header background color:<br>
                                    <span class="help">Set header background color for all header.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_header_bgcolor" name="bs_colors[header_bgcolor]" value="<?php echo $bs_colors['header_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['header_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Blocks background color:<br>
                                    <span class="help">Set background color for drop down box (navigation menu, cart) in header.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_headernav_bgcolor" name="bs_colors[headernav_bgcolor]" value="<?php echo $bs_colors['headernav_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['headernav_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Pattern Image:<br>
                                    <span class="help">Set background pattern for header.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $headernav_thumb; ?>" alt="" id="headernav_thumb" />
                                        <input type="hidden" name="bs_colors[headernav_image]" value="<?php echo $bs_colors['headernav_image']; ?>" id="headernav_image" />
                                    <br />
                                        <a onclick="image_upload('headernav_image', 'headernav_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#headernav_thumb').attr('src', '<?php echo $no_image; ?>'); $('#headernav_image').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Search decoration in header:<br>
                                    <span class="help">Set search decoration image for header.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $headernav_search_decoration_thumb; ?>" alt="" id="headernav_search_decoration_thumb" />
                                        <input type="hidden" name="bs_colors[headernav_search_decoration]" value="<?php echo $bs_colors['headernav_search_decoration']; ?>" id="headernav_search_decoration" />
                                        <br />
                                        <a onclick="image_upload('headernav_search_decoration', 'headernav_search_decoration_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#headernav_search_decoration_thumb').attr('src', '<?php echo $no_image; ?>'); $('#headernav_search_decoration').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Search decoration position:<br>
                                    <span class="help">Set numerical value to align position of search decoration image.</span>
                                </td>
                                <td><input name="bs_colors[headernav_search_decoration_position]" type="text" value="<?php echo $bs_colors['headernav_search_decoration_position']; ?>" /></td>
                            </tr>




                        </table>
                    </div>
                    <!--subtabs: end Header Navigation -->

                    <!--subtabs: Content -->
                    <div id="tabs_colors-sub6" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set text color for content blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_content_text" name="bs_colors[content_text]" value="<?php echo $bs_colors['content_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['content_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for content blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_content_link" name="bs_colors[content_link]" value="<?php echo $bs_colors['content_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['content_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set link hover color for content blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_content_linkhover" name="bs_colors[content_linkhover]" value="<?php echo $bs_colors['content_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['content_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for content blocks.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_content_bgcolor" name="bs_colors[content_bgcolor]" value="<?php echo $bs_colors['content_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['content_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Image:<br>
                                    <span class="help">Set background image for content.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $content_bg_thumb; ?>" alt="" id="content_bg_thumb" />
                                        <input type="hidden" name="bs_colors[content_bg]" value="<?php echo $bs_colors['content_bg']; ?>" id="content_bg" />
                                        <br />
                                        <a onclick="image_upload('content_bg', 'content_bg_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#content_bg_thumb').attr('src', '<?php echo $no_image; ?>'); $('#content_bg').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Image display mode:<br>
                                    <span class="help">Set background image display mode</a></span>
                                </td>
                                <td>
                                    <select id="bs_colors_content_bg_mode" name="bs_colors[content_bg_mode]" data-active="<?php echo $bs_colors['content_bg_mode']; ?>">
                                        <option value="no-repeat">No repeat</option>
                                        <option value="repeat">Repeat</option>
                                    </select>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Product block shadow and hover block color:<br>
                                    <span class="help">Set product shadow and hover block background color.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_product_border" name="bs_colors[product_border]" value="<?php echo $bs_colors['product_border']; ?>" type="text" style="background-color: <?php echo $bs_colors['product_border']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Product border shadow:<br>
                                    <span class="help">Enable/disable product border shadow</span>
                                </td>
                                <td>
                                    <div id="bs_colors_product_shadow_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_colors[product_shadow]" value="enable" id="bs_colors_product_shadow1">
                                            <label for="bs_colors_product_shadow1">Enable</label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_colors[product_shadow]" value="disable" id="bs_colors_product_shadow2">
                                            <label for="bs_colors_product_shadow2">Disable</label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Image rollover mode in sliders:<br>
                                    <span class="help">Choose Image rollover mode in sliders or disable it.</a></span>
                                </td>
                                <td>
                                    <select id="bs_colors_product_image_rollover" name="bs_colors[product_image_rollover]" data-active="<?php echo $bs_colors['product_image_rollover']; ?>">
                                        <option value="advanced">Advanced</option>
                                        <option value="simple">Simple</option>
                                        <option value="none">Disable rollover</option>
                                    </select>
                                </td>
                            </tr>
                            -->
                        </table>
                    </div>
                    <!--end subtabs: Content -->


                    <!--subtabs: Footer info -->
                    <div id="tabs_colors-sub7" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set text color for footer info block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerinfo_text" name="bs_colors[footerinfo_text]" value="<?php echo $bs_colors['footerinfo_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerinfo_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for footer info block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerinfo_link" name="bs_colors[footerinfo_link]" value="<?php echo $bs_colors['footerinfo_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerinfo_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Captions  Color:<br>
                                    <span class="help">Set captions color for footer info block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerinfo_captions" name="bs_colors[footerinfo_captions]" value="<?php echo $bs_colors['footerinfo_captions']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerinfo_captions']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Bold Text Color:<br>
                                    <span class="help">Set bold text color for footer info block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerinfo_bold" name="bs_colors[footerinfo_bold]" value="<?php echo $bs_colors['footerinfo_bold']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerinfo_bold']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for footer info block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerinfo_bgcolor" name="bs_colors[footerinfo_bgcolor]" value="<?php echo $bs_colors['footerinfo_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerinfo_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>

                        </table>
                    </div>
                    <!--end subtabs: Footer info -->

                    <!--subtabs: Footer -->
                    <div id="tabs_colors-sub8" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Text Color:<br>
                                    <span class="help">Set text color for footer block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footer_text" name="bs_colors[footer_text]" value="<?php echo $bs_colors['footer_text']; ?>" type="text" style="background-color: <?php echo $bs_colors['footer_text']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for footer block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footer_link" name="bs_colors[footer_link]" value="<?php echo $bs_colors['footer_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['footer_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set link hover color for footer block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footer_link_hover" name="bs_colors[footer_link_hover]" value="<?php echo $bs_colors['footer_link_hover']; ?>" type="text" style="background-color: <?php echo $bs_colors['footer_link_hover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for footer block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footer_bgcolor" name="bs_colors[footer_bgcolor]" value="<?php echo $bs_colors['footer_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['footer_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Delimiter Footer Image:<br>
                                    <span class="help">Upload delimiter content image.</span>
                                </td>
                                <td valign="top">
                                    <div class="image" align="center">
                                        <img src="<?php echo $footer_delimeter_thumb; ?>" alt="" id="footer_delimeter_thumb" />
                                        <input type="hidden" name="bs_colors[footer_delimeter]" value="<?php echo $bs_colors['footer_delimeter']; ?>" id="footer_delimeter" />
                                        <br />
                                        <a onclick="image_upload('footer_delimeter', 'footer_delimeter_thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#footer_delimeter_thumb').attr('src', '<?php echo $no_image; ?>'); $('#footer_delimeter').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                </td>


                            </tr>








                        </table>
                    </div>
                    <!--end subtabs: Footer -->

                    <!--subtabs: Footer popup-->
                    <div id="tabs_colors-sub9" class="margin_left display_block">
                        <table class="form form_colors">
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Captions text color:<br>
                                    <span class="help">Set captions text color for footer popup block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerpopup_captions" name="bs_colors[footerpopup_captions]" value="<?php echo $bs_colors['footerpopup_captions']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerpopup_captions']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Color:<br>
                                    <span class="help">Set link color for footer popup block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerpopup_link" name="bs_colors[footerpopup_link]" value="<?php echo $bs_colors['footerpopup_link']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerpopup_link']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Link Hover Color:<br>
                                    <span class="help">Set link hover color for footer popup block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerpopup_linkhover" name="bs_colors[footerpopup_linkhover]" value="<?php echo $bs_colors['footerpopup_linkhover']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerpopup_linkhover']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Color:<br>
                                    <span class="help">Set background color for footer popup block.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_footerpopup_bgcolor" name="bs_colors[footerpopup_bgcolor]" value="<?php echo $bs_colors['footerpopup_bgcolor']; ?>" type="text" style="background-color: <?php echo $bs_colors['footerpopup_bgcolor']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Background Transparency:<br>
                                    <span class="help">Set background transparency for footer popup block (0..1).</span>
                                </td>
                                <td><input name="bs_colors[footerpopup_bgtrans]" type="text" value="<?php echo $bs_colors['footerpopup_bgtrans']; ?>" /></td>
                            </tr>

                        </table>
                    </div>
                    <!--end subtabs: Footer popup-->

                    <!--subtabs: price-->
                    <div id="tabs_colors-sub10" class="margin_left display_block">
                        <table class="form form_colors">
                            <tr>
                                <td>Price Font:<br>
                                    <span class="help">Select font which will be used for prices. Theme use Google font's library. Find out more here - <a target="_blank" href="//www.google.com/fonts/">Google web fonts free library</a></span>
                                </td>

                                <td>
                                    <select id="bs_colors_price_font" name="bs_colors[price_font]" data-active="<?php echo $bs_colors['price_font']; ?>">
                                        <option value="-">Select</option>
                                        <option value="Viga">Viga</option>
                                        <option value="Oswald">Oswald</option>
                                        <option value="Alegreya Sans">Alegreya Sans</option>
                                        <option value="Aclonica">Aclonica</option>
                                        <option value="Allan">Allan</option>
                                        <option value="Allerta">Allerta</option>
                                        <option value="Amaranth">Amaranth</option>
                                        <option value="Anton">Anton</option>
                                        <option value="Arimo">Arimo</option>
                                        <option value="Artifika">Artifika</option>
                                        <option value="Arvo">Arvo</option>
                                        <option value="Asset">Asset</option>
                                        <option value="Astloch">Astloch</option>
                                        <option value="Bangers">Bangers</option>
                                        <option value="Bentham">Bentham</option>
                                        <option value="Bevan">Bevan</option>
                                        <option value="Cabin">Cabin</option>
                                        <option value="Calligraffitti">Calligraffitti</option>
                                        <option value="Candal">Candal</option>
                                        <option value="Cantarell">Cantarell</option>
                                        <option value="Cardo">Cardo</option>
                                        <option value="Coda">Coda</option>
                                        <option value="Crushed">Crushed</option>
                                        <option value="Cuprum">Cuprum</option>
                                        <option value="Damion">Damion</option>
                                        <option value="Forum">Forum</option>
                                        <option value="Geo">Geo</option>
                                        <option value="Gruppo">Gruppo</option>
                                        <option value="Inconsolata">Inconsolata</option>
                                        <option value="Judson">Judson</option>
                                        <option value="Jura">Jura</option>
                                        <option value="Kameron">Kameron</option>
                                        <option value="Kenia">Kenia</option>
                                        <option value="Kranky">Kranky</option>
                                        <option value="Kreon">Kreon</option>
                                        <option value="Kristi">Kristi</option>
                                        <option value="Lekton">Lekton</option>
                                        <option value="Limelight">Limelight</option>
                                        <option value="Lobster">Lobster</option>
                                        <option value="Lora">Lora</option>
                                        <option value="Mako">Mako</option>
                                        <option value="MedievalSharp">MedievalSharp</option>
                                        <option value="Megrim">Megrim</option>
                                        <option value="Merriweather">Merriweather</option>
                                        <option value="Metrophobic">Metrophobic</option>
                                        <option value="Michroma">Michroma</option>
                                        <option value="Monofett">Monofett</option>
                                        <option value="Neucha">Neucha</option>
                                        <option value="Neuton">Neuton</option>
                                        <option value="Orbitron">Orbitron</option>
                                        <option value="Pacifico">Pacifico</option>
                                        <option value="Philosopher">Philosopher</option>
                                        <option value="Play">Play</option>
                                        <option value="Puritan">Puritan</option>
                                        <option value="Quattrocento">Quattrocento</option>
                                        <option value="Radley">Radley</option>
                                        <option value="Rokkitt">Rokkitt</option>
                                        <option value="Schoolbell">Schoolbell</option>
                                        <option value="Slackey">Slackey</option>
                                        <option value="Smythe">Smythe</option>
                                        <option value="Sunshiney">Sunshiney</option>
                                        <option value="Syncopate">Syncopate</option>
                                        <option value="Tangerine">Tangerine</option>
                                        <option value="trebuchet ms">Trebuchet ms</option>
                                        <option value="Ubuntu">Ubuntu</option>
                                        <option value="Ultra">Ultra</option>
                                        <option value="Varela">Varela</option>
                                        <option value="Vibur">Vibur</option>
                                        <option value="Wallpoet">Wallpoet</option>
                                        <option value="Zeyada">Zeyada</option>
                                    </select>
                                    <span id="bs_colors_price_font_preview" style="font-size:30px;line-height: 30px; display:block;padding:8px 0 0 0">Lorem Ipsum Dolor</span>
                                </td>



                            </tr>
                            <!------------------------------------------------------------------------------------------------>

                            <tr>
                                <td>Regular price Color:<br>
                                    <span class="help">Set color for a regular price display.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_price_regular" name="bs_colors[price_regular]" value="<?php echo $bs_colors['price_regular']; ?>" type="text" style="background-color: <?php echo $bs_colors['price_regular']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>New special price color:<br>
                                    <span class="help">Set color for a new price display.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_price_new" name="bs_colors[price_new]" value="<?php echo $bs_colors['price_new']; ?>" type="text" style="background-color: <?php echo $bs_colors['price_new']; ?>; color: white;">
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Old price color:<br>
                                    <span class="help">Set color for an old price display.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_price_old" name="bs_colors[price_old]" value="<?php echo $bs_colors['price_old']; ?>" type="text" style="background-color: <?php echo $bs_colors['price_old']; ?>; color: white;">
                                </td>
                            </tr>

                        </table>
                    </div>
                    <!--end subtabs: price-->

                </div>
                <!-------------------------------------end tab Colors,backgrounds,fonts-->

                <!-------------------------------------tab Products sliders, products listings-->
                <div id="tab-products" class="display_none">


                    <div id="tab-products-sub" class="vtabs">
                        <a href="#tab-products-sub1" class="selected">Products, listings</a>
                        <a href="#tab-products-sub2" class="">Product labels</a>
                        <a href="#tab-products-sub3" class="">Social accounts for buttons in product view</a>
                    </div>

                    <div id="tab-products-sub1" class="margin_left display_block">
                        <table class="form">
                            <!--
                            <tr>
                                <td>Carousels:<br>
                                    <span class="help">Choose carousel layout.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_carousel_type" name="bs_products[carousel_type]" data-active="<?php echo $bs_products['carousel_type']; ?>">
                                        <option value="2_1">2 + 1</option>
                                        <option value="tabs">Tabs</option>
                                        <option value="3rows">3 separate rows</option>
                                    </select>
                                </td>
                            </tr>
                            -->

                            <tr>
                                <td>Mode of sliders on main page:<br>
                                    <span class="help">Choose view of sliders on main page: isotope or simple.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_slider_mode" name="bs_products[slider_mode]" data-active="<?php echo $bs_products['slider_mode']; ?>">
                                        <option value="tabs">Tabbed sliders</option>
                                        <option value="simple">Simple slides</option>
                                    </select>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Product listing mode:<br>
                                    <span class="help">Choose products listing mode for "Grid" view.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_product_listing" name="bs_products[product_listing]" data-active="<?php echo $bs_products['product_listing']; ?>">
                                        <option value="usual">Usual (description, price)</option>
                                        <option value="simple">Simple (image only)</option>
                                    </select>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <!--

                            <tr>
                                <td>Rollover effect for images in listings, sliders:<br>
                                    <span class="help">Choose effect for products' images: simple change or rotating images.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_rollover_effect" name="bs_products[rollover_effect]" data-active="<?php echo $bs_products['rollover_effect']; ?>">
                                        <option value="1">Simple</option>
                                        <option value="2">Rotate</option>
                                        <option value="none">No rollover</option>
                                    </select>
                                </td>
                            </tr>
                            -->

                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Catalog mode:<br>
                                    <span class="help">Create your listings into simple catalog.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_product_catalog_mode" name="bs_products[product_catalog_mode]" data-active="<?php echo $bs_products['product_catalog_mode']; ?>">
                                        <option value="disable">Disable catalog mode</option>
                                        <option value="enable">Enable catalog mode</option>
                                    </select>
                                </td>
                            </tr>

                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Product listing image size:<br>
                                    <span class="help">Choose product image preview size in listing.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_product_image_size" name="bs_products[product_image_size]" data-active="<?php echo $bs_products['product_image_size']; ?>">
                                        <option value="big">Big</option>
                                        <option value="small">Small</option>
                                    </select>
                                </td>
                            </tr>
                            -->
                            <!------------------------------------------------------------------------------------------------>
                            <tr>
                                <td>Zooming image mode on product page:<br>
                                    <span class="help">Choose zooming image mode on product page.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_product_zoom_mode" name="bs_products[product_zoom_mode]" data-active="<?php echo $bs_products['product_zoom_mode']; ?>">
                                        <option value="cloudzoom">Cloudzoom</option>
                                        <option value="fancybox">Lightbox</option>
                                    </select>
                                </td>
                            </tr>
                            <!------------------------------------------------------------------------------------------------>
                            <!--
                            <tr>
                                <td>Cloudzoom position:<br>
                                    <span class="help">Choose position of cloudzoom image preview on product page.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_cloudzoom_mode" name="bs_products[cloudzoom_mode]" data-active="<?php echo $bs_products['cloudzoom_mode']; ?>">
                                        <option value="right">Right</option>
                                        <option value="inside">Inside product image</option>
                                    </select>
                                </td>
                            </tr>
                            -->
                            <!------------------------------------------------------------------------------------------------>

                            <tr>
                                <td>Custom tabbed block - title:<br>
                                    <span class="help">Set custom tabbed product block title.</span>
                                </td>
                                <td>
                                    <div id="language-4" class="htabs">
                                        <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                        ?>
                                        <a href="#tab-language-custom-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                                            <?php echo $language['name']; ?>
                                        </a>
                                        <?php
                                             $module_row++;
                                             }
                                        ?>
                                    </div>
                                    <?php
                                             $module_row = 1;
                                             foreach ($languages as $language) {
                                    ?>
                                    <div id="tab-language-custom-<?php echo $module_row; ?>-<?php echo $language['code']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td class="border_bottom_none">
                                                    <input class="width_full" name="bs_products[<?php echo $language['code']; ?>][tabblock_title]" type="text" value="<?php echo isset($bs_products[$language['code']]) ? $bs_products[$language['code']]['tabblock_title'] : ''; ?>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <?php
                                             $module_row++;
                                             }
                                        ?>
                                </td>


                            </tr>


                            <tr>
                                <td>Category description on category page:<br>
                                    <span class="help">Choose display or not category description on category page.</a></span>
                                </td>
                                <td>
                                    <select id="bs_products_category_description" name="bs_products[category_description]" data-active="<?php echo $bs_products['category_description']; ?>">
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </td>
                            </tr>







                        </table>

                    </div>

                    <div id="tab-products-sub2" class="margin_left display_none">
                        <table class="form">
                            <tr>
                                <td>Show "Sale" label:</td>
                                <td>
                                    <div id="bs_products_sale_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[sale_status]" value="enable" id="bs_products_sale_status1">
                                            <label for="bs_products_sale_status1">
                                                Enable
                                            </label>
                                        </div>
                                        <div class="f_left">
                                        <input type="radio" name="bs_products[sale_status]" value="disable" id="bs_products_sale_status2">
                                            <label for="bs_products_sale_status2">
                                                Disable
                                            </label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>"Sale" label position:<br>
                                </td>
                                <td>
                                    <select id="bs_products_sale_position" name="bs_products[sale_position]" data-active="<?php echo $bs_products['sale_position']; ?>">
                                        <option value="top_left">Top Left</option>
                                        <option value="top_right">Top Right</option>
                                        <option value="bottom_left">Bottom Left</option>
                                        <option value="bottom_right">Bottom Right</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Color of "Sale" label:<br>
                                    <span class="help">Set background color of "Sale" label.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_sale_label_bg" name="bs_colors[sale_label_bg]" value="<?php echo $bs_colors['sale_label_bg']; ?>" type="text" style="background-color: <?php echo $bs_colors['sale_label_bg']; ?>; color: white;">
                                </td>
                            </tr>






                            <tr>
                                <td>Show "New" label:<br>
                                </td>
                                <td>
                                    <div id="bs_products_new_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[new_status]" value="enable" id="bs_products_new_status1">
                                            <label for="bs_products_new_status1">
                                                Enable
                                            </label>
                                         </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[new_status]" value="disable" id="bs_products_new_status2">
                                            <label for="bs_products_new_status2">
                                                Disable
                                            </label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>"New" label position:<br>
                                </td>
                                <td>
                                    <select id="bs_products_new_position" name="bs_products[new_position]" data-active="<?php echo $bs_products['new_position']; ?>">
                                        <option value="top_right">Top Right</option>
                                        <option value="top_left">Top Left</option>
                                        <option value="bottom_left">Bottom Left</option>
                                        <option value="bottom_right">Bottom Right</option>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td>Period of holding "New" label:<br>
                                    <span class="help">Number of days from the date "Date Available" to today date for a product.
                                </td>
                                <td>
                                    <input name="bs_products[days]" type="text" value="<?php echo $bs_products['days']; ?>" />
                                </td>
                            </tr>
                            <tr>
                                <td>Color of "New" label:<br>
                                    <span class="help">Set background color of "New" label.</span>
                                </td>
                                <td>
                                    <input id="bs_colors_new_label_bg" name="bs_colors[new_label_bg]" value="<?php echo $bs_colors['new_label_bg']; ?>" type="text" style="background-color: <?php echo $bs_colors['new_label_bg']; ?>; color: white;">
                                </td>
                            </tr>


                            <tr>
                                <td>Show "QUICK VIEW" function:<br>
                                    <span class="help">Set display or not “QUICK VIEW” function on products in sliders.
                                </td>
                                <td>
                                    <div id="bs_products_quick_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[quick_status]" value="1" id="bs_quick_status1">
                                            <label for="bs_quick_status1">
                                                Enable
                                            </label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[quick_status]" value="0" id="bs_quick_status2">
                                            <label for="bs_quick_status2">
                                                Disable
                                            </label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>


                            <tr>
                                <td>Show "Discount" label:<br>
                                    <span class="help">Set display or not "Discount" label.
                                </td>
                                <td>
                                    <div id="bs_products_discount_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[discount_status]" value="enable" id="bs_discount_status1">
                                            <label for="bs_discount_status1">
                                                Enable
                                            </label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[discount_status]" value="disable" id="bs_discount_status2">
                                            <label for="bs_discount_status2">
                                                Disable
                                            </label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>Show countdown of Special Offer:<br>
                                    <span class="help">Set display or not countdown of Special Offer in product sliders.
                                </td>
                                <td>
                                    <div id="bs_products_countdown_status_container">
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[countdown_status]" value="enable" id="bs_countdown_status1">
                                            <label for="bs_countdown_status1">
                                                Enable
                                            </label>
                                        </div>
                                        <div class="f_left">
                                            <input type="radio" name="bs_products[countdown_status]" value="disable" id="bs_countdown_status2">
                                            <label for="bs_countdown_status2">
                                                Disable
                                            </label>
                                        </div>
                                        <div class="clear_both"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="tab-products-sub3" class="margin_left display_none">
                        <p>
                            <span class="help">Keep in mind, if you leave one of this fields empty corresponding button will not be displayed on a product page.</span>
                        </p>
                        <table class="form">
                            <tr>
                                <td>Facebook button:<br>
                                    <span class="help">Here you can change account to your own. All information about this social button you can read there:
                                    <a href="https://developers.facebook.com/docs/reference/plugins/like/">https://developers.facebook.com/docs/reference/plugins/like/</a>
                                    </span>
                                </td>
                                <td>
                                    <input style="width:90%" name="bs_products[facebook_button]" type="text" value="<?php echo $bs_products['facebook_button']; ?>" />
                                </td>

                            </tr>
                            <tr>
                                <td>Twitter button:<br>
                                    <span class="help">Here you can change account to your own. All information about this social button you can read there:
                                    <a href="https://dev.twitter.com/docs/tweet-button">https://dev.twitter.com/docs/tweet-button</a>
                                    </span>
                                </td>
                                <td>
                                    <input style="width:90%" name="bs_products[twitter_button]" type="text" value="<?php echo $bs_products['twitter_button']; ?>" />
                                </td>
                            </tr>

                            <tr>
                                <td>Pin It button:<br>
                                    <span class="help">Here you can change view of Pin It button or generate your own.
                                        <br>Generate it you can here:
                                    <a href="//business.pinterest.com/widget-builder/#do_pin_it_button">//business.pinterest.com/widget-builder/#do_pin_it_button</a>
                                        To read about it's settings you can here:
                                    <a href="//developers.pinterest.com/pin_it/">//developers.pinterest.com/pin_it/</a>
                                    </span>
                                </td>
                                <td>
                                    <textarea name="bs_products[pinit_button]" style="width:90%;height: 200px">
                                        <?php echo $bs_products['pinit_button']; ?>
                                    </textarea>

                                </td>
                            </tr>



                        </table>
                    </div>


                </div>
                <!------------------------------------end tab Products sliders, products listings-->

                <!-------------------------------------tab flexslider-->
                <div id="tab-flexslider" class="display_none">
                    <table class="form">
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Prev/next buttons<br>
                                <span class="help">Enable/disable previous/next navigation</span>
                            </td>
                            <td>
                                <div id="bs_flexslider_flexslider_nav_container">
                                    <div class="f_left">
                                        <input type="radio" name="bs_flexslider[flexslider_nav]" value="true" id="bs_flexslider_flexslider_nav1">
                                        <label for="bs_flexslider_flexslider_nav1">Enable</label>
                                    </div>
                                    <div class="f_left">
                                        <input type="radio" name="bs_flexslider[flexslider_nav]" value="false" id="bs_flexslider_flexslider_nav2">
                                        <label for="bs_flexslider_flexslider_nav2">Disable</label>
                                    </div>
                                    <div class="clear_both"></div>
                                </div>
                            </td>
                        </tr>
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Control navigation<br>
                                <span class="help">Enable/disable navigation for paging control of each slide</span>
                            </td>
                            <td>
                                <div id="bs_flexslider_flexslider_control_container">
                                    <div class="f_left">
                                        <input type="radio" name="bs_flexslider[flexslider_control]" value="true" id="bs_flexslider_flexslider_control1">
                                        <label for="bs_flexslider_flexslider_control1">Enable</label>
                                    </div>
                                    <div class="f_left">
                                        <input type="radio" name="bs_flexslider[flexslider_control]" value="false" id="bs_flexslider_flexslider_control2">
                                        <label for="bs_flexslider_flexslider_control2">Disable</label>
                                    </div>
                                    <div class="clear_both"></div>
                                </div>
                            </td>
                        </tr>
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Animation type:<br>
                                <span class="help">Select your animation type, "fade" or "slide".</span>
                            </td>
                            <td>
                                <select id="bs_flexslider_flexslider_animation" name="bs_flexslider[flexslider_animation]" data-active="<?php echo $bs_flexslider['flexslider_animation']; ?>">
                                    <option value="slide">Slide</option>
                                    <option value="fade">Fade</option>
                                </select>
                            </td>
                        </tr>
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Direction type:<br>
                                <span class="help">Select the sliding direction, "horizontal" or "vertical" (if you've selected before animation type - slide).</span>
                            </td>
                            <td>
                                <select id="bs_flexslider_flexslider_direction" name="bs_flexslider[flexslider_direction]" data-active="<?php echo $bs_flexslider['flexslider_direction']; ?>">
                                    <option value="horizontal">Horizontal</option>
                                    <option value="vertical">Vertical</option>
                                </select>
                            </td>
                        </tr>
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Slideshow Speed:<br>
                                <span class="help">Set the speed of the slideshow cycling, in milliseconds.</span>
                            </td>
                            <td><input name="bs_flexslider[flexslider_slideshowspeed]" type="text" value="<?php echo $bs_flexslider['flexslider_slideshowspeed']; ?>" /></td>
                        </tr>
                        <!------------------------------------------------------------------------------------------------>
                        <tr>
                            <td>Animation Speed:<br>
                                <span class="help">Set the speed of animations, in milliseconds.</span>
                            </td>
                            <td><input name="bs_flexslider[flexslider_animationspeed]" type="text" value="<?php echo $bs_flexslider['flexslider_animationspeed']; ?>" /></td>
                        </tr>

                    </table>
                </div>
                <!-------------------------------------end tab flexslider-->


                <div class="clear_both"></div>
                <input type="hidden" name="buttonForm" value="" />

            </form>
        </div>
    </div>
</div>


<script type="text/javascript"><!--
jQuery('#tabs a').tabs();

jQuery('#tab-general-sub a').tabs();
jQuery('#tab-colors-sub a').tabs();
jQuery('#tab-products-sub a').tabs();

jQuery('#language-1 a').tabs();
jQuery('#language-2 a').tabs();
jQuery('#language-3 a').tabs();
jQuery('#language-4 a').tabs();
jQuery('#language-blog a').tabs();
jQuery('#language-contacts a').tabs();
jQuery('#language-map a').tabs();
jQuery('#language-contactpopup-1 a').tabs();

jQuery('#languages a').tabs();
jQuery('#vtab-option a').tabs();


//--></script>
<script type="text/javascript"><!--

jQuery(document).ready(function(){


    jQuery("#bs_colors_new_label_bg").ColorPicker({color:jQuery("#bs_colors_new_label_bg").val(),onShow:function(colpkr){jQuery(colpkr).fadeIn(500);return false;},onHide:function(colpkr){jQuery(colpkr).fadeOut(500);return false;},onChange:function(hsb,hex,rgb){jQuery("#bs_colors_new_label_bg").css("backgroundColor","#"+hex);jQuery("#bs_colors_new_label_bg").val("#"+hex);}});
    jQuery("#bs_colors_sale_label_bg").ColorPicker({color:jQuery("#bs_colors_sale_label_bg").val(),onShow:function(colpkr){jQuery(colpkr).fadeIn(500);return false;},onHide:function(colpkr){jQuery(colpkr).fadeOut(500);return false;},onChange:function(hsb,hex,rgb){jQuery("#bs_colors_sale_label_bg").css("backgroundColor","#"+hex);jQuery("#bs_colors_sale_label_bg").val("#"+hex);}});

    /***********************************tab-general: set active headertopline */
    jQuery(function() {
        var $radios = jQuery('#bs_general_headertopline_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['headertopline']; ?>"]').attr('checked', true);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_general_headerspy_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['headerspy']; ?>"]').attr('checked', true);
        }
    });

    /***********************************tab-general: set active Right quick panel */
    jQuery(function() {
        var $radios = jQuery('#bs_general_quickpanel_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['quickpanel']; ?>"]').attr('checked', true);
        }
    });
    /***********************************tab-general: set active Footer info */
    jQuery(function() {
        var $radios = jQuery('#bs_general_footerinfo_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['footerinfo']; ?>"]').attr('checked', true);
        }
    });
    /***********************************tab-general: set active Footer popup */
    jQuery(function() {
        var $radios = jQuery('#bs_general_footerpopup_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['footerpopup']; ?>"]').attr('checked', true);
        }
    });
    /***********************************tab-general: set active Sidebar  */
    jQuery(function() {
        var $radios = jQuery('#bs_general_sidebar_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['sidebar']; ?>"]').attr('checked', true);
        }
    });


    /***********************************navigation: set active Home button in Top menu */
    jQuery(function() {
        var $radios = jQuery('#bs_general_homebutton_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['homebutton']; ?>"]').attr('checked', true);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_general_customs_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['customs']; ?>"]').attr('checked', true);
        }
    });

    /***********************************navigation: Custom block */
    jQuery(function() {
        var $radios = jQuery('#bs_general_customblock_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['customblock_status']; ?>"]').attr('checked', true);
        }
    });
    /***********************************navigation: Second custom link in top menu */
    jQuery(function() {
        var $radios = jQuery('#bs_general_customitem_item_status2_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['customitem_item_status2']; ?>"]').attr('checked', true);
        }
    });

    /***********************************socials buttons in footer */
    jQuery(function() {
        var $radios = jQuery('#bs_general_socials_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['socials_status']; ?>"]').attr('checked', true);
        }
    });

    /***********************************payment buttons in footer */
    jQuery(function() {
        var $radios = jQuery('#bs_general_footerpayment_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['footerpayment_status']; ?>"]').attr('checked', true);
        }
    });

    /***********************************blog link in top menu status */
    jQuery(function() {
        var $radios = jQuery('#bs_general_blog_link_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['blog_link_status']; ?>"]').attr('checked', true);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_general_contacts_link_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['contacts_link_status']; ?>"]').attr('checked', true);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_general_contact_map_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['contact_map_status']; ?>"]').attr('checked', true);
        }
    });





    jQuery(function() {
        var $radios = jQuery('#bs_general_css_file_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_general['css_file']; ?>"]').attr('checked', true);
        }
    });


    /***********************************tab-colors: set themecolor****************************************/
    jQuery("#bs_theme_general_themecolor").ColorPicker({
         color: jQuery('#bs_theme_general_themecolor').val(),
         onShow: function (colpkr) {
         jQuery(colpkr).fadeIn(500);
         return false;
         },
         onHide: function (colpkr) {
         jQuery(colpkr).fadeOut(500);
         return false;
         },
         onChange: function (hsb, hex, rgb) {
         jQuery('#bs_theme_general_themecolor').css('backgroundColor', '#' + hex);
         jQuery('#bs_theme_general_themecolor').val('#' + hex);
         }
    });


    /***********************************tab-colors: set Theme Hover Color  */
    jQuery("#bs_colors_general_themehover").ColorPicker({
        color: jQuery('#bs_colors_general_themehover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_themehover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_themehover').val('#' + hex);
        }
    });

    /***********************************tab-colors: set Input hover color (focus border)  */
    jQuery("#bs_colors_general_input").ColorPicker({
        color: jQuery('#bs_colors_general_input').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_input').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_input').val('#' + hex);
        }
    });


    /***********************************tab-colors: set Text Color  */
    jQuery("#bs_colors_general_text").ColorPicker({
        color: jQuery('#bs_colors_general_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_text').val('#' + hex);
        }
    });


    /***********************************tab-colors: set Link Color  */
    jQuery("#bs_colors_general_link").ColorPicker({
        color: jQuery('#bs_colors_general_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_link').val('#' + hex);
        }
    });


    /***********************************tab-colors: set Link Hover Color  */
    jQuery("#bs_colors_general_linkhover").ColorPicker({
        color: jQuery('#bs_colors_general_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_linkhover').val('#' + hex);
        }
    });


    /***********************************tab-colors: set Background Color  */
    jQuery("#bs_colors_general_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_general_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_general_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_general_bgcolor').val('#' + hex);
        }
    });
    jQuery("#bs_general_layout_skin").val(jQuery("#bs_general_layout_skin").data("active")).attr('selected', true);
    jQuery("#bs_general_bgimage_mode").val(jQuery("#bs_general_bgimage_mode").data("active")).attr('selected', true);
    jQuery("#bs_colors_content_bg_mode").val(jQuery("#bs_colors_content_bg_mode").data("active")).attr('selected', true);
    jQuery("#bs_colors_captions_font").val(jQuery("#bs_colors_captions_font").data("active")).attr('selected', true);
    jQuery("#bs_colors_price_font").val(jQuery("#bs_colors_price_font").data("active")).attr('selected', true);
    jQuery("#bs_general_footerpopup_mode").val(jQuery("#bs_general_footerpopup_mode").data("active")).attr('selected', true);
    jQuery("#bs_products_category_description").val(jQuery("#bs_products_category_description").data("active")).attr('selected', true);


    /***********************************tab-colors: set captions Color  */
    jQuery("#bs_colors_captions_text").ColorPicker({
        color: jQuery('#bs_colors_captions_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_captions_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_captions_text').val('#' + hex);
        }
    });

    /* set active captions font */



    /***********************************tab-colors: Header TopLine - set Text Color  */
    jQuery("#bs_colors_topline_text").ColorPicker({
        color: jQuery('#bs_colors_topline_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_topline_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_topline_text').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header TopLine - set Link Color  */
    jQuery("#bs_colors_topline_link").ColorPicker({
        color: jQuery('#bs_colors_topline_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_topline_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_topline_link').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header TopLine - set Link Hover Color  */
    jQuery("#bs_colors_topline_linkhover").ColorPicker({
        color: jQuery('#bs_colors_topline_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_topline_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_topline_linkhover').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header TopLine - set Background Color  */
    jQuery("#bs_colors_topline_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_topline_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_topline_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_topline_bgcolor').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header TopLine - set Phone Color  */
    jQuery("#bs_colors_topline_phonecolor").ColorPicker({
        color: jQuery('#bs_colors_topline_phonecolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_topline_phonecolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_topline_phonecolor').val('#' + hex);
        }
    });

    /***********************************tab-general: set tool line shadow  */
    jQuery(function() {
        var $radios = jQuery('#bs_colors_topline_shadow_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_colors['topline_shadow']; ?>"]').attr('checked', true);
        }
    });

    /*******************************************************************************************************************/

    /***********************************tab-colors: Header tool line dd boxes - set link Color  */
    jQuery("#bs_colors_dd_ink").ColorPicker({
        color: jQuery('#bs_colors_dd_ink').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_dd_ink').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_dd_ink').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header tool line dd boxes - set link hover Color  */
    jQuery("#bs_colors_dd_linkhover").ColorPicker({
        color: jQuery('#bs_colors_dd_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_dd_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_dd_linkhover').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header tool line dd boxes - set bg Color  */
    jQuery("#bs_colors_dd_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_dd_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_dd_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_dd_bgcolor').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header tool line dd boxes - set border Color  */
    jQuery("#bs_colors_dd_border").ColorPicker({
        color: jQuery('#bs_colors_dd_border').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_dd_border').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_dd_border').val('#' + hex);
        }
    });

    /*******************************************************************************************************************/

    /***********************************tab-colors: Header nav - set link Color  */
    jQuery("#bs_colors_headernav_text").ColorPicker({
        color: jQuery('#bs_colors_headernav_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_headernav_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_headernav_text').val('#' + hex);
        }
    });

    /***********************************tab-colors: Header nav - set link Color  */
    jQuery("#bs_colors_headernav_link").ColorPicker({
        color: jQuery('#bs_colors_headernav_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_headernav_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_headernav_link').val('#' + hex);
        }
    });
    /***********************************tab-colors: Header nav - set link hover Color  */
    jQuery("#bs_colors_headernav_linkhover").ColorPicker({
        color: jQuery('#bs_colors_headernav_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_headernav_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_headernav_linkhover').val('#' + hex);
        }
    });

    /***********************************tab-colors: Header bg Color  */
    jQuery("#bs_colors_header_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_header_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_header_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_header_bgcolor').val('#' + hex);
        }
    });


    /***********************************tab-colors: Header nav - set bg Color  */
    jQuery("#bs_colors_headernav_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_headernav_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_headernav_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_headernav_bgcolor').val('#' + hex);
        }
    });


    /*****************************************************************************************************/

    /***********************************tab-colors: content Text Color */
    jQuery("#bs_colors_content_text").ColorPicker({
        color: jQuery('#bs_colors_content_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_content_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_content_text').val('#' + hex);
        }
    });

    /***********************************tab-colors: content Link Color */
    jQuery("#bs_colors_content_link").ColorPicker({
        color: jQuery('#bs_colors_content_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_content_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_content_link').val('#' + hex);
        }
    });

    /***********************************tab-colors: content Link hover Color */
    jQuery("#bs_colors_content_linkhover").ColorPicker({
        color: jQuery('#bs_colors_content_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_content_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_content_linkhover').val('#' + hex);
        }
    });

    /***********************************tab-colors: content Background Color */
    jQuery("#bs_colors_content_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_content_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_content_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_content_bgcolor').val('#' + hex);
        }
    });


    /*****************************************************************************************************/

    /***********************************tab-colors: Footer info */
    jQuery("#bs_colors_footerinfo_text").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_text').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_link").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_link').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_linkhover").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_linkhover').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_captions").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_captions').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_captions').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_captions').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_bold").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_bold').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_bold').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_bold').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_footerinfo_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_bgcolor').val('#' + hex);
        }
    });

    jQuery("#bs_colors_footerinfo_linecolor").ColorPicker({
        color: jQuery('#bs_colors_content_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerinfo_linecolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerinfo_linecolor').val('#' + hex);
        }
    });


    /*****************************************************************************************************/

    /***********************************tab-colors: Footer */
    jQuery("#bs_colors_footer_text").ColorPicker({
        color: jQuery('#bs_colors_footer_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footer_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footer_text').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footer_link").ColorPicker({
        color: jQuery('#bs_colors_footer_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footer_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footer_link').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footer_link_hover").ColorPicker({
        color: jQuery('#bs_colors_footer_link_hover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footer_link_hover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footer_link_hover').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footer_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_footer_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footer_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footer_bgcolor').val('#' + hex);
        }
    });

    /*****************************************************************************************************/

    /***********************************tab-colors: Footer popup */
    jQuery("#bs_colors_footerpopup_text").ColorPicker({
        color: jQuery('#bs_colors_footerpopup_text').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerpopup_text').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerpopup_text').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footerpopup_captions").ColorPicker({
        color: jQuery('#bs_colors_footerpopup_captions').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerpopup_captions').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerpopup_captions').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footerpopup_link").ColorPicker({
        color: jQuery('#bs_colors_footerpopup_link').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerpopup_link').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerpopup_link').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footerpopup_linkhover").ColorPicker({
        color: jQuery('#bs_colors_footerpopup_linkhover').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerpopup_linkhover').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerpopup_linkhover').val('#' + hex);
        }
    });
    jQuery("#bs_colors_footerpopup_bgcolor").ColorPicker({
        color: jQuery('#bs_colors_footerpopup_bgcolor').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_footerpopup_bgcolor').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_footerpopup_bgcolor').val('#' + hex);
        }
    });

    /*****************************************************************************************************/

    /***********************************tab-colors: prices */
    jQuery("#bs_colors_price_regular").ColorPicker({
        color: jQuery('#bs_colors_price_regular').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_price_regular').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_price_regular').val('#' + hex);
        }
    });
    jQuery("#bs_colors_price_new").ColorPicker({
        color: jQuery('#bs_colors_price_new').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_price_new').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_price_new').val('#' + hex);
        }
    });
    jQuery("#bs_colors_price_old").ColorPicker({
        color: jQuery('#bs_colors_price_old').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_price_old').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_price_old').val('#' + hex);
        }
    });


    /* update font preview for price font  */
    jQuery(function(){
        fontSelect=jQuery("#bs_colors_price_font");
        fontUpdate=function(){
            curFont=jQuery("#bs_colors_price_font").val();
            jQuery("#bs_colors_price_font_preview").css({ fontFamily: curFont });
            if (curFont != '-') {
                jQuery("<link />",{href:"//fonts.googleapis.com/css?family="+curFont,rel:"stylesheet",type:"text/css"}).appendTo("head");
            }
        }
        fontSelect.change(function(){
            fontUpdate();
        }).keyup(function(){
                    fontUpdate();
                }).keydown(function(){
                    fontUpdate();
                });
        jQuery("#bs_colors_price_font").trigger("change");
        fontUpdate();
    });


    /* update font preview for captions  */
    jQuery(function(){
        fontSelect=jQuery("#bs_colors_captions_font");
        fontUpdate_captions=function(){
            curFont=jQuery("#bs_colors_captions_font").val();
            jQuery("#bs_colors_captions_font_preview").css({ fontFamily: curFont });
            if (curFont != '-') {
                jQuery("<link />",{href:"//fonts.googleapis.com/css?family="+curFont,rel:"stylesheet",type:"text/css"}).appendTo("head");
            }

        }
        fontSelect.change(function(){
            fontUpdate_captions();
        }).keyup(function(){
                    fontUpdate_captions();
                }).keydown(function(){
                    fontUpdate_captions();
                });
        jQuery("#bs_colors_captions_font").trigger("change");
        fontUpdate_captions();
    });




    /* products, listings */
    jQuery("#bs_products_carousel_type").val(jQuery("#bs_products_carousel_type").data("active")).attr('selected', true);
    jQuery("#bs_products_slider_mode").val(jQuery("#bs_products_slider_mode").data("active")).attr('selected', true);
    jQuery("#bs_products_product_listing").val(jQuery("#bs_products_product_listing").data("active")).attr('selected', true);

    jQuery("#bs_products_rollover_effect").val(jQuery("#bs_products_rollover_effect").data("active")).attr('selected', true);


    jQuery("#bs_products_product_catalog_mode").val(jQuery("#bs_products_product_catalog_mode").data("active")).attr('selected', true);
    jQuery("#bs_products_product_image_size").val(jQuery("#bs_products_product_image_size").data("active")).attr('selected', true);
    jQuery("#bs_colors_product_image_rollover").val(jQuery("#bs_colors_product_image_rollover").data("active")).attr('selected', true);
    jQuery("#bs_products_product_zoom_mode").val(jQuery("#bs_products_product_zoom_mode").data("active")).attr('selected', true);
    jQuery("#bs_products_cloudzoom_mode").val(jQuery("#bs_products_cloudzoom_mode").data("active")).attr('selected', true);
    jQuery("#bs_flexslider_flexslider_animation").val(jQuery("#bs_flexslider_flexslider_animation").data("active")).attr('selected', true);
    jQuery("#bs_flexslider_flexslider_direction").val(jQuery("#bs_flexslider_flexslider_direction").data("active")).attr('selected', true);



    jQuery(function() {
        var $radios = jQuery('#bs_flexslider_flexslider_nav_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_flexslider['flexslider_nav']; ?>"]').attr('checked', true);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_flexslider_flexslider_control_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_flexslider['flexslider_control']; ?>"]').attr('checked', true);
        }
    });

    jQuery(function() {
        var $radios = jQuery('#bs_products_discount_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_products['discount_status']; ?>"]').attr('checked', true);
        }
    });

    jQuery(function() {
        var $radios = jQuery('#bs_products_quick_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_products['quick_status']; ?>"]').attr('checked', true);
        }
    });
    /*
    jQuery(function() {
        var $radios = jQuery('#bs_products_countdown_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_products['countdown_status']; ?>"]').attr('checked', true);
        }
    });
    */




    jQuery("#bs_colors_product_border").ColorPicker({
        color: jQuery('#bs_colors_product_border').val(),
        onShow: function (colpkr) {
            jQuery(colpkr).fadeIn(500);
            return false;
        },
        onHide: function (colpkr) {
            jQuery(colpkr).fadeOut(500);
            return false;
        },
        onChange: function (hsb, hex, rgb) {
            jQuery('#bs_colors_product_border').css('backgroundColor', '#' + hex);
            jQuery('#bs_colors_product_border').val('#' + hex);
        }
    });
    jQuery(function() {
        var $radios = jQuery('#bs_colors_product_shadow_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_colors['product_shadow']; ?>"]').attr('checked', true);
        }
    });




    /* set active sale label */
    jQuery(function() {
        var $radios = jQuery('#bs_products_sale_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_products['sale_status']; ?>"]').attr('checked', true);
        }
    });

    /* set active new label */
    jQuery(function() {
        var $radios = jQuery('#bs_products_new_status_container input:radio');
        if($radios.is(':checked') === false) {
            $radios.filter('[value="<?php echo $bs_products['new_status']; ?>"]').attr('checked', true);
        }
    });
    /* set active sale position */
    jQuery("#bs_products_sale_position").val(jQuery("#bs_products_sale_position").data("active")).attr('selected', true);
    /* set active new position */
    jQuery("#bs_products_new_position").val(jQuery("#bs_products_new_position").data("active")).attr('selected', true);

    jQuery("#bs_additional_flexslider_width").val(jQuery("#bs_additional_flexslider_width").data("active")).attr('selected', true);
    jQuery("#bs_additional_nivo_width").val(jQuery("#bs_additional_nivo_width").data("active")).attr('selected', true);
    jQuery("#bs_additional_revolution_width").val(jQuery("#bs_additional_revolution_width").data("active")).attr('selected', true);
});


function image_upload(field, thumb) {
    $('#dialog').remove();

    $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

    $('#dialog').dialog({
        title: '<?php echo $text_image_manager; ?>',
        close: function (event, ui) {
            if ($('#' + field).attr('value')) {
                $.ajax({
                    url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
                    dataType: 'text',
                    success: function(data) {
                        $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
                    }
                });
            }
        },
        bgiframe: false,
        width: 800,
        height: 400,
        resizable: false,
        modal: false
    });
}



function buttonApply() {document.settingsform.buttonForm.value='apply';$('#form').submit();}


//--></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
    CKEDITOR.replace('description<?php echo $language['code']; ?>', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });

    CKEDITOR.replace('description-contactpopup-<?php echo $language['code']; ?>', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });

<?php } ?>
//--></script>
<?php echo $footer; ?>