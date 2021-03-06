SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `wp_dk_speakup_petitions` 
CHANGE COLUMN `expiration_date` `expiration_date` DATETIME NULL DEFAULT '1900-01-01 00:00:00';

UPDATE TABLE `wp_dk_speakup_petitions` SET 'expiration_date' = '1900-01-01 00:00:00' WHERE 'expiration_date' = '0000-00-00 00:00:00'

ALTER TABLE `wp_dk_speakup_petitions` 
ADD COLUMN `petition_before_form` TEXT NULL DEFAULT NULL AFTER `is_editable`,
ADD COLUMN `petition_after_form` TEXT NULL DEFAULT NULL AFTER `petition_before_form`,
ADD COLUMN `user_send_email` TINYINT(1) NULL DEFAULT 0 AFTER `petition_after_form`,
ADD COLUMN `user_subject` TINYTEXT NULL DEFAULT NULL AFTER `user_send_email`,
ADD COLUMN `user_text` LONGTEXT NULL DEFAULT NULL AFTER `user_subject`,
ADD COLUMN `user_html` LONGTEXT NULL DEFAULT NULL AFTER `user_text`;

ALTER TABLE `wp_dk_speakup_petitions` 
ADD COLUMN `user_sender_email` VARCHAR(300) NULL DEFAULT NULL AFTER `user_sender_email`;

ALTER TABLE `wp_dk_speakup_petitions` 
ADD COLUMN `share_fb_img` TEXT NULL DEFAULT NULL AFTER `user_html`,
ADD COLUMN `share_fb_desc` TEXT NULL DEFAULT NULL AFTER `share_fb_img`,
ADD COLUMN `share_twitter` TINYTEXT NULL DEFAULT NULL AFTER `share_fb_desc`,
ADD COLUMN `share_email_subject` TINYTEXT NULL DEFAULT NULL AFTER `share_twitter`,
ADD COLUMN `share_email_body` TEXT NULL DEFAULT NULL AFTER `share_email_subject`;

ALTER TABLE `wp_dk_speakup_petitions` 
ADD COLUMN `share_fb_title` TINYTEXT NULL DEFAULT NULL AFTER `share_fb_img`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
