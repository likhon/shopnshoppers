<?php  
class ControllerModuleBrands extends Controller {
	protected function index($setting) {
		$this->language->load('module/brands');
		$this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['direction'] = $this->language->get('direction');

        static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');


		$this->data['limit'] = $setting['limit'];
		$this->data['scroll'] = $setting['scroll'];

        $this->data['height'] = $setting['height']/2;
        $this->data['width'] = $setting['width']/2;


        $this->data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
                    'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
					'image2x' => $this->model_tool_image->resize($result['image'], $setting['width']*2, $setting['height']*2)
				);
			}
		}

		$this->data['module'] = $module++; 

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/brands.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/brands.tpl';
		} else {
			$this->template = 'default/template/module/brands.tpl';
		}

		$this->render(); 
	}
}