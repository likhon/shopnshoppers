<?php  
class ControllerModuleWelcome extends Controller {
	protected function index($setting) {
		$this->language->load('module/welcome');
		
		$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

		if (isset($setting['description'][$this->config->get('config_language_id')])) {
            $this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['message'] = '';
        }

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/welcome.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/welcome.tpl';
		} else {
			$this->template = 'default/template/module/welcome.tpl';
		}
		
		$this->render();
	}
}
?>