<?php  
#############################################################################
#
#  Adpatations for OpenCart 1.5.1 from Alcuino 25.8.2011
#  Original developed by  Somsak2004, web: www.somsak2004.net email: sanma2001@hotmail.com
#  
#############################################################################
class ControllerModuleQrcode  extends Controller {		 

	protected function index($setting) {

		$this->language->load('module/qrcode');

		if($setting['layout_id']=='2' && $setting['show']) {
			
			$this->load->model('catalog/product');
			
			$myUrl = $this->curPageURL() ;
			$this->tmp=$this->link(html_entity_decode($myUrl));
			
			if ($this->config->get('config_seo_url') == 1) {
				$string = substr(strrchr($myUrl, "/"), 1);
				if (!$setting['code']==''){
					$this->data['heading_title'] = html_entity_decode($string);
				}
			}else{
				$product_info = $this->model_catalog_product->getProduct($_GET["product_id"]);
				if (!$setting['code']==''){
					$this->data['heading_title'] = html_entity_decode($product_info['name']);
				}
			}
			
		}else{
		
			$this->data['heading_title'] = html_entity_decode($setting['code'] );
			
			$this->tmp=$this->link(html_entity_decode($setting['gen']));
		}

		$this->data['width']  = $setting['image_width'] ;
		$this->data['height'] = $setting['image_height'] ;
		
		$this->data['qr_code']='<img src="'.$this->get_link($size = $setting['image_width'] ).'" alt="" />';
		
		$this->data['gen']    = $setting['gen'] ;
    
		$this->id = 'qrcode';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/qrcode.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/qrcode.tpl';
		} else {
			$this->template = 'default/template/module/qrcode.tpl';
		}
		$this->render();
	}
	
	protected function link($url){
		if (preg_match('/^http:\/\//', $url) || preg_match('/^https:\/\//', $url)) 
		{
			$this->data2 = $url;
		}
		else
		{
			$this->data2 = "http://".$url;
		}
	}
	
	//getting link for image
	protected function get_link($size = 150, $EC_level = 'L', $margin = '0'){
		$this->data2 = urlencode($this->data2); 
		return 'http://chart.apis.google.com/chart?chs='.$size.'x'.$size.'&cht=qr&chld='.$EC_level.'|'.$margin.'&chl='.$this->data2;
	}
	
	//forsing image download
	protected function download_image($file){
		
		header('Content-Description: File Transfer');
		header('Content-Type: image/png');
		header('Content-Disposition: attachment; filename=QRcode.png');
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');
		header('Content-Length: ' . filesize($file));
		ob_clean();
		flush();
		echo $file;
	}
	
	// current page
	protected function curPageURL() {
		$pageURL = 'http';
		if (!isset($this->request->server['HTTPS']) || ($this->request->server['HTTPS'] != 'on')) {
		}else{
			$pageURL .= "s";
		}
		$pageURL .= "://";
		if ($_SERVER["SERVER_PORT"] != "80") {
			$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
		} else {
			$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
		}
	 return $pageURL;
	}

}