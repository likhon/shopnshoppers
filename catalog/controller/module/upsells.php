<?php  
class ControllerModuleUpsells extends Controller {
	protected function index() {
		$this->language->load('module/upsells');

      	$this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['empty_products'] = $this->language->get('empty_products');
        $this->data['tab_also_bought_title'] = $this->language->get('tab_also_bought_title');

        $this->load->model('catalog/product_also_bought');

        $this->data['text_no_product_also_bought'] = $this->language->get('text_no_product_also_bought');
        $this->data['products_also_bought'] = array();
        $products_also_bought_result = $this->model_catalog_product_also_bought->getProductAlsoBought((int)$this->request->get['product_id'], 10);

        foreach ($products_also_bought_result as $result) {
            if ($result['image']) {
                $image = $result['image'];
            } else {
                $image = 'no_image.jpg';
            }
/*
            $product_special = $this->model_catalog_product->getProduct($result['product_id']);

            if ((float)$product_special['special']) {
                $special = $this->currency->format($this->tax->calculate($product_special['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            if ((float)$product_special['special']) {
                $discount = round((($result['price'] - $product_special['special'])/$result['price'])*100, 0);
            } else {
                $discount = false;
            }
*/
            $this->data['products_also_bought'][] = array(
                'product_id'    => $result['product_id'],
                'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),

                'name'    		=> $result['name'],
                //'model'   		=> $result['model'],
                //'rating'  		=> $rating,
                //'stars'   		=> sprintf($this->language->get('text_stars'), $rating),
                //'price'   	 => $result['price'],
                //'special' 	 => $special,
                //'discount'      => $discount,
                'thumb'   		=> $this->model_tool_image->resize($image, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height')),
                'thumb2x'   	=> $this->model_tool_image->resize($image, $this->config->get('config_image_product_width')*2, $this->config->get('config_image_product_height')*2)
            );

        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/upsells.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/upsells.tpl';
		} else {
			$this->template = 'default/template/module/upsells.tpl';
		}
		
		$this->render();
	}
}