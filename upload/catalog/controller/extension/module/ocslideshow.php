<?php
class ControllerExtensionModuleOcslideshow extends Controller {
	public function index($setting) { 
		static $module = 0;	
		$this->language->load('extension/module/ocslideshow');
		$this->load->model('ocslideshow/slide');
		$this->load->model('tool/image');
		
		

		$this->document->addScript('catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js');

		$data = array();
		$data['text_readmore'] = $this->language->get('text_readmore');
		$data['text_readmore_home6'] = $this->language->get('text_readmore_home6');
		$data['ocslideshows'] = array();
		$data['animate'] = 'animate-in';
		$results = $this->model_ocslideshow_slide->getocslideshow($setting['banner']);
		//var_dump($results);die;
		if($results ) {
			$store_id  = $this->config->get('config_store_id');
			foreach ($results as $result) {
			//	if (file_exists(DIR_IMAGE . $result['image'])) {
			  $banner_store = array();
			  if(isset($result['banner_store'])) {
				$banner_store = explode(',',$result['banner_store']);
			  }
			  if(in_array($store_id,$banner_store)) {
					$data['ocslideshows'][] = array(
						'title' => $result['title'],
						'sub_title' => $result['sub_title'],
						'description' => $result['description'],
						'link'  => $result['link'],
						'type'  => $result['type'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
						'small_image' => $this->config->get('config_url'). 'image/' . $result['small_image'],
						'small_image_name' => $result['small_image']
					);
			 }
					
				//}
				
				$data['slide_setting'] = $this->model_ocslideshow_slide->getSettingSlide($result['ocslideshow_id']);
				//var_dump($data['slide_setting']);die;
				//var_dump($result['ocslideshow_id']);die;
			}
			
					

			return $this->load->view('extension/module/ocslideshow.tpl', $data);

		
		}
		
		
	}
}