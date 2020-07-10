# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table answer (
  record_id                     varchar(255) not null,
  question_id                   varchar(255) not null,
  loop_index                    integer not null,
  value                         varchar(255),
  question_id                   varchar(255),
  record_id                     varchar(255),
  constraint pk_answer primary key (record_id,question_id,loop_index)
);

create table beneficiaries (
  report_id                     varchar(255) not null,
  beneficiary_code              varchar(255) not null,
  total                         integer,
  text                          varchar(255),
  report_id                     varchar(255),
  constraint pk_beneficiaries primary key (report_id,beneficiary_code)
);

create table credentials (
  user_id                       varchar(255) not null,
  salt                          varbinary(255),
  sesame                        varchar(255),
  constraint uq_credentials_user_id unique (user_id),
  constraint pk_credentials primary key (user_id)
);

create table ref_district (
  id                            integer auto_increment not null,
  name                          varchar(255),
  ref_region_id                 integer,
  constraint pk_ref_district primary key (id)
);

create table document (
  id                            varchar(255) not null,
  filename                      varchar(255),
  system_file                   varchar(255),
  constraint pk_document primary key (id)
);

create table donor_document (
  id                            varchar(255) not null,
  filename                      varchar(255),
  system_file                   varchar(255),
  donor_report_id               varchar(255) not null,
  constraint uq_donor_document_donor_report_id unique (donor_report_id),
  constraint pk_donor_document primary key (id)
);

create table donor_report (
  id                            varchar(255) not null,
  name                          varchar(255),
  description                   varchar(255),
  from_date                     datetime(6),
  to_date                       datetime(6),
  donor_report_type_cd          varchar(255),
  constraint uq_donor_report_donor_report_type_cd unique (donor_report_type_cd),
  constraint pk_donor_report primary key (id)
);

create table donor_report_type (
  cd                            varchar(255) not null,
  name                          varchar(255),
  constraint pk_donor_report_type primary key (cd)
);

create table flag_reason (
  id                            integer auto_increment not null,
  category                      varchar(255),
  description                   varchar(255),
  constraint pk_flag_reason primary key (id)
);

create table ovi_flag_reason (
  flag_reason_id                integer not null,
  ovi_id                        varchar(255) not null,
  constraint pk_ovi_flag_reason primary key (flag_reason_id,ovi_id)
);

create table flash_report (
  id                            varchar(255) not null,
  summary                       varchar(255),
  document_id                   varchar(255),
  report_id                     varchar(255),
  constraint uq_flash_report_document_id unique (document_id),
  constraint pk_flash_report primary key (id)
);

create table groups (
  id                            varchar(255) not null,
  label                         varchar(255),
  path                          varchar(255),
  field_list                    tinyint(1) default 0,
  rank                          integer,
  relevant                      varchar(255),
  repeat_flag                   tinyint(1) default 0,
  group_id                      varchar(255),
  survey_id                     varchar(255),
  survey_version                integer,
  parent_group_id               varchar(255),
  constraint pk_groups primary key (id)
);

create table imp_part (
  id                            varchar(255) not null,
  abbr                          varchar(255),
  name                          varchar(255),
  ref_status_cd                 varchar(255),
  date_created                  datetime(6),
  color_code                    varchar(255),
  constraint pk_imp_part primary key (id)
);

create table imp_part_member (
  user_id                       varchar(255) not null,
  imp_part_id                   varchar(255) not null,
  user_id                       varchar(255),
  imp_part_id                   varchar(255),
  effective_date                datetime(6),
  expiration_date               datetime(6),
  constraint pk_imp_part_member primary key (user_id,imp_part_id)
);

create table lessons_learned (
  id                            varchar(255) not null,
  name                          varchar(255),
  monitoring_year_cycle         varchar(255),
  document_id                   varchar(255),
  constraint uq_lessons_learned_document_id unique (document_id),
  constraint pk_lessons_learned primary key (id)
);

create table master_activity (
  id                            varchar(255) not null,
  monitoring_year_cycle         varchar(255),
  program_cd                    varchar(255),
  imp_part_id                   varchar(255),
  award_number                  varchar(255),
  sub_recipient                 varchar(255),
  sector_id                     integer,
  subsector_id                  integer,
  activity_description          varchar(255),
  zone_id                       integer,
  region_id                     integer,
  district_id                   integer,
  village_name                  varchar(255),
  latitude                      varchar(255),
  longitude                     varchar(255),
  constraint uq_master_activity_program_cd unique (program_cd),
  constraint uq_master_activity_imp_part_id unique (imp_part_id),
  constraint uq_master_activity_sector_id unique (sector_id),
  constraint uq_master_activity_subsector_id unique (subsector_id),
  constraint uq_master_activity_zone_id unique (zone_id),
  constraint uq_master_activity_region_id unique (region_id),
  constraint uq_master_activity_district_id unique (district_id),
  constraint pk_master_activity primary key (id)
);

