
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal,
  objectEnumValues,
  makeStrictEnum,
  Public,
  getRuntime,
  skip
} = require('./runtime/index-browser.js')


const Prisma = {}

exports.Prisma = Prisma
exports.$Enums = {}

/**
 * Prisma Client JS version: 6.6.0
 * Query Engine version: f676762280b54cd07c770017ed3711ddde35f37a
 */
Prisma.prismaVersion = {
  client: "6.6.0",
  engine: "f676762280b54cd07c770017ed3711ddde35f37a"
}

Prisma.PrismaClientKnownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientKnownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientUnknownRequestError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientRustPanicError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientRustPanicError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientInitializationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientInitializationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.PrismaClientValidationError = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`PrismaClientValidationError is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`sqltag is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.empty = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`empty is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.join = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`join is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.raw = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`raw is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.validator = Public.validator

/**
* Extensions
*/
Prisma.getExtensionContext = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.getExtensionContext is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}
Prisma.defineExtension = () => {
  const runtimeName = getRuntime().prettyName;
  throw new Error(`Extensions.defineExtension is unable to run in this browser environment, or has been bundled for the browser (running in ${runtimeName}).
In case this error is unexpected for you, please report it in https://pris.ly/prisma-prisma-bug-report`,
)}

/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = objectEnumValues.instances.DbNull
Prisma.JsonNull = objectEnumValues.instances.JsonNull
Prisma.AnyNull = objectEnumValues.instances.AnyNull

Prisma.NullTypes = {
  DbNull: objectEnumValues.classes.DbNull,
  JsonNull: objectEnumValues.classes.JsonNull,
  AnyNull: objectEnumValues.classes.AnyNull
}



/**
 * Enums
 */

exports.Prisma.TransactionIsolationLevel = makeStrictEnum({
  ReadUncommitted: 'ReadUncommitted',
  ReadCommitted: 'ReadCommitted',
  RepeatableRead: 'RepeatableRead',
  Serializable: 'Serializable'
});

exports.Prisma.App_releasesScalarFieldEnum = {
  id: 'id',
  release_version: 'release_version',
  app_name: 'app_name',
  platform: 'platform',
  release_note: 'release_note',
  release_url: 'release_url',
  minimum_version: 'minimum_version',
  added_at: 'added_at'
};

exports.Prisma.AppointmentsScalarFieldEnum = {
  id: 'id',
  name: 'name',
  email: 'email',
  phone: 'phone',
  registry_type: 'registry_type',
  institution_id: 'institution_id',
  service_id: 'service_id',
  operator_id: 'operator_id',
  user_id: 'user_id',
  reason: 'reason',
  date: 'date',
  start_time: 'start_time',
  end_time: 'end_time',
  location: 'location',
  additional_note: 'additional_note',
  creator_id: 'creator_id',
  recurring: 'recurring',
  notification_status: 'notification_status',
  ticket_created: 'ticket_created',
  appointment_cancelled: 'appointment_cancelled',
  created_at: 'created_at',
  cancellation_reason: 'cancellation_reason'
};

exports.Prisma.AppsScalarFieldEnum = {
  id: 'id',
  name: 'name',
  status: 'status',
  institution_id: 'institution_id',
  secret_key: 'secret_key',
  access_key: 'access_key',
  created_at: 'created_at',
  updated_at: 'updated_at'
};

exports.Prisma.Audit_trailScalarFieldEnum = {
  id: 'id',
  old_value: 'old_value',
  new_value: 'new_value',
  action: 'action',
  model: 'model',
  field: 'field',
  user_id: 'user_id',
  ip: 'ip',
  user_agent: 'user_agent',
  model_id: 'model_id',
  display_name: 'display_name',
  time: 'time',
  status: 'status',
  reviewed_by: 'reviewed_by'
};

exports.Prisma.CategoriesScalarFieldEnum = {
  id: 'id',
  name: 'name',
  sector_id: 'sector_id'
};

exports.Prisma.Change_requestScalarFieldEnum = {
  id: 'id',
  old_value: 'old_value',
  new_value: 'new_value',
  action: 'action',
  model: 'model',
  model_id: 'model_id',
  user_id: 'user_id',
  ip: 'ip',
  user_agent: 'user_agent',
  display_name: 'display_name',
  status: 'status',
  reviewed_by: 'reviewed_by',
  time: 'time',
  institution_id: 'institution_id'
};

exports.Prisma.DeviceScalarFieldEnum = {
  id: 'id',
  uuid: 'uuid',
  notification_token: 'notification_token',
  affiliate_id: 'affiliate_id',
  service_id: 'service_id',
  serial_number: 'serial_number',
  status: 'status',
  created_at: 'created_at',
  device_type: 'device_type',
  gender: 'gender',
  age_range: 'age_range',
  language: 'language',
  notification_enabled: 'notification_enabled',
  apiKey: 'apiKey',
  nonce: 'nonce',
  linkShortCode: 'linkShortCode',
  linkShortCodeExp: 'linkShortCodeExp',
  phone_number: 'phone_number',
  latest_hb: 'latest_hb',
  latest_hb_version: 'latest_hb_version',
  updated_at: 'updated_at'
};

