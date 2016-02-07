<?php  
class ControllerModuleFooterInfo extends Controller {
	protected function index($setting) {
		$this->language->load('module/footer_info');
		
		$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));

        $this->data['title_facebook'] = html_entity_decode($this->language->get('title_facebook'), ENT_QUOTES, 'UTF-8');
        $this->data['title_twitter'] = html_entity_decode($this->language->get('title_twitter'), ENT_QUOTES, 'UTF-8');


        if (isset($setting['description'][$this->config->get('config_language_id')])) {
            $this->data['message'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['message'] = '';
        }
        if (isset($setting['description1'][$this->config->get('config_language_id')])) {
            $this->data['message1'] = html_entity_decode($setting['description1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['message1'] = '';
        }

        if (isset($setting['title'][$this->config->get('config_language_id')])) {
            $this->data['title'] = html_entity_decode($setting['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['title'] = '';
        }
        if (isset($setting['title1'][$this->config->get('config_language_id')])) {
            $this->data['title1'] = html_entity_decode($setting['title1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        } else {
            $this->data['title1'] = '';
        }



        if (isset($setting['facebook'][$this->config->get('config_language_id')])) {
            $this->data['facebook_account'] = $setting['facebook'][$this->config->get('config_language_id')];
        } else {
            $this->data['facebook_account'] = '';
        }

        if (isset($setting['twitter'][$this->config->get('config_language_id')])) {
            $this->data['twitter_account'] = $setting['twitter'][$this->config->get('config_language_id')];
        } else {
            $this->data['twitter_account'] = '';
        }






        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/footer_info.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/footer_info.tpl';
		} else {
			$this->template = 'default/template/module/footer_info.tpl';
		}
		
		$this->render();
	}
}