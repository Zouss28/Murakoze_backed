/*
  Warnings:

  - You are about to alter the column `open_time` on the `workingHour` table. The data in that column could be lost. The data in that column will be cast from `VarChar(120)` to `Time(0)`.
  - You are about to alter the column `close_time` on the `workingHour` table. The data in that column could be lost. The data in that column will be cast from `VarChar(120)` to `Time(0)`.

*/
-- AlterTable
ALTER TABLE `workingHour` MODIFY `open_time` TIME(0) NULL,
    MODIFY `close_time` TIME(0) NULL;
