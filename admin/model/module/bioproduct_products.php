<?php

class ModelModuleBioproductProducts extends Model {
    public function createTables() {

        /* Creates Required Tables */

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "theme_product_option` (
							  `id` int(11) NOT NULL AUTO_INCREMENT,
							  `product_id` int(11) NOT NULL,
							  `product_video` varchar(255) NOT NULL,
							  PRIMARY KEY (`id`)
							) ENGINE=MyISAM COLLATE=utf8_general_ci");
    }
	public function updateProductsArray ($products, $option) {

		// sql query to get advanced attribute
		$sql = "SELECT `product_id`, `".$option."` as `option` FROM " . DB_PREFIX . "theme_product_option WHERE `".$option."` <> '' ";
		
		// get attribute value from db
		$advAttrs = $this->db->query($sql);

		// update products array. Add advanced attribute
		foreach( ($advAttrs->rows) as $advAttr ) {
						
				foreach ( $products as $key => $product) {
					if ($product['product_id'] ==  $advAttr['product_id']) {
						$products[$key][$option] = $advAttr['option'];
						break;
					}
				}
		}
		
		//return update array
		return $products;
	}

	public function saveAttribute ($attribute_name, $product) {
		//var_export($product);
		
		$sql = "SELECT `product_id` FROM " . DB_PREFIX . "theme_product_option WHERE `product_id` = " . $product['product_id'];
		//$sql = "SELECT `product_id` FROM " . DB_PREFIX . "theme_product_option WHERE `product_id` = 999 ";
		
		// get attribute value from db
		$advAttrs = $this->db->query($sql);

		//var_export($advAttrs->num_rows);
		//die();
		
		if ($advAttrs->num_rows == 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "theme_product_option SET product_id = '" . $product['product_id'] . "', `".$attribute_name."` = '" . $product[$attribute_name] . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "theme_product_option SET `".$attribute_name."` = '" . $product[$attribute_name] . "' WHERE product_id = '" . $product['product_id'] . "'");
		}
				
	}
	
	
	public function getAttribute ($attribute_name, $product_id) {
		$sql = "SELECT `".$attribute_name."` FROM " . DB_PREFIX . "theme_product_option WHERE `product_id` = " . $product_id;
		
		$attr = $this->db->query($sql);
		
		return $attr->row[$attribute_name];
	}
}