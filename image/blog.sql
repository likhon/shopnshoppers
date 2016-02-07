Installing of Blog:
1. Add module Bioproduct Theme Top Menu Module
2. Add module Bioproduct Theme Side Collapsed Categories Module

/*
`blog_categories`,
`blog_categories_description`,
`blog_categories_to_layout`,
`blog_categories_to_store`,
`blog_comments`,
`blog_posts`,
`blog_posts_tags`,
`blog_posts_description`,
`blog_posts_image`,
`blog_posts_to_category`,
`blog_posts_to_blog_categories`,
`blog_posts_to_layout`,
`blog_posts_to_product`,
`blog_posts_to_store`,
`blog_posts_related`,
`blog_links`,
`blog_links_description
*/
DROP TABLE
		`oc_blog_categories`,
		`oc_blog_categories_description`,
		`oc_blog_categories_to_layout`,
		`oc_blog_categories_to_store`,
		`oc_blog_comments`,
		`oc_blog_posts`,
		`oc_blog_posts_tags`,
		`oc_blog_posts_description`,
		`oc_blog_posts_image`,
		`oc_blog_posts_to_category`,
		`oc_blog_posts_to_blog_categories`,
		`oc_blog_posts_to_layout`,
		`oc_blog_posts_to_product`,
		`oc_blog_posts_to_store`,
		`oc_blog_posts_related`,
		`oc_blog_links`,
		`oc_blog_links_description`;

/* clearing */
DELETE FROM `oc_blog_categories`;
DELETE FROM `oc_blog_categories_description`;
DELETE FROM `oc_blog_categories_to_layout`;
DELETE FROM `oc_blog_categories_to_store`;
DELETE FROM `oc_blog_comments`;
DELETE FROM `oc_blog_posts`;
DELETE FROM `oc_blog_posts_tags`;
DELETE FROM `oc_blog_posts_description`;
DELETE FROM `oc_blog_posts_image`;
DELETE FROM `oc_blog_posts_to_category`;
DELETE FROM `oc_blog_posts_to_blog_categories`;
DELETE FROM `oc_blog_posts_to_layout`;
DELETE FROM `oc_blog_posts_to_product`;
DELETE FROM `oc_blog_posts_to_store`;
DELETE FROM `oc_blog_posts_related`;
DELETE FROM `oc_blog_links`;
DELETE FROM `oc_blog_links_description`;

/* data inserting */
INSERT INTO `oc_setting` VALUES (null, 0, 'blog_settings', 'blog_settings', 'a:12:{s:20:"config_post_per_page";s:2:"10";s:20:"config_guest_comment";s:1:"1";s:15:"posts_img_width";s:3:"733";s:16:"posts_img_height";s:3:"301";s:20:"post_img_thumb_width";s:2:"40";s:21:"post_img_thumb_height";s:2:"40";s:26:"post_img_extra_thumb_width";s:3:"733";s:27:"post_img_extra_thumb_height";s:3:"301";s:20:"post_img_popup_width";s:3:"733";s:21:"post_img_popup_height";s:3:"301";s:13:"cat_img_width";s:2:"65";s:14:"cat_img_height";s:2:"65";}', 1);

INSERT INTO `oc_blog_categories` VALUES
(1, '', 0, 1, '2014-04-08 11:59:25', '2014-04-08 11:59:25', 0, 0, 1, 2),
(2, '', 0, 1, '2014-04-08 12:01:58', '2014-04-08 12:01:58', 0, 0, 2, 1),
(3, '', 0, 1, '2014-04-08 12:02:11', '2014-04-08 12:02:11', 0, 0, 3, 1),
(4, '', 0, 1, '2014-04-08 12:03:28', '2014-04-08 12:03:28', 0, 0, 4, 0),
(5, '', 0, 1, '2014-04-08 12:03:45', '2014-04-08 12:03:45', 0, 0, 5, 0);

INSERT INTO `oc_blog_categories_description` VALUES
(1, 1, 'Web Design', '', '', ''),
(2, 1, 'Wordpress Themes', '', '', ''),
(3, 1, 'Animation', '', '', ''),
(4, 1, 'Logo Design', '', '', ''),
(5, 1, 'Photography', '', '', '');

INSERT INTO `oc_blog_categories_to_store` VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0);

INSERT INTO `oc_blog_links` VALUES
(1, '2014-04-08 12:34:37', '2014-04-08 13:00:41');

INSERT INTO `oc_blog_links_description` VALUES
(1, 1, 'video01', 'www.youtube.com/embed/HfBRJYyyIgE', 1, 1, 1);

INSERT INTO `oc_blog_posts` VALUES
(1, 0, 1, 1, '2014-04-08 09:02:13', 1, 'Admin', '2014-04-08', '2014-04-08 13:45:29', 1, 1, 'data/blog/post01.jpg'),
(2, 0, 1, 1, '2014-04-08 09:43:34', 1, 'Admin', '2014-04-07', '2014-04-08 13:45:35', 1, 2, 'data/blog/post02.jpg'),
(3, 0, 1, 1, '2014-04-08 10:40:20', 1, 'Admin', '2014-04-07', '2014-04-08 13:45:44', 1, 3, 'data/blog/post01.jpg'),
(4, 0, 1, 1, '2014-04-08 11:58:05', 1, 'Admin', '2014-04-07', '2014-04-08 13:45:55', 1, 4, 'data/blog/post02.jpg');

INSERT INTO `oc_blog_posts_description` VALUES
(1, 1, 'Nullam id justo sed diam duis sollicitudin commodo ', '', '', 'developer,branding,OpenCart', 'Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh... ', '&lt;p&gt;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&lt;/p&gt;\r\n'),
(3, 1, 'Integer vel nibh sit amet turpis vulputate aliquet', '', '', 'test,modern', 'Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh', '&lt;p&gt;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&lt;/p&gt;\r\n'),
(4, 1, 'Fusce tincidunt, justo congue egestas molestie dwdwd', '', '', 'blog,modern', 'Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh', '&lt;p&gt;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&lt;/p&gt;\r\n'),
(2, 1, 'Fusce tincidunt, justo congue egestas molestie', '', '', 'modern,fashion', 'Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh... ', '&lt;p&gt;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh&amp;nbsp;Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis, mi risus sagittis odio, vel ultrices enim sem ut imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh...&amp;nbsp;&lt;/p&gt;\r\n');

INSERT INTO `oc_blog_posts_image` VALUES
(21, 1, 'data/blog/img_blog-01.jpg', 1),
(22, 2, 'data/blog/img_blog-02.jpg', 1),
(23, 3, 'data/blog/img_blog-03.jpg', 1),
(24, 4, 'data/blog/img_blog-04.jpg', 1);

INSERT INTO `oc_blog_posts_tags` VALUES
(9, 'blog', 1),
(3, 'branding', 1),
(7, 'developer', 1),
(6, 'fashion', 1),
(5, 'modern', 1),
(4, 'OpenCart', 1),
(8, 'shop', 1),
(2, 'web developer', 1);

INSERT INTO `oc_blog_posts_to_blog_categories` VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);

INSERT INTO `oc_blog_posts_to_store` VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);