create table media (
  id                            varchar(255) not null,
  ovi_id                        varchar(255) not null,
  name                          varchar(255),
  description                   varchar(255),
  file_name                     varchar(255),
  constraint pk_media primary key (id)
);

create table message (
  id                            varchar(255) not null,
  message                       varbinary(255),
  sender_id                     varchar(255),
  message_date                  datetime(6),
  reply_reference_id            varchar(255),
  constraint uq_message_sender_id unique (sender_id),
  constraint uq_message_reply_reference_id unique (reply_reference_id),
  constraint pk_message primary key (id)
);

create table message_recipient (
  message_id                    varchar(255) not null,
  recipient_id                  varchar(255) not null,
  message_id                    varchar(255),
  recipient_id                  varchar(255),
  constraint pk_message_recipient primary key (message_id,recipient_id)
);

create table monitoring_report (
  id                            varchar(255) not null,
  report_date                   varchar(255),
  report_period                 varchar(255),
  monitoring_report_code        varchar(255),
  monitoring_year_cycle         varchar(255),
  document_id                   varchar(255),
  added_on                      datetime(6),
  constraint uq_monitoring_report_document_id unique (document_id),
  constraint pk_monitoring_report primary key (id)
);

create table ovi (
  id                            varchar(255) not null,
  report_id                     varchar(255),
  ref_sector_id                 integer,
  ovi1m                         integer,
  ovi1f                         integer,
  ovi1x                         integer,
  ovi2m                         integer,
  ovi2f                         integer,
  ovi3                          integer,
  ovi4                          integer,
  ovi5                          varchar(255),
  number_of_sites               integer,
  number_of_activities          integer,
  number_of_green_activities    integer,
  constraint pk_ovi primary key (id)
);

create table ovi_sub_sector (
  ovi_id                        varchar(255) not null,
  ref_sub_sector_id             integer not null,
  constraint pk_ovi_sub_sector primary key (ovi_id,ref_sub_sector_id)
);

create table options (
  id                            varchar(255) not null,
  path                          varchar(255),
  label                         varchar(255),
  value                         varchar(255),
  parent_option_id              varchar(255),
  media_id                      varchar(255),
  question_id                   varchar(255),
  constraint uq_options_media_id unique (media_id),
  constraint pk_options primary key (id)
);

create table photo (
  id                            varchar(255) not null,
  filename                      varchar(255),
  caption                       varchar(255),
  system_file                   varchar(255),
  report_id                     varchar(255),
  constraint pk_photo primary key (id)
);

create table ref_program (
  cd                            varchar(255) not null,
  name                          varchar(255),
  constraint pk_ref_program primary key (cd)
);

create table question (
  id                            varchar(255) not null,
  input_type                    varchar(255),
  survey_id                     varchar(255),
  survey_version                integer,
  rank                          integer,
  relevant                      varchar(255),
  const                         varchar(255),
  readonly                      tinyint(1) default 0,
  required                      tinyint(1) default 0,
  hidden                        tinyint(1) default 0,
  calculate                     varchar(255),
  constmsg                      varchar(255),
  default_value                 varchar(255),
  hint                          varchar(255),
  media_type                    varchar(255),
  label                         varchar(255),
  path                          varchar(255),
  appearance                    varchar(255),
  group_id                      varchar(255),
  constraint pk_question primary key (id)
);

create table record (
  id                            varchar(255) not null,
  survey_id                     varchar(255),
  survey_version                integer,
  start_time                    datetime(6),
  end_time                      datetime(6),
  latitude                      varchar(255),
  longitude                     varchar(255),
  accuracy                      varchar(255),
  altitude                      varchar(255),
  xml_id                        varchar(255),
  created_by                    varchar(255),
  submission_date               datetime(6),
  modified_by                   varchar(255),
  date_modified                 datetime(6),
  constraint uq_record_xml_id unique (xml_id),
  constraint uq_record_created_by unique (created_by),
  constraint uq_record_modified_by unique (modified_by),
  constraint pk_record primary key (id)
);

create table ref_region (
  id                            integer auto_increment not null,
  name                          varchar(255),
  ref_zone_id                   integer,
  constraint pk_ref_region primary key (id)
);

create table report (
  id                            varchar(255) not null,
  description                   varchar(255),
  site_visit_tag                varchar(255),
  date_of_visit                 datetime(6),
  ref_zone_id                   integer,
  ref_district_id               integer,
  ref_region_id                 integer,
  village_name                  varchar(255),
  longitude                     varchar(255),
  latitude                      varchar(255),
  flag_rating                   varchar(255),
  award_number                  varchar(255),
  imp_part_id                   varchar(255),
  ref_status_cd                 varchar(255),
  ref_program_cd                varchar(255),
  drict_impl                    tinyint(1) default 0,
  sub_recipient                 varchar(255),
  my                            varchar(255),
  mr                            varchar(255),
  tpm_id                        varchar(255),
  activity_status_cd            varchar(255),
  document_id                   varchar(255),
  date_created                  datetime(6),
  constraint uq_report_document_id unique (document_id),
  constraint pk_report primary key (id)
);

