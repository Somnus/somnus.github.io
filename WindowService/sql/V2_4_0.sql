-- ----------------------------
-- Table structure for a1thirdpartyorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS `a1thirdpartyorder`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BillOrderNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BillOrderUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BusinessDate` datetime(6) NOT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `CustomerNum` int(11) NOT NULL,
  `HandleTime` datetime(6) NOT NULL,
  `IsOver` bit(1) NOT NULL,
  `Market_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Market_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MemberID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NickName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderSource` int(11) NOT NULL,
  `OrderUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RefusalRemarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SanOrderState` int(11) NOT NULL,
  `SubTotalMoney` decimal(18, 2) NOT NULL,
  `TableUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for a1thirdpartyorderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS `a1thirdpartyorderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Activitie` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ActivitieMoney` decimal(18, 2) NOT NULL,
  `BackQuantity` decimal(18, 2) NOT NULL,
  `BillOrderNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BillOrderUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BusinessDate` datetime(6) NOT NULL,
  `CanOperQuantity` decimal(18, 2) NOT NULL,
  `CreateOrderUser_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(6) NOT NULL,
  `Discount` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DiscountMoney` decimal(18, 2) NOT NULL,
  `Dishes_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DistributionMoney` decimal(18, 2) NOT NULL,
  `Equipment_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Equipment_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GiveupMoney` decimal(18, 2) NOT NULL,
  `KitOrder_ParentUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KouBei_Money` decimal(18, 2) NOT NULL,
  `OldPrice` decimal(18, 2) NOT NULL,
  `OrderCustomerID` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OrderSource` int(11) NULL DEFAULT NULL,
  `OrderType` int(11) NOT NULL,
  `OrderUser_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OtherMoney` decimal(18, 2) NOT NULL,
  `Price` decimal(18, 2) NOT NULL,
  `PrintNum` int(11) NOT NULL,
  `Proportion` decimal(18, 2) NOT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReminderNum` int(11) NOT NULL,
  `RgWipeMoney` decimal(18, 2) NOT NULL,
  `SendQuantity` decimal(18, 2) NOT NULL,
  `ServiceMoney` decimal(18, 2) NOT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Setmeal_ParentUUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SettleMoney` decimal(18, 2) NOT NULL,
  `SignFlat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SingleRemarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SubTotalMoney` decimal(18, 2) NOT NULL,
  `TakeFoodTime` datetime(6) NOT NULL,
  `TakeFoodUser_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `UnitName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_BillOrderUUID`(`BillOrderUUID`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_CreateTime`(`CreateTime`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_Dishes_UUID`(`Dishes_UUID`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_DisplayTypeBig_UUID`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_Setmeal_ParentUUID`(`Setmeal_ParentUUID`) USING BTREE,
  INDEX `IX_A1ThirdPartyOrderDetail_Stalls_UUID`(`Stalls_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Add Column OrderCustomerID,OrderSource for a1orderdetail
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1orderdetail ADD COLUMN OrderCustomerID VARCHAR(100);');
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1orderdetail ADD COLUMN OrderSource INT(11);');

-- ----------------------------
-- Add Column PrintPlan for a1equipment
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1equipment ADD COLUMN PrintPlan INT(11);');

-- ----------------------------
-- Add Column PrintPlan,PrintEquipmentID,PrintEquipmentName for a1kitchenorder
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1kitchenorder ADD COLUMN KitchenType INT(11);');
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1kitchenorder ADD COLUMN PrintEquipmentID VARCHAR(36);');
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1kitchenorder ADD COLUMN PrintEquipmentName VARCHAR(50);');

-- ----------------------------
-- Add Column IsBackDisheState for a1config
-- ----------------------------
CALL xlypos_dev_2_2_add_index('ALTER TABLE a1config ADD COLUMN IsBackDisheState BIT(1);');