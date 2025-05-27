-- CreateTable
CREATE TABLE `surveyAnswers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `service_id` INTEGER NOT NULL,
    `question_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `answer` VARCHAR(255) NULL,
    `scale_rating` INTEGER NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `surveyQuestions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `service_id` INTEGER NOT NULL,
    `question` TEXT NULL,
    `choices` LONGTEXT NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_servic_id`(`service_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `surveyQuestions` ADD CONSTRAINT `fk_servic_id` FOREIGN KEY (`service_id`) REFERENCES `service_group`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