exports.Prisma.Device_heartbeatScalarFieldEnum = {
  id: 'id',
  time: 'time',
  device_id: 'device_id',
  operator_id: 'operator_id',
  version: 'version'
};

exports.Prisma.InstitutionScalarFieldEnum = {
  id: 'id',
  uuid: 'uuid',
  name: 'name',
  search_term: 'search_term',
  email: 'email',
  address: 'address',
  phone_number: 'phone_number',
  url: 'url',
  status: 'status',
  created_at: 'created_at',
  plan: 'plan',
  type: 'type',
  level: 'level',
  parent_id: 'parent_id',
  good_ratings: 'good_ratings',
  bad_ratings: 'bad_ratings',
  excellent_ratings: 'excellent_ratings',
  nps: 'nps',
  csat: 'csat',
  queue_autocreation: 'queue_autocreation',
  queue_manual_creation: 'queue_manual_creation',
  working_hours: 'working_hours',
  qms_message: 'qms_message',
  priority_list: 'priority_list',
  logo: 'logo',
  app_name: 'app_name',
  allowed_context: 'allowed_context',
  host_name: 'host_name',
  membership_type: 'membership_type',
  category_id: 'category_id',
  latest_membership_renew_time: 'latest_membership_renew_time',
  description: 'description',
  latitude: 'latitude',
  longitude: 'longitude',
  button_one: 'button_one',
  button_two: 'button_two',
  amenities: 'amenities'
};

exports.Prisma.Institution_invoicesScalarFieldEnum = {
  id: 'id',
  invoice_number: 'invoice_number',
  institution_id: 'institution_id',
  institution_name: 'institution_name',
  period_start: 'period_start',
  period_end: 'period_end',
  generated_at: 'generated_at',
  expiry: 'expiry',
  payment_reference_number: 'payment_reference_number',
  ext_payment_reference_number: 'ext_payment_reference_number',
  payment_status: 'payment_status',
  payment_status_desc: 'payment_status_desc',
  payment_method: 'payment_method',
  payment_retries: 'payment_retries',
  status: 'status',
  total_amount: 'total_amount'
};

exports.Prisma.Institution_service_trackingScalarFieldEnum = {
  id: 'id',
  institution_id: 'institution_id',
  branch_id: 'branch_id',
  service_id: 'service_id',
  branch_name: 'branch_name',
  service_group_name: 'service_group_name',
  time: 'time',
  action: 'action',
  status: 'status',
  invoice_number: 'invoice_number'
};

exports.Prisma.Login_historyScalarFieldEnum = {
  id: 'id',
  user_id: 'user_id',
  ip: 'ip',
  user_agent: 'user_agent',
  time: 'time'
};

exports.Prisma.MigrationScalarFieldEnum = {
  version: 'version',
  apply_time: 'apply_time'
};

exports.Prisma.Mms_fileScalarFieldEnum = {
  id: 'id',
  device_uuid: 'device_uuid',
  institution_id: 'institution_id',
  path: 'path',
  comment: 'comment',
  type: 'type',
  longitude: 'longitude',
  latitude: 'latitude',
  height: 'height',
  width: 'width',
  first_view_time: 'first_view_time',
  last_view_time: 'last_view_time',
  created_at: 'created_at'
};

exports.Prisma.NotificationScalarFieldEnum = {
  id: 'id',
  title: 'title',
  content: 'content',
  link: 'link',
  seen: 'seen',
  time_sent: 'time_sent',
  time_seen: 'time_seen'
};

exports.Prisma.Notification_recipientScalarFieldEnum = {
  id: 'id',
  id_notification: 'id_notification',
  id_user: 'id_user',
  seen: 'seen',
  ticket: 'ticket',
  reference_id: 'reference_id'
};

exports.Prisma.OptionScalarFieldEnum = {
  id: 'id',
  name: 'name',
  description: 'description',
  type: 'type',
  parent_id: 'parent_id',
  created_at: 'created_at'
};

exports.Prisma.Popup_questionsScalarFieldEnum = {
  id: 'id',
  name_en: 'name_en',
  name_fr: 'name_fr',
  name_rw: 'name_rw',
  name_sw: 'name_sw',
  service_id: 'service_id',
  description_en: 'description_en',
  description_fr: 'description_fr',
  description_rw: 'description_rw',
  description_sw: 'description_sw',
  applies_to_bad: 'applies_to_bad',
  applies_to_good: 'applies_to_good',
  applies_to_excellent: 'applies_to_excellent',
  institution_id: 'institution_id',
  status: 'status',
  type: 'type',
  created_at: 'created_at',
  updated_at: 'updated_at'
};

exports.Prisma.Popup_questions_answersScalarFieldEnum = {
  id: 'id',
  device_id: 'device_id',
  rating_id: 'rating_id',
  ticket_id: 'ticket_id',
  answer_id: 'answer_id',
  answered_at: 'answered_at'
};

exports.Prisma.Popup_questions_possible_answersScalarFieldEnum = {
  id: 'id',
  popup_question_id: 'popup_question_id',
  answer_en: 'answer_en',
  answer_fr: 'answer_fr',
  answer_rw: 'answer_rw',
  answer_sw: 'answer_sw',
  created_at: 'created_at',
  updated_at: 'updated_at',
  priority: 'priority'
};

