<?php 
class ControllerBlogPost extends Controller {  

	public function archieve() {
		$this->language->load('blog/post');
		$this->load->model('tool/image');
		$this->load->model('blog/post');	
		
		$year = 0;
		$month = 0;
		if (isset($this->request->get['apath'])) {
			$archieve_path  = explode('_',$this->request->get['apath']);
			$year = $archieve_path[0];
			if(isset($archieve_path[1])){
				$month = $archieve_path[1];
			}
		}
		
		$this->data['year'] 	= $year;
		if($month>0){
			$this->data['month'] 	= date('F', mktime(0,0,0,$month,1));
			$this->document->setTitle('Archives: '. $this->data['month'].' '. $this->data['year']); 
		} else {
			$this->document->setTitle('Archives: '. $this->data['year']); 
		}
		
		$this->__addHeadScripts();
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'bp.modified';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
		
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
		} else { 
			$filter_title = '';
		}		
					
		$blog_settings = $this->config->get('blog_settings');		
		//$this->data['blog_layout_cols'] = $blog_settings['blog_layout_cols'];
		
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $blog_settings['config_post_per_page'];
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
		
				
		$this->data['breadcrumbs'][] = array(
       		'text'      => 'Blog',
			'href'      => $this->url->link('blog/post'),
       		'separator' => $this->language->get('text_separator')
   		);	
		
		
		$apaths  = explode('_',$this->request->get['apath']);
		$path_arr = array();
		foreach($apaths as $apath){
			$path_arr[] = $apath;
			$this->data['breadcrumbs'][] = array(
				'text'      => ((int)$apath>12)?'Archives '.$apath: date('F', mktime(0,0,0,$apath,1)),
				'href'      => $this->url->link('blog/post/archieve&apath='.implode('_',$path_arr)),
				'separator' => $this->language->get('text_separator')
			);
		}
			
		
		$this->data['heading_title'] 	= $this->language->get('text_post');
		$this->data['text_refine'] 		= $this->language->get('text_refine');
		$this->data['text_empty'] 		= $this->language->get('text_empty');			
		$this->data['text_display'] 	= $this->language->get('text_display');
		$this->data['text_sort'] 		= $this->language->get('text_sort');
		$this->data['text_limit'] 		= $this->language->get('text_limit');

		$data = array(
			'year'		 		 => $year,
			'month'		 		 => $month,
			'filter_title'       => $filter_title,
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$post_total = $this->model_blog_post->getTotalPostsByArchieve($data); 
			
		$results = $this->model_blog_post->getPostsByArchieve($data);
			
		$this->data['posts'] = array();
		foreach ($results as $result) {	
			
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width'], $blog_settings['posts_img_height']);
                $image2x = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width']*2, $blog_settings['posts_img_height']*2);
            } else {
				$image = false;
                $image2x = false;
            }
			
			$this->data['posts'][] = array(
				'id'  		  		=> $result['id'],
				'title'       		=> $result['title'],
				'posted_date'     	=> date('F d, Y',strtotime($result['posted_date'])),
				'thumb'        		=> $image,
                'thumb2x'        	=> $image2x,
                'modified'  		=> $result['modified'],
				'author_name'  		=> $result['author_name'],
				//'description' 	=> mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 255) . '..',
				'short_description' => $result['short_description'],
				'href'        		=> $this->url->link('blog/post/view', '&blog_post_id=' . $result['id'].'&apath='.$this->request->get['apath'])
			);
		}

		$url = '&apath='.$this->request->get['apath'];

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
						
		$this->data['sorts'] = array();

		$this->data['sorts'][] = array(
			'text'  => 'Latest',
			'value' => 'bp.modified-DESC',
			'href'  => $this->url->link('blog/post/archieve', '&sort=bp.modified&order=DESC' . $url)
		);
		
		$this->data['sorts'][] = array(
			'text'  => 'Oldest',
			'value' => 'bp.modified-ASC',
			'href'  => $this->url->link('blog/post/archieve', '&sort=bp.modified&order=ASC' . $url)
		);

		$url = '&apath='.$this->request->get['apath'];

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
			
		$this->data['limits'] = array();
		
		//$this->data['blog_layout_cols'] = $blog_settings['blog_layout_cols'];

		$this->data['limits'][] = array(
			'text'  => $blog_settings['config_post_per_page'],
			'value' => $blog_settings['config_post_per_page'],
			'href'  => $this->url->link('blog/post/archieve', $url . '&limit=' . $blog_settings['config_post_per_page'])
		);

