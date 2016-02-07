<?php
class ControllerModuleLatest extends Controller {
	protected function index($setting) {
		$this->language->load('module/latest');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');
		
		$this->data['products'] = array();
		
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProducts($data);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
                $image2x = $this->model_tool_image->resize($result['image'], $setting['image_width']*2, $setting['image_height']*2);
			} else {
				$image = false;
                $image2x = false;
			}
						
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
            /*--------------------------- theme new------------------------------------------ */
            $results_images = $this->model_catalog_product->getProductImages($result['product_id']);

            if ($results_images) {
                $first = true;
                foreach ($results_images as $results_image) {
                    if ( $first ) {
                        $popup = $this->model_tool_image->resize($results_image['image'], $setting['image_width'], $setting['image_height']);
                        $popup2x = $this->model_tool_image->resize($results_image['image'], $setting['image_width']*2, $setting['image_height']*2);

                        $first = false;
                    }
                }
            } else {
                $popup = false;
                $popup2x = false;

            }

            $this->data['additional_images'] = array();

            $additional_images = $this->model_catalog_product->getProductImages($result['product_id']);
            $this->data['additional_images'] = $additional_images;

            /*special end date output*/
            $query_date = $this->db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$result['product_id']."'");

            if ($query_date->rows) {
                $special_end_date = $query_date->row["date_end"];
            } else {
                $special_end_date = false;
            }
            /*special end date output*/

            /* vars from admin panel labels settings */
            $this->data['button_compare'] = $this->language->get('button_compare');
            $this->data['button_wishlist'] = $this->language->get('button_wishlist');
            $this->data['quick_view'] = $this->language->get('quick_view');
            $this->data['countdown'] = $this->language->get('countdown');
            $this->data['ex_tax'] = $this->language->get('ex_tax');
            $this->data['new_label'] = $this->language->get('new_label');
            $this->data['sale_label'] = $this->language->get('sale_label');
            $this->data['price_in_reward_points'] = $this->language->get('price_in_reward_points');
            $this->config->get('bs_products');
            $this->data['bioproduct_products_settings'] = $this->config->get('bs_products');

            if (isset($this->data['bioproduct_products_settings']['new_status'])) {
                $this->data['new_status'] = $this->data['bioproduct_products_settings']['new_status'];
            } else {
                $this->data['new_status'] = '';
            }
            if (isset($this->data['bioproduct_products_settings']['new_position'])) {
                $this->data['new_position'] = $this->data['bioproduct_products_settings']['new_position'];
            } else {
                $this->data['new_position'] = '';
            }
            if (isset($this->data['bioproduct_products_settings']['sale_status'])) {
                $this->data['sale_status'] = $this->data['bioproduct_products_settings']['sale_status'];
            } else {
                $this->data['sale_status'] = '';
            }
            if (isset($this->data['bioproduct_products_settings']['sale_position'])) {
                $this->data['sale_position'] = $this->data['bioproduct_products_settings']['sale_position'];
            } else {
                $this->data['sale_position'] = '';
            }
            if (isset($this->data['bioproduct_products_settings']['newlabel_period'])) {
                $this->data['newlabel_period'] = $this->data['bioproduct_products_settings']['newlabel_period'];
            } else {
                $this->data['newlabel_period'] = '';
            }


            if ($this->config->get('config_tax')) {
                $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
            } else {
                $tax = false;
            }
            if ((float)$result['special']) {
                $discount = round((($result['price'] - $result['special'])/$result['price'])*100, 0);
            } else {
                $discount = false;
            }

            /*//--------------------------- theme new------------------------------------------ */

            $this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
                /* theme new  */
                'popup'   	 => $popup,
                'thumb2x'   	 => $image2x,
                'popup2x'   	 => $popup2x,

                'additional_images' => $additional_images,
                'date_added'   	 => $result['date_added'],
                'date_available'   	 => $result['date_available'],
                'discount'      => $discount,
                'name_short'   => strlen($result['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $result['name'],
                'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 500) . '..',
                'stock_status'      => $result['stock_status'],
                'manufacturer'      => $result['manufacturer'],
                'minimum'      => $result['minimum'],
                'quantity'      => $result['quantity'],
                'reward'      => $result['reward'],
                'points'      => $result['points'],
                'tax_class_id'      => $result['tax_class_id'],
                'status'      => $result['status'],
                'tax'         => $tax,
                'date_end'   	 => $special_end_date,
                /* //theme new  */
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/latest.tpl';
		} else {
			$this->template = 'default/template/module/latest.tpl';
		}

		$this->render();
	}
}
?>