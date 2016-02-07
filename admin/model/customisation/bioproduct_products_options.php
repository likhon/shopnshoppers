<?php

class ModelCustomisationBioproductProductsOptions extends Model {

	// input parametrs
	//
	// $products - array 
	// Array of products
	//
	// $option - string
	// Advanced option name
	//
	
	
	    public function createTables() {

        /* Creates Required Tables */

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "bioproduct_products_options` (
							  `id` int(11) NOT NULL AUTO_INCREMENT,
							  `product_id` int(11) NOT NULL,
							  `product_video` varchar(255) NOT NULL,
							  `custom_html1` varchar(255) NOT NULL,							  
							  PRIMARY KEY (`id`)
							) ENGINE=MyISAM COLLATE=utf8_general_ci");
    }

	
	
	
	public function updateProductsArray ($products, $option) {

		// sql query to get advanced attribute
		$sql = "SELECT `product_id`, `".$option."` as `option` FROM " . DB_PREFIX . "bioproduct_products_options WHERE `".$option."` <> '' ";
		
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
		
		$sql = "SELECT `product_id` FROM " . DB_PREFIX . "bioproduct_products_options WHERE `product_id` = " . $product['product_id'];
		//$sql = "SELECT `product_id` FROM " . DB_PREFIX . "bioproduct_products_options WHERE `product_id` = 999 ";
		
		// get attribute value from db
		$advAttrs = $this->db->query($sql);

		//var_export($advAttrs->num_rows);
		//die();
		
		if ($advAttrs->num_rows == 0) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "bioproduct_products_options SET product_id = '" . $product['product_id'] . "', `".$attribute_name."` = '" . $product[$attribute_name] . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "bioproduct_products_options SET `".$attribute_name."` = '" . $product[$attribute_name] . "' WHERE product_id = '" . $product['product_id'] . "'");
		}
				
	}
	
	
	public function getAttribute ($attribute_name, $product_id) {
		$sql = "SELECT `".$attribute_name."` FROM " . DB_PREFIX . "bioproduct_products_options WHERE `product_id` = " . $product_id;
        $attr = $this->db->query($sql);

        if (!empty($attr->row[$attribute_name])) {

            return $attr->row[$attribute_name];
        } else {
            return null;
        }
		
	}

    /************************************************** models for categories custom fields */
    public function createTablesCategories() {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "theme_categories_options` (
							  `id` int(11) NOT NULL AUTO_INCREMENT,
							  `category_id` int(11) NOT NULL,

							  `image_src` varchar(255) NOT NULL,
							  `image_top_src` varchar(255) NOT NULL,


							  PRIMARY KEY (`id`)
							) ENGINE=MyISAM COLLATE=utf8_general_ci");

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'description_custom'");
        if (!$column_exists->num_rows) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description ADD description_custom TEXT COLLATE utf8_bin NOT NULL  AFTER `description`");
        }


    }
    public function deleteTablesCategories() {
        $this->db->query("DROP TABLE `" . DB_PREFIX . "theme_categories_options`");

        $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "category_description LIKE 'description_custom'");
        if ($column_exists->num_rows) {
            $this->db->query("ALTER TABLE " . DB_PREFIX . "category_description DROP COLUMN description_custom");
        }

    }
    public function updateCategoriesArray ($categories, $option) {
        $sql = "SELECT `category_id`, `".$option."` as `option` FROM " . DB_PREFIX . "theme_categories_options WHERE `".$option."` <> '' ";
        $advAttrs = $this->db->query($sql);
        foreach( ($advAttrs->rows) as $advAttr ) {

            foreach ( $categories as $key => $category) {
                if ($category['category_id'] ==  $advAttr['category_id']) {
                    $categories[$key][$option] = $advAttr['option'];
                    break;
                }
            }
        }
        return $categories;
    }
    public function saveAttributeCategories ($attribute_name, $category) {
        $sql = "SELECT `category_id` FROM " . DB_PREFIX . "theme_categories_options WHERE `category_id` = " . $category['category_id'];
        $advAttrs = $this->db->query($sql);
        if ($advAttrs->num_rows == 0) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "theme_categories_options SET category_id = '" . $category['category_id'] . "', `".$attribute_name."` = '" . $category[$attribute_name] . "'");
        } else {
           $this->db->query("UPDATE " . DB_PREFIX . "theme_categories_options SET `".$attribute_name."` = '" . $category[$attribute_name] . "' WHERE category_id = '" . $category['category_id'] . "'");
        }
    }
    public function getAttributeCategories ($attribute_name, $category_id) {
        $sql = "SELECT `".$attribute_name."` FROM " . DB_PREFIX . "theme_categories_options WHERE `category_id` = " . $category_id;
        $attr = $this->db->query($sql);
        if (!empty($attr->row[$attribute_name])) {
            return $attr->row[$attribute_name];
        } else {
            return null;
        }
    }
}