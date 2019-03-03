SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for a1acewillpayid
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1acewillpayid`  (
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算订单ID',
  `Pay_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微生活支付商户订单ID',
  `IsCancel` bit(1) NULL DEFAULT NULL COMMENT '订单是否撤销',
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1acewillpayorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS `a1acewillpayorder`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MemberCno` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Store_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Store_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Pay_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PayType_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `PayType_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `Before_Credit` int(11) NULL DEFAULT NULL,
  `Before_Balance` int(11) NULL DEFAULT NULL,
  `After_Credit` int(11) NULL DEFAULT NULL,
  `After_Balance` int(11) NULL DEFAULT NULL,
  `OrderUseCredit` int(11) NULL DEFAULT NULL,
  `OrderUseBalance` int(11) NULL DEFAULT NULL,
  `CouponsMoney` decimal(18, 2) NULL DEFAULT NULL,
  `CreateTime` datetime(0) NULL DEFAULT NULL,
  `Version` bigint(13) NULL DEFAULT NULL,
  `ConsumeType` int(11) NULL DEFAULT NULL COMMENT '1 支付  2 兑换',
  `PayMoney` decimal(18, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '会员支付订单记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1acewillpayorderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1acewillpayorderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MemberPay_UUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CouponID` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CouponName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `CouponFace` decimal(18, 2) NULL DEFAULT NULL,
  `CouponNum` int(11) NULL DEFAULT NULL,
  `GiftName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `GiftCredit` int(11) NULL DEFAULT NULL,
  `GiftCid` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `GiftNum` int(11) NULL DEFAULT NULL,
  `Version` bigint(13) NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '会员支付订单明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1authorization
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1authorization`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authorization` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ExpireTime` datetime(0) NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1checkordermax
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1checkordermax`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `MaxNumber` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1config
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1config`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BusinessHour` datetime(0) NOT NULL,
  `CcCommission` bit(1) NOT NULL,
  `CheckOrderFooter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CheckOrderPrintNum` int(11) NOT NULL,
  `CloudMemberUrl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CloudUrl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FaceUrl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsActivity` bit(1) NOT NULL,
  `IsAutomaticScanOrder` bit(1) NOT NULL,
  `IsFormula` bit(1) NOT NULL,
  `IsInit` bit(1) NOT NULL,
  `IsVip` bit(1) NOT NULL,
  `Isgiveup` int(11) NOT NULL,
  `Koubei_UUID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PcCommission` bit(1) NOT NULL,
  `Pointtype` int(11) NOT NULL,
  `QzCommission` bit(1) NOT NULL,
  `Reservetime` int(11) NOT NULL,
  `Sbdistribution` bit(1) NOT NULL,
  `Store_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SyCommission` bit(1) NOT NULL,
  `Symbol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dataget
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1dataget`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ErrorCount` int(11) NOT NULL,
  `ErrorMsg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IsSuccess` bit(1) NOT NULL,
  `ObjName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NULL DEFAULT NULL,
  `URL` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dataupload
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1dataupload`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ErrorCount` int(11) NOT NULL,
  `ErrorMsg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IsSuccess` bit(1) NOT NULL,
  `Local_Table` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Local_UUID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ObjName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1discount
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1discount`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BgColor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsEdit` bit(1) NOT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Money` decimal(18, 2) NOT NULL,
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NotInDishes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NotInDishesType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Number` decimal(18, 2) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `IsEnable_IDX`(`IsEnable`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dishes
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1dishes`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DishesStorehouse_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IsCanSales` bit(1) NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `IsLimit` bit(1) NULL DEFAULT NULL,
  `IsOnline` bit(1) NOT NULL,
  `Jianpin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` decimal(18, 2) NOT NULL,
  `Resources` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SKU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sort` int(11) NULL DEFAULT NULL,
  `Stalls_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Stock` decimal(18, 2) NULL DEFAULT NULL,
  `Sudoku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` int(11) NOT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `DisplayTypeBig_UUID_IDX`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `IsEnable_IDX`(`IsEnable`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE,
  INDEX `Type_IDX`(`Type`) USING BTREE,
  INDEX `IsCanSales_IDX`(`IsCanSales`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dishesfiles
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1dishesfiles`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FilePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsDefault` bit(1) NOT NULL,
  `Type` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `Type_IDX`(`Type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1disheslimit
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1disheslimit`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `User_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dishesstorehouse
-- ----------------------------;
CREATE TABLE IF NOT EXISTS  `a1dishesstorehouse`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FullPinyin` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Jianpin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Sudoku` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1dishestype
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1dishestype`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Fid_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sort` int(11) NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `IDX_Type`(`Type`) USING BTREE,
  INDEX `IDX_Fid_UUID`(`Fid_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1duty
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1duty`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DiscountMoney` decimal(18, 2) NOT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SendMoney` decimal(18, 2) NOT NULL,
  `Sort` int(11) NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  `Weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1equipment
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1equipment`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IpAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsAutoProduce` bit(1) NOT NULL,
  `IsEnable` bit(1) NOT NULL,
  `MacAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MakeInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Port` int(11) NOT NULL,
  `PrintInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PrintType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID_Array` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TableArea_UUID_Array` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Type` int(11) NULL DEFAULT NULL,
  `UpdateTime` datetime(0) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Type_IDX`(`Type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1functionfont
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1functionfont`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitchenorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitchenorder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Equipment_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Equipment_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsFail` bit(1) NOT NULL,
  `IsPrint` bit(1) NOT NULL,
  `IsUpload` bit(1) NOT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderType` int(11) NOT NULL,
  `OrderUser_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PrintNum` int(11) NOT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StateStr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableArea_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableArea_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `BusinessDate_IDX`(`BusinessDate`) USING BTREE,
  INDEX `Equipment_UUID_IDX`(`Equipment_UUID`) USING BTREE,
  INDEX `Service_UUID_IDX`(`Service_UUID`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE,
  INDEX `TableArea_UUID_IDX`(`TableArea_UUID`) USING BTREE,
  INDEX `Table_UUID_IDX`(`Table_UUID`) USING BTREE,
  INDEX `IsPrint_IDX`(`IsPrint`) USING BTREE,
  INDEX `IsFail_IDX`(`IsFail`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitchenorderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitchenorderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Dishes_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_SKU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrder_ParentUUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderDetail_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SingleRemarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `State` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `DisplayTypeBig_UUID_IDX`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `KitOrder_UUID_IDX`(`KitOrder_UUID`) USING BTREE,
  INDEX `OrderDetail_UUID_IDX`(`OrderDetail_UUID`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitexporder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitexporder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BiographyTime` datetime(0) NOT NULL,
  `Biography_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Biography_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `Equipment_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsUpload` bit(1) NOT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PrintOrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProduceTime` datetime(0) NOT NULL,
  `Produce_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Produce_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StallsInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Equipment_UUID_IDX`(`Equipment_UUID`) USING BTREE,
  INDEX `Produce_UUID_IDX`(`Produce_UUID`) USING BTREE,
  INDEX `Biography_UUID_IDX`(`Biography_UUID`) USING BTREE,
  INDEX `BusinessDate_IDX`(`BusinessDate`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitexporderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitexporderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_SKU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitExpOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrderDetail_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderDetail_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TabelArea_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableArea_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `DisplayTypeBig_UUID_IDX`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `KitOrderDetail_UUID_IDX`(`KitOrderDetail_UUID`) USING BTREE,
  INDEX `KitOrder_UUID_IDX`(`KitOrder_UUID`) USING BTREE,
  INDEX `OrderDetail_UUID_IDX`(`OrderDetail_UUID`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE,
  INDEX `TableArea_UUID_IDX`(`TableArea_UUID`) USING BTREE,
  INDEX `Table_UUID_IDX`(`Table_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitexprforder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitexprforder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ProduceTime` datetime(0) NOT NULL,
  `Produce_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Produce_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RefundTime` datetime(0) NOT NULL,
  `Refund_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Refund_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `StallsInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Produce_UUID_IDX`(`Produce_UUID`) USING BTREE,
  INDEX `BusinessDate_IDX`(`BusinessDate`) USING BTREE,
  INDEX `Status_IDX`(`Status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1kitexprforderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1kitexprforderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_SKU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitExpRfOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrderDetail_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KitOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderDetail_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Record` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TabelArea_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableArea_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TotalQuantity` decimal(18, 2) NOT NULL,
  `UnitName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `DisplayTypeBig_UUID_IDX`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `KitOrderDetail_UUID_IDX`(`KitOrderDetail_UUID`) USING BTREE,
  INDEX `KitOrder_UUID_IDX`(`KitOrder_UUID`) USING BTREE,
  INDEX `OrderDetail_UUID_IDX`(`OrderDetail_UUID`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE,
  INDEX `TableArea_UUID_IDX`(`TableArea_UUID`) USING BTREE,
  INDEX `Table_UUID_IDX`(`Table_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1log
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1log`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `LogContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LogType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Store_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `CreateTime_IDX`(`CreateTime`) USING BTREE,
  INDEX `LogType_IDX`(`LogType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1market
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1market`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Endtime` int(11) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Starttime` int(11) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1memberpaydetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1memberpaydetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PayMoney` decimal(18, 2) NOT NULL,
  `PayOrder_UUID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PayRechargeMoney` decimal(18, 2) NOT NULL,
  `RechargeShopCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1memberpayorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1memberpayorder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AddTime` datetime(0) NOT NULL,
  `AddUserID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AddUserName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AfterMemCurrentStoreValue` decimal(18, 2) NOT NULL,
  `AfterMemFreeStoreValue` decimal(18, 2) NOT NULL,
  `BeforeMemCurrentStoreValue` decimal(18, 2) NOT NULL,
  `BeforeMemFreeStoreValue` decimal(18, 2) NOT NULL,
  `LastUpdateTime` datetime(0) NOT NULL,
  `MemberID` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderState` int(11) NOT NULL,
  `OrderType` int(11) NOT NULL,
  `PayMoney` decimal(18, 2) NOT NULL,
  `PayRechargeMoney` decimal(18, 2) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1optionnote
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1optionnote`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Type_IDX`(`Type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1order
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1order`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ActivitieMoney` decimal(18, 2) NOT NULL,
  `BackCheckNum` int(11) NOT NULL,
  `BillMoeny` decimal(18, 2) NOT NULL,
  `BillRemarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BillTime` datetime(0) NOT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `CashTime` datetime(0) NOT NULL,
  `CashUser_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Discount` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DiscountMoney` decimal(18, 2) NOT NULL,
  `Discount_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DistributionMoney` decimal(18, 2) NOT NULL,
  `GiveupMoney` decimal(18, 2) NOT NULL,
  `HasPayMoney` decimal(18, 2) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `IsBack` bit(1) NULL DEFAULT NULL,
  `IsBill` bit(1) NOT NULL,
  `KouBei_Money` decimal(18, 2) NOT NULL,
  `Market_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Market_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Member_Info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OrderType` int(11) NOT NULL,
  `OtherMoney` decimal(18, 2) NOT NULL,
  `PrintNum` int(11) NOT NULL,
  `PrivateRoomMoney` decimal(18, 2) NOT NULL,
  `Remarks` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RgWipeMoney` decimal(18, 2) NOT NULL,
  `ServiceMoney` decimal(18, 2) NOT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SettleMoney` decimal(18, 2) NOT NULL,
  `SettlePrivateRoomMoney` decimal(18, 2) NOT NULL,
  `State` int(11) NOT NULL,
  `StateRemarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SubTotalMoney` decimal(18, 2) NOT NULL,
  `UnPaidMoney` decimal(18, 2) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `BusinessDate_IDX`(`BusinessDate`) USING BTREE,
  INDEX `Service_UUID_IDX`(`Service_UUID`) USING BTREE,
  INDEX `OrderType_IDX`(`OrderType`) USING BTREE,
  INDEX `State_IDX`(`State`) USING BTREE,
  INDEX `CashTime_IDX`(`CashTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1orderbackdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1orderbackdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AfterMoney` decimal(18, 2) NOT NULL,
  `BeforeMoney` decimal(18, 2) NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Reasons` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `User_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `User_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `User_UUID_IDX`(`User_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1orderdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1orderdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Activitie` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ActivitieMoney` decimal(18, 2) NOT NULL,
  `BackQuantity` decimal(18, 2) NOT NULL,
  `BillOrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BillOrderUUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `CanOperQuantity` decimal(18, 2) NOT NULL,
  `CreateOrderUser_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Discount` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DiscountMoney` decimal(18, 2) NOT NULL,
  `Dishes_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DisplayTypeBig_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DisplayTypeSmall_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DistributionMoney` decimal(18, 2) NOT NULL,
  `Equipment_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Equipment_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GiveupMoney` decimal(18, 2) NOT NULL,
  `KitOrder_ParentUUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KouBei_Money` decimal(18, 2) NOT NULL,
  `OldPrice` decimal(18, 2) NOT NULL,
  `OrderType` int(11) NOT NULL,
  `OrderUser_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OtherMoney` decimal(18, 2) NOT NULL,
  `Price` decimal(18, 2) NOT NULL,
  `PrintNum` int(11) NOT NULL,
  `Proportion` decimal(18, 2) NOT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReminderNum` int(11) NOT NULL,
  `RgWipeMoney` decimal(18, 2) NOT NULL,
  `SendQuantity` decimal(18, 2) NOT NULL,
  `ServiceMoney` decimal(18, 2) NOT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Setmeal_ParentUUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SettleMoney` decimal(18, 2) NOT NULL,
  `SignFlat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SingleRemarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Stalls_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SubTotalMoney` decimal(18, 2) NOT NULL,
  `TakeFoodTime` datetime(0) NOT NULL,
  `TakeFoodUser_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `UnitName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `DisplayTypeBig_UUID_IDX`(`DisplayTypeBig_UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `Service_UUID_IDX`(`Service_UUID`) USING BTREE,
  INDEX `Stalls_UUID_IDX`(`Stalls_UUID`) USING BTREE,
  INDEX `OrderType_IDX`(`OrderType`) USING BTREE,
  INDEX `Type_IDX`(`Type`) USING BTREE,
  INDEX `CreateTime_IDX`(`CreateTime`) USING BTREE,
  INDEX `BillOrderUUID_IDX`(`BillOrderUUID`) USING BTREE,
  INDEX `Setmeal_ParentUUID_IDX`(`Setmeal_ParentUUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1ordersplit
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1ordersplit`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BillOrder_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SplitNum` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Service_UUID_IDX`(`Service_UUID`) USING BTREE,
  INDEX `BillOrder_UUID_IDX`(`BillOrder_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1paycarddetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1paycarddetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BeginTime` datetime(0) NULL DEFAULT NULL,
  `DishIDs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DishTypeIDs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EndTime` datetime(0) NULL DEFAULT NULL,
  `FaceValue` decimal(18, 2) NOT NULL,
  `IsContain` bit(1) NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `IsTogether` bit(1) NULL DEFAULT NULL,
  `MarkLimit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Money` decimal(18, 2) NOT NULL,
  `MoneyLimit` decimal(18, 2) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NumLimit` int(11) NULL DEFAULT NULL,
  `PayType_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  `WeekLimt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1paydetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1paydetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ActualAmount` decimal(18, 2) NOT NULL,
  `CardMoney` decimal(18, 2) NOT NULL,
  `CardNum` int(11) NULL DEFAULT NULL,
  `Card_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Card_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `IsBack` bit(1) NOT NULL,
  `IsCanBack` bit(1) NOT NULL,
  `IsSuccess` bit(1) NOT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayMoney` decimal(18, 2) NOT NULL,
  `PayOrderNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayTypeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayType_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `PayType_UUID_IDX`(`PayType_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1paytype
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1paytype`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BgColor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IsCanBack` bit(1) NOT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayWay_UUID` int(11) NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1paytypeother
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1paytypeother`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FaceValue` decimal(18, 2) NOT NULL,
  `Money` decimal(18, 2) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PayType_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1petcardpayorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1petcardpayorder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AddUserID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AddUserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AferLeaveMoney` decimal(18, 2) NOT NULL,
  `BeforeLeaveMoney` decimal(18, 2) NOT NULL,
  `IsCanBack` bit(1) NOT NULL,
  `LastUpdateTime` datetime(0) NOT NULL,
  `OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PayMoney` decimal(18, 2) NOT NULL,
  `PetCardNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1scanorder
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1scanorder`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `JsonData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `Status_IDX`(`Status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1setmealdetail
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1setmealdetail`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Price` decimal(18, 2) NOT NULL,
  `Quantity` decimal(18, 2) NOT NULL,
  `Ruels_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `Ruels_UUID_IDX`(`Ruels_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1setmealrule
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1setmealrule`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `IsNeed` bit(1) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RequiredNumber` int(11) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `IsEnable_IDX`(`IsEnable`) USING BTREE,
  INDEX `IsNeed_IDX`(`IsNeed`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1setmealrulerelationship
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1setmealrulerelationship`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Dishes_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SetmealRule_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Dishes_UUID_IDX`(`Dishes_UUID`) USING BTREE,
  INDEX `SetmealRule_UUID_IDX`(`SetmealRule_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1shift
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1shift`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Store_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpdateTime` datetime(0) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1stalls
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1stalls`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IsEnable` bit(1) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1table
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1table`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BiographyCoefficient` decimal(18, 2) NULL DEFAULT NULL,
  `Capacity` int(11) NULL DEFAULT NULL,
  `CleanScore` decimal(18, 2) NULL DEFAULT NULL,
  `IsEnable` bit(1) NOT NULL,
  `IsInvented` bit(1) NOT NULL,
  `IsPrivate` bit(1) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PrivateMoney` decimal(18, 2) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ServingCoefficient` decimal(18, 2) NULL DEFAULT NULL,
  `Sort` int(11) NULL DEFAULT NULL,
  `TableArea_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `IsEnable_IDX`(`IsEnable`) USING BTREE,
  INDEX `TableArea_UUID_IDX`(`TableArea_UUID`) USING BTREE,
  INDEX `Sort_IDX`(`Sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tablearea
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tablearea`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Sort` int(11) NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  `IsEnable` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tablechange
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tablechange`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `IsPrint` bit(1) NOT NULL,
  `PrintNum` int(11) NOT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TargetTableName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tablelog
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tablelog`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `LogType` int(11) NOT NULL,
  `ReMarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `Service_UUID_IDX`(`Service_UUID`) USING BTREE,
  INDEX `LogType_IDX`(`LogType`) USING BTREE,
  INDEX `CreateTime_IDX`(`CreateTime`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tableservicegroup
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tableservicegroup`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `Group_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tableservicelock
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tableservicelock`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreateTime` datetime(0) NOT NULL,
  `EqID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EqName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Service_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  `Weight` int(11) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1tableservicepart
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1tableservicepart`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BusinessDate` datetime(0) NOT NULL,
  `CloseTime` datetime(0) NOT NULL,
  `CloseUser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CustomerNum` int(11) NOT NULL,
  `Group_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsNow` bit(1) NOT NULL,
  `OpenTime` datetime(0) NOT NULL,
  `OpenUser` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Order_OrderNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Order_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ServiceState` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SubTotalMoney` decimal(18, 2) NOT NULL,
  `TableArea_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TableArea_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Table_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `BusinessDate_IDX`(`BusinessDate`) USING BTREE,
  INDEX `Order_UUID_IDX`(`Order_UUID`) USING BTREE,
  INDEX `Table_UUID_IDX`(`Table_UUID`) USING BTREE,
  INDEX `TableArea_UUID_IDX`(`TableArea_UUID`) USING BTREE,
  INDEX `OpenTime_IDX`(`OpenTime`) USING BTREE,
  INDEX `Group_UUID_IDX`(`Group_UUID`) USING BTREE,
  INDEX `ServiceState_IDX`(`ServiceState`) USING BTREE,
  INDEX `IsNow_IDX`(`IsNow`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1user
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1user`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IsEable` bit(1) NOT NULL,
  `Mobilephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RecentlyLogin` datetime(0) NOT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TokenLimit` bigint(20) NOT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `IsEable_IDX`(`IsEable`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for a1userresource
-- ----------------------------
CREATE TABLE IF NOT EXISTS  `a1userresource`  (
  `UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Functions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Roleids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `User_UUID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Version` bigint(20) NOT NULL,
  PRIMARY KEY (`UUID`) USING BTREE,
  INDEX `User_UUID_IDX`(`User_UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;