exports.Prisma.Qms_branch_operatorScalarFieldEnum = {
  id: 'id',
  operator_id: 'operator_id',
  institution_id: 'institution_id',
  service_id: 'service_id',
  linked_at: 'linked_at',
  status: 'status'
};

exports.Prisma.Qms_branch_transactionsScalarFieldEnum = {
  id: 'id',
  affiliate_id: 'affiliate_id',
  date: 'date',
  note: 'note',
  created_at: 'created_at',
  last_updated: 'last_updated'
};

exports.Prisma.Qms_counterScalarFieldEnum = {
  id: 'id',
  name: 'name',
  description: 'description',
  service_id: 'service_id',
  created_at: 'created_at',
  updated_at: 'updated_at'
};

exports.Prisma.Qms_customerScalarFieldEnum = {
  id: 'id',
  customer_uuid: 'customer_uuid',
  device_id: 'device_id',
  name: 'name',
  phone_number: 'phone_number',
  email: 'email',
  has_priority_service: 'has_priority_service',
  created_at: 'created_at',
  updated_at: 'updated_at'
};

exports.Prisma.Qms_operatorScalarFieldEnum = {
  id: 'id',
  operator_uuid: 'operator_uuid',
  institution_id: 'institution_id',
  name: 'name',
  username: 'username',
  password_hash: 'password_hash',
  is_active: 'is_active',
  created_at: 'created_at',
  updated_at: 'updated_at',
  email_address: 'email_address',
  phone_number: 'phone_number',
  terminal: 'terminal'
};

exports.Prisma.Qms_operator_transactionsScalarFieldEnum = {
  id: 'id',
  branch_transaction_id: 'branch_transaction_id',
  operator_id: 'operator_id',
  transaction: 'transaction',
  created_at: 'created_at',
  last_updated: 'last_updated'
};

exports.Prisma.Qms_queueScalarFieldEnum = {
  id: 'id',
  queue_uuid: 'queue_uuid',
  service_id: 'service_id',
  queue_date: 'queue_date',
  start_time: 'start_time',
  end_time: 'end_time',
  status: 'status',
  avg_service_time: 'avg_service_time',
  created_at: 'created_at',
  updated_at: 'updated_at',
  closure_notification: 'closure_notification',
  inter_arrival_time: 'inter_arrival_time'
};

exports.Prisma.Qms_queue_operator_lnkScalarFieldEnum = {
  id: 'id',
  queue_id: 'queue_id',
  operator_id: 'operator_id',
  operator_uuid: 'operator_uuid',
  counter_id: 'counter_id',
  first_login: 'first_login',
  last_logout: 'last_logout',
  api_key: 'api_key'
};

exports.Prisma.Qms_ticketScalarFieldEnum = {
  id: 'id',
  ticket_uuid: 'ticket_uuid',
  queue_id: 'queue_id',
  customer_id: 'customer_id',
  ticket_number: 'ticket_number',
  full_ticket_number: 'full_ticket_number',
  pin: 'pin',
  status: 'status',
  service_time: 'service_time',
  estimated_waiting_time: 'estimated_waiting_time',
  created_at: 'created_at',
  waiting_ended_on: 'waiting_ended_on',
  skipped_at: 'skipped_at',
  cancelled_at: 'cancelled_at',
  on_hold_from: 'on_hold_from',
  skips_count: 'skips_count',
  prioritized: 'prioritized',
  reason_id: 'reason_id',
  prioritized_at: 'prioritized_at',
  is_next: 'is_next',
  prev_ticket_id: 'prev_ticket_id',
  rating_notification_sent: 'rating_notification_sent',
  source: 'source'
};

exports.Prisma.Qms_ticket_assignmentScalarFieldEnum = {
  id: 'id',
  ticket_id: 'ticket_id',
  queue_id: 'queue_id',
  operator_id: 'operator_id',
  counter_id: 'counter_id',
  status: 'status',
  started_at: 'started_at',
  completed_at: 'completed_at',
  assigned_at: 'assigned_at',
  state: 'state',
  comment: 'comment'
};

exports.Prisma.RatingScalarFieldEnum = {
  id: 'id',
  state: 'state',
  time: 'time',
  service_id: 'service_id',
  comment: 'comment',
  gender: 'gender',
  age_range: 'age_range',
  location: 'location',
  device_id: 'device_id',
  nps_score: 'nps_score',
  ticket_id: 'ticket_id',
  finger_print: 'finger_print'
};

exports.Prisma.Rating_assetsScalarFieldEnum = {
  rating_assets_id: 'rating_assets_id',
  rating_assets_image: 'rating_assets_image',
  rating_assets_video: 'rating_assets_video',
  rating_id: 'rating_id'
};

exports.Prisma.Rating_qr_code_sessionsScalarFieldEnum = {
  id: 'id',
  institution_uuid: 'institution_uuid',
  service_uuid: 'service_uuid',
  user_agent: 'user_agent',
  finger_print: 'finger_print',
  ip_address: 'ip_address',
  session_token: 'session_token',
  session_expiration: 'session_expiration',
  status: 'status',
  created_at: 'created_at'
};

