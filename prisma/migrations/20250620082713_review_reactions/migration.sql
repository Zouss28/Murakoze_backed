-- CreateTable
CREATE TABLE `review_reactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `review_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `reaction` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `review_reactions_review_id_idx`(`review_id`),
    INDEX `review_reactions_user_id_idx`(`user_id`),
    UNIQUE INDEX `review_reactions_review_id_user_id_reaction_key`(`review_id`, `user_id`, `reaction`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `review_reactions` ADD CONSTRAINT `review_reactions_review_id_fkey` FOREIGN KEY (`review_id`) REFERENCES `reviews`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `review_reactions` ADD CONSTRAINT `review_reactions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users_profile`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
