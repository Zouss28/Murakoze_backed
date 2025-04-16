/*
  Warnings:

  - You are about to drop the column `sector` on the `categories` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `categories` DROP COLUMN `sector`,
    ADD COLUMN `sector_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `institution` ADD COLUMN `description` TEXT NULL,
    ADD COLUMN `latitude` INTEGER NULL,
    ADD COLUMN `longitude` INTEGER NULL;

-- CreateTable
CREATE TABLE `images` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `type` VARCHAR(255) NULL,
    `image_url` VARCHAR(255) NULL,
    `caption` VARCHAR(255) NULL,
    `uploaded_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_institution_id`(`institution_id`),
    INDEX `fk_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sectors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users_profile` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(50) NULL,
    `age_group` VARCHAR(50) NULL,
    `gender` VARCHAR(50) NULL,
    `address` VARCHAR(50) NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE INDEX `fk_sector_id` ON `categories`(`sector_id`);

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `fk_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `sectors`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
