-- CreateTable
CREATE TABLE `amenities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `icon` VARCHAR(100) NOT NULL,
    `added_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `business_amenities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NULL,
    `amenitY_id` INTEGER NULL,

    INDEX `fk_instititu_id`(`institution_id`),
    UNIQUE INDEX `amenitY_id`(`amenitY_id`, `institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `business_amenities` ADD CONSTRAINT `fk_amen_id` FOREIGN KEY (`amenitY_id`) REFERENCES `amenities`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `business_amenities` ADD CONSTRAINT `fk_instititu_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
