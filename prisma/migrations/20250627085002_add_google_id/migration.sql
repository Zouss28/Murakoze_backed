/*
  Warnings:

  - A unique constraint covering the columns `[googleId]` on the table `users_profile` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `users_profile` ADD COLUMN `googleId` VARCHAR(191) NULL,
    ADD COLUMN `refreshToken` VARCHAR(244) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `users_profile_googleId_key` ON `users_profile`(`googleId`);
