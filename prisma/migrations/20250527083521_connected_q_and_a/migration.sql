-- CreateIndex
CREATE INDEX `fk_Serv_id` ON `surveyAnswers`(`question_id`);

-- AddForeignKey
ALTER TABLE `surveyAnswers` ADD CONSTRAINT `fk_Serv_id` FOREIGN KEY (`question_id`) REFERENCES `surveyQuestions`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