exports.Prisma.Rating_replyScalarFieldEnum = {
  id: 'id',
  specific: 'specific',
  rating_id: 'rating_id',
  time: 'time',
  reply: 'reply'
};

exports.Prisma.ReportsScalarFieldEnum = {
  id: 'id',
  title: 'title',
  type: 'type',
  institution_id: 'institution_id',
  service_ids: 'service_ids',
  start_date: 'start_date',
  end_date: 'end_date',
  report_created_by: 'report_created_by',
  report_institution_id: 'report_institution_id',
  report_recipient: 'report_recipient',
  report_queue_uuid: 'report_queue_uuid',
  report_content_key: 'report_content_key',
  status: 'status',
  created_at: 'created_at'
};

exports.Prisma.Request_institutionScalarFieldEnum = {
  id: 'id',
  owner_name: 'owner_name',
  address: 'address',
  phone_number: 'phone_number',
  email: 'email',
  name: 'name',
  category: 'category',
  location: 'location',
  type: 'type',
  business_certificate: 'business_certificate',
  product_type: 'product_type',
  approval_status: 'approval_status'
};

exports.Prisma.ServiceScalarFieldEnum = {
  id: 'id',
  institution_id: 'institution_id',
  status: 'status',
  created_at: 'created_at',
  bad_rating_threshold: 'bad_rating_threshold',
  group: 'group',
  good_ratings: 'good_ratings',
  bad_ratings: 'bad_ratings',
  excellent_ratings: 'excellent_ratings',
  nps: 'nps',
  csat: 'csat',
  mean_service_time: 'mean_service_time',
  avg_service_time: 'avg_service_time',
  uuid: 'uuid',
  inter_arrival_time: 'inter_arrival_time',
  estimated_time: 'estimated_time'
};

exports.Prisma.Service_groupScalarFieldEnum = {
  id: 'id',
  name: 'name',
  name_rw: 'name_rw',
  name_fr: 'name_fr',
  name_sw: 'name_sw',
  search_term: 'search_term',
  institution_id: 'institution_id',
  created_at: 'created_at',
  updated_at: 'updated_at',
  uuid: 'uuid',
  status: 'status',
  good_ratings: 'good_ratings',
  bad_ratings: 'bad_ratings',
  excellent_ratings: 'excellent_ratings',
  nps: 'nps',
  csat: 'csat',
  mean_service_time: 'mean_service_time',
  ticket_prefix: 'ticket_prefix',
  bad_rating_threshold: 'bad_rating_threshold'
};

exports.Prisma.SurveyScalarFieldEnum = {
  id: 'id',
  uuid: 'uuid',
  type: 'type',
  name: 'name',
  description: 'description',
  url: 'url',
  survey_data: 'survey_data',
  institution_id: 'institution_id',
  service_id: 'service_id',
  created_at: 'created_at',
  updated_at: 'updated_at',
  status: 'status',
  access_key: 'access_key'
};

exports.Prisma.Survey_resultScalarFieldEnum = {
  id: 'id',
  survey_id: 'survey_id',
  rating_id: 'rating_id',
  service_id: 'service_id',
  device_id: 'device_id',
  agent: 'agent',
  result_data: 'result_data',
  replied_at: 'replied_at'
};

exports.Prisma.TagsScalarFieldEnum = {
  id: 'id',
  name: 'name',
  services: 'services',
  created_at: 'created_at',
  created_by: 'created_by',
  updated_by: 'updated_by',
  status: 'status'
};

exports.Prisma.TipScalarFieldEnum = {
  id: 'id',
  collection_reference_id: 'collection_reference_id',
  disbursement_reference_id: 'disbursement_reference_id',
  device_id: 'device_id',
  rating_id: 'rating_id',
  payee: 'payee',
  payer: 'payer',
  amount: 'amount',
  tip_amount: 'tip_amount',
  collection_status: 'collection_status',
  collection_status_details: 'collection_status_details',
  closed_at: 'closed_at',
  disbursed_at: 'disbursed_at',
  disbursement_status: 'disbursement_status',
  disbursement_status_details: 'disbursement_status_details',
  created_at: 'created_at',
  updated_at: 'updated_at'
};

exports.Prisma.UserScalarFieldEnum = {
  id: 'id',
  name: 'name',
  title: 'title',
  phone_number: 'phone_number',
  username: 'username',
  auth_key: 'auth_key',
  password_hash: 'password_hash',
  password_reset_token: 'password_reset_token',
  email: 'email',
  status: 'status',
  role: 'role',
  created_at: 'created_at',
  updated_at: 'updated_at',
  verification_token: 'verification_token',
  allowed_context: 'allowed_context',
  institution_id: 'institution_id',
  last_received_hb_alert_at: 'last_received_hb_alert_at',
  last_received_rating_notification_at: 'last_received_rating_notification_at',
  language: 'language',
  notifications_enabled: 'notifications_enabled',
  last_login: 'last_login',
  allow_auto_approved_changes: 'allow_auto_approved_changes'
};

