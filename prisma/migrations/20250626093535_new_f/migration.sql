/*
  Warnings:

  - You are about to drop the column `reaction` on the `review_reactions` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[review_id,user_id,reaction_type_id]` on the table `review_reactions` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `appointments` DROP FOREIGN KEY `fk_appointment_creator`;

-- DropForeignKey
ALTER TABLE `appointments` DROP FOREIGN KEY `fk_appointment_institution`;

-- DropForeignKey
ALTER TABLE `appointments` DROP FOREIGN KEY `fk_appointment_operator`;

-- DropForeignKey
ALTER TABLE `appointments` DROP FOREIGN KEY `fk_appointment_service`;

-- DropForeignKey
ALTER TABLE `appointments` DROP FOREIGN KEY `fk_appointment_user`;

-- DropForeignKey
ALTER TABLE `apps` DROP FOREIGN KEY `fk_app_institution_id`;

-- DropForeignKey
ALTER TABLE `business_amenities` DROP FOREIGN KEY `fk_amen_id`;

-- DropForeignKey
ALTER TABLE `business_amenities` DROP FOREIGN KEY `fk_instititu_id`;

-- DropForeignKey
ALTER TABLE `categories` DROP FOREIGN KEY `fk_sector_id`;

-- DropForeignKey
ALTER TABLE `category_search_terms` DROP FOREIGN KEY `category_search_terms_ibfk_1`;

-- DropForeignKey
ALTER TABLE `device` DROP FOREIGN KEY `fk_device_affiliate`;

-- DropForeignKey
ALTER TABLE `images` DROP FOREIGN KEY `fk_institution_id`;

-- DropForeignKey
ALTER TABLE `images` DROP FOREIGN KEY `fk_review_id`;

-- DropForeignKey
ALTER TABLE `images` DROP FOREIGN KEY `fk_user_id`;

-- DropForeignKey
ALTER TABLE `institution` DROP FOREIGN KEY `fk_category_id`;

-- DropForeignKey
ALTER TABLE `popup_questions` DROP FOREIGN KEY `fk_institution`;

-- DropForeignKey
ALTER TABLE `popup_questions_answers` DROP FOREIGN KEY `fk_popup_questions_possible_answers`;

-- DropForeignKey
ALTER TABLE `popup_questions_possible_answers` DROP FOREIGN KEY `fk_popup_questions_answers`;

-- DropForeignKey
ALTER TABLE `price_ranges` DROP FOREIGN KEY `fk_price_range`;

-- DropForeignKey
ALTER TABLE `qms_branch_operator` DROP FOREIGN KEY `fk_qms_branch_operator_institution`;

-- DropForeignKey
ALTER TABLE `qms_branch_operator` DROP FOREIGN KEY `fk_qms_operator`;

-- DropForeignKey
ALTER TABLE `qms_branch_transactions` DROP FOREIGN KEY `fk_affiliate`;

-- DropForeignKey
ALTER TABLE `qms_counter` DROP FOREIGN KEY `fk_service`;

-- DropForeignKey
ALTER TABLE `qms_customer` DROP FOREIGN KEY `qms_customer_ibfk_1`;

-- DropForeignKey
ALTER TABLE `qms_operator` DROP FOREIGN KEY `fk_qms_operator_institution`;

-- DropForeignKey
ALTER TABLE `qms_operator_transactions` DROP FOREIGN KEY `fk_branch_transactions`;

-- DropForeignKey
ALTER TABLE `qms_operator_transactions` DROP FOREIGN KEY `fk_operator`;

-- DropForeignKey
ALTER TABLE `qms_queue` DROP FOREIGN KEY `qms_queue_ibfk_1`;

-- DropForeignKey
ALTER TABLE `qms_queue_operator_lnk` DROP FOREIGN KEY `qms_queue_operator_lnk_ibfk_1`;

-- DropForeignKey
ALTER TABLE `qms_queue_operator_lnk` DROP FOREIGN KEY `qms_queue_operator_lnk_ibfk_2`;

-- DropForeignKey
ALTER TABLE `qms_ticket` DROP FOREIGN KEY `fk_reason_option`;

-- DropForeignKey
ALTER TABLE `qms_ticket` DROP FOREIGN KEY `qms_ticket_ibfk_1`;

-- DropForeignKey
ALTER TABLE `qms_ticket` DROP FOREIGN KEY `qms_ticket_ibfk_2`;

-- DropForeignKey
ALTER TABLE `qms_ticket_assignment` DROP FOREIGN KEY `qms_ticket_assignment_ibfk_1`;

-- DropForeignKey
ALTER TABLE `qms_ticket_assignment` DROP FOREIGN KEY `qms_ticket_assignment_ibfk_2`;

-- DropForeignKey
ALTER TABLE `rating` DROP FOREIGN KEY `fk1_service_id`;

-- DropForeignKey
ALTER TABLE `rating` DROP FOREIGN KEY `fk_device`;

-- DropForeignKey
ALTER TABLE `rating_assets` DROP FOREIGN KEY `fk_rating_id`;

-- DropForeignKey
ALTER TABLE `review_reactions` DROP FOREIGN KEY `review_reactions_review_id_fkey`;

-- DropForeignKey
ALTER TABLE `reviews` DROP FOREIGN KEY `fk_institutions_id`;

-- DropForeignKey
ALTER TABLE `reviews` DROP FOREIGN KEY `fk_users_id`;

-- DropForeignKey
ALTER TABLE `service` DROP FOREIGN KEY `fk_service_group`;

-- DropForeignKey
ALTER TABLE `service` DROP FOREIGN KEY `service_ibfk_1`;

-- DropForeignKey
ALTER TABLE `serviceReview` DROP FOREIGN KEY `fk_Service_id`;

-- DropForeignKey
ALTER TABLE `serviceReview` DROP FOREIGN KEY `fk_Suser_id`;

-- DropForeignKey
ALTER TABLE `service_group` DROP FOREIGN KEY `fk_service_group_institution_id`;

-- DropForeignKey
ALTER TABLE `surveyAnswers` DROP FOREIGN KEY `fk_Serv_id`;

-- DropForeignKey
ALTER TABLE `surveyQuestions` DROP FOREIGN KEY `fk_servic_id`;

-- DropForeignKey
ALTER TABLE `tip` DROP FOREIGN KEY `fk_tip_device`;

-- DropForeignKey
ALTER TABLE `tip` DROP FOREIGN KEY `fk_tip_rating`;

-- DropForeignKey
ALTER TABLE `workingHour` DROP FOREIGN KEY `fk_institit_id`;

-- DropIndex
DROP INDEX `review_reactions_review_id_user_id_reaction_key` ON `review_reactions`;

-- AlterTable
ALTER TABLE `review_reactions` DROP COLUMN `reaction`,
    ADD COLUMN `reaction_type_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `users_profile` ADD COLUMN `resetPasswordExpires` DATETIME(3) NULL,
    ADD COLUMN `resetPasswordToken` VARCHAR(255) NULL;

-- CreateTable
CREATE TABLE `reaction_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `icon` VARCHAR(191) NULL,

    UNIQUE INDEX `reaction_types_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review_replies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `review_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `reply_text` TEXT NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `parent_reply_id` INTEGER NULL,

    INDEX `review_replies_review_id_idx`(`review_id`),
    INDEX `review_replies_user_id_idx`(`user_id`),
    INDEX `review_replies_parent_reply_id_idx`(`parent_reply_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `review_reactions_review_id_user_id_reaction_type_id_key` ON `review_reactions`(`review_id`, `user_id`, `reaction_type_id`);

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_creator` FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_service` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_user` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `apps` ADD CONSTRAINT `fk_app_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `fk_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `sectors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `device` ADD CONSTRAINT `fk_device_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `institution` ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `popup_questions` ADD CONSTRAINT `fk_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `popup_questions_answers` ADD CONSTRAINT `fk_popup_questions_possible_answers` FOREIGN KEY (`answer_id`) REFERENCES `popup_questions_possible_answers`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `popup_questions_possible_answers` ADD CONSTRAINT `fk_popup_questions_answers` FOREIGN KEY (`popup_question_id`) REFERENCES `popup_questions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_branch_operator` ADD CONSTRAINT `fk_qms_branch_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_branch_operator` ADD CONSTRAINT `fk_qms_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_branch_transactions` ADD CONSTRAINT `fk_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_counter` ADD CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_customer` ADD CONSTRAINT `qms_customer_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_operator` ADD CONSTRAINT `fk_qms_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_operator_transactions` ADD CONSTRAINT `fk_branch_transactions` FOREIGN KEY (`branch_transaction_id`) REFERENCES `qms_branch_transactions`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_operator_transactions` ADD CONSTRAINT `fk_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_queue` ADD CONSTRAINT `qms_queue_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_queue_operator_lnk` ADD CONSTRAINT `qms_queue_operator_lnk_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_queue_operator_lnk` ADD CONSTRAINT `qms_queue_operator_lnk_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `fk_reason_option` FOREIGN KEY (`reason_id`) REFERENCES `option`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `qms_ticket_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `qms_customer`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `qms_ticket_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_ticket_assignment` ADD CONSTRAINT `qms_ticket_assignment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `qms_ticket`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `qms_ticket_assignment` ADD CONSTRAINT `qms_ticket_assignment_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rating` ADD CONSTRAINT `fk1_service_id` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rating` ADD CONSTRAINT `fk_device` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `rating_assets` ADD CONSTRAINT `fk_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `service` ADD CONSTRAINT `fk_service_group` FOREIGN KEY (`group`) REFERENCES `service_group`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `service` ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `service_group` ADD CONSTRAINT `fk_service_group_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tip` ADD CONSTRAINT `fk_tip_device` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `tip` ADD CONSTRAINT `fk_tip_rating` FOREIGN KEY (`rating_id`) REFERENCES `rating`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_review_id` FOREIGN KEY (`review_id`) REFERENCES `reviews`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reviews` ADD CONSTRAINT `fk_institutions_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reviews` ADD CONSTRAINT `fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review_replies` ADD CONSTRAINT `review_replies_parent_reply_id_fkey` FOREIGN KEY (`parent_reply_id`) REFERENCES `review_replies`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review_replies` ADD CONSTRAINT `review_replies_review_id_fkey` FOREIGN KEY (`review_id`) REFERENCES `reviews`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review_replies` ADD CONSTRAINT `review_replies_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `workingHour` ADD CONSTRAINT `fk_institit_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `business_amenities` ADD CONSTRAINT `fk_amen_id` FOREIGN KEY (`amenitY_id`) REFERENCES `amenities`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `business_amenities` ADD CONSTRAINT `fk_instititu_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `price_ranges` ADD CONSTRAINT `fk_price_range` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `surveyAnswers` ADD CONSTRAINT `fk_Serv_id` FOREIGN KEY (`question_id`) REFERENCES `surveyQuestions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `surveyQuestions` ADD CONSTRAINT `fk_servic_id` FOREIGN KEY (`service_id`) REFERENCES `service_group`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `serviceReview` ADD CONSTRAINT `fk_Service_id` FOREIGN KEY (`service_id`) REFERENCES `service_group`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `serviceReview` ADD CONSTRAINT `fk_Suser_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `category_search_terms` ADD CONSTRAINT `category_search_terms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
