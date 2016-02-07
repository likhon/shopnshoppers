<?php

class ModelCustomisationBioproductProductsOptions extends Model {
	public function getAttribute ($attribute_name, $product_id) {
		$sql = "SELECT `".$attribute_name."` FROM " . DB_PREFIX . "bioproduct_products_options WHERE `product_id` = " . $product_id;
        $attr = $this->db->query($sql);

        if (!empty($attr->row[$attribute_name])) {

            return $attr->row[$attribute_name];
        } else {
            return null;
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