exports.Prisma.Wallet_accountsScalarFieldEnum = {
  id: 'id',
  user_id: 'user_id',
  account_type_id: 'account_type_id',
  account_number: 'account_number',
  account_name: 'account_name',
  balance: 'balance',
  public_key: 'public_key',
  private_key: 'private_key',
  added_at: 'added_at'
};

exports.Prisma.Wallet_accounts_typesScalarFieldEnum = {
  id: 'id',
  category: 'category',
  abbreviation: 'abbreviation',
  name: 'name',
  added_at: 'added_at'
};

exports.Prisma.Wallet_transfersScalarFieldEnum = {
  id: 'id',
  amount: 'amount',
  currency: 'currency',
  time: 'time',
  payer_id: 'payer_id',
  payer_account_id: 'payer_account_id',
  payee_address: 'payee_address',
  payee_name: 'payee_name',
  payee_account_type: 'payee_account_type',
  payee_account_number: 'payee_account_number',
  payee_type: 'payee_type',
  tx_id: 'tx_id',
  fspid: 'fspid',
  ext_trx_id: 'ext_trx_id',
  pay_money_ext_res: 'pay_money_ext_res',
  confirm_party_ext_res: 'confirm_party_ext_res',
  confirm_quote_ext_res: 'confirm_quote_ext_res',
  status: 'status',
  quote_id: 'quote_id',
  note: 'note',
  transfer_fees: 'transfer_fees'
};

exports.Prisma.Wallet_usersScalarFieldEnum = {
  id: 'id',
  device_id: 'device_id',
  fullname: 'fullname',
  email: 'email',
  private_key: 'private_key',
  public_key: 'public_key',
  initiated_at: 'initiated_at'
};

exports.Prisma.ImagesScalarFieldEnum = {
  id: 'id',
  institution_id: 'institution_id',
  user_id: 'user_id',
  type: 'type',
  image_url: 'image_url',
  caption: 'caption',
  uploaded_at: 'uploaded_at',
  review_id: 'review_id'
};

exports.Prisma.SectorsScalarFieldEnum = {
  id: 'id',
  name: 'name',
  description: 'description'
};

exports.Prisma.Users_profileScalarFieldEnum = {
  id: 'id',
  first_name: 'first_name',
  last_name: 'last_name',
  email: 'email',
  password: 'password',
  phone_number: 'phone_number',
  age_group: 'age_group',
  gender: 'gender',
  address: 'address',
  added_at: 'added_at',
  isVerified: 'isVerified',
  verifyToken: 'verifyToken'
};

exports.Prisma.ReviewsScalarFieldEnum = {
  id: 'id',
  user_id: 'user_id',
  institution_id: 'institution_id',
  rating: 'rating',
  review: 'review',
  created_at: 'created_at',
  is_approved: 'is_approved'
};

exports.Prisma.WorkingHourScalarFieldEnum = {
  id: 'id',
  institution_id: 'institution_id',
  day_of_week: 'day_of_week',
  open_time: 'open_time',
  close_time: 'close_time'
};

exports.Prisma.AmenitiesScalarFieldEnum = {
  id: 'id',
  name: 'name',
  icon: 'icon',
  added_at: 'added_at'
};

exports.Prisma.Business_amenitiesScalarFieldEnum = {
  id: 'id',
  institution_id: 'institution_id',
  amenitY_id: 'amenitY_id'
};

exports.Prisma.Price_rangesScalarFieldEnum = {
  id: 'id',
  max_value: 'max_value',
  min_value: 'min_value',
  institution_id: 'institution_id',
  label: 'label'
};

exports.Prisma.SurveyAnswersScalarFieldEnum = {
  id: 'id',
  question_id: 'question_id',
  user_id: 'user_id',
  answer: 'answer',
  scale_rating: 'scale_rating',
  added_at: 'added_at'
};

exports.Prisma.SurveyQuestionsScalarFieldEnum = {
  id: 'id',
  service_id: 'service_id',
  question: 'question',
  choices: 'choices',
  added_at: 'added_at'
};

exports.Prisma.ServiceReviewScalarFieldEnum = {
  id: 'id',
  user_id: 'user_id',
  service_id: 'service_id',
  rating: 'rating',
  emoRating: 'emoRating',
  added_at: 'added_at'
};

exports.Prisma.SortOrder = {
  asc: 'asc',
  desc: 'desc'
};

exports.Prisma.NullsOrder = {
  first: 'first',
  last: 'last'
};

exports.Prisma.app_releasesOrderByRelevanceFieldEnum = {
  release_version: 'release_version',
  release_note: 'release_note',
  release_url: 'release_url',
  minimum_version: 'minimum_version'
};

exports.Prisma.appointmentsOrderByRelevanceFieldEnum = {
  name: 'name',
  email: 'email',
  phone: 'phone',
  reason: 'reason',
  location: 'location',
  additional_note: 'additional_note',
  cancellation_reason: 'cancellation_reason'
};

exports.Prisma.appsOrderByRelevanceFieldEnum = {
  name: 'name',
  secret_key: 'secret_key',
  access_key: 'access_key'
};

