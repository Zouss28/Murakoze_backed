/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `users_profile` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `unique_email` ON `users_profile`(`email`);
