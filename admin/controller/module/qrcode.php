<?php
#############################################################################
#  Adpatations for OpenCart 1.5.1.1 from Alcuino 28.8.2011
#  Original developed by  Somsak2004, web: www.somsak2004.net email: sanma2001@hotmail.com
#  
#############################################################################
class ControllerModuleQrcode extends Controller {			   
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/qrcode');

		$this->document->setTitle = $this->language->get('heading_title_normal');
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {

			$this->model_setting_setting->editSetting('qrcode', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_show_product'] = $this->language->get('entry_show_product');
		$this->data['entry_no_show_product'] = $this->language->get('entry_no_show_product');
		$this->data['entry_generator'] = $this->language->get('entry_generator');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension');
		$this->data['entry_help'] = $this->language->get('entry_help');
		$this->data['entry_version_status'] = $this->language->get('entry_version_status');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_author'] = $this->language->get('entry_author');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->error['sort_order'])) {
			$this->data['error_sort_order'] = $this->error['sort_order'];
		} else {
			$this->data['error_sort_order'] = '';
		}
		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
		}
		
        $this->data['breadcrumbs'] = array();
   		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=extension/module&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER .'index.php?route=module/qrcode&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title_normal'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/qrcode', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['qrcode_module'])) {
			$this->data['modules'] = $this->request->post['qrcode_module'];
		} elseif ($this->config->get('qrcode_module')) { 
			$this->data['modules'] = $this->config->get('qrcode_module');
		}				
		
		
        $this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		$this->template = 'module/qrcode.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
        $this->response->setOutput($this->render());
	}
	
	private function validate() {

		if (!$this->user->hasPermission('modify', 'module/qrcode')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}

}
?>