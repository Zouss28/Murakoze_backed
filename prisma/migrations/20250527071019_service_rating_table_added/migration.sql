-- CreateTable
CREATE TABLE `serviceReview` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `service_id` INTEGER NULL,
    `rating` INTEGER NULL,
    `emoRating` VARCHAR(25) NOT NULL,
    `added_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_Service_id`(`service_id`),
    INDEX `fk_Suser_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `serviceReview` ADD CONSTRAINT `fk_Service_id` FOREIGN KEY (`service_id`) REFERENCES `service_group`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `serviceReview` ADD CONSTRAINT `fk_Suser_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