create table ref_role (
  cd                            varchar(255) not null,
  name                          varchar(255),
  constraint pk_ref_role primary key (cd)
);

create table ref_sector (
  id                            integer auto_increment not null,
  name                          varchar(255),
  ref_program_cd                varchar(255),
  color_code                    varchar(255),
  constraint pk_ref_sector primary key (id)
);

create table report_sector (
  ref_sector_id                 integer not null,
  report_id                     varchar(255) not null,
  constraint pk_report_sector primary key (ref_sector_id,report_id)
);

create table site (
  id                            varchar(255) not null,
  name                          varchar(255),
  longitude                     varchar(255),
  latitude                      varchar(255),
  site_type_cd                  varchar(255),
  ref_zone_id                   integer,
  ref_district_id               integer,
  ref_region_id                 integer,
  constraint pk_site primary key (id)
);

create table site_selection (
  id                            varchar(255) not null,
  imp_part_id                   varchar(255),
  user_id                       varchar(255),
  status                        varchar(255),
  site_tag                      varchar(255),
  tpm_id                        varchar(255),
  constraint uq_site_selection_imp_part_id unique (imp_part_id),
  constraint uq_site_selection_user_id unique (user_id),
  constraint uq_site_selection_status unique (status),
  constraint uq_site_selection_tpm_id unique (tpm_id),
  constraint pk_site_selection primary key (id)
);

create table site_selection_activity (
  site_selection_id             varchar(255) not null,
  master_activity_id            varchar(255) not null,
  site_selection_id             varchar(255),
  master_activity_id            varchar(255),
  constraint pk_site_selection_activity primary key (site_selection_id,master_activity_id)
);

create table site_selection_comments (
  id                            varchar(255) not null,
  comment                       varchar(255),
  entry_date                    datetime(6),
  user_id                       varchar(255),
  site_selection_id             varchar(255),
  constraint uq_site_selection_comments_user_id unique (user_id),
  constraint uq_site_selection_comments_site_selection_id unique (site_selection_id),
  constraint pk_site_selection_comments primary key (id)
);

create table site_selection_site (
  site_selection_id             varchar(255) not null,
  site_id                       varchar(255) not null,
  site_selection_id             varchar(255),
  site_id                       varchar(255),
  constraint pk_site_selection_site primary key (site_selection_id,site_id)
);

create table site_type (
  cd                            varchar(255) not null,
  name                          varchar(255),
  constraint pk_site_type primary key (cd)
);

create table ref_status (
  cd                            varchar(255) not null,
  name                          varchar(255),
  constraint pk_ref_status primary key (cd)
);

create table ref_sub_sector (
  id                            integer auto_increment not null,
  name                          varchar(255),
  abbr                          varchar(255),
  color_code                    varchar(255),
  sector_id                     integer,
  constraint pk_ref_sub_sector primary key (id)
);

create table report_sub_sector (
  ref_sub_sector_id             integer not null,
  report_id                     varchar(255) not null,
  constraint pk_report_sub_sector primary key (ref_sub_sector_id,report_id)
);

create table survey (
  id                            varchar(255) not null,
  version                       integer not null,
  created_by                    varchar(255),
  status_cd                     varchar(255),
  supervisor                    varchar(255),
  name                          varchar(255),
  site_tag                      varchar(255),
  description                   varchar(255),
  date_created                  datetime(6),
  survey_type                   varchar(255),
  ip_id                         varchar(255),
  xml_id                        varchar(255),
  constraint uq_survey_created_by unique (created_by),
  constraint uq_survey_status_cd unique (status_cd),
  constraint uq_survey_supervisor unique (supervisor),
  constraint uq_survey_ip_id unique (ip_id),
  constraint uq_survey_xml_id unique (xml_id),
  constraint pk_survey primary key (id,version)
);

create table tpm (
  id                            varchar(255) not null,
  name                          varchar(255),
  pin                           varchar(255),
  constraint pk_tpm primary key (id)
);

create table user (
  id                            varchar(255) not null,
  email                         varchar(255) not null,
  first_name                    varchar(255),
  last_name                     varchar(255),
  date_created                  datetime(6),
  ref_status_cd                 varchar(255),
  ref_role_cd                   varchar(255),
  imp_part_id                   varchar(255),
  tpm_id                        varchar(255),
  constraint uq_user_imp_part_id unique (imp_part_id),
  constraint uq_user_tpm_id unique (tpm_id),
  constraint pk_user primary key (id)
);

create table user_activity (
  id                            varchar(255) not null,
  user_id                       varchar(255),
  login_time                    datetime(6),
  logout_time                   datetime(6),
  ip_addess                     varchar(255),
  city                          varchar(255),
  country                       varchar(255),
  longitude                     varchar(255),
  latitude                      varchar(255),
  constraint pk_user_activity primary key (id)
);

