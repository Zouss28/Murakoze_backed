-- AlterTable
ALTER TABLE `images` ADD COLUMN `review_id` INTEGER NULL;

-- CreateIndex
CREATE INDEX `fk_review_id` ON `images`(`review_id`);

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `fk_review_id` FOREIGN KEY (`review_id`) REFERENCES `reviews`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
