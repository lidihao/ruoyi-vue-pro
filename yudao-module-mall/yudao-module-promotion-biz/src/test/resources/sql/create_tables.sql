CREATE TABLE IF NOT EXISTS `market_activity`
(
    `id`                    bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `title`                 varchar(64) NOT NULL,
    `activity_type`         tinyint(4)  NOT NULL,
    `status`                tinyint(4)  NOT NULL,
    `start_time`            datetime    NOT NULL,
    `end_time`              datetime    NOT NULL,
    `invalid_time`          datetime,
    `delete_time`           datetime,
    `time_limited_discount` varchar(2000),
    `full_privilege`        varchar(2000),
    `creator`               varchar(64)          DEFAULT '',
    `create_time`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`               varchar(64)          DEFAULT '',
    `update_time`           datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`               bit         NOT NULL DEFAULT FALSE,
    `tenant_id`             bigint(20)  NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '促销活动';

CREATE TABLE IF NOT EXISTS `promotion_coupon_template`
(
    `id`                   bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`                 varchar(64)  NOT NULL,
    `status`               int      NOT NULL,
    `total_count`          int      NOT NULL,
    `take_limit_count`     int      NOT NULL,
    `take_type`            int      NOT NULL,
    `use_price`            int      NOT NULL,
    `product_scope`        int      NOT NULL,
    `product_spu_ids`      varchar(64),
    `validity_type`        int      NOT NULL,
    `valid_start_time`     datetime,
    `valid_end_time`       datetime,
    `fixed_start_term`     int,
    `fixed_end_term`       int,
    `discount_type`        int      NOT NULL,
    `discount_percent`     int,
    `discount_price`       int,
    `discount_limit_price` int,
    `take_count`           int      NOT NULL DEFAULT 0,
    `use_count`            int      NOT NULL DEFAULT 0,
    `creator`              varchar(64)           DEFAULT '',
    `create_time`          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`              varchar(64)           DEFAULT '',
    `update_time`          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`              bit      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '优惠劵模板';

CREATE TABLE IF NOT EXISTS `promotion_coupon`
(
    `id`                   bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `template_id`          bigint   NOT NULL,
    `name`                 varchar(64)  NOT NULL,
    `status`               int      NOT NULL,
    `user_id`              bigint   NOT NULL,
    `take_type`            int      NOT NULL,
    `useprice`             int      NOT NULL,
    `valid_start_time`     datetime NOT NULL,
    `valid_end_time`       datetime NOT NULL,
    `product_scope`        int      NOT NULL,
    `product_spu_ids`      varchar(64),
    `discount_type`        int      NOT NULL,
    `discount_percent`     int,
    `discount_price`       int,
    `discount_limit_price` int,
    `use_order_id`         bigint,
    `use_time`             datetime,
    `creator`              varchar(64)           DEFAULT '',
    `create_time`          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`              varchar(64)           DEFAULT '',
    `update_time`          datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`              bit      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '优惠劵';

CREATE TABLE IF NOT EXISTS `promotion_reward_activity`
(
    `id`              bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`            varchar(64)  NOT NULL,
    `status`          int      NOT NULL,
    `start_time`      datetime NOT NULL,
    `end_time`        datetime NOT NULL,
    `remark`          varchar(64),
    `condition_type`  int      NOT NULL,
    `product_scope`   int      NOT NULL,
    `product_spu_ids` varchar(64),
    `rules`           varchar(64),
    `creator`         varchar(64)           DEFAULT '',
    `create_time`     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`         varchar(64)           DEFAULT '',
    `update_time`     datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`         bit      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '满减送活动';

CREATE TABLE IF NOT EXISTS `promotion_discount_activity`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`        varchar(64)  NOT NULL,
    `status`      int      NOT NULL,
    `start_time`  datetime NOT NULL,
    `end_time`    datetime NOT NULL,
    `remark`      varchar(64),
    `creator`     varchar(64)           DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(64)           DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit      NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '限时折扣活动';

CREATE TABLE IF NOT EXISTS `promotion_seckill_activity`
(
    `id`                 bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `spu_id`             bigint   NOT NULL,
    `name`               varchar(64)  NOT NULL,
    `status`             int      NOT NULL,
    `remark`             varchar(64),
    `start_time`         varchar(64)  NOT NULL,
    `end_time`           varchar(64)  NOT NULL,
    `sort`               int      NOT NULL,
    `config_ids`         varchar(64)  NOT NULL,
    `order_count`        int      NOT NULL,
    `user_count`         int      NOT NULL,
    `total_price`        int      NOT NULL,
    `total_limit_count`  int,
    `single_limit_count` int,
    `stock`              int,
    `total_stock`        int,
    `creator`            varchar(64)           DEFAULT '',
    `create_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)           DEFAULT '',
    `update_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit      NOT NULL DEFAULT FALSE,
    `tenant_id`          bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '秒杀活动';

CREATE TABLE IF NOT EXISTS `promotion_seckill_config`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`        varchar(64)  NOT NULL,
    `start_time`  varchar(64)  NOT NULL,
    `end_time`    varchar(64)  NOT NULL,
    `pic_url`     varchar(64)  NOT NULL,
    `status`      int      NOT NULL,
    `creator`     varchar(64)           DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(64)           DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit      NOT NULL DEFAULT FALSE,
    `tenant_id`   bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '秒杀时段配置';

CREATE TABLE IF NOT EXISTS `promotion_combination_activity`
(
    `id`                 bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`               varchar(64)  NOT NULL,
    `spu_id`             bigint,
    `total_limit_count`  int      NOT NULL,
    `single_limit_count` int      NOT NULL,
    `start_time`         varchar(64)  NOT NULL,
    `end_time`           varchar(64)  NOT NULL,
    `user_size`          int      NOT NULL,
    `total_num`          int      NOT NULL,
    `success_num`        int      NOT NULL,
    `order_user_count`   int      NOT NULL,
    `virtual_group`      int      NOT NULL,
    `status`             int      NOT NULL,
    `limit_duration`     int      NOT NULL,
    `creator`            varchar(64)           DEFAULT '',
    `create_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)           DEFAULT '',
    `update_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit      NOT NULL DEFAULT FALSE,
    `tenant_id`          bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '拼团活动';

CREATE TABLE IF NOT EXISTS `promotion_article_category`
(
    `id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`        varchar(64)  NOT NULL,
    `pic_url`     varchar(64),
    `status`      int      NOT NULL,
    `sort`        int      NOT NULL,
    `creator`     varchar(64)           DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`     varchar(64)           DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`     bit      NOT NULL DEFAULT FALSE,
    `tenant_id`   bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '文章分类表';

CREATE TABLE IF NOT EXISTS `promotion_article`
(
    `id`               bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `category_id`      bigint   NOT NULL,
    `title`            varchar(64)  NOT NULL,
    `author`           varchar(64),
    `pic_url`          varchar(64)  NOT NULL,
    `introduction`     varchar(64),
    `browse_count`     varchar(64),
    `sort`             int      NOT NULL,
    `status`           int      NOT NULL,
    `spu_id`           bigint   NOT NULL,
    `recommend_hot`    bit      NOT NULL,
    `recommend_banner` bit      NOT NULL,
    `content`          varchar(64)  NOT NULL,
    `creator`          varchar(64)           DEFAULT '',
    `create_time`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`          varchar(64)           DEFAULT '',
    `update_time`      datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`          bit      NOT NULL DEFAULT FALSE,
    `tenant_id`        bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '文章管理表';

CREATE TABLE IF NOT EXISTS `promotion_diy_template`
(
    `id`                 bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `name`               varchar(64)  NOT NULL,
    `used`               bit      NOT NULL,
    `used_time`          varchar(64),
    `remark`             varchar(64),
    `preview_pic_urls`   varchar(64),
    `property`           varchar(64)  NOT NULL,
    `creator`            varchar(64)           DEFAULT '',
    `create_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)           DEFAULT '',
    `update_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit      NOT NULL DEFAULT FALSE,
    `tenant_id`          bigint   NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) COMMENT '装修模板';
CREATE TABLE IF NOT EXISTS `promotion_diy_page`
(
    `id`                 bigint   NOT NULL AUTO_INCREMENT COMMENT '任务编号',
    `template_id`        bigint   NOT NULL,
    `name`               varchar(64)  NOT NULL,
    `remark`             varchar(64),
    `preview_pic_urls`   varchar(64),
    `property`           varchar(64),
    `creator`            varchar(64)           DEFAULT '',
    `create_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)           DEFAULT '',
    `update_time`        datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit      NOT NULL DEFAULT FALSE,
    `tenant_id`          bigint   NOT NULL,
    PRIMARY KEY (`id`)
) COMMENT '装修页面';