create table user_token (
  id                            varchar(255) not null,
  user_id                       varchar(255),
  constraint pk_user_token primary key (id)
);

create table xml (
  id                            varchar(255) not null,
  content                       varchar(255),
  constraint pk_xml primary key (id)
);

create table ref_zone (
  id                            integer auto_increment not null,
  name                          varchar(255),
  abbr                          varchar(255) not null,
  constraint pk_ref_zone primary key (id)
);

alter table answer add constraint fk_answer_question_id foreign key (question_id) references question (id) on delete restrict on update restrict;
create index ix_answer_question_id on answer (question_id);

alter table answer add constraint fk_answer_record_id foreign key (record_id) references record (id) on delete restrict on update restrict;
create index ix_answer_record_id on answer (record_id);

alter table beneficiaries add constraint fk_beneficiaries_report_id foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_beneficiaries_report_id on beneficiaries (report_id);

alter table credentials add constraint fk_credentials_user_id foreign key (user_id) references user (id) on delete restrict on update restrict;

alter table ref_district add constraint fk_ref_district_ref_region_id foreign key (ref_region_id) references ref_region (id) on delete restrict on update restrict;
create index ix_ref_district_ref_region_id on ref_district (ref_region_id);

alter table donor_document add constraint fk_donor_document_donor_report_id foreign key (donor_report_id) references donor_report (id) on delete restrict on update restrict;

alter table donor_report add constraint fk_donor_report_donor_report_type_cd foreign key (donor_report_type_cd) references donor_report_type (cd) on delete restrict on update restrict;

alter table ovi_flag_reason add constraint fk_ovi_flag_reason_flag_reason foreign key (flag_reason_id) references flag_reason (id) on delete restrict on update restrict;
create index ix_ovi_flag_reason_flag_reason on ovi_flag_reason (flag_reason_id);

alter table ovi_flag_reason add constraint fk_ovi_flag_reason_ovi foreign key (ovi_id) references ovi (id) on delete restrict on update restrict;
create index ix_ovi_flag_reason_ovi on ovi_flag_reason (ovi_id);

alter table flash_report add constraint fk_flash_report_document_id foreign key (document_id) references document (id) on delete restrict on update restrict;

alter table flash_report add constraint fk_flash_report_report_id foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_flash_report_report_id on flash_report (report_id);

alter table groups add constraint fk_groups_parent_group_id foreign key (parent_group_id) references groups (id) on delete restrict on update restrict;
create index ix_groups_parent_group_id on groups (parent_group_id);

alter table groups add constraint fk_groups_survey foreign key (survey_id,survey_version) references survey (id,version) on delete restrict on update restrict;
create index ix_groups_survey on groups (survey_id,survey_version);

alter table imp_part add constraint fk_imp_part_ref_status_cd foreign key (ref_status_cd) references ref_status (cd) on delete restrict on update restrict;
create index ix_imp_part_ref_status_cd on imp_part (ref_status_cd);

alter table imp_part_member add constraint fk_imp_part_member_user_id foreign key (user_id) references user (id) on delete restrict on update restrict;
create index ix_imp_part_member_user_id on imp_part_member (user_id);

alter table imp_part_member add constraint fk_imp_part_member_imp_part_id foreign key (imp_part_id) references imp_part (id) on delete restrict on update restrict;
create index ix_imp_part_member_imp_part_id on imp_part_member (imp_part_id);

