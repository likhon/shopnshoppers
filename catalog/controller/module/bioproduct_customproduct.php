<?php  
class ControllerModuleBioproductCustomproduct extends Controller {
	protected function index($setting) {
		$this->language->load('module/bioproduct_customproduct');

        $this->data['heading_title'] = $this->language->get('heading_title');

        if (isset($setting['description'][$this->config->get('config_language_id')])) {
            $this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['message'] = html_entity_decode($setting['description'][1], ENT_QUOTES, 'UTF-8');
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bioproduct_customproduct.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/bioproduct_customproduct.tpl';
		}

		$this->render();
	}
}