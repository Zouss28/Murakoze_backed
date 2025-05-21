/*
  Warnings:

  - You are about to drop the column `price_range_id` on the `institution` table. All the data in the column will be lost.
  - You are about to drop the column `category_id` on the `price_ranges` table. All the data in the column will be lost.
  - Added the required column `institution_id` to the `price_ranges` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `institution` DROP FOREIGN KEY `fk_price_id`;

-- DropForeignKey
ALTER TABLE `price_ranges` DROP FOREIGN KEY `fk_price_range_id`;

-- DropIndex
DROP INDEX `fk_price_id` ON `institution`;

-- DropIndex
DROP INDEX `fk_price_range_id` ON `price_ranges`;

-- AlterTable
ALTER TABLE `institution` DROP COLUMN `price_range_id`;

-- AlterTable
ALTER TABLE `price_ranges` DROP COLUMN `category_id`,
    ADD COLUMN `institution_id` INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX `fk_price_range` ON `price_ranges`(`institution_id`);

-- AddForeignKey
ALTER TABLE `price_ranges` ADD CONSTRAINT `fk_price_range` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
