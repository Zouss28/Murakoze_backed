-- CreateTable
CREATE TABLE `workingHour` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NOT NULL,
    `day_of_week` VARCHAR(20) NOT NULL,
    `open_time` VARCHAR(120) NOT NULL,
    `close_time` VARCHAR(120) NOT NULL,

    INDEX `fk_institit_id`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `workingHour` ADD CONSTRAINT `fk_institit_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