exports.Prisma.audit_trailOrderByRelevanceFieldEnum = {
  old_value: 'old_value',
  new_value: 'new_value',
  action: 'action',
  model: 'model',
  field: 'field',
  ip: 'ip',
  user_agent: 'user_agent',
  model_id: 'model_id',
  display_name: 'display_name'
};

exports.Prisma.categoriesOrderByRelevanceFieldEnum = {
  name: 'name'
};

exports.Prisma.change_requestOrderByRelevanceFieldEnum = {
  old_value: 'old_value',
  new_value: 'new_value',
  action: 'action',
  model: 'model',
  ip: 'ip',
  user_agent: 'user_agent',
  display_name: 'display_name'
};

exports.Prisma.deviceOrderByRelevanceFieldEnum = {
  uuid: 'uuid',
  notification_token: 'notification_token',
  service_id: 'service_id',
  serial_number: 'serial_number',
  apiKey: 'apiKey',
  linkShortCode: 'linkShortCode',
  phone_number: 'phone_number',
  latest_hb_version: 'latest_hb_version'
};

exports.Prisma.device_heartbeatOrderByRelevanceFieldEnum = {
  version: 'version'
};

exports.Prisma.institutionOrderByRelevanceFieldEnum = {
  uuid: 'uuid',
  name: 'name',
  search_term: 'search_term',
  email: 'email',
  address: 'address',
  phone_number: 'phone_number',
  url: 'url',
  working_hours: 'working_hours',
  qms_message: 'qms_message',
  priority_list: 'priority_list',
  logo: 'logo',
  app_name: 'app_name',
  host_name: 'host_name',
  description: 'description',
  latitude: 'latitude',
  longitude: 'longitude',
  button_one: 'button_one',
  button_two: 'button_two',
  amenities: 'amenities'
};

exports.Prisma.institution_invoicesOrderByRelevanceFieldEnum = {
  invoice_number: 'invoice_number',
  institution_name: 'institution_name',
  payment_reference_number: 'payment_reference_number',
  ext_payment_reference_number: 'ext_payment_reference_number',
  payment_status_desc: 'payment_status_desc',
  payment_method: 'payment_method'
};

exports.Prisma.institution_service_trackingOrderByRelevanceFieldEnum = {
  branch_name: 'branch_name',
  service_group_name: 'service_group_name',
  invoice_number: 'invoice_number'
};

exports.Prisma.login_historyOrderByRelevanceFieldEnum = {
  ip: 'ip',
  user_agent: 'user_agent'
};

exports.Prisma.migrationOrderByRelevanceFieldEnum = {
  version: 'version'
};

exports.Prisma.mms_fileOrderByRelevanceFieldEnum = {
  device_uuid: 'device_uuid',
  path: 'path',
  comment: 'comment'
};

exports.Prisma.notificationOrderByRelevanceFieldEnum = {
  title: 'title',
  content: 'content',
  link: 'link'
};

exports.Prisma.optionOrderByRelevanceFieldEnum = {
  name: 'name',
  description: 'description'
};

exports.Prisma.popup_questionsOrderByRelevanceFieldEnum = {
  name_en: 'name_en',
  name_fr: 'name_fr',
  name_rw: 'name_rw',
  name_sw: 'name_sw',
  service_id: 'service_id',
  description_en: 'description_en',
  description_fr: 'description_fr',
  description_rw: 'description_rw',
  description_sw: 'description_sw'
};

exports.Prisma.popup_questions_possible_answersOrderByRelevanceFieldEnum = {
  answer_en: 'answer_en',
  answer_fr: 'answer_fr',
  answer_rw: 'answer_rw',
  answer_sw: 'answer_sw'
};

exports.Prisma.qms_branch_operatorOrderByRelevanceFieldEnum = {
  service_id: 'service_id'
};

exports.Prisma.qms_branch_transactionsOrderByRelevanceFieldEnum = {
  note: 'note'
};

exports.Prisma.qms_counterOrderByRelevanceFieldEnum = {
  name: 'name',
  description: 'description'
};

exports.Prisma.qms_customerOrderByRelevanceFieldEnum = {
  customer_uuid: 'customer_uuid',
  name: 'name',
  phone_number: 'phone_number',
  email: 'email'
};

exports.Prisma.qms_operatorOrderByRelevanceFieldEnum = {
  operator_uuid: 'operator_uuid',
  name: 'name',
  username: 'username',
  password_hash: 'password_hash',
  email_address: 'email_address',
  phone_number: 'phone_number'
};

exports.Prisma.qms_queueOrderByRelevanceFieldEnum = {
  queue_uuid: 'queue_uuid'
};

exports.Prisma.qms_queue_operator_lnkOrderByRelevanceFieldEnum = {
  operator_uuid: 'operator_uuid',
  api_key: 'api_key'
};

exports.Prisma.qms_ticketOrderByRelevanceFieldEnum = {
  ticket_uuid: 'ticket_uuid',
  ticket_number: 'ticket_number',
  full_ticket_number: 'full_ticket_number'
};

exports.Prisma.qms_ticket_assignmentOrderByRelevanceFieldEnum = {
  comment: 'comment'
};

exports.Prisma.ratingOrderByRelevanceFieldEnum = {
  comment: 'comment',
  finger_print: 'finger_print'
};

