/*
  Warnings:

  - You are about to drop the column `institution_id` on the `price_ranges` table. All the data in the column will be lost.
  - Added the required column `category_id` to the `price_ranges` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `price_ranges` DROP FOREIGN KEY `fk_price_range_id`;

-- DropIndex
DROP INDEX `fk_price_range_id` ON `price_ranges`;

-- AlterTable
ALTER TABLE `institution` ADD COLUMN `price_range_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `price_ranges` DROP COLUMN `institution_id`,
    ADD COLUMN `category_id` INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX `fk_price_id` ON `institution`(`price_range_id`);

-- CreateIndex
CREATE INDEX `fk_price_range_id` ON `price_ranges`(`category_id`);

-- AddForeignKey
ALTER TABLE `institution` ADD CONSTRAINT `fk_price_id` FOREIGN KEY (`price_range_id`) REFERENCES `price_ranges`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `price_ranges` ADD CONSTRAINT `fk_price_range_id` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
