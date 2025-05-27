-- AlterTable
ALTER TABLE `users_profile` ADD COLUMN `isVerified` BOOLEAN NULL,
    ADD COLUMN `verifyToken` VARCHAR(255) NULL;
