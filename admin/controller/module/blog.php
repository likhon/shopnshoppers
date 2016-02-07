<?php
class ControllerModuleBlog extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/blog');

		$this->document->setTitle($this->language->get('heading_title_normal'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('blog', $this->request->post);		
			$this->session->data['success'] = $this->language->get('text_success');
			
			if(!isset($this->request->get['reopen'])){
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}
				
		$this->data['heading_title'] 		= $this->language->get('heading_title');

		$this->data['text_enabled'] 		= $this->language->get('text_enabled');
		$this->data['text_disabled'] 		= $this->language->get('text_disabled');
		$this->data['text_content_top'] 	= $this->language->get('text_content_top');
		$this->data['text_content_bottom'] 	= $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] 	= $this->language->get('text_column_left');
		$this->data['text_column_right'] 	= $this->language->get('text_column_right');
		
		$this->data['entry_widget'] 		= $this->language->get('entry_widget');
		$this->data['entry_layout'] 		= $this->language->get('entry_layout');
		$this->data['entry_position'] 		= $this->language->get('entry_position');
		$this->data['entry_count'] 			= $this->language->get('entry_count');
		$this->data['entry_options'] 		= $this->language->get('entry_options');
		$this->data['entry_status'] 		= $this->language->get('entry_status');
		$this->data['entry_sort_order'] 	= $this->language->get('entry_sort_order');
		//$this->data['entry_post_per_page'] 	= $this->language->get('entry_post_per_page');
		//$this->data['entry_guest_comment'] 	= $this->language->get('entry_guest_comment');
		
		//$this->data['error_post_per_page'] 	= $this->language->get('error_post_per_page');
		
		$this->data['button_save'] 			= $this->language->get('button_save');
		$this->data['button_cancel'] 		= $this->language->get('button_cancel');
		$this->data['button_add_module'] 	= $this->language->get('button_add_module');
		$this->data['button_remove'] 		= $this->language->get('button_remove');

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = false;
		}

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

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
			'href'      => $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if(isset($this->request->get['reopen'])){
			$this->data['action'] = $this->url->link('module/blog', 'reopen=1&token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('module/blog', 'token=' . $this->session->data['token'], 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['blog_module'])) {
			$this->data['modules'] = $this->request->post['blog_module'];
		} elseif ($this->config->get('blog_module')) { 
			$this->data['modules'] = $this->config->get('blog_module');
		}	
		
		/*
		$this->data['blog_setting'] = array();
		
		if (isset($this->request->post['blog_setting'])) {
			$this->data['blog_setting'] = $this->request->post['blog_setting'];
		} elseif ($this->config->get('blog_setting')) { 
			$this->data['blog_setting'] = $this->config->get('blog_setting');
		}
		*/

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		
		$this->data['widgets'] = array(
			array(
				'widget_id' => 1,
				'name'		=> 'Blog Category'
			),
			array(
				'widget_id' => 2,
				'name'		=> 'Favourite Links'
			),
			array(
				'widget_id' => 3,
				'name'		=> 'Blog Archives'
			),
			array(
				'widget_id' => 4,
				'name'		=> 'Latest Posts'
			),
			array(
				'widget_id' => 5,
				'name'		=> 'Post Related Products'
			),
			array(
				'widget_id' => 6,
				'name'		=> 'Post Related Categories'
			),
			array(
				'widget_id' => 7,
				'name'		=> 'Post Related Post'
			),
			array(
				'widget_id' => 8,
				'name'		=> 'Tags'
			),
		);

		$this->template = 'module/blog.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/blog')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		/*
		if((int)$this->request->post['blog_setting']['config_post_per_page'] < 1){
			$this->error['warning'] = $this->language->get('error_post_per_page');
			$this->data['error_post_per_page'] =  $this->language->get('error_post_per_page');
		}
*/
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install(){
		$this->language->load('module/blog');
		$this->load->model('blog/setup');
		$this->model_blog_setup->createTables();
		$this->session->data['success'] = $this->language->get('text_success_installed');
		//$this->createAdminMenu();
	}
	
	public function uninstall(){
		$this->language->load('module/blog');
		$this->load->model('blog/setup');
		$this->model_blog_setup->deleteTables();
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('blog_module');	
		$this->session->data['success'] = $this->language->get('text_success_uninstalled');
		//$this->removeAdminMenu();
	}
	
	private function createAdminMenu(){

		/* Get Header Content */
		$content = file_get_contents(DIR_TEMPLATE.'/common/header.tpl');
		
		$blog_menu = '
		<!-- Blog Menu -->
		<?php
			if(isset($blog_post)){
		?>
		  <li id="blog"><a class="top">Blog</a>
			<ul>
			  <li><a href="<?php echo $blog_post; ?>">Post</a></li>
			  <li><a href="<?php echo $blog_comment; ?>">Comments</a></li>
			  <li><a href="<?php echo $blog_category; ?>">Categories</a></li>
			  <li><a href="<?php echo $blog_roll; ?>">Favourite Links</a></li>
			</ul>
		  </li>
		<?php
			}
		?>
		<!-- Blog Menu -->';
		
		$content = str_replace('<li id="system">',$blog_menu."\n\t\t<li id=\"system\">",$content);
		file_put_contents(DIR_TEMPLATE.'/common/header.tpl', $content);
		
		/* Get Header Controller Content */
		
		$hcontent = file_get_contents(DIR_APPLICATION.'/controller/common/header.php'); 
		$admin_header = '
		/* Added for blog extension */
			
		$this->load->model(\'setting/extension\');
		$extensions = $this->model_setting_extension->getInstalled(\'module\');
		if(in_array(\'blog\', $extensions)){
			
			/* Added For Blog Extension */
			//$this->data[\'text_blog\'] = $this->language->get(\'text_blog\');
			//$this->data[\'text_blog_categories\'] = $this->language->get(\'text_blog_categories\');
			//$this->data[\'text_blog_comments\'] = $this->language->get(\'text_blog_comments\');
			//$this->data[\'text_blog_rolls\'] = $this->language->get(\'text_blog_rolls\');
			//$this->data[\'text_blog_posts\'] = $this->language->get(\'text_blog_posts\');
			/* Added For Blog Extension */
			
			$this->data[\'blog_module\'] = $this->config->get(\'blog_module\');
			$this->data[\'blog_post\'] = $this->url->link(\'blog/post\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_category\'] = $this->url->link(\'blog/category\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_roll\'] = $this->url->link(\'blog/roll\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_comment\'] = $this->url->link(\'blog/comment\', \'token=\' . $this->session->data[\'token\'], \'SSL\');	
		}

		/* Added for blog extension */';
		
		$hcontent = str_replace('$this->data[\'stores\'] = array();',$admin_header."\n\t\t\t".'$this->data[\'stores\'] = array();',$hcontent);
		file_put_contents(DIR_APPLICATION.'/controller/common/header.php', $hcontent);		
	}
	
	private function removeAdminMenu(){
		/* Get Header Content */
		$content = file_get_contents(DIR_TEMPLATE.'/common/header.tpl');
		
		$blog_menu = '
		<!-- Blog Menu -->
		<?php
			if(isset($blog_post)){
		?>
		  <li id="blog"><a class="top">Blog</a>
			<ul>
			  <li><a href="<?php echo $blog_post; ?>">Post</a></li>
			  <li><a href="<?php echo $blog_comment; ?>">Comments</a></li>
			  <li><a href="<?php echo $blog_category; ?>">Categories</a></li>
			  <li><a href="<?php echo $blog_roll; ?>">Favourite Links</a></li>
			</ul>
		  </li>
		<?php
			}
		?>
		<!-- Blog Menu -->';
		
		$content = str_replace($blog_menu,'',$content);
		file_put_contents(DIR_TEMPLATE.'/common/header.tpl', $content);
		
		
		
		
		/* Get Header Controller Content */
		
		$hcontent = file_get_contents(DIR_APPLICATION.'/controller/common/header.php'); 
		$admin_header = '
		/* Added for blog extension */
			
		$this->load->model(\'setting/extension\');
		$extensions = $this->model_setting_extension->getInstalled(\'module\');
		if(in_array(\'blog\', $extensions)){
			
			/* Added For Blog Extension */
			//$this->data[\'text_blog\'] = $this->language->get(\'text_blog\');
			//$this->data[\'text_blog_categories\'] = $this->language->get(\'text_blog_categories\');
			//$this->data[\'text_blog_comments\'] = $this->language->get(\'text_blog_comments\');
			//$this->data[\'text_blog_rolls\'] = $this->language->get(\'text_blog_rolls\');
			//$this->data[\'text_blog_posts\'] = $this->language->get(\'text_blog_posts\');
			/* Added For Blog Extension */
			
			$this->data[\'blog_module\'] = $this->config->get(\'blog_module\');
			$this->data[\'blog_post\'] = $this->url->link(\'blog/post\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_category\'] = $this->url->link(\'blog/category\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_roll\'] = $this->url->link(\'blog/roll\', \'token=\' . $this->session->data[\'token\'], \'SSL\');
			$this->data[\'blog_comment\'] = $this->url->link(\'blog/comment\', \'token=\' . $this->session->data[\'token\'], \'SSL\');	
		}

		/* Added for blog extension */';
		
		$hcontent = str_replace($admin_header,'',$hcontent);
		file_put_contents(DIR_APPLICATION.'/controller/common/header.php', $hcontent);
	}
}
?>