exports.Prisma.rating_assetsOrderByRelevanceFieldEnum = {
  rating_assets_image: 'rating_assets_image',
  rating_assets_video: 'rating_assets_video'
};

exports.Prisma.rating_qr_code_sessionsOrderByRelevanceFieldEnum = {
  institution_uuid: 'institution_uuid',
  service_uuid: 'service_uuid',
  user_agent: 'user_agent',
  finger_print: 'finger_print',
  ip_address: 'ip_address',
  session_token: 'session_token'
};

exports.Prisma.rating_replyOrderByRelevanceFieldEnum = {
  reply: 'reply'
};

exports.Prisma.reportsOrderByRelevanceFieldEnum = {
  title: 'title',
  type: 'type',
  service_ids: 'service_ids',
  report_institution_id: 'report_institution_id',
  report_recipient: 'report_recipient',
  report_queue_uuid: 'report_queue_uuid',
  report_content_key: 'report_content_key'
};

exports.Prisma.request_institutionOrderByRelevanceFieldEnum = {
  owner_name: 'owner_name',
  address: 'address',
  phone_number: 'phone_number',
  email: 'email',
  name: 'name',
  category: 'category',
  location: 'location',
  type: 'type',
  business_certificate: 'business_certificate',
  product_type: 'product_type'
};

exports.Prisma.serviceOrderByRelevanceFieldEnum = {
  uuid: 'uuid'
};

exports.Prisma.service_groupOrderByRelevanceFieldEnum = {
  name: 'name',
  name_rw: 'name_rw',
  name_fr: 'name_fr',
  name_sw: 'name_sw',
  search_term: 'search_term',
  uuid: 'uuid',
  ticket_prefix: 'ticket_prefix'
};

exports.Prisma.surveyOrderByRelevanceFieldEnum = {
  uuid: 'uuid',
  name: 'name',
  description: 'description',
  url: 'url',
  survey_data: 'survey_data',
  service_id: 'service_id',
  access_key: 'access_key'
};

exports.Prisma.survey_resultOrderByRelevanceFieldEnum = {
  agent: 'agent',
  result_data: 'result_data'
};

exports.Prisma.tagsOrderByRelevanceFieldEnum = {
  name: 'name',
  services: 'services'
};

exports.Prisma.tipOrderByRelevanceFieldEnum = {
  collection_reference_id: 'collection_reference_id',
  disbursement_reference_id: 'disbursement_reference_id',
  payee: 'payee',
  payer: 'payer',
  collection_status: 'collection_status',
  collection_status_details: 'collection_status_details',
  disbursement_status: 'disbursement_status',
  disbursement_status_details: 'disbursement_status_details'
};

exports.Prisma.userOrderByRelevanceFieldEnum = {
  name: 'name',
  title: 'title',
  phone_number: 'phone_number',
  username: 'username',
  auth_key: 'auth_key',
  password_hash: 'password_hash',
  password_reset_token: 'password_reset_token',
  email: 'email',
  verification_token: 'verification_token',
  institution_id: 'institution_id',
  language: 'language'
};

exports.Prisma.wallet_accountsOrderByRelevanceFieldEnum = {
  account_number: 'account_number',
  account_name: 'account_name',
  public_key: 'public_key',
  private_key: 'private_key'
};

exports.Prisma.wallet_accounts_typesOrderByRelevanceFieldEnum = {
  category: 'category',
  abbreviation: 'abbreviation',
  name: 'name'
};

exports.Prisma.wallet_transfersOrderByRelevanceFieldEnum = {
  currency: 'currency',
  payee_address: 'payee_address',
  payee_name: 'payee_name',
  payee_account_type: 'payee_account_type',
  payee_account_number: 'payee_account_number',
  payee_type: 'payee_type',
  tx_id: 'tx_id',
  fspid: 'fspid',
  ext_trx_id: 'ext_trx_id',
  pay_money_ext_res: 'pay_money_ext_res',
  confirm_party_ext_res: 'confirm_party_ext_res',
  confirm_quote_ext_res: 'confirm_quote_ext_res',
  status: 'status',
  quote_id: 'quote_id',
  note: 'note',
  transfer_fees: 'transfer_fees'
};

exports.Prisma.wallet_usersOrderByRelevanceFieldEnum = {
  fullname: 'fullname',
  email: 'email',
  private_key: 'private_key',
  public_key: 'public_key'
};

exports.Prisma.imagesOrderByRelevanceFieldEnum = {
  type: 'type',
  image_url: 'image_url',
  caption: 'caption'
};

exports.Prisma.sectorsOrderByRelevanceFieldEnum = {
  name: 'name',
  description: 'description'
};

exports.Prisma.users_profileOrderByRelevanceFieldEnum = {
  first_name: 'first_name',
  last_name: 'last_name',
  email: 'email',
  password: 'password',
  phone_number: 'phone_number',
  age_group: 'age_group',
  gender: 'gender',
  address: 'address',
  verifyToken: 'verifyToken'
};

exports.Prisma.reviewsOrderByRelevanceFieldEnum = {
  review: 'review'
};

