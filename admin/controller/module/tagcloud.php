<?php
class ControllerModuleTagCloud extends Controller 
{
    private $error = array();

    public function index() {
        $this->data = array_merge($this->data, $this->load->language('module/tagcloud'));

        $this->document->setTitle($this->language->get('heading_title_normal'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
            $this->model_setting_setting->editSetting('tagcloud', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', '&token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['text_enabled']  = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        
        $this->data['button_save']   = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        
        $this->data['tab_general']   = $this->language->get('tab_general');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        
        if (isset($this->error['font'])) {
            $this->data['error_font'] = $this->error['font'];
        } else {
            $this->data['error_font'] = array();
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('common/home', '&token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('extension/module', '&token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('text_module'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'href'      => $this->url->link('module/tagcloud', '&token=' . $this->session->data['token'], 'SSL'),
            'text'      => $this->language->get('heading_title_normal'),
            'separator' => ' :: '
        );

        $this->data['action']  = $this->url->link('module/tagcloud', '&token=' . $this->session->data['token'], 'SSL');
        
        $this->data['cancel']  = $this->url->link('extension/module', '&token=' . $this->session->data['token'], 'SSL');
        
        $this->data['generate_url'] = $this->url->link('module/tagcloud/generate', '&token=' . $this->session->data['token'], 'SSL');

        $this->data['modules'] = array();
        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        if(isset($this->request->post['tagcloud_resize'])) {
            $this->data['tagcloud_resize'] = $this->request->post['tagcloud_resize'];
        } elseif($this->config->get('tagcloud_resize')) {
            $this->data['tagcloud_resize'] = $this->config->get('tagcloud_resize');
        }

        if(isset($this->request->post['tagcloud_tabtitle'])) {
            $this->data['tagcloud_tabtitle'] = $this->request->post['tagcloud_tabtitle'];
        } elseif($this->config->get('tagcloud_tabtitle')) {
            $this->data['tagcloud_tabtitle'] = $this->config->get('tagcloud_tabtitle');
        }
        if(isset($this->request->post['tagcloud_tabicon'])) {
            $this->data['tagcloud_tabicon'] = $this->request->post['tagcloud_tabicon'];
        } elseif($this->config->get('tagcloud_tabicon')) {
            $this->data['tagcloud_tabicon'] = $this->config->get('tagcloud_tabicon');
        }



        if(isset($this->request->post['tagcloud_module'])) {
            $this->data['modules'] = $this->request->post['tagcloud_module'];
        } elseif ($this->config->get('tagcloud_module')) {
            $this->data['modules'] = $this->config->get('tagcloud_module');
        }
        
        $this->load->model('design/layout');
        
        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'module/tagcloud.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        
        $this->response->setOutput($this->render());
    }

    public function generate()
    {
        $this->load->language('module/tagcloud');

        if(!$this->user->hasPermission('modify', 'module/tagcloud')){
            $json['status']  = 'Error';
            $json['message'] = $this->language->get('error_permission');
        } else {
            $json = $this->generateTagCloud();
        }

        $this->response->setOutput(json_encode($json));
    }

    private function generateTagCloud()
    {
        $this->load->language('module/tagcloud');
        $this->load->model('module/tagcloud');

        $rawdata = $this->model_module_tagcloud->getRawTags();
        foreach($rawdata as $row) {
            $rowTags = explode(',', $row['tag']);
            foreach($rowTags as $key => $value) {
                $data[] = array(
                        'store_id' => $row['store_id'],
                        'language_id' => $row['language_id'],
                        'qty' => '1',
                        'tag' => trim($value)
                    );
            }
        }
        $this->model_module_tagcloud->clear();
        $this->model_module_tagcloud->update($data);
        return array('status' => 'Success', 'message' => $this->language->get('generate_success'));
    }

    private function validate()
    {
        if(!$this->user->hasPermission('modify', 'module/tagcloud')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if(isset($this->request->post['tagcloud_module'])) {
            foreach($this->request->post['tagcloud_module'] as $key => $value) {
                if(!$value['min_font_size'] || !$value['max_font_size']) {
                    $this->error['font'][$key] = $this->language->get('error_font');
                }   
            }
        }
        
        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function install()
    {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "tag_cloud` (
        `qty` int(11) NOT NULL,
        `tag` varchar(255) COLLATE utf8_bin NOT NULL,
        `language_id` int(11) NOT NULL,
        `store_id` int(11) NOT NULL,
        PRIMARY KEY (`tag`,`language_id`,`store_id`)
        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");
    }

    public function uninstall()
    {
        $this->db->query("DROP TABLE " . DB_PREFIX . "tag_cloud");
    }
}
