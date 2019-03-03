-- ----------------------------
-- Table structure for a1activity
-- ----------------------------
CREATE TABLE IF NOT EXISTS `a1activity`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ActivityRule_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ActivityName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `CreateUser_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `State` int(11) NOT NULL,
  `Store_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  `Weight` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for a1activityrules
-- ----------------------------
CREATE TABLE  IF NOT EXISTS `a1activityrules`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ActivityCustomer_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ActivityModeCode` int(11) NOT NULL,
  `ActivityTypeCode` int(11) NOT NULL,
  `ApplicableAmount` decimal(18, 2) NOT NULL,
  `DayUse` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DiscountRatio` decimal(18, 2) NOT NULL,
  `Dishes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DishesTypes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EndTime` datetime(0) NOT NULL,
  `FullReductionAmount` decimal(18, 2) NOT NULL,
  `IsDayUse` bit(1) NOT NULL,
  `IsDishes` bit(1) NOT NULL,
  `IsExclusive` bit(1) NOT NULL,
  `IsMonthUse` bit(1) NOT NULL,
  `IsWeekUse` bit(1) NOT NULL,
  `MonthUse` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `StartTime` datetime(0) NOT NULL,
  `Version` bigint(20) NOT NULL,
  `WeekUse` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for a1activitysingleproduct
-- ----------------------------
CREATE TABLE IF NOT EXISTS `a1activitysingleproduct`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ActivityRule_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BuyNum` decimal(18, 2) NOT NULL,
  `DirectSendNum` decimal(18, 2) NOT NULL,
  `DishesStorehouse_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OldPrice` decimal(18, 2) NOT NULL,
  `PreferenceAmount` decimal(18, 2) NOT NULL,
  `PromotionalPrice` decimal(18, 2) NOT NULL,
  `SendNum` decimal(18, 2) NOT NULL,
  `SingerRatio` decimal(18, 2) NOT NULL,
  `State` bit(1) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Add Column Activity for a1order
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1order ADD COLUMN Activity longtext;');

-- ----------------------------
-- Update the type of Column Activitie for a1order
-- ----------------------------
ALTER TABLE a1orderdetail MODIFY COLUMN Activitie LONGTEXT;

-- ----------------------------
-- Add Column IsMaxActivity for a1config
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1config ADD COLUMN IsMaxActivity int(1);');