exports.Prisma.workingHourOrderByRelevanceFieldEnum = {
  day_of_week: 'day_of_week'
};

exports.Prisma.amenitiesOrderByRelevanceFieldEnum = {
  name: 'name',
  icon: 'icon'
};

exports.Prisma.price_rangesOrderByRelevanceFieldEnum = {
  label: 'label'
};

exports.Prisma.surveyAnswersOrderByRelevanceFieldEnum = {
  answer: 'answer'
};

exports.Prisma.surveyQuestionsOrderByRelevanceFieldEnum = {
  question: 'question',
  choices: 'choices'
};

exports.Prisma.serviceReviewOrderByRelevanceFieldEnum = {
  emoRating: 'emoRating'
};
exports.app_releases_app_name = exports.$Enums.app_releases_app_name = {
  mobile_rating: 'mobile_rating',
  tablet_rating: 'tablet_rating',
  tablet_qms_o: 'tablet_qms_o'
};

exports.app_releases_platform = exports.$Enums.app_releases_platform = {
  android: 'android',
  ios: 'ios'
};

exports.audit_trail_status = exports.$Enums.audit_trail_status = {
  CREATED: 'CREATED',
  UPDATED: 'UPDATED',
  DELETED: 'DELETED'
};

exports.institution_invoices_payment_status = exports.$Enums.institution_invoices_payment_status = {
  FAILED: 'FAILED',
  PENDING: 'PENDING',
  COMPLETED: 'COMPLETED'
};

exports.institution_invoices_status = exports.$Enums.institution_invoices_status = {
  PENDING: 'PENDING',
  EXPIRED: 'EXPIRED',
  PAID: 'PAID',
  CANCELED: 'CANCELED'
};

exports.qms_queue_status = exports.$Enums.qms_queue_status = {
  open: 'open',
  paused: 'paused',
  stopped: 'stopped',
  closed: 'closed'
};

exports.rating_qr_code_sessions_status = exports.$Enums.rating_qr_code_sessions_status = {
  Open: 'Open',
  Close: 'Close'
};

exports.Prisma.ModelName = {
  app_releases: 'app_releases',
  appointments: 'appointments',
  apps: 'apps',
  audit_trail: 'audit_trail',
  categories: 'categories',
  change_request: 'change_request',
  device: 'device',
  device_heartbeat: 'device_heartbeat',
  institution: 'institution',
  institution_invoices: 'institution_invoices',
  institution_service_tracking: 'institution_service_tracking',
  login_history: 'login_history',
  migration: 'migration',
  mms_file: 'mms_file',
  notification: 'notification',
  notification_recipient: 'notification_recipient',
  option: 'option',
  popup_questions: 'popup_questions',
  popup_questions_answers: 'popup_questions_answers',
  popup_questions_possible_answers: 'popup_questions_possible_answers',
  qms_branch_operator: 'qms_branch_operator',
  qms_branch_transactions: 'qms_branch_transactions',
  qms_counter: 'qms_counter',
  qms_customer: 'qms_customer',
  qms_operator: 'qms_operator',
  qms_operator_transactions: 'qms_operator_transactions',
  qms_queue: 'qms_queue',
  qms_queue_operator_lnk: 'qms_queue_operator_lnk',
  qms_ticket: 'qms_ticket',
  qms_ticket_assignment: 'qms_ticket_assignment',
  rating: 'rating',
  rating_assets: 'rating_assets',
  rating_qr_code_sessions: 'rating_qr_code_sessions',
  rating_reply: 'rating_reply',
  reports: 'reports',
  request_institution: 'request_institution',
  service: 'service',
  service_group: 'service_group',
  survey: 'survey',
  survey_result: 'survey_result',
  tags: 'tags',
  tip: 'tip',
  user: 'user',
  wallet_accounts: 'wallet_accounts',
  wallet_accounts_types: 'wallet_accounts_types',
  wallet_transfers: 'wallet_transfers',
  wallet_users: 'wallet_users',
  images: 'images',
  sectors: 'sectors',
  users_profile: 'users_profile',
  reviews: 'reviews',
  workingHour: 'workingHour',
  amenities: 'amenities',
  business_amenities: 'business_amenities',
  price_ranges: 'price_ranges',
  surveyAnswers: 'surveyAnswers',
  surveyQuestions: 'surveyQuestions',
  serviceReview: 'serviceReview'
};

/**
 * This is a stub Prisma Client that will error at runtime if called.
 */
class PrismaClient {
  constructor() {
    return new Proxy(this, {
      get(target, prop) {
        let message
        const runtime = getRuntime()
        if (runtime.isEdge) {
          message = `PrismaClient is not configured to run in ${runtime.prettyName}. In order to run Prisma Client on edge runtime, either:
- Use Prisma Accelerate: https://pris.ly/d/accelerate
- Use Driver Adapters: https://pris.ly/d/driver-adapters
`;
        } else {
          message = 'PrismaClient is unable to run in this browser environment, or has been bundled for the browser (running in `' + runtime.prettyName + '`).'
        }

        message += `
If this is unexpected, please open an issue: https://pris.ly/prisma-prisma-bug-report`

        throw new Error(message)
      }
    })
  }
}

exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
