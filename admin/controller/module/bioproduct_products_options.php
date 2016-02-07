<?php
class ControllerModuleBioproductProductsOptions extends Controller {

    private $error = array();
    public function index() {
        $this->language->load('module/bioproduct_products_options');
		$this->document->setTitle($this->language->get('heading_title_normal'));
        $this->load->model('setting/setting');
		
		$this->load->model('customisation/bioproduct_products_options');


        $this->data['token'] = $this->session->data['token'];

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			foreach ($this->request->post['product'] as $product) {
				if (!empty($product['product_video'])) {
					$this->model_customisation_bioproduct_products_options->saveAttribute('product_video', $product);
				}
				if (!empty($product['custom_html1'])) {
					$this->model_customisation_bioproduct_products_options->saveAttribute('custom_html1', $product);
				}
			}
			
            $this->model_setting_setting->editSetting('bioproduct_products_options', $this->request->post);
            $this->session->data['text_success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));

        }


        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
        $this->data['text_browse'] = $this->language->get('text_browse');
        $this->data['text_clear'] = $this->language->get('text_clear');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }


        $this->data['heading_title'] = $this->language->get('heading_title');

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
            'href'      => $this->url->link('module/bioproduct_products_options', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );



        /* product */



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

        $this->language->load('catalog/product');
        $this->load->model('catalog/product');


		

		$product_total = $this->model_catalog_product->getTotalProducts($data);
        $products = $this->model_catalog_product->getProducts($data);

		
		////////////////////////////////////////////////////////////////
		//
		//
		
		// add custom attribute to products array
		$products = $this->model_customisation_bioproduct_products_options->updateProductsArray($products, 'product_video');

		// add custom attribute to products array		
		$products = $this->model_customisation_bioproduct_products_options->updateProductsArray($products, 'custom_html1');
		
		$this->data['products'] = $products;
		
        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_admin_limit');
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->url->link('module/bioproduct_products_options', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $this->data['pagination'] = $pagination->render();

		
        /* end product */


        $this->document->addStyle($this->config->get('config_url').'view/stylesheet/bioproduct.css');
        $this->data['config_url'] = $this->config->get('config_url');
        $this->data['action'] = $this->url->link('module/bioproduct_products_options', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
        $this->template = 'module/bioproduct_products_options.tpl';

        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render());
		

    }
	
	
	public function install(){
		$this->load->model('customisation/bioproduct_products_options');
		$this->model_customisation_bioproduct_products_options->createTables();
		$this->session->data['success'] = $this->language->get('text_success_installed');
	}


    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/bioproduct_products_options')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}