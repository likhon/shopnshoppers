<?php
class ControllerModuleFeatured extends Controller {
	protected function index($setting) {
		$this->language->load('module/featured');
        /*theme new*/
        static $module = 0;
        /*//theme new*/

        $this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		
		$this->load->model('catalog/product'); 
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$products = explode(',', $this->config->get('featured_product'));		

		if (empty($setting['limit'])) {
			$setting['limit'] = 5;
		}
		
		$products = array_slice($products, 0, (int)$setting['limit']);
		
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
                    /*theme new*/
                    $image2x = $this->model_tool_image->resize($product_info['image'], $setting['image_width']*2, $setting['image_height']*2);
                    /*//theme new*/
                } else {
					$image = false;
                    /*theme new*/
                    $image2x = false;
                    /*//theme new*/
                }

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
					
                /*--------------------------- theme new------------------------------------------ */

                if ((float)$product_info['special']) {
                    $discount = round((($product_info['price'] - $product_info['special'])/$product_info['price'])*100, 0);
                } else {
                    $discount = false;
                }
                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
                } else {
                    $tax = false;
                }
                $results_images = $this->model_catalog_product->getProductImages($product_info['product_id']);
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

                $additional_images = $this->model_catalog_product->getProductImages($product_info['product_id']);
                $this->data['additional_images'] = $additional_images;

                /*special end date output*/
                $query_date = $this->db->query("SELECT date_end FROM ".DB_PREFIX."product_special WHERE product_id='".(int)$product_info['product_id']."'");
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
                $this->data['new_label'] = $this->language->get('new_label');
                $this->data['sale_label'] = $this->language->get('sale_label');
                $this->data['countdown'] = $this->language->get('countdown');
                $this->data['ex_tax'] = $this->language->get('ex_tax');
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
                $this->data['module'] = $module++;

                /*--------------------------- //theme new------------------------------------------ */

                $this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'   	 => $image,

                    /* theme new  */
                    'popup'   	 => $popup,
                'thumb2x'   	 => $image2x,
                'popup2x'   	 => $popup2x,
                    'additional_images' => $additional_images,
                    'date_added'   	 => $product_info['date_added'],
                    'date_available'   	 => $product_info['date_available'],
                    'discount'      => $discount,
                    'name_short'   => strlen($product_info['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $product_info['name'],

                    'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, 500) . '..',
                    'stock_status'      => $product_info['stock_status'],
                    'manufacturer'      => $product_info['manufacturer'],
                    'minimum'      => $product_info['minimum'],
                    'quantity'      => $product_info['quantity'],
                    'reward'      => $product_info['reward'],
                    'points'      => $product_info['points'],
                    'tax_class_id'      => $product_info['tax_class_id'],
                    'status'      => $product_info['status'],
                    'tax'         => $tax,
                    'date_end'   	 => $special_end_date,
                    /* //theme new  */
					'name'    	 => $product_info['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/featured.tpl';
		} else {
			$this->template = 'default/template/module/featured.tpl';
		}

		$this->render();
	}
}
?>