alter table lessons_learned add constraint fk_lessons_learned_document_id foreign key (document_id) references document (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_program_cd foreign key (program_cd) references ref_program (cd) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_imp_part_id foreign key (imp_part_id) references imp_part (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_sector_id foreign key (sector_id) references ref_sector (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_subsector_id foreign key (subsector_id) references ref_sub_sector (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_zone_id foreign key (zone_id) references ref_zone (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_region_id foreign key (region_id) references ref_region (id) on delete restrict on update restrict;

alter table master_activity add constraint fk_master_activity_district_id foreign key (district_id) references ref_district (id) on delete restrict on update restrict;

alter table media add constraint fk_media_ovi_id foreign key (ovi_id) references record (id) on delete restrict on update restrict;
create index ix_media_ovi_id on media (ovi_id);

alter table message add constraint fk_message_sender_id foreign key (sender_id) references user (id) on delete restrict on update restrict;

alter table message add constraint fk_message_reply_reference_id foreign key (reply_reference_id) references message (id) on delete restrict on update restrict;

alter table message_recipient add constraint fk_message_recipient_message_id foreign key (message_id) references message (id) on delete restrict on update restrict;
create index ix_message_recipient_message_id on message_recipient (message_id);

alter table message_recipient add constraint fk_message_recipient_recipient_id foreign key (recipient_id) references user (id) on delete restrict on update restrict;
create index ix_message_recipient_recipient_id on message_recipient (recipient_id);

alter table monitoring_report add constraint fk_monitoring_report_document_id foreign key (document_id) references document (id) on delete restrict on update restrict;

alter table ovi add constraint fk_ovi_report_id foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_ovi_report_id on ovi (report_id);

alter table ovi add constraint fk_ovi_ref_sector_id foreign key (ref_sector_id) references ref_sector (id) on delete restrict on update restrict;
create index ix_ovi_ref_sector_id on ovi (ref_sector_id);

alter table ovi_sub_sector add constraint fk_ovi_sub_sector_ovi foreign key (ovi_id) references ovi (id) on delete restrict on update restrict;
create index ix_ovi_sub_sector_ovi on ovi_sub_sector (ovi_id);

alter table ovi_sub_sector add constraint fk_ovi_sub_sector_ref_sub_sector foreign key (ref_sub_sector_id) references ref_sub_sector (id) on delete restrict on update restrict;
create index ix_ovi_sub_sector_ref_sub_sector on ovi_sub_sector (ref_sub_sector_id);

alter table options add constraint fk_options_parent_option_id foreign key (parent_option_id) references options (id) on delete restrict on update restrict;
create index ix_options_parent_option_id on options (parent_option_id);

alter table options add constraint fk_options_media_id foreign key (media_id) references media (id) on delete restrict on update restrict;

alter table options add constraint fk_options_question_id foreign key (question_id) references question (id) on delete restrict on update restrict;
create index ix_options_question_id on options (question_id);

alter table photo add constraint fk_photo_report_id foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_photo_report_id on photo (report_id);

alter table question add constraint fk_question_group_id foreign key (group_id) references groups (id) on delete restrict on update restrict;
create index ix_question_group_id on question (group_id);

alter table question add constraint fk_question_survey foreign key (survey_id,survey_version) references survey (id,version) on delete restrict on update restrict;
create index ix_question_survey on question (survey_id,survey_version);

alter table record add constraint fk_record_xml_id foreign key (xml_id) references xml (id) on delete restrict on update restrict;

alter table record add constraint fk_record_created_by foreign key (created_by) references user (id) on delete restrict on update restrict;

alter table record add constraint fk_record_modified_by foreign key (modified_by) references user (id) on delete restrict on update restrict;

alter table record add constraint fk_record_survey foreign key (survey_id,survey_version) references survey (id,version) on delete restrict on update restrict;
create index ix_record_survey on record (survey_id,survey_version);

alter table ref_region add constraint fk_ref_region_ref_zone_id foreign key (ref_zone_id) references ref_zone (id) on delete restrict on update restrict;
create index ix_ref_region_ref_zone_id on ref_region (ref_zone_id);

alter table report add constraint fk_report_ref_zone_id foreign key (ref_zone_id) references ref_zone (id) on delete restrict on update restrict;
create index ix_report_ref_zone_id on report (ref_zone_id);

alter table report add constraint fk_report_ref_district_id foreign key (ref_district_id) references ref_district (id) on delete restrict on update restrict;
create index ix_report_ref_district_id on report (ref_district_id);

alter table report add constraint fk_report_ref_region_id foreign key (ref_region_id) references ref_region (id) on delete restrict on update restrict;
create index ix_report_ref_region_id on report (ref_region_id);

alter table report add constraint fk_report_imp_part_id foreign key (imp_part_id) references imp_part (id) on delete restrict on update restrict;
create index ix_report_imp_part_id on report (imp_part_id);

alter table report add constraint fk_report_ref_status_cd foreign key (ref_status_cd) references ref_status (cd) on delete restrict on update restrict;
create index ix_report_ref_status_cd on report (ref_status_cd);

alter table report add constraint fk_report_ref_program_cd foreign key (ref_program_cd) references ref_program (cd) on delete restrict on update restrict;
create index ix_report_ref_program_cd on report (ref_program_cd);

alter table report add constraint fk_report_tpm_id foreign key (tpm_id) references tpm (id) on delete restrict on update restrict;
create index ix_report_tpm_id on report (tpm_id);

alter table report add constraint fk_report_activity_status_cd foreign key (activity_status_cd) references ref_status (cd) on delete restrict on update restrict;
create index ix_report_activity_status_cd on report (activity_status_cd);

alter table report add constraint fk_report_document_id foreign key (document_id) references document (id) on delete restrict on update restrict;

alter table ref_sector add constraint fk_ref_sector_ref_program_cd foreign key (ref_program_cd) references ref_program (cd) on delete restrict on update restrict;
create index ix_ref_sector_ref_program_cd on ref_sector (ref_program_cd);

alter table report_sector add constraint fk_report_sector_ref_sector foreign key (ref_sector_id) references ref_sector (id) on delete restrict on update restrict;
create index ix_report_sector_ref_sector on report_sector (ref_sector_id);

alter table report_sector add constraint fk_report_sector_report foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_report_sector_report on report_sector (report_id);

alter table site add constraint fk_site_site_type_cd foreign key (site_type_cd) references site_type (cd) on delete restrict on update restrict;
create index ix_site_site_type_cd on site (site_type_cd);

alter table site add constraint fk_site_ref_zone_id foreign key (ref_zone_id) references ref_zone (id) on delete restrict on update restrict;
create index ix_site_ref_zone_id on site (ref_zone_id);

alter table site add constraint fk_site_ref_district_id foreign key (ref_district_id) references ref_district (id) on delete restrict on update restrict;
create index ix_site_ref_district_id on site (ref_district_id);

alter table site add constraint fk_site_ref_region_id foreign key (ref_region_id) references ref_region (id) on delete restrict on update restrict;
create index ix_site_ref_region_id on site (ref_region_id);

alter table site_selection add constraint fk_site_selection_imp_part_id foreign key (imp_part_id) references imp_part (id) on delete restrict on update restrict;

alter table site_selection add constraint fk_site_selection_user_id foreign key (user_id) references user (id) on delete restrict on update restrict;

alter table site_selection add constraint fk_site_selection_status foreign key (status) references ref_status (cd) on delete restrict on update restrict;

alter table site_selection add constraint fk_site_selection_tpm_id foreign key (tpm_id) references tpm (id) on delete restrict on update restrict;

alter table site_selection_activity add constraint fk_site_selection_activity_site_selection_id foreign key (site_selection_id) references site_selection (id) on delete restrict on update restrict;
create index ix_site_selection_activity_site_selection_id on site_selection_activity (site_selection_id);

alter table site_selection_activity add constraint fk_site_selection_activity_master_activity_id foreign key (master_activity_id) references master_activity (id) on delete restrict on update restrict;
create index ix_site_selection_activity_master_activity_id on site_selection_activity (master_activity_id);

alter table site_selection_comments add constraint fk_site_selection_comments_user_id foreign key (user_id) references user (id) on delete restrict on update restrict;

alter table site_selection_comments add constraint fk_site_selection_comments_site_selection_id foreign key (site_selection_id) references site_selection (id) on delete restrict on update restrict;

alter table site_selection_site add constraint fk_site_selection_site_site_selection_id foreign key (site_selection_id) references site_selection (id) on delete restrict on update restrict;
create index ix_site_selection_site_site_selection_id on site_selection_site (site_selection_id);

alter table site_selection_site add constraint fk_site_selection_site_site_id foreign key (site_id) references site (id) on delete restrict on update restrict;
create index ix_site_selection_site_site_id on site_selection_site (site_id);

alter table ref_sub_sector add constraint fk_ref_sub_sector_sector_id foreign key (sector_id) references ref_sector (id) on delete restrict on update restrict;
create index ix_ref_sub_sector_sector_id on ref_sub_sector (sector_id);

alter table report_sub_sector add constraint fk_report_sub_sector_ref_sub_sector foreign key (ref_sub_sector_id) references ref_sub_sector (id) on delete restrict on update restrict;
create index ix_report_sub_sector_ref_sub_sector on report_sub_sector (ref_sub_sector_id);

alter table report_sub_sector add constraint fk_report_sub_sector_report foreign key (report_id) references report (id) on delete restrict on update restrict;
create index ix_report_sub_sector_report on report_sub_sector (report_id);

alter table survey add constraint fk_survey_created_by foreign key (created_by) references user (id) on delete restrict on update restrict;

alter table survey add constraint fk_survey_status_cd foreign key (status_cd) references ref_status (cd) on delete restrict on update restrict;

alter table survey add constraint fk_survey_supervisor foreign key (supervisor) references user (id) on delete restrict on update restrict;

alter table survey add constraint fk_survey_ip_id foreign key (ip_id) references imp_part (id) on delete restrict on update restrict;

alter table survey add constraint fk_survey_xml_id foreign key (xml_id) references xml (id) on delete restrict on update restrict;

alter table user add constraint fk_user_ref_status_cd foreign key (ref_status_cd) references ref_status (cd) on delete restrict on update restrict;
create index ix_user_ref_status_cd on user (ref_status_cd);

alter table user add constraint fk_user_ref_role_cd foreign key (ref_role_cd) references ref_role (cd) on delete restrict on update restrict;
create index ix_user_ref_role_cd on user (ref_role_cd);

alter table user add constraint fk_user_imp_part_id foreign key (imp_part_id) references imp_part (id) on delete restrict on update restrict;

alter table user add constraint fk_user_tpm_id foreign key (tpm_id) references tpm (id) on delete restrict on update restrict;

alter table user_activity add constraint fk_user_activity_user_id foreign key (user_id) references user (id) on delete restrict on update restrict;
create index ix_user_activity_user_id on user_activity (user_id);


# --- !Downs

alter table answer drop foreign key fk_answer_question_id;
drop index ix_answer_question_id on answer;

alter table answer drop foreign key fk_answer_record_id;
drop index ix_answer_record_id on answer;

alter table beneficiaries drop foreign key fk_beneficiaries_report_id;
drop index ix_beneficiaries_report_id on beneficiaries;

alter table credentials drop foreign key fk_credentials_user_id;

alter table ref_district drop foreign key fk_ref_district_ref_region_id;
drop index ix_ref_district_ref_region_id on ref_district;

alter table donor_document drop foreign key fk_donor_document_donor_report_id;

alter table donor_report drop foreign key fk_donor_report_donor_report_type_cd;

alter table ovi_flag_reason drop foreign key fk_ovi_flag_reason_flag_reason;
drop index ix_ovi_flag_reason_flag_reason on ovi_flag_reason;

alter table ovi_flag_reason drop foreign key fk_ovi_flag_reason_ovi;
drop index ix_ovi_flag_reason_ovi on ovi_flag_reason;

alter table flash_report drop foreign key fk_flash_report_document_id;

alter table flash_report drop foreign key fk_flash_report_report_id;
drop index ix_flash_report_report_id on flash_report;

alter table groups drop foreign key fk_groups_parent_group_id;
drop index ix_groups_parent_group_id on groups;

alter table groups drop foreign key fk_groups_survey;
drop index ix_groups_survey on groups;

alter table imp_part drop foreign key fk_imp_part_ref_status_cd;
drop index ix_imp_part_ref_status_cd on imp_part;

alter table imp_part_member drop foreign key fk_imp_part_member_user_id;
drop index ix_imp_part_member_user_id on imp_part_member;

alter table imp_part_member drop foreign key fk_imp_part_member_imp_part_id;
drop index ix_imp_part_member_imp_part_id on imp_part_member;

alter table lessons_learned drop foreign key fk_lessons_learned_document_id;

alter table master_activity drop foreign key fk_master_activity_program_cd;

alter table master_activity drop foreign key fk_master_activity_imp_part_id;

alter table master_activity drop foreign key fk_master_activity_sector_id;

alter table master_activity drop foreign key fk_master_activity_subsector_id;

alter table master_activity drop foreign key fk_master_activity_zone_id;

alter table master_activity drop foreign key fk_master_activity_region_id;

alter table master_activity drop foreign key fk_master_activity_district_id;

alter table media drop foreign key fk_media_ovi_id;
drop index ix_media_ovi_id on media;

alter table message drop foreign key fk_message_sender_id;

alter table message drop foreign key fk_message_reply_reference_id;

alter table message_recipient drop foreign key fk_message_recipient_message_id;
drop index ix_message_recipient_message_id on message_recipient;

alter table message_recipient drop foreign key fk_message_recipient_recipient_id;
drop index ix_message_recipient_recipient_id on message_recipient;

alter table monitoring_report drop foreign key fk_monitoring_report_document_id;

alter table ovi drop foreign key fk_ovi_report_id;
drop index ix_ovi_report_id on ovi;

alter table ovi drop foreign key fk_ovi_ref_sector_id;
drop index ix_ovi_ref_sector_id on ovi;

alter table ovi_sub_sector drop foreign key fk_ovi_sub_sector_ovi;
drop index ix_ovi_sub_sector_ovi on ovi_sub_sector;

alter table ovi_sub_sector drop foreign key fk_ovi_sub_sector_ref_sub_sector;
drop index ix_ovi_sub_sector_ref_sub_sector on ovi_sub_sector;

alter table options drop foreign key fk_options_parent_option_id;
drop index ix_options_parent_option_id on options;

alter table options drop foreign key fk_options_media_id;

alter table options drop foreign key fk_options_question_id;
drop index ix_options_question_id on options;

alter table photo drop foreign key fk_photo_report_id;
drop index ix_photo_report_id on photo;

alter table question drop foreign key fk_question_group_id;
drop index ix_question_group_id on question;

alter table question drop foreign key fk_question_survey;
drop index ix_question_survey on question;

alter table record drop foreign key fk_record_xml_id;

alter table record drop foreign key fk_record_created_by;

alter table record drop foreign key fk_record_modified_by;

alter table record drop foreign key fk_record_survey;
drop index ix_record_survey on record;

alter table ref_region drop foreign key fk_ref_region_ref_zone_id;
drop index ix_ref_region_ref_zone_id on ref_region;

alter table report drop foreign key fk_report_ref_zone_id;
drop index ix_report_ref_zone_id on report;

alter table report drop foreign key fk_report_ref_district_id;
drop index ix_report_ref_district_id on report;

alter table report drop foreign key fk_report_ref_region_id;
drop index ix_report_ref_region_id on report;

alter table report drop foreign key fk_report_imp_part_id;
drop index ix_report_imp_part_id on report;

alter table report drop foreign key fk_report_ref_status_cd;
drop index ix_report_ref_status_cd on report;

alter table report drop foreign key fk_report_ref_program_cd;
drop index ix_report_ref_program_cd on report;

alter table report drop foreign key fk_report_tpm_id;
drop index ix_report_tpm_id on report;

alter table report drop foreign key fk_report_activity_status_cd;
drop index ix_report_activity_status_cd on report;

alter table report drop foreign key fk_report_document_id;

alter table ref_sector drop foreign key fk_ref_sector_ref_program_cd;
drop index ix_ref_sector_ref_program_cd on ref_sector;

alter table report_sector drop foreign key fk_report_sector_ref_sector;
drop index ix_report_sector_ref_sector on report_sector;

alter table report_sector drop foreign key fk_report_sector_report;
drop index ix_report_sector_report on report_sector;

alter table site drop foreign key fk_site_site_type_cd;
drop index ix_site_site_type_cd on site;

alter table site drop foreign key fk_site_ref_zone_id;
drop index ix_site_ref_zone_id on site;

alter table site drop foreign key fk_site_ref_district_id;
drop index ix_site_ref_district_id on site;

alter table site drop foreign key fk_site_ref_region_id;
drop index ix_site_ref_region_id on site;

alter table site_selection drop foreign key fk_site_selection_imp_part_id;

alter table site_selection drop foreign key fk_site_selection_user_id;

alter table site_selection drop foreign key fk_site_selection_status;

alter table site_selection drop foreign key fk_site_selection_tpm_id;

alter table site_selection_activity drop foreign key fk_site_selection_activity_site_selection_id;
drop index ix_site_selection_activity_site_selection_id on site_selection_activity;

alter table site_selection_activity drop foreign key fk_site_selection_activity_master_activity_id;
drop index ix_site_selection_activity_master_activity_id on site_selection_activity;

alter table site_selection_comments drop foreign key fk_site_selection_comments_user_id;

alter table site_selection_comments drop foreign key fk_site_selection_comments_site_selection_id;

alter table site_selection_site drop foreign key fk_site_selection_site_site_selection_id;
drop index ix_site_selection_site_site_selection_id on site_selection_site;

alter table site_selection_site drop foreign key fk_site_selection_site_site_id;
drop index ix_site_selection_site_site_id on site_selection_site;

alter table ref_sub_sector drop foreign key fk_ref_sub_sector_sector_id;
drop index ix_ref_sub_sector_sector_id on ref_sub_sector;

alter table report_sub_sector drop foreign key fk_report_sub_sector_ref_sub_sector;
drop index ix_report_sub_sector_ref_sub_sector on report_sub_sector;

alter table report_sub_sector drop foreign key fk_report_sub_sector_report;
drop index ix_report_sub_sector_report on report_sub_sector;

alter table survey drop foreign key fk_survey_created_by;

alter table survey drop foreign key fk_survey_status_cd;

alter table survey drop foreign key fk_survey_supervisor;

alter table survey drop foreign key fk_survey_ip_id;

alter table survey drop foreign key fk_survey_xml_id;

alter table user drop foreign key fk_user_ref_status_cd;
drop index ix_user_ref_status_cd on user;

alter table user drop foreign key fk_user_ref_role_cd;
drop index ix_user_ref_role_cd on user;

alter table user drop foreign key fk_user_imp_part_id;

alter table user drop foreign key fk_user_tpm_id;

alter table user_activity drop foreign key fk_user_activity_user_id;
drop index ix_user_activity_user_id on user_activity;

drop table if exists answer;

drop table if exists beneficiaries;

drop table if exists credentials;

drop table if exists ref_district;

drop table if exists document;

drop table if exists donor_document;

drop table if exists donor_report;

drop table if exists donor_report_type;

drop table if exists flag_reason;

drop table if exists ovi_flag_reason;

drop table if exists flash_report;

drop table if exists groups;

drop table if exists imp_part;

drop table if exists imp_part_member;

drop table if exists lessons_learned;

drop table if exists master_activity;

drop table if exists media;

drop table if exists message;

drop table if exists message_recipient;

drop table if exists monitoring_report;

drop table if exists ovi;

drop table if exists ovi_sub_sector;

drop table if exists options;

drop table if exists photo;

drop table if exists ref_program;

drop table if exists question;

drop table if exists record;

drop table if exists ref_region;

drop table if exists report;

drop table if exists ref_role;

drop table if exists ref_sector;

drop table if exists report_sector;

drop table if exists site;

drop table if exists site_selection;

drop table if exists site_selection_activity;

drop table if exists site_selection_comments;

drop table if exists site_selection_site;

drop table if exists site_type;

drop table if exists ref_status;

drop table if exists ref_sub_sector;

drop table if exists report_sub_sector;

drop table if exists survey;

drop table if exists tpm;

drop table if exists user;

drop table if exists user_activity;

drop table if exists user_token;

drop table if exists xml;

drop table if exists ref_zone;

