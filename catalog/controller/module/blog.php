<?php  
class ControllerModuleBlog extends Controller {
	protected function index($setting) {
		$this->language->load('module/blog');

		switch((int)$setting['widget_id']){
			case 1: $this->__CategoryWidget($setting); 				break; /* Blog Categories */
			case 2: $this->__FavouritelinksWidget($setting); 		break; /* Favourite Links */
			case 3: $this->__ArchivesWidget($setting);				break; /* Archives */
			case 4: $this->__RecentPostsWidget($setting);			break; /* Post with images */
			case 5: $this->__PostRelatedProductsWidget($setting);	break; /* Post Related Products */	
			case 6: $this->__PostRelatedCategoriesWidget($setting);	break; /* Post Related Categories */	
			case 7: $this->__RelatedPostWidget($setting);			break; /* Related Posts */
			case 8: $this->__DisplayTagCloud($setting);			    break; /* Tag Clouds */
		}
  	}
	
	private function __DisplayTagCloud($setting){
		$this->data['heading_title'] = $this->language->get('heading_tag_cloud');
	
		$this->load->model('blog/tags');
		$this->data['tags'] = $this->model_blog_tags->getAllTags($setting['tag_limit']);
		
		$this->data['canvas_width']  = $setting['canvas_width'];
		$this->data['canvas_height'] = $setting['canvas_height'];
		$this->data['cloud_shape'] = $setting['cloud_shape'];
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/tag_cloud.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/tag_cloud.tpl';
		} else {
			$this->template = 'default/template/module/blog/tag_cloud.tpl';
		}

		$this->render();
	}
	
	private function __PostRelatedCategoriesWidget($setting){
		if(!isset($this->request->get['blog_post_id'])){
			return;
		}
	
		$this->data['heading_title'] = $this->language->get('heading_title_prc');
	
		$this->load->model('blog/post');
		
		$this->load->model('tool/image');
		
		$this->load->model('catalog/category');
		
		$this->data['categories'] = array();

		$category_ids = $this->model_blog_post->getPostcategory($this->request->get['blog_post_id']);
		
		if(!isset($category_ids[0])){
			return ;
		}

		$results = $this->model_blog_post->getcategory($category_ids);
		
		foreach ($results as $result) {
		
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 45, 45);
				} else {
					$image = false;
				}
				$this->data['categories'][] = array(
					'category_id' => $result['category_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'href'    	 => $this->url->link('product/category', 'path=' . $result['category_id']),
				);
			
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/post_related_categories.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/post_related_categories.tpl';
		} else {
			$this->template = 'default/template/module/blog/post_related_categories.tpl';
		}

		$this->render();
	
	}
	
	private function __PostRelatedProductsWidget($setting){

		if(!isset($this->request->get['blog_post_id'])){
			return;
		}
		
      	$this->data['heading_title'] = $this->language->get('heading_title_prp');
		
		$this->data['button_cart'] = $this->language->get('button_cart');
				
		$this->load->model('blog/post');
		
		$this->load->model('tool/image');
		
		

		if((int)$setting['image_width']==0 || (int)$setting['image_height']==0){
			$setting['image_width'] = 80;
			$setting['image_height']= 80;
		}
		
		$this->data['products'] = array();
		
		$product_ids = $this->model_blog_post->getPostProduct($this->request->get['blog_post_id']);
		
		if(!isset($product_ids[0])){
			return ;
		}

		$results = $this->model_blog_post->getProducts($product_ids);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
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
			
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/post_related_products.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/post_related_products.tpl';
		} else {
			$this->template = 'default/template/module/blog/post_related_products.tpl';
		}

		$this->render();
	}
	
	private function __CategoryWidget($setting){
		$this->data['heading_title'] = $this->language->get('heading_title_bcat');
	
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		

		$this->load->model('blog/category');
		$this->load->model('blog/post');
		$this->load->model('tool/image');
		$this->data['categories'] = array();
					
		$categories = $this->model_blog_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();
			
			$children = $this->model_blog_category->getCategories($category['blog_category_id']);
			
			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['blog_category_id'],
					'filter_sub_category' => true
				);		
				
				if ((bool)$setting['show_img'] && $child['image']) {
					$image = $this->model_tool_image->resize($child['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				if ((bool)$setting['show_desc']) {
					$desc = $child['desc'];
				} else {
					$desc = false;
				}
					
				if ($setting['count']) {
					$post_total = $this->model_blog_post->rgetTotalPosts($data);
					
					$children_data[] = array(
						'category_id' => $child['blog_category_id'],
						'name'        => $child['name'] . ' (' . $post_total . ')',
						'img'         => $image,
						'desc'        => html_entity_decode($desc),
						'href'        => $this->url->link('blog/post/category', 'path=' . $category['blog_category_id'] . '_' . $child['blog_category_id'])	
					);						
				} else {
					$children_data[] = array(
						'category_id' => $child['blog_category_id'],
						'name'        => $child['name'],
						'img'         => $image,
						'desc'        => html_entity_decode($desc),
						'href'        => $this->url->link('blog/post/category', 'path=' . $category['blog_category_id'] . '_' . $child['blog_category_id'])	
					);						
				}			
			}
	
			$data = array(
				'filter_category_id'  => $category['blog_category_id'],
				'filter_sub_category' => true	
			);		
			
			if ((bool)$setting['show_img'] && $category['image']) {
				$image = $this->model_tool_image->resize($category['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
			if ((bool)$setting['show_desc']) {
				$desc = $category['desc'];
			} else {
				$desc = false;
			}
			
			if ($setting['count']) {
				$post_total = $this->model_blog_post->rgetTotalPosts($data);
			
				$this->data['categories'][] = array(
					'category_id' => $category['blog_category_id'],
					'name'        => $category['name'] . ' (' . $post_total . ')',
					'img'         => $image,
					'children'    => $children_data,
					'desc'        => html_entity_decode($desc),
					'href'        => $this->url->link('blog/post/category', 'path=' . $category['blog_category_id'])
				);				
			} else {
				$this->data['categories'][] = array(
					'category_id' => $category['blog_category_id'],
					'name'        => $category['name'],
					'img'         => $image,
					'children'    => $children_data,
					'desc'        => html_entity_decode($desc),
					'href'        => $this->url->link('blog/post/category', 'path=' . $category['blog_category_id'])
				);			
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/categories.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/categories.tpl';
		} else {
			$this->template = 'default/template/module/blog/categories.tpl';
		}
		
		$this->render();
	}
	
	private function __FavouritelinksWidget($setting){
		$this->data['heading_title'] = $this->language->get('heading_favlinks');
	
		$this->load->model('blog/roll');
		
		$this->load->model('tool/image');
		
		$this->data['favouriate_links'] = array();
					
		$this->data['favouriate_links'] = $this->model_blog_roll->getFavouriateLinks();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/favourite_links.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/favourite_links.tpl';
		} else {
			$this->template = 'default/template/module/blog/favourite_links.tpl';
		}
		
		$this->render();
	}
	
	private function __ArchivesWidget($setting){
		$this->data['heading_title'] = $this->language->get('heading_archives');
	
		if (isset($this->request->get['apath'])) {
			$parts = explode('_', (string)$this->request->get['apath']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['year'] = $parts[0];
		} else {
			$this->data['year'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['month'] = $parts[1];
		} else {
			$this->data['month'] = 0;
		}
									
		$this->load->model('blog/post');
		
		$this->data['archieves'] = array();
					
		$years = $this->model_blog_post->getYears();
		
		foreach ($years as $year) {
			$months_data = array();
			
			$months = $this->model_blog_post->getMonths($year['id']);
			
			foreach ($months as $month) {
				if ($setting['count']) {
					$months_data[] = array(
						'archieve_id' => $month['id'],
						'name'        => $month['month'] . ' (' . $month['cnt'] . ')',
						'href'        => $this->url->link('blog/post/archieve', 'apath=' . $year['id'] . '_' . $month['id'])	
					);						
				} else {
					$months_data[] = array(
						'archieve_id' => $month['id'],
						'name'        => $month['month'],
						'href'        => $this->url->link('blog/post/archieve', 'apath=' . $year['id'] . '_' . $month['id'])	
					);						
				}			
			}

			if ($setting['count']) {
				$this->data['archieves'][] = array(
					'archieve_id' => $year['id'],
					'name'        => $year['year'] . ' (' . $year['cnt'] . ')',
					'children'    => $months_data,
					'href'        => $this->url->link('blog/post/archieve', 'apath=' . $year['year'])
				);				
			} else {
				$this->data['archieves'][] = array(
					'archieve_id' => $year['id'],
					'name'        => $year['year'],
					'children'    => $months_data,
					'href'        => $this->url->link('blog/post/archieve', 'apath=' . $year['year'])
				);			
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/archives.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/archives.tpl';
		} else {
			$this->template = 'default/template/module/blog/archives.tpl';
		}
		
		$this->render();
	}
	
	private function __RecentPostsWidget($setting){

		$this->data['heading_title'] = $this->language->get('heading_title_recent');
	
		$this->load->model('blog/post');			
		 
		$this->load->model('tool/image');


		if((int)$setting['image_width']==0 || (int)$setting['image_height']==0){
			$setting['image_width'] = 45;
			$setting['image_height']= 45;
		}
		
		$this->data['posts'] =  array();
		
		$results = $this->model_blog_post->getRecentPosts($setting['limit']);
		
		foreach ($results as $result) {
			if ((int)$setting['show_img']==1 && $result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
                $image2x = $this->model_tool_image->resize($result['image'], $setting['image_width']*2, $setting['image_height']*2);
            } else {
				$image = false;
                $image2x = false;
            }

			$this->data['posts'][] = array(
				'id'  		  		=> $result['id'],
				'title'       		=> $result['title'],
				'posted_date'     	=> date('F d, Y',strtotime($result['posted_date'])),
				'short_description' => ($setting['show_short_desc'])?$result['short_description']: false,
				'author_name' 		=> ($setting['show_author'])?$result['author_name']: false,
				'thumb'		  		=> $image,
                'thumb2x'		  	=> $image2x,
                'href'       		=> $this->url->link('blog/post/view', '&blog_post_id=' . $result['id'])
			);
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/recent_posts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/recent_posts.tpl';
		} else {
			$this->template = 'default/template/module/blog/recent_posts.tpl';
		}
		
		$this->render();
	}

	private function __RelatedPostWidget($setting){
	
		if(!isset($this->request->get['blog_post_id'])){
			return;
		}
	
		$this->data['heading_title'] = $this->language->get('heading_title_rp');
	
		$this->load->model('blog/post');
		
		$this->load->model('tool/image');

		$this->data['posts'] = array();
		

		$results = $this->model_blog_post->getPostRelated($this->model_blog_post->getRelatedPosts($this->request->get['blog_post_id']));

		if((int)$setting['image_width']==0 || (int)$setting['image_height']==0){
			$setting['image_width'] = 45;
			$setting['image_height']= 45;
		}
		
		foreach ($results as $result) {
		
			if ((int)$setting['show_img']==1 && $result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}

			$this->data['posts'][] = array(
				'id' 				=> $result['blog_post_id'],
				'title'     		=> $result['title'],
				'posted_date'     	=> date('F d, Y',strtotime($result['posted_date'])),
				'short_description' => ($setting['show_short_desc'])?$result['short_description']: false,
				'author_name' 		=> ($setting['show_author'])?$result['author_name']: false,
				'thumb'		  		=> $image,
				'href'    			=> $this->url->link('blog/post/view', '&blog_post_id=' . $result['blog_post_id']),
			);
		
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog/related_posts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/blog/related_posts.tpl';
		} else {
			$this->template = 'default/template/module/blog/related_posts.tpl';
		}

		$this->render();
	}
}
?>