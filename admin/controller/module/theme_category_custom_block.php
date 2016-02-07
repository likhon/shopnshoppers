<?php
class ControllerModuleThemeCategoryCustomBlock extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/theme_category_custom_block');
		$this->document->setTitle($this->language->get('heading_title_normal'));
        $this->load->model('setting/setting');
        $this->load->model('customisation/bioproduct_products_options');
        $this->data['token'] = $this->session->data['token'];

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('theme_category_custom_block', $this->request->post);




            foreach ($this->request->post['category'] as $category) {
                //if (!empty($category['tab_icon'])) {
                    //$this->model_customisation_bioproduct_products_options->saveAttributeCategories('tab_icon', $category);
                //}
                if (!empty($category['image_src'])) {
                    $this->model_customisation_bioproduct_products_options->saveAttributeCategories('image_src', $category);
                }
                if (!empty($category['image_top_src'])) {
                    $this->model_customisation_bioproduct_products_options->saveAttributeCategories('image_top_src', $category);
                }


            }




            $this->model_setting_setting->editSetting('theme_category_custom_block', $this->request->post);
            $this->session->data['text_success'] = $this->language->get('text_success');
            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));

        }




        $this->data['block_title'] = $this->language->get('block_title');


        $this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();


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
			'href'      => $this->url->link('module/theme_category_custom_block', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/theme_category_custom_block', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();


        /* category */
        $this->language->load('catalog/category');
        $this->load->model('catalog/category');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }


        $data = array(
            'start' => ($page - 1) * $this->config->get('config_admin_limit'),
            'limit' => $this->config->get('config_admin_limit')
        );


        $category_total = $this->model_catalog_category->getTotalCategories();
        $categories = $this->model_catalog_category->getCategories($data);


        // add custom attribute to products array
        //$categories = $this->model_customisation_bioproduct_products_options->updateCategoriesArray($categories, 'tab_icon');
        $categories = $this->model_customisation_bioproduct_products_options->updateCategoriesArray($categories, 'image_src');
        $categories = $this->model_customisation_bioproduct_products_options->updateCategoriesArray($categories, 'image_top_src');

        $this->data['categories'] = $categories;


        $pagination = new Pagination();
        $pagination->total = $category_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('module/theme_category_custom_block', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();


        /* end category */


        if (isset($this->request->post['theme_category_custom_block_module'])) {
			$this->data['modules'] = $this->request->post['theme_category_custom_block_module'];
		} elseif ($this->config->get('theme_category_custom_block_module')) {
			$this->data['modules'] = $this->config->get('theme_category_custom_block_module');
		}			
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/theme_category_custom_block.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

    public function install(){
        $this->load->model('customisation/bioproduct_products_options');
        $this->model_customisation_bioproduct_products_options->createTablesCategories();
        $this->load->model('setting/setting');
        $this->session->data['success'] = $this->language->get('text_success_installed');
    }

    public function uninstall(){
        $this->load->model('customisation/bioproduct_products_options');
        $this->model_customisation_bioproduct_products_options->deleteTablesCategories();
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('theme_category_custom_block');
        $this->session->data['success'] = $this->language->get('text_success_uninstalled');
    }


    protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/theme_category_custom_block')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}