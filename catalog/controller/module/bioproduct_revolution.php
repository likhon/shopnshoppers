<?php  
class ControllerModuleBioproductRevolution extends Controller {
	protected function index($setting) {
		$this->language->load('module/bioproduct_revolution');

        //$this->document->addScript('catalog/view/theme/' . $this->config->get('config_template') . '/js/rs-plugin/js/jquery.themepunch.plugins.min.js');
        //$this->document->addScript('catalog/view/theme/' . $this->config->get('config_template') . '/js/rs-plugin/js/jquery.themepunch.revolution.min.js');
        //$this->document->addScript('catalog/view/theme/' . $this->config->get('config_template') . '/js/rs-plugin/js/revolution_ini.js');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->config->get('bs_additional');
        $this->data['slider_width_settings'] = $this->config->get('bs_additional');

        if (isset($setting['description'][$this->config->get('config_language_id')])) {
            $this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['message'] = html_entity_decode($setting['description'][1], ENT_QUOTES, 'UTF-8');
        }


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bioproduct_revolution.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/bioproduct_revolution.tpl';
		}

		$this->render();
	}
}