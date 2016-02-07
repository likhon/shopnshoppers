<?php
class ControllerModuleTagCloud extends Controller 
{
    protected function index($setting) {
        $this->data = array_merge($this->data, $this->language->load('module/tagcloud'));

        $this->load->model('module/tagcloud');
        $this->data['sort_order'] = $setting['sort_order'];

        $this->data['tagcloud'] = $this->model_module_tagcloud->getRandomTags(array(
            'limit'         => (int)$setting['limit'],
            'min_font_size' => (int)$setting['min_font_size'],
            'max_font_size' => (int)$setting['max_font_size'],
            'resize'        => $this->config->get('tagcloud_resize')
        ));

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tagcloud.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/tagcloud.tpl';
        } else {
            $this->template = 'default/template/module/tagcloud.tpl';
        }
        
        $this->render();
    }
}
