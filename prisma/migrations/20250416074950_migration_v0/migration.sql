-- CreateTable
CREATE TABLE `app_releases` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `release_version` VARCHAR(64) NOT NULL,
    `app_name` ENUM('mobile_rating', 'tablet_rating', 'tablet_qms_o') NOT NULL,
    `platform` ENUM('android', 'ios') NOT NULL,
    `release_note` TEXT NULL,
    `release_url` VARCHAR(255) NOT NULL,
    `minimum_version` VARCHAR(64) NOT NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `appointments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(255) NOT NULL,
    `registry_type` SMALLINT NOT NULL,
    `institution_id` INTEGER NULL,
    `service_id` INTEGER NULL,
    `operator_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `reason` VARCHAR(255) NOT NULL,
    `date` TIMESTAMP(0) NOT NULL,
    `start_time` TIMESTAMP(0) NOT NULL,
    `end_time` TIMESTAMP(0) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `additional_note` VARCHAR(255) NOT NULL,
    `creator_id` INTEGER NOT NULL,
    `recurring` SMALLINT NULL DEFAULT 0,
    `notification_status` SMALLINT NULL DEFAULT 1,
    `ticket_created` SMALLINT NULL DEFAULT 0,
    `appointment_cancelled` SMALLINT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `cancellation_reason` TEXT NULL,

    INDEX `fk_appointment_creator`(`creator_id`),
    INDEX `fk_appointment_institution`(`institution_id`),
    INDEX `fk_appointment_operator`(`operator_id`),
    INDEX `fk_appointment_service`(`service_id`),
    INDEX `fk_appointment_user`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `apps` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    `status` INTEGER NOT NULL DEFAULT 0,
    `institution_id` INTEGER NOT NULL,
    `secret_key` VARCHAR(255) NULL,
    `access_key` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_app_institution_id`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `audit_trail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `old_value` TEXT NULL,
    `new_value` TEXT NULL,
    `action` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `field` VARCHAR(255) NULL,
    `user_id` INTEGER NULL,
    `ip` VARCHAR(255) NULL,
    `user_agent` VARCHAR(255) NULL,
    `model_id` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NULL,
    `time` DATETIME(0) NOT NULL,
    `status` ENUM('1', '2', '3') NULL,
    `reviewed_by` INTEGER NULL,

    INDEX `idx_audit_trail_action`(`action`),
    INDEX `idx_audit_trail_field`(`field`),
    INDEX `idx_audit_trail_ip`(`ip`),
    INDEX `idx_audit_trail_model`(`model`),
    INDEX `idx_audit_trail_model_id`(`model_id`),
    INDEX `idx_audit_trail_user_agent`(`user_agent`),
    INDEX `idx_audit_trail_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sector` VARCHAR(45) NOT NULL,
    `name` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `change_request` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `old_value` TEXT NULL,
    `new_value` TEXT NULL,
    `action` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `model_id` INTEGER NULL,
    `user_id` INTEGER NOT NULL,
    `ip` VARCHAR(255) NULL,
    `user_agent` VARCHAR(255) NULL,
    `display_name` VARCHAR(255) NULL,
    `status` BOOLEAN NULL DEFAULT true,
    `reviewed_by` INTEGER NULL,
    `time` DATETIME(0) NOT NULL,
    `institution_id` INTEGER NULL,

    INDEX `idx_change_request_action`(`action`),
    INDEX `idx_change_request_ip`(`ip`),
    INDEX `idx_change_request_model`(`model`),
    INDEX `idx_change_request_model_id`(`model_id`),
    INDEX `idx_change_request_user_agent`(`user_agent`),
    INDEX `idx_change_request_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `device` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(64) NULL,
    `notification_token` VARCHAR(255) NULL,
    `affiliate_id` INTEGER NULL,
    `service_id` VARCHAR(256) NULL,
    `serial_number` VARCHAR(255) NULL,
    `status` INTEGER NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `device_type` TINYINT NOT NULL DEFAULT 1,
    `gender` INTEGER NULL,
    `age_range` INTEGER NULL,
    `language` INTEGER NULL,
    `notification_enabled` BOOLEAN NULL DEFAULT false,
    `apiKey` VARCHAR(225) NULL,
    `nonce` INTEGER NULL DEFAULT 0,
    `linkShortCode` VARCHAR(16) NULL,
    `linkShortCodeExp` DATETIME(0) NULL,
    `phone_number` VARCHAR(64) NULL,
    `latest_hb` DATETIME(0) NULL,
    `latest_hb_version` VARCHAR(64) NULL,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `uuid`(`uuid`),
    INDEX `fk_device_affiliate`(`affiliate_id`),
    INDEX `fk_service_device`(`service_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `device_heartbeat` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `device_id` INTEGER NULL,
    `operator_id` INTEGER NULL,
    `version` VARCHAR(64) NULL,

    INDEX `device_id_idx`(`device_id`),
    INDEX `operator_id_idx`(`operator_id`),
    INDEX `time_idx`(`time`),
    INDEX `version_idx`(`version`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `institution` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(64) NULL,
    `name` VARCHAR(45) NOT NULL,
    `search_term` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `address` VARCHAR(255) NULL,
    `phone_number` VARCHAR(45) NULL,
    `url` VARCHAR(255) NULL,
    `status` TINYINT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `plan` INTEGER NULL,
    `type` INTEGER NULL,
    `level` TINYINT NULL DEFAULT 2,
    `parent_id` INTEGER NULL,
    `good_ratings` INTEGER NULL,
    `bad_ratings` INTEGER NULL,
    `excellent_ratings` INTEGER NULL,
    `nps` INTEGER NULL,
    `csat` INTEGER NULL,
    `queue_autocreation` TINYINT NULL DEFAULT 0,
    `queue_manual_creation` TINYINT NULL DEFAULT 1,
    `working_hours` VARCHAR(256) NULL,
    `qms_message` VARCHAR(256) NULL,
    `priority_list` LONGTEXT NULL,
    `logo` VARCHAR(255) NULL,
    `app_name` VARCHAR(255) NULL,
    `allowed_context` TINYINT NULL DEFAULT 1,
    `host_name` VARCHAR(255) NULL,
    `membership_type` INTEGER NOT NULL DEFAULT 1,
    `category_id` INTEGER NULL,
    `latest_membership_renew_time` DATETIME(0) NULL,

    UNIQUE INDEX `institution_uuid`(`uuid`),
    INDEX `fk_category_id`(`category_id`),
    INDEX `fk_institution_plan`(`plan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `institution_invoices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `invoice_number` TEXT NOT NULL,
    `institution_id` SMALLINT NOT NULL,
    `institution_name` TEXT NOT NULL,
    `period_start` DATETIME(0) NOT NULL,
    `period_end` DATETIME(0) NOT NULL,
    `generated_at` TIMESTAMP(0) NOT NULL,
    `expiry` TIMESTAMP(0) NOT NULL,
    `payment_reference_number` TEXT NOT NULL,
    `ext_payment_reference_number` TEXT NULL,
    `payment_status` ENUM('FAILED', 'PENDING', 'COMPLETED') NOT NULL,
    `payment_status_desc` TEXT NULL,
    `payment_method` TEXT NULL,
    `payment_retries` SMALLINT NULL,
    `status` ENUM('PENDING', 'EXPIRED', 'PAID', 'CANCELED') NOT NULL,
    `total_amount` FLOAT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `institution_service_tracking` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NULL,
    `branch_id` INTEGER NULL,
    `service_id` INTEGER NULL,
    `branch_name` VARCHAR(255) NULL,
    `service_group_name` VARCHAR(255) NULL,
    `time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `action` BOOLEAN NULL DEFAULT false,
    `status` BOOLEAN NULL DEFAULT true,
    `invoice_number` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `login_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `ip` VARCHAR(255) NULL,
    `user_agent` VARCHAR(255) NULL,
    `time` DATETIME(0) NOT NULL,

    INDEX `idx_audit_trail_ip`(`ip`),
    INDEX `idx_audit_trail_user_agent`(`user_agent`),
    INDEX `idx_audit_trail_user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migration` (
    `version` VARCHAR(180) NOT NULL,
    `apply_time` INTEGER NULL,

    PRIMARY KEY (`version`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mms_file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `device_uuid` VARCHAR(255) NOT NULL,
    `institution_id` INTEGER NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `comment` VARCHAR(5000) NULL,
    `type` SMALLINT NOT NULL,
    `longitude` DOUBLE NULL,
    `latitude` DOUBLE NULL,
    `height` INTEGER NULL,
    `width` INTEGER NULL,
    `first_view_time` TIMESTAMP(0) NULL,
    `last_view_time` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NULL,
    `content` VARCHAR(255) NOT NULL,
    `link` VARCHAR(255) NULL,
    `seen` BOOLEAN NULL,
    `time_sent` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `time_seen` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification_recipient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_notification` INTEGER NOT NULL,
    `id_user` INTEGER NULL,
    `seen` INTEGER NULL,
    `ticket` INTEGER NULL,
    `reference_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `option` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(128) NULL,
    `description` TEXT NULL,
    `type` INTEGER NULL,
    `parent_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `popup_questions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name_en` VARCHAR(255) NOT NULL,
    `name_fr` VARCHAR(255) NULL,
    `name_rw` VARCHAR(255) NULL,
    `name_sw` VARCHAR(255) NULL,
    `service_id` TEXT NOT NULL,
    `description_en` VARCHAR(255) NOT NULL,
    `description_fr` VARCHAR(255) NULL,
    `description_rw` VARCHAR(255) NULL,
    `description_sw` VARCHAR(255) NULL,
    `applies_to_bad` BOOLEAN NOT NULL DEFAULT true,
    `applies_to_good` BOOLEAN NOT NULL DEFAULT false,
    `applies_to_excellent` BOOLEAN NOT NULL DEFAULT false,
    `institution_id` INTEGER NOT NULL,
    `status` BOOLEAN NULL DEFAULT false,
    `type` TINYINT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_institution`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `popup_questions_answers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `device_id` INTEGER NOT NULL,
    `rating_id` INTEGER NULL,
    `ticket_id` INTEGER NULL,
    `answer_id` INTEGER NOT NULL,
    `answered_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_popup_questions_possible_answers`(`answer_id`),
    INDEX `popup_questions_answers_device_id`(`device_id`),
    INDEX `popup_questions_answers_rating_id`(`rating_id`),
    INDEX `popup_questions_answers_ticket_id`(`ticket_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `popup_questions_possible_answers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `popup_question_id` INTEGER NOT NULL,
    `answer_en` VARCHAR(255) NOT NULL,
    `answer_fr` VARCHAR(255) NOT NULL,
    `answer_rw` VARCHAR(255) NOT NULL,
    `answer_sw` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `priority` INTEGER NULL,

    INDEX `fk_popup_questions_answers`(`popup_question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_branch_operator` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `operator_id` INTEGER NOT NULL,
    `institution_id` INTEGER NOT NULL,
    `service_id` TEXT NOT NULL,
    `linked_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` TINYINT NOT NULL DEFAULT 1,

    INDEX `fk_qms_branch_operator_institution`(`institution_id`),
    INDEX `fk_qms_operator`(`operator_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_branch_transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `affiliate_id` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `note` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `last_updated` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `idx_unique_column`(`affiliate_id`, `date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_counter` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `service_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_service`(`service_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_uuid` VARCHAR(64) NOT NULL,
    `device_id` INTEGER NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(64) NULL,
    `email` VARCHAR(255) NULL,
    `has_priority_service` BOOLEAN NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `device_id`(`device_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_operator` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `operator_uuid` VARCHAR(64) NOT NULL,
    `institution_id` INTEGER NULL,
    `name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NULL,
    `is_active` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `email_address` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(64) NULL,
    `terminal` BOOLEAN NULL DEFAULT false,

    INDEX `fk_qms_operator_institution`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_operator_transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `branch_transaction_id` INTEGER NOT NULL,
    `operator_id` INTEGER NOT NULL,
    `transaction` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `last_updated` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_branch_transactions`(`branch_transaction_id`),
    INDEX `fk_operator`(`operator_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_queue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `queue_uuid` VARCHAR(64) NOT NULL,
    `service_id` INTEGER NOT NULL,
    `queue_date` DATE NOT NULL,
    `start_time` TIME(0) NOT NULL,
    `end_time` TIME(0) NOT NULL,
    `status` ENUM('open', 'paused', 'stopped', 'closed') NOT NULL,
    `avg_service_time` FLOAT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `closure_notification` TINYINT NOT NULL DEFAULT 0,
    `inter_arrival_time` FLOAT NULL,

    INDEX `qms_queue_ibfk_1`(`service_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_queue_operator_lnk` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `queue_id` INTEGER NOT NULL,
    `operator_id` INTEGER NOT NULL,
    `operator_uuid` VARCHAR(64) NULL,
    `counter_id` INTEGER NULL,
    `first_login` TIMESTAMP(0) NULL,
    `last_logout` TIMESTAMP(0) NULL,
    `api_key` VARCHAR(64) NULL,

    INDEX `qms_queue_operator_lnk_ibfk_1`(`queue_id`),
    INDEX `qms_queue_operator_lnk_ibfk_2`(`operator_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_ticket` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ticket_uuid` VARCHAR(64) NOT NULL,
    `queue_id` INTEGER NOT NULL,
    `customer_id` INTEGER NOT NULL,
    `ticket_number` VARCHAR(64) NOT NULL,
    `full_ticket_number` VARCHAR(255) NULL,
    `pin` INTEGER NOT NULL,
    `status` TINYINT NULL DEFAULT 1,
    `service_time` FLOAT NULL,
    `estimated_waiting_time` INTEGER NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `waiting_ended_on` TIMESTAMP(0) NULL,
    `skipped_at` TIMESTAMP(0) NULL,
    `cancelled_at` TIMESTAMP(0) NULL,
    `on_hold_from` TIMESTAMP(0) NULL,
    `skips_count` INTEGER NULL DEFAULT 0,
    `prioritized` BOOLEAN NULL DEFAULT false,
    `reason_id` INTEGER NULL,
    `prioritized_at` TIMESTAMP(0) NULL,
    `is_next` BOOLEAN NULL DEFAULT false,
    `prev_ticket_id` INTEGER NULL,
    `rating_notification_sent` TINYINT NOT NULL DEFAULT 0,
    `source` TINYINT NOT NULL DEFAULT 2,

    INDEX `customer_id`(`customer_id`),
    INDEX `fk_reason_option`(`reason_id`),
    INDEX `queue_id`(`queue_id`),
    UNIQUE INDEX `idx-unique-qms_ticket-queue_id-ticket_number`(`queue_id`, `ticket_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `qms_ticket_assignment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ticket_id` INTEGER NOT NULL,
    `queue_id` INTEGER NULL,
    `operator_id` INTEGER NULL,
    `counter_id` INTEGER NULL,
    `status` TINYINT NULL DEFAULT 1,
    `started_at` TIMESTAMP(0) NULL,
    `completed_at` TIMESTAMP(0) NULL,
    `assigned_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `state` TINYINT NULL DEFAULT 1,
    `comment` TEXT NULL,

    INDEX `operator_id`(`operator_id`),
    INDEX `qms_ticket_assignment_ibfk_1`(`ticket_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rating` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `state` BOOLEAN NOT NULL,
    `time` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `service_id` INTEGER NOT NULL,
    `comment` TEXT NULL,
    `gender` INTEGER NULL,
    `age_range` INTEGER NULL,
    `location` INTEGER NULL,
    `device_id` INTEGER NULL,
    `nps_score` INTEGER NULL,
    `ticket_id` INTEGER NULL,
    `finger_print` VARCHAR(255) NULL,

    INDEX `fk1_service_id`(`service_id`),
    INDEX `fk_device`(`device_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rating_assets` (
    `rating_assets_id` INTEGER NOT NULL AUTO_INCREMENT,
    `rating_assets_image` VARCHAR(45) NULL,
    `rating_assets_video` VARCHAR(35) NULL,
    `rating_id` BIGINT NULL,

    INDEX `fk_rating_id`(`rating_id`),
    PRIMARY KEY (`rating_assets_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rating_qr_code_sessions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_uuid` VARCHAR(255) NULL,
    `service_uuid` VARCHAR(255) NULL,
    `user_agent` VARCHAR(255) NOT NULL,
    `finger_print` VARCHAR(255) NOT NULL,
    `ip_address` VARCHAR(255) NOT NULL,
    `session_token` VARCHAR(255) NOT NULL,
    `session_expiration` TIMESTAMP(0) NOT NULL,
    `status` ENUM('Open', 'Close') NOT NULL DEFAULT 'Open',
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `session_token`(`session_token`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rating_reply` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `specific` BOOLEAN NULL,
    `rating_id` INTEGER NULL,
    `time` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `reply` VARCHAR(2000) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `institution_id` INTEGER NOT NULL,
    `service_ids` LONGTEXT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `report_created_by` INTEGER NOT NULL,
    `report_institution_id` LONGTEXT NOT NULL,
    `report_recipient` LONGTEXT NOT NULL,
    `report_queue_uuid` VARCHAR(36) NOT NULL,
    `report_content_key` VARCHAR(255) NULL,
    `status` INTEGER NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `report_queue_uuid`(`report_queue_uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `request_institution` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `owner_name` VARCHAR(45) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(45) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `category` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `business_certificate` VARCHAR(255) NOT NULL,
    `product_type` VARCHAR(255) NOT NULL,
    `approval_status` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `institution_id` INTEGER NULL,
    `status` TINYINT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `bad_rating_threshold` INTEGER NULL DEFAULT 10,
    `group` INTEGER NULL,
    `good_ratings` INTEGER NULL,
    `bad_ratings` INTEGER NULL,
    `excellent_ratings` INTEGER NULL,
    `nps` INTEGER NULL,
    `csat` INTEGER NULL,
    `mean_service_time` INTEGER NULL DEFAULT 5,
    `avg_service_time` FLOAT NULL,
    `uuid` VARCHAR(255) NULL,
    `inter_arrival_time` FLOAT NULL,
    `estimated_time` FLOAT NULL,

    INDEX `fk_institution_id`(`institution_id`),
    INDEX `fk_service_group`(`group`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_group` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `name_rw` VARCHAR(255) NULL,
    `name_fr` VARCHAR(255) NULL,
    `name_sw` VARCHAR(255) NULL,
    `search_term` VARCHAR(255) NULL,
    `institution_id` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `uuid` VARCHAR(255) NULL,
    `status` INTEGER NULL,
    `good_ratings` INTEGER NULL,
    `bad_ratings` INTEGER NULL,
    `excellent_ratings` INTEGER NULL,
    `nps` INTEGER NULL,
    `csat` INTEGER NULL,
    `mean_service_time` INTEGER NULL DEFAULT 5,
    `ticket_prefix` VARCHAR(64) NULL,
    `bad_rating_threshold` INTEGER NULL,

    INDEX `fk_service_group_institution_id`(`institution_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `survey` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(64) NULL,
    `type` BOOLEAN NULL DEFAULT true,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NULL,
    `survey_data` LONGTEXT NULL,
    `institution_id` INTEGER NOT NULL,
    `service_id` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `status` BOOLEAN NULL DEFAULT false,
    `access_key` VARCHAR(64) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `survey_result` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `survey_id` INTEGER NOT NULL,
    `rating_id` INTEGER NULL,
    `service_id` INTEGER NULL,
    `device_id` INTEGER NULL,
    `agent` TEXT NULL,
    `result_data` LONGTEXT NOT NULL,
    `replied_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `services` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_by` INTEGER NOT NULL,
    `updated_by` INTEGER NULL,
    `status` BOOLEAN NULL DEFAULT false,

    INDEX `fk-tags-created_by`(`created_by`),
    INDEX `fk-tags-updated_by`(`updated_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tip` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `collection_reference_id` VARCHAR(255) NOT NULL,
    `disbursement_reference_id` VARCHAR(255) NOT NULL,
    `device_id` INTEGER NOT NULL,
    `rating_id` BIGINT NULL,
    `payee` VARCHAR(64) NOT NULL,
    `payer` VARCHAR(64) NOT NULL,
    `amount` INTEGER NOT NULL,
    `tip_amount` INTEGER NOT NULL,
    `collection_status` VARCHAR(64) NULL,
    `collection_status_details` LONGTEXT NULL,
    `closed_at` TIMESTAMP(0) NULL,
    `disbursed_at` TIMESTAMP(0) NULL,
    `disbursement_status` VARCHAR(64) NULL,
    `disbursement_status_details` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_tip_device`(`device_id`),
    INDEX `fk_tip_rating`(`rating_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `title` VARCHAR(255) NULL,
    `phone_number` VARCHAR(15) NULL,
    `username` VARCHAR(255) NOT NULL,
    `auth_key` VARCHAR(32) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `password_reset_token` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `status` BOOLEAN NOT NULL DEFAULT true,
    `role` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `verification_token` VARCHAR(255) NULL,
    `allowed_context` TINYINT NULL DEFAULT 1,
    `institution_id` TEXT NULL,
    `last_received_hb_alert_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `last_received_rating_notification_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `language` VARCHAR(64) NULL,
    `notifications_enabled` BOOLEAN NULL DEFAULT true,
    `last_login` DATETIME(0) NULL,
    `allow_auto_approved_changes` BOOLEAN NULL DEFAULT false,

    UNIQUE INDEX `username`(`username`),
    UNIQUE INDEX `password_reset_token`(`password_reset_token`),
    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- CreateTable
CREATE TABLE `wallet_accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `account_type_id` INTEGER NULL,
    `account_number` VARCHAR(255) NULL,
    `account_name` VARCHAR(255) NULL,
    `balance` FLOAT NULL,
    `public_key` VARCHAR(255) NULL,
    `private_key` VARCHAR(255) NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet_accounts_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(255) NULL,
    `abbreviation` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `added_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet_transfers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `amount` FLOAT NULL,
    `currency` VARCHAR(64) NULL,
    `time` DATETIME(0) NULL,
    `payer_id` INTEGER NULL,
    `payer_account_id` INTEGER NULL,
    `payee_address` VARCHAR(255) NULL,
    `payee_name` VARCHAR(255) NULL,
    `payee_account_type` VARCHAR(255) NULL,
    `payee_account_number` VARCHAR(255) NULL,
    `payee_type` VARCHAR(255) NULL,
    `tx_id` VARCHAR(255) NULL,
    `fspid` VARCHAR(255) NULL,
    `ext_trx_id` VARCHAR(255) NULL,
    `pay_money_ext_res` LONGTEXT NULL,
    `confirm_party_ext_res` LONGTEXT NULL,
    `confirm_quote_ext_res` LONGTEXT NULL,
    `status` VARCHAR(255) NULL,
    `quote_id` VARCHAR(255) NULL,
    `note` VARCHAR(255) NULL,
    `transfer_fees` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet_users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `device_id` INTEGER NULL,
    `fullname` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `private_key` VARCHAR(255) NULL,
    `public_key` VARCHAR(255) NULL,
    `initiated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_creator` FOREIGN KEY (`creator_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_service` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `fk_appointment_user` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `apps` ADD CONSTRAINT `fk_app_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `device` ADD CONSTRAINT `fk_device_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `institution` ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `popup_questions` ADD CONSTRAINT `fk_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `popup_questions_answers` ADD CONSTRAINT `fk_popup_questions_possible_answers` FOREIGN KEY (`answer_id`) REFERENCES `popup_questions_possible_answers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `popup_questions_possible_answers` ADD CONSTRAINT `fk_popup_questions_answers` FOREIGN KEY (`popup_question_id`) REFERENCES `popup_questions`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_branch_operator` ADD CONSTRAINT `fk_qms_branch_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_branch_operator` ADD CONSTRAINT `fk_qms_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_branch_transactions` ADD CONSTRAINT `fk_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_counter` ADD CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_customer` ADD CONSTRAINT `qms_customer_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_operator` ADD CONSTRAINT `fk_qms_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_operator_transactions` ADD CONSTRAINT `fk_branch_transactions` FOREIGN KEY (`branch_transaction_id`) REFERENCES `qms_branch_transactions`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_operator_transactions` ADD CONSTRAINT `fk_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_queue` ADD CONSTRAINT `qms_queue_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_queue_operator_lnk` ADD CONSTRAINT `qms_queue_operator_lnk_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_queue_operator_lnk` ADD CONSTRAINT `qms_queue_operator_lnk_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `fk_reason_option` FOREIGN KEY (`reason_id`) REFERENCES `option`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `qms_ticket_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `qms_customer`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_ticket` ADD CONSTRAINT `qms_ticket_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_ticket_assignment` ADD CONSTRAINT `qms_ticket_assignment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `qms_ticket`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `qms_ticket_assignment` ADD CONSTRAINT `qms_ticket_assignment_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rating` ADD CONSTRAINT `fk1_service_id` FOREIGN KEY (`service_id`) REFERENCES `service`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rating` ADD CONSTRAINT `fk_device` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `rating_assets` ADD CONSTRAINT `fk_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `service` ADD CONSTRAINT `fk_service_group` FOREIGN KEY (`group`) REFERENCES `service_group`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `service` ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `service_group` ADD CONSTRAINT `fk_service_group_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tags` ADD CONSTRAINT `fk-tags-created_by` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tags` ADD CONSTRAINT `fk-tags-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tip` ADD CONSTRAINT `fk_tip_device` FOREIGN KEY (`device_id`) REFERENCES `device`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tip` ADD CONSTRAINT `fk_tip_rating` FOREIGN KEY (`rating_id`) REFERENCES `rating`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
