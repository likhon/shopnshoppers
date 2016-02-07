<?php  
class ControllerModuleNivoslider extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/nivo-slider-bioproduct/jquery.nivo.slider.js');
		
		//$this->data['width'] = $setting['width'];
		//$this->data['height'] = $setting['height'];
		
		$this->data['banners'] = array();

        $this->config->get('bs_additional');
        $this->data['slider_width_settings'] = $this->config->get('bs_additional');


        if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						//'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
						'image' => $result['image']
					);
				}
			}
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/nivoslider.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/nivoslider.tpl';
		} else {
			$this->template = 'default/template/module/nivoslider.tpl';
		}
		
		$this->render();
	}
}