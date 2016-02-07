<?php
class ControllerModuleBioproduct extends Controller {
    private $_name = 'bioproduct';

    private $error = array();
    public function index() {
        $this->language->load('module/bioproduct');
		$this->document->setTitle($this->language->get('heading_title_normal'));


        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');



        $this->data['heading_title'] = $this->language->get('heading_title');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'module/bioproduct.tpl')) {
            $this->template = $this->config->get('config_template') . 'module/bioproduct.tpl';
        } else {
            $this->template = 'module/bioproduct.tpl';
        }


        $this->load->model('setting/setting');


        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_normal'),
            'href'      => $this->url->link('module/bioproduct', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );





        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('bioproduct', $this->request->post);
            $this->session->data['text_success'] = $this->language->get('text_success');

            if ($this->request->post['buttonForm'] == 'apply') {
                $this->redirect($this->url->link('module/' . $this->_name, 'token=' . $this->session->data['token'], 'SSL'));
            } else {
                $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            }

        }

        $this->data['bs_general'] = $this->config->get('bs_general');
        $this->data['bs_colors'] = $this->config->get('bs_colors');
        $this->data['bs_products'] = $this->config->get('bs_products');
        $this->data['bs_flexslider'] = $this->config->get('bs_flexslider');
        $this->data['bs_additional'] = $this->config->get('bs_additional');
        $this->data['bs_theme'] = $this->config->get('bs_theme');

        $this->load->model('tool/image');
        $this->data['token'] = $this->session->data['token'];

        /************************************** images upload */
        $this->load->model('tool/image');
        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

        /* Logo (Right quick panel) image upload */
        if (($this->data['bs_general']['logo_right']) && file_exists(DIR_IMAGE . $this->data['bs_general']['logo_right'])) {
            $this->data['logo_right_thumb'] = $this->model_tool_image->resize($this->data['bs_general']['logo_right'], 100, 100);
        } else {
            $this->data['logo_right_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }

        /* Logo (Contact popup) image upload */
        if (($this->data['bs_general']['logo_popup']) && file_exists(DIR_IMAGE . $this->data['bs_general']['logo_popup'])) {
            $this->data['logo_popup_thumb'] = $this->model_tool_image->resize($this->data['bs_general']['logo_popup'], 100, 100);
        } else {
            $this->data['logo_popup_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }


        /* header top line Background Image upload */
        if (($this->data['bs_general']['bgimage']) && file_exists(DIR_IMAGE . $this->data['bs_general']['bgimage'])) {
            $this->data['bgimage_thumb'] = $this->model_tool_image->resize($this->data['bs_general']['bgimage'], 100, 100);
        } else {
            $this->data['bgimage_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }

        /* header navigation image upload */
        if (($this->data['bs_colors']['headernav_image']) && file_exists(DIR_IMAGE . $this->data['bs_colors']['headernav_image'])) {
            $this->data['headernav_thumb'] = $this->model_tool_image->resize($this->data['bs_colors']['headernav_image'], 100, 100);
        } else {
            $this->data['headernav_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        /* Arrow Image dd upload */
        if (($this->data['bs_colors']['dd_arrow']) && file_exists(DIR_IMAGE . $this->data['bs_colors']['dd_arrow'])) {
            $this->data['dd_arrow_thumb'] = $this->model_tool_image->resize($this->data['bs_colors']['dd_arrow'], 100, 100);
        } else {
            $this->data['dd_arrow_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }

        /* content Background image upload */
        if (($this->data['bs_colors']['content_bg']) && file_exists(DIR_IMAGE . $this->data['bs_colors']['content_bg'])) {
            $this->data['content_bg_thumb'] = $this->model_tool_image->resize($this->data['bs_colors']['content_bg'], 100, 100);
        } else {
            $this->data['content_bg_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }
        /* footer_delimeter image upload */
        if (($this->data['bs_colors']['footer_delimeter']) && file_exists(DIR_IMAGE . $this->data['bs_colors']['footer_delimeter'])) {
            $this->data['footer_delimeter_thumb'] = $this->model_tool_image->resize($this->data['bs_colors']['footer_delimeter'], 100, 100);
        } else {
            $this->data['footer_delimeter_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }


        /* Search decoration in header upload */
        if (($this->data['bs_colors']['headernav_search_decoration']) && file_exists(DIR_IMAGE . $this->data['bs_colors']['headernav_search_decoration'])) {
            $this->data['headernav_search_decoration_thumb'] = $this->model_tool_image->resize($this->data['bs_colors']['headernav_search_decoration'], 100, 100);
        } else {
            $this->data['headernav_search_decoration_thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
        }

        /* information pages */
        $this->load->model('catalog/information');

        //var_dump($this->model_catalog_information->getInformations());

        foreach ($this->model_catalog_information->getInformations() as $result) {
            $this->data['information_pages'][] = array(
                'title' => $result['title'],
                'information_id' => $result['information_id'],
                'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
            );
        }
        /* end information pages */




        $this->document->addScript($this->config->get('config_url').'catalog/view/bs-colorpicker/js/colorpicker.js');
        $this->document->addStyle($this->config->get('config_url').'catalog/view/bs-colorpicker/css/colorpicker.css');
        $this->document->addStyle($this->config->get('config_url').'view/stylesheet/bioproduct.css');
        $this->data['config_url'] = $this->config->get('config_url');
        $this->data['action'] = $this->url->link('module/bioproduct', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
        
	    $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/information')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}