		$page_limits = array(
			25, 50, 75, 100
		);
		
		foreach($page_limits as $page_limit){
			$this->data['limits'][] = array(
				'text'  => $page_limit,
				'value' => $page_limit,
				'href'  => $this->url->link('blog/post/archieve', $url . '&limit='.$page_limit)
			);
		}
		
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
					
		$pagination 		= new Pagination();
		$pagination->total 	= $post_total;
		$pagination->page 	= $page;
		$pagination->limit 	= $limit;
		$pagination->text 	= $this->language->get('text_pagination');
		$pagination->url 	= $this->url->link('blog/post/archieve', $url . '&page={page}&apath='.$this->request->get['apath']);
		
		$this->data['pagination'] = $pagination->render();
	
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		$this->data['apath'] = $this->request->get['apath'];
		$this->data['filter_title'] = $filter_title;
		
		$this->data['button_continue'] = $this->language->get('button_continue');
	
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/archieve.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/archieve.tpl';
		} else {
			$this->template = 'default/template/blog/archieve.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
		$this->response->setOutput($this->render());										

	}

	public function category() {
		$this->language->load('blog/post');
		
		$this->load->model('blog/post');	
		$this->load->model('tool/image');
		$this->load->model('blog/category');	
		
		if (isset($this->request->get['path'])) {
			$categories  = explode('_',$this->request->get['path']);
			$blog_category_id = array_pop($categories);
		} else {
			$blog_category_id = 0;
		}
		
		$category_info = $this->model_blog_category->getCategoryDescriptions($blog_category_id);
		$this->data['category_info'] = $category_info[1];
		
		$this->document->setTitle($this->data['category_info']['name']);
	
		$this->__addHeadScripts();

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'bp.modified';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	
		
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
		} else { 
			$filter_title = '';
		}
		
		$blog_settings = $this->config->get('blog_settings');
		//$this->data['blog_layout_cols'] = $blog_settings['blog_layout_cols'];
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			
			$limit = $blog_settings['config_post_per_page'];
		}
					
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
		
				
		$this->data['breadcrumbs'][] = array(
       		'text'      => 'Blog',
			'href'      => $this->url->link('blog/post'),
       		'separator' => $this->language->get('text_separator')
   		);	
		
		
		$categories  = explode('_',$this->request->get['path']);
		$path_arr = array();
		foreach($categories as $categoryId){
			$category_info = $this->model_blog_category->getCategoryDescriptions($categoryId);
			$path_arr[] = $categoryId;
			$this->data['breadcrumbs'][] = array(
				'text'      => $category_info[1]['name'],
				'href'      => $this->url->link('blog/post/category&path='.implode('_',$path_arr)),
				'separator' => $this->language->get('text_separator')
			);
		}
			
		
		$this->data['heading_title'] 	= $this->language->get('text_post');
		$this->data['text_refine'] 		= $this->language->get('text_refine');
		$this->data['text_empty'] 		= $this->language->get('text_empty');			
		$this->data['text_display'] 	= $this->language->get('text_display');
		$this->data['text_sort'] 		= $this->language->get('text_sort');
		$this->data['text_limit'] 		= $this->language->get('text_limit');
		
		$data = array(
			'blog_category_id'	 => $blog_category_id,
			'sort'               => $sort,
			'filter_title'       => $filter_title,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);

		$post_total = $this->model_blog_post->getTotalPostsByCategory($data); 
			
		$results = $this->model_blog_post->getPostsByCategory($data);
			
		$this->data['post'] = array();
		foreach ($results as $result) {	
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width'], $blog_settings['posts_img_height']);
                $image2x = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width']*2, $blog_settings['posts_img_height']*2);
            } else {
				$image = false;
                $image2x = false;
            }

            $results_images = $this->model_blog_post->getPostImages($result['id']);
            if ($results_images) {
                $first = true;
                foreach ($results_images as $results_image) {
                    if ( $first ) {
                        $firt_additional_image = $this->model_tool_image->resize($results_image['image'], $blog_settings['posts_img_width'], $blog_settings['posts_img_height']);
                        $firt_additional_image2x = $this->model_tool_image->resize($results_image['image'], $blog_settings['posts_img_width']*2, $blog_settings['posts_img_height']*2);

                        $first = false;
                    }
                }
            } else {
                $firt_additional_image = false;
                $firt_additional_image2x = false;
            }




            $this->data['posts'][] = array(
				'id'  		  		=> $result['id'],
				'title'       		=> $result['title'],
				'posted_date'     	=> date('F d, Y',strtotime($result['posted_date'])),
				'thumb'        		=> $image,
                'thumb2x'        	=> $image2x,
                'first_image'				=> $firt_additional_image,
                'first_image2x'				=> $firt_additional_image2x,
                'modified'  		=> $result['modified'],
				'author_name'  		=> $result['author_name'],
				//'description' 	=> mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 255) . '..',
				'short_description' => $result['short_description'],
				'href'        		=> $this->url->link('blog/post/view', '&blog_post_id=' . $result['id'].'&path='.$this->request->get['path'])
			);
		}
		
		$url = '&path='.$this->request->get['path'];

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
						
		$this->data['sorts'] = array();

		$this->data['sorts'][] = array(
			'text'  => 'Latest',
			'value' => 'bp.modified-DESC',
			'href'  => $this->url->link('blog/post/category', '&sort=bp.modified&order=DESC' . $url)
		);
		
		$this->data['sorts'][] = array(
			'text'  => 'Oldest',
			'value' => 'bp.modified-ASC',
			'href'  => $this->url->link('blog/post/category', '&sort=bp.modified&order=ASC' . $url)
		);

		$url = '&path='.$this->request->get['path'];

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
			
		$this->data['limits'] = array();
		
		$this->data['limits'][] = array(
			'text'  => $blog_settings['config_post_per_page'],
			'value' => $blog_settings['config_post_per_page'],
			'href'  => $this->url->link('blog/post/category', $url . '&limit=' . $blog_settings['config_post_per_page'])
		);

		$page_limits = array(
			1,25, 50, 75, 100
		);
		
		foreach($page_limits as $page_limit){
			$this->data['limits'][] = array(
				'text'  => $page_limit,
				'value' => $page_limit,
				'href'  => $this->url->link('blog/post/category', $url . '&limit='.$page_limit)
			);
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
					
		$pagination 		= new Pagination();
		$pagination->total 	= $post_total;
		$pagination->page 	= $page;
		$pagination->limit 	= $limit;
		$pagination->text 	= $this->language->get('text_pagination');
		$pagination->url 	= $this->url->link('blog/post/category', $url . '&page={page}&path='.$this->request->get['path']);
		
		$this->data['pagination'] = $pagination->render();
	
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		$this->data['filter_title'] = $filter_title;
		$this->data['path'] = $this->request->get['path'];

		$this->data['button_continue'] = $this->language->get('button_continue');
	
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/category.tpl';
		} else {
			$this->template = 'default/template/blog/category.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
		$this->response->setOutput($this->render());										

	}

	public function index() { 
		$this->__addHeadScripts();
	
		$this->language->load('blog/post');
		
		$this->load->model('tool/image');
		$this->load->model('catalog/category');
		$this->load->model('blog/post');
		
		$this->load->model('catalog/product');
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'bp.modified';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}	

		if (isset($this->request->get['filter_tag'])) {
			$filter_tag = $this->request->get['filter_tag'];
		} else { 
			$filter_tag = '';
		}	
		
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
		} else { 
			$filter_title = '';
		}	
		
		$blog_settings = $this->config->get('blog_settings');
		//$this->data['blog_layout_cols'] = $blog_settings['blog_layout_cols'];
		
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $blog_settings['config_post_per_page'];
		}
	
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
		
				
		$this->data['breadcrumbs'][] = array(
       		'text'      => 'Blog',
			'href'      => $this->url->link('blog/post'),
       		'separator' => $this->language->get('text_separator')
   		);	
		
		$this->data['heading_title'] 	= $this->language->get('text_post');
		$this->data['text_refine'] 		= $this->language->get('text_refine');
		$this->data['text_empty'] 		= $this->language->get('text_empty');			
		$this->data['text_display'] 	= $this->language->get('text_display');
		$this->data['text_sort'] 		= $this->language->get('text_sort');
		$this->data['text_limit'] 		= $this->language->get('text_limit');
			
		$data = array(
			'sort'               => $sort,
			'order'              => $order,
			'filter_title'       => $filter_title,
			'filter_tag'         => $filter_tag,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit
		);
		
		$post_total = $this->model_blog_post->getTotalPosts($data); 
		$results = $this->model_blog_post->getPosts($data);
		
		$this->data['posts'] = array();
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width'], $blog_settings['posts_img_height']);
                $image2x = $this->model_tool_image->resize($result['image'], $blog_settings['posts_img_width']*2, $blog_settings['posts_img_height']*2);
            } else {
				$image = false;
                $image2x = false;
            }


            $results_images = $this->model_blog_post->getPostImages($result['id']);
            if ($results_images) {
                $first = true;
                foreach ($results_images as $results_image) {
                    if ( $first ) {
                        $firt_additional_image = $this->model_tool_image->resize($results_image['image'], $blog_settings['posts_img_width'], $blog_settings['posts_img_height']);
                        $firt_additional_image2x = $this->model_tool_image->resize($results_image['image'], $blog_settings['posts_img_width']*2, $blog_settings['posts_img_height']*2);

                        $first = false;
                    }
                }
            } else {
                $firt_additional_image = false;
                $firt_additional_image2x = false;
            }





            $this->data['posts'][] = array(
				'id'  		  		=> $result['id'],
				'title'       		=> $result['title'],
				'posted_date'     	=> date('F d, Y', strtotime($result['posted_date'])),
				'thumb'				=> $image,
                'thumb2x'			=> $image2x,
                'first_image'		=> $firt_additional_image,
                'first_image2x'		=> $firt_additional_image2x,

                'author_name'     	=> $result['author_name'],
				'short_description' => $result['short_description'],
				//'description' 		=> mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 255) . '..',
				'href'        		=> $this->url->link('blog/post/view', '&blog_post_id=' . $result['id'])
			);
		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		if (isset($this->request->get['filter_tag'])) {
			$url .= '&filter_tag=' . $this->request->get['filter_tag'];
		}	
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
			
		$this->data['sorts'] = array();

		$this->data['sorts'][] = array(
			'text'  => 'Latest',
			'value' => 'bp.modified-DESC',
			'href'  => $this->url->link('blog/post', '&sort=bp.modified&order=DESC' . $url)
		);
		
		$this->data['sorts'][] = array(
			'text'  => 'Oldest',
			'value' => 'bp.modified-ASC',
			'href'  => $this->url->link('blog/post', '&sort=bp.modified&order=ASC' . $url)
		);

		$url = '';
		
		if (isset($this->request->get['filter_tag'])) {
			$url .= '&filter_tag=' . $this->request->get['filter_tag'];
		}	
		
		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}	

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		/* No Of Post Per Page */
		$blog_setting_limit = $blog_settings['config_post_per_page'];	
		
		$this->data['limits'] = array();
		
		$this->data['limits'][] = array(
			'text'  => $blog_setting_limit,
			'value' => $blog_setting_limit,
			'href'  => $this->url->link('blog/post', $url . '&limit=' . $blog_setting_limit)
		);

		$page_limits = array(
			25, 50, 75, 100
		);
		
		foreach($page_limits as $page_limit){
			$this->data['limits'][] = array(
				'text'  => $page_limit,
				'value' => $page_limit,
				'href'  => $this->url->link('blog/post', $url . '&limit='.$page_limit)
			);
		}
		
		/* No Of Post Per Page */
		
		/* Pagination */

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
					
		$pagination 		= new Pagination();
		$pagination->total 	= $post_total;
		$pagination->page 	= $page;
		$pagination->limit 	= $limit;
		$pagination->text 	= $this->language->get('text_pagination');
		$pagination->url 	= $this->url->link('blog/post', $url . '&page={page}');
		
		$this->data['pagination'] = $pagination->render();
	
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		$this->data['filter_title'] = $filter_title;
		
		$this->data['button_continue'] = $this->language->get('button_continue');
	
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/posts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/posts.tpl';
		} else {
			$this->template = 'default/template/blog/posts.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
		$this->response->setOutput($this->render());										

  	}
	
	public function view(){
		$this->language->load('blog/comment');
		$this->language->load('blog/post');
		
		$this->load->model('blog/post');			
		$this->load->model('tool/image');

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);	
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => 'Blog',
			'href'      => $this->url->link('blog/post'),
       		'separator' => $this->language->get('text_separator')
   		);	
		
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		if(isset($this->request->get['path'])){
			$this->load->model('blog/category');	
			$categories  = explode('_',$this->request->get['path']);
			$path_arr = array();
			foreach($categories as $blog_category_id){
				$category_info = $this->model_blog_category->getCategoryDescriptions($blog_category_id);
				$path_arr[] = $blog_category_id;
				if(isset($category_info[1])){
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info[1]['name'],
						'href'      => $this->url->link('blog/post/category&path='.implode('_',$path_arr)),
						'separator' => $this->language->get('text_separator')
					);
				}
			}
		}

		if(isset($this->request->get['apath'])){
			$apaths  = explode('_',$this->request->get['apath']);
			$path_arr = array();
			foreach($apaths as $apath){
				$path_arr[] = $apath;
				$this->data['breadcrumbs'][] = array(
					'text'      => ((int)$apath>12)?'Archives '.$apath: date('F', mktime(0,0,0,$apath,1)),
					'href'      => $this->url->link('blog/post/archieve&apath='.implode('_',$path_arr)),
					'separator' => $this->language->get('text_separator')
				);
			
			}
		}
		
		$this->data['post']= $this->model_blog_post->getPost($this->request->get['blog_post_id']); 
		$this->data['blog_post_id'] = $this->request->get['blog_post_id'];

		$this->document->setTitle($this->data['post']['title']); 
		$this->document->setDescription($this->data['post']['meta_description']);
		$this->document->setKeywords($this->data['post']['meta_keyword']);
		$this->document->addLink($this->url->link('blog/post/view', 'blog_post_id=' . $this->request->get['blog_post_id']), 'canonical');
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
		
		$this->__addHeadScripts();

		$this->data['heading_title'] =$this->data['post']['title'];
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->data['post']['title'],
			'href'      => $this->url->link('blog/post/view&blog_post_id='.$this->request->get['blog_post_id']),
       		'separator' => $this->language->get('text_separator')
   		);
		
		$this->load->model('tool/image');
		
		$blog_settings = $this->config->get('blog_settings');

		if ($this->data['post']['image']) {
			$this->data['popup'] = $this->model_tool_image->resize(
				$this->data['post']['image'], 
				$blog_settings['post_img_popup_width'], 
				$blog_settings['post_img_popup_height']
			);
		} else {
			$this->data['popup'] = false;
		}
		
		if ($this->data['post']['image']) {
			$this->data['thumb'] =  $this->model_tool_image->resize(
				$this->data['post']['image'], 
				$blog_settings['post_img_thumb_width'], 
				$blog_settings['post_img_thumb_height']
			);

            $this->data['thumb2x'] =  $this->model_tool_image->resize(
                $this->data['post']['image'],
                $blog_settings['post_img_thumb_width']*2,
                $blog_settings['post_img_thumb_height']*2
            );


        } else {
			$this->data['thumb'] = false;
            $this->data['thumb2x'] = false;
        }
			
		$this->data['images'] = array();
			
		$results = $this->model_blog_post->getPostImages($this->request->get['blog_post_id']);
			
		foreach ($results as $result) {
			$this->data['images'][] = array(
				'popup' => $this->model_tool_image->resize(
					$result['image'], 
					$blog_settings['post_img_popup_width'], 
					$blog_settings['post_img_popup_height']
				),
				'thumb' => $this->model_tool_image->resize(
					$result['image'], 
					$blog_settings['post_img_extra_thumb_width'], 
					$blog_settings['post_img_extra_thumb_height']
				),
                'thumb2x' => $this->model_tool_image->resize(
                    $result['image'],
                    $blog_settings['post_img_extra_thumb_width']*2,
                    $blog_settings['post_img_extra_thumb_height']*2
                )
			);
		}	
		
		$this->data['text_empty'] = $this->language->get('text_empty');				

		if((int)$blog_settings['config_guest_comment']==1){
			$this->data['comment_status'] = true;
		} else {
			if ($this->customer->isLogged()) {
				$this->data['comment_status'] = true;
			}else{
				$this->data['comment_status'] = false;
			}
		}
		
		if($this->data['comment_status']){
			$this->data['entry_name'] 		= $this->language->get('entry_name');
			$this->data['entry_email'] 		= $this->language->get('entry_email');
			$this->data['entry_comment'] 	= $this->language->get('entry_comment');
			$this->data['entry_rating'] 	= $this->language->get('entry_rating');
			$this->data['entry_good'] 		= $this->language->get('entry_good');
			$this->data['entry_bad'] 		= $this->language->get('entry_bad');
			$this->data['entry_captcha'] 	= $this->language->get('entry_captcha');
			$this->data['text_note'] 		= $this->language->get('text_note');
			
		}
		
		$this->data['text_wait'] = $this->language->get('text_wait');
		
		$this->data['continue'] = $this->url->link('blog/post');
		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['text_related_tags'] = $this->language->get('text_related_tags');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blog/post.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/blog/post.tpl';
		} else {
			$this->template = 'default/template/blog/post.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
		$this->response->setOutput($this->render());			
		
	}
	
	private function __addHeadScripts(){

	}
}