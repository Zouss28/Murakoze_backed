-- CreateTable
CREATE TABLE `price_ranges` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NOT NULL,
    `max_value` INTEGER NOT NULL,
    `min_value` INTEGER NOT NULL,

    INDEX `fk_price_range_id`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `price_ranges` ADD CONSTRAINT `fk_price_range_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
