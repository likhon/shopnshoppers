<?php
class ControllerCommonSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
		
		// Decode URL
		if (isset($this->request->get['_route_'])) {

			$static_urls =  array(
				'blog.html' 	=> 'blog/post',
				'home.html' 	=> 'common/home',
				'register.html' => 'account/register',
				'login.html' 	=> 'account/login'
			);
			if(isset($static_urls[$this->request->get['_route_']])) {
				$this->request->get['route'] = $static_urls[$this->request->get['_route_']];
				return $this->forward($this->request->get['route']);
			} else if(strpos($this->request->get['_route_'],'blog/')>-1){
				$this->request->get['_route_'] = str_replace('blog/','',$this->request->get['_route_']);
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($this->request->get['_route_']) . "'");
				
				if ($query->num_rows) {
					$url_arr = explode('&', $query->row['query']);
					
					foreach($url_arr as $url_i){
						$url_params = explode('=', $url_i);
						if($url_params[0] == 'blog_category_id'){
							$this->request->get['path'] = $url_params[1];
						}
						$this->request->get[$url_params[0]] = $url_params[1];
					}
					$this->request->get['_route_'] =  '';
				}
			}
			
			$parts = explode('/', $this->request->get['_route_']);
			
			foreach ($parts as $part) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");
				
				if ($query->num_rows) {
					$url = explode('=', $query->row['query']);
					
					if ($url[0] == 'product_id') {
						$this->request->get['product_id'] = $url[1];
					}
					
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}	
					
					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}
					
					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}	
				} else {
					$this->request->get['route'] = 'error/not_found';	
				}
			}
			
			
			if (isset($this->request->get['blog_category_id'])) {
				$this->request->get['route'] = 'blog/post/category';
			} elseif (isset($this->request->get['blog_post_id'])) {
				$this->request->get['route'] = 'blog/post/view';
			} elseif (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}
			
			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}
	
	public function rewrite($link) {
		$url_info = parse_url(str_replace('&amp;', '&', $link));
	
		$url = ''; 
		
		$data = array();
		
		parse_str($url_info['query'], $data);


		//$static_urls =  array(
			//'blog/post' => '/blog.html',
			//'common/home' => '/home.html',
			//'account/register' => '/register.html',
			//'account/login' => '/login.html'
		//);
		//if(isset($static_urls[$data['route']])) {
			//return $static_urls[$data['route']];
		//}
			
		if ($data['route'] == 'blog/post/view' || $data['route'] == 'blog/post/category') {
			if($data['route'] == 'blog/post/category'){
				unset($data['route']);
				foreach ($data as $key => $value) {
					$query_str[] = str_replace('path', 'blog_category_id', $key) . '=' .$value;
				}
			} else {
				unset($data['route']);
				$query_str = array();
				foreach ($data as $key => $value) {
					$query_str[] = $key . '=' .$value;
				}
			}

			$final_query = $this->db->escape(implode('&', $query_str));

			$query = $this->db->query('SELECT * FROM ' . DB_PREFIX . "url_alias WHERE `query` = '$final_query'");

			if ($query->num_rows) {
				return  '/blog/' . $query->row['keyword'];
			} else{
				return $link;
			}
		}
			
		
		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id')) {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");
				
					if ($query->num_rows) {
						$url .= '/' . $query->row['keyword'];
						
						unset($data[$key]);
					}					
				} elseif ($key == 'path') {
					$categories = explode('_', $value);
					
					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");
				
						if ($query->num_rows) {
							$url .= '/' . $query->row['keyword'];
						}							
					}
					
					unset($data[$key]);
				}
			}
		}
	
		if ($url) {
			unset($data['route']);
		
			$query = '';
		
			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . $key . '=' . $value;
				}
				
				if ($query) {
					$query = '?' . trim($query, '&');
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
			return $link;
		}
	}	
}
?>