/*
 Navicat Premium Data Transfer

 Source Server         : web
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : thatlungdb

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 06/06/2025 22:24:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `addressCity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `addressStreet` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isUse` int NULL DEFAULT 0,
  `isDeleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (1, 1, 'Bắc Giang', '787 Redfern St', 0, 0);
INSERT INTO `addresses` VALUES (2, 1, 'Đắk Lắk', '787 Redfern St', 1, 0);
INSERT INTO `addresses` VALUES (3, 4, 'Bắc Giang', '787 Redfern St', 1, 0);
INSERT INTO `addresses` VALUES (4, 4, 'Bạc Liêu', '787 Redfern St', 0, 0);
INSERT INTO `addresses` VALUES (5, 5, 'Hà Tĩnh', '787 Redfern St', 0, 0);
INSERT INTO `addresses` VALUES (6, 5, 'Hà Giang', '787 Redfern St', 0, 0);
INSERT INTO `addresses` VALUES (7, 5, 'Nghệ An', '787 Redfern St', 1, 0);
INSERT INTO `addresses` VALUES (8, 7, 'Hải Dương', '123fdgdfgdfg', 0, 0);
INSERT INTO `addresses` VALUES (9, 7, 'An Giang', 'asdadasdas', 1, 0);
INSERT INTO `addresses` VALUES (10, 7, 'An Giang', 'qweqwewq', 0, 0);
INSERT INTO `addresses` VALUES (11, 8, 'Bắc Giang', '787 Redfern St', 1, 0);
INSERT INTO `addresses` VALUES (13, 8, 'An Giang', 'dfsdfsfds', 0, 0);
INSERT INTO `addresses` VALUES (14, 8, 'An Giang', 'qweqwewqewqe', 0, 0);
INSERT INTO `addresses` VALUES (15, 8, 'An Giang', 'cvbcvbcbc', 0, 0);
INSERT INTO `addresses` VALUES (16, 8, 'An Giang', 'qwewqeqwe', 0, 0);
INSERT INTO `addresses` VALUES (17, 9, 'Bạc Liêu', 'xcvxvxv', 0, 0);
INSERT INTO `addresses` VALUES (18, 9, 'Bắc Ninh', 'sadadas', 0, 0);
INSERT INTO `addresses` VALUES (19, 9, 'An Giang', '31 Nguyễn Văn Trỗi, Phan Rí Cửa, Tuy Phong, Bình Thuận', 1, 0);
INSERT INTO `addresses` VALUES (20, 10, 'Bến Tre', '31 Nguyễn Văn Trỗi, Phan Rí Cửa, Tuy Phong, Bình Thuận', 1, 0);
INSERT INTO `addresses` VALUES (21, 11, 'Bến Tre', '31 Nguyễn Văn Trỗi, Phan Rí Cửa, Tuy Phong, Bình Thuận', 1, 0);
INSERT INTO `addresses` VALUES (22, 11, 'Nghệ An', '787 Redfern St', 0, 0);
INSERT INTO `addresses` VALUES (23, 11, 'An Giang', '798 Nghệ An Hà Nội', 0, 0);
INSERT INTO `addresses` VALUES (24, 12, 'Bà Rịa - Vũng Tàu', '798 Nghệ An Hà Nội', 0, 0);
INSERT INTO `addresses` VALUES (25, 12, 'Nghệ An', '787 Redfern St', 1, 0);
INSERT INTO `addresses` VALUES (26, 12, 'Bến Tre', '31 Nguyễn Văn Trỗi, Phan Rí Cửa, Tuy Phong, Bình Thuận', 0, 0);
INSERT INTO `addresses` VALUES (27, 13, 'Hải Dương', '31 Nguyễn Văn Trỗi, Phan Rí Cửa, Tuy Phong, Bình Thuận', 1, 0);

-- ----------------------------
-- Table structure for beltcategory
-- ----------------------------
DROP TABLE IF EXISTS `beltcategory`;
CREATE TABLE `beltcategory`  (
  `beltId` int NOT NULL,
  `categoryId` int NOT NULL,
  PRIMARY KEY (`beltId`, `categoryId`) USING BTREE,
  INDEX `categoryId`(`categoryId` ASC) USING BTREE,
  CONSTRAINT `beltcategory_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `beltcategory_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of beltcategory
-- ----------------------------
INSERT INTO `beltcategory` VALUES (1, 1);
INSERT INTO `beltcategory` VALUES (1, 2);
INSERT INTO `beltcategory` VALUES (1, 3);
INSERT INTO `beltcategory` VALUES (1, 4);
INSERT INTO `beltcategory` VALUES (2, 1);
INSERT INTO `beltcategory` VALUES (2, 2);
INSERT INTO `beltcategory` VALUES (3, 3);
INSERT INTO `beltcategory` VALUES (3, 4);
INSERT INTO `beltcategory` VALUES (4, 5);
INSERT INTO `beltcategory` VALUES (4, 6);
INSERT INTO `beltcategory` VALUES (5, 7);
INSERT INTO `beltcategory` VALUES (5, 8);
INSERT INTO `beltcategory` VALUES (6, 9);
INSERT INTO `beltcategory` VALUES (6, 10);
INSERT INTO `beltcategory` VALUES (9, 11);
INSERT INTO `beltcategory` VALUES (9, 12);
INSERT INTO `beltcategory` VALUES (10, 2);
INSERT INTO `beltcategory` VALUES (10, 13);
INSERT INTO `beltcategory` VALUES (10, 14);
INSERT INTO `beltcategory` VALUES (11, 1);
INSERT INTO `beltcategory` VALUES (11, 2);
INSERT INTO `beltcategory` VALUES (12, 14);
INSERT INTO `beltcategory` VALUES (12, 15);
INSERT INTO `beltcategory` VALUES (13, 10);
INSERT INTO `beltcategory` VALUES (13, 16);
INSERT INTO `beltcategory` VALUES (15, 1);
INSERT INTO `beltcategory` VALUES (15, 17);
INSERT INTO `beltcategory` VALUES (15, 18);
INSERT INTO `beltcategory` VALUES (16, 19);
INSERT INTO `beltcategory` VALUES (16, 20);
INSERT INTO `beltcategory` VALUES (17, 20);
INSERT INTO `beltcategory` VALUES (17, 21);
INSERT INTO `beltcategory` VALUES (18, 22);
INSERT INTO `beltcategory` VALUES (18, 23);
INSERT INTO `beltcategory` VALUES (19, 24);
INSERT INTO `beltcategory` VALUES (19, 25);
INSERT INTO `beltcategory` VALUES (20, 18);
INSERT INTO `beltcategory` VALUES (20, 26);
INSERT INTO `beltcategory` VALUES (20, 27);
INSERT INTO `beltcategory` VALUES (21, 9);
INSERT INTO `beltcategory` VALUES (21, 20);
INSERT INTO `beltcategory` VALUES (21, 28);
INSERT INTO `beltcategory` VALUES (22, 18);
INSERT INTO `beltcategory` VALUES (22, 29);
INSERT INTO `beltcategory` VALUES (23, 7);
INSERT INTO `beltcategory` VALUES (23, 30);
INSERT INTO `beltcategory` VALUES (24, 31);
INSERT INTO `beltcategory` VALUES (24, 32);
INSERT INTO `beltcategory` VALUES (25, 1);
INSERT INTO `beltcategory` VALUES (25, 27);
INSERT INTO `beltcategory` VALUES (25, 33);
INSERT INTO `beltcategory` VALUES (26, 18);
INSERT INTO `beltcategory` VALUES (26, 34);
INSERT INTO `beltcategory` VALUES (27, 2);
INSERT INTO `beltcategory` VALUES (27, 35);
INSERT INTO `beltcategory` VALUES (28, 36);
INSERT INTO `beltcategory` VALUES (29, 37);
INSERT INTO `beltcategory` VALUES (30, 38);
INSERT INTO `beltcategory` VALUES (31, 39);
INSERT INTO `beltcategory` VALUES (32, 40);
INSERT INTO `beltcategory` VALUES (33, 41);
INSERT INTO `beltcategory` VALUES (34, 42);
INSERT INTO `beltcategory` VALUES (35, 43);
INSERT INTO `beltcategory` VALUES (35, 44);
INSERT INTO `beltcategory` VALUES (36, 45);
INSERT INTO `beltcategory` VALUES (36, 46);
INSERT INTO `beltcategory` VALUES (37, 47);
INSERT INTO `beltcategory` VALUES (37, 48);
INSERT INTO `beltcategory` VALUES (38, 10);
INSERT INTO `beltcategory` VALUES (38, 49);
INSERT INTO `beltcategory` VALUES (39, 50);
INSERT INTO `beltcategory` VALUES (39, 51);
INSERT INTO `beltcategory` VALUES (40, 51);
INSERT INTO `beltcategory` VALUES (40, 52);
INSERT INTO `beltcategory` VALUES (41, 53);
INSERT INTO `beltcategory` VALUES (41, 54);
INSERT INTO `beltcategory` VALUES (41, 55);
INSERT INTO `beltcategory` VALUES (42, 56);
INSERT INTO `beltcategory` VALUES (42, 57);
INSERT INTO `beltcategory` VALUES (43, 27);
INSERT INTO `beltcategory` VALUES (43, 58);
INSERT INTO `beltcategory` VALUES (44, 59);
INSERT INTO `beltcategory` VALUES (44, 60);
INSERT INTO `beltcategory` VALUES (45, 61);
INSERT INTO `beltcategory` VALUES (45, 62);
INSERT INTO `beltcategory` VALUES (46, 57);
INSERT INTO `beltcategory` VALUES (46, 63);
INSERT INTO `beltcategory` VALUES (47, 57);
INSERT INTO `beltcategory` VALUES (47, 64);
INSERT INTO `beltcategory` VALUES (48, 62);
INSERT INTO `beltcategory` VALUES (48, 65);
INSERT INTO `beltcategory` VALUES (48, 66);
INSERT INTO `beltcategory` VALUES (49, 27);
INSERT INTO `beltcategory` VALUES (49, 67);
INSERT INTO `beltcategory` VALUES (50, 27);
INSERT INTO `beltcategory` VALUES (50, 32);
INSERT INTO `beltcategory` VALUES (51, 32);
INSERT INTO `beltcategory` VALUES (51, 68);
INSERT INTO `beltcategory` VALUES (51, 69);
INSERT INTO `beltcategory` VALUES (52, 67);
INSERT INTO `beltcategory` VALUES (52, 68);
INSERT INTO `beltcategory` VALUES (52, 70);
INSERT INTO `beltcategory` VALUES (53, 57);
INSERT INTO `beltcategory` VALUES (53, 71);
INSERT INTO `beltcategory` VALUES (54, 27);
INSERT INTO `beltcategory` VALUES (54, 72);
INSERT INTO `beltcategory` VALUES (54, 73);
INSERT INTO `beltcategory` VALUES (55, 45);
INSERT INTO `beltcategory` VALUES (55, 74);
INSERT INTO `beltcategory` VALUES (56, 27);
INSERT INTO `beltcategory` VALUES (56, 75);
INSERT INTO `beltcategory` VALUES (57, 57);
INSERT INTO `beltcategory` VALUES (57, 72);
INSERT INTO `beltcategory` VALUES (58, 57);
INSERT INTO `beltcategory` VALUES (58, 74);
INSERT INTO `beltcategory` VALUES (59, 76);
INSERT INTO `beltcategory` VALUES (59, 77);
INSERT INTO `beltcategory` VALUES (60, 57);
INSERT INTO `beltcategory` VALUES (60, 78);
INSERT INTO `beltcategory` VALUES (61, 20);
INSERT INTO `beltcategory` VALUES (61, 27);
INSERT INTO `beltcategory` VALUES (61, 79);
INSERT INTO `beltcategory` VALUES (62, 80);
INSERT INTO `beltcategory` VALUES (62, 81);
INSERT INTO `beltcategory` VALUES (62, 82);
INSERT INTO `beltcategory` VALUES (63, 27);
INSERT INTO `beltcategory` VALUES (63, 83);
INSERT INTO `beltcategory` VALUES (63, 84);
INSERT INTO `beltcategory` VALUES (64, 20);
INSERT INTO `beltcategory` VALUES (64, 85);
INSERT INTO `beltcategory` VALUES (65, 77);
INSERT INTO `beltcategory` VALUES (65, 86);
INSERT INTO `beltcategory` VALUES (66, 20);
INSERT INTO `beltcategory` VALUES (66, 87);
INSERT INTO `beltcategory` VALUES (66, 88);
INSERT INTO `beltcategory` VALUES (67, 20);
INSERT INTO `beltcategory` VALUES (67, 89);
INSERT INTO `beltcategory` VALUES (68, 20);
INSERT INTO `beltcategory` VALUES (68, 27);
INSERT INTO `beltcategory` VALUES (68, 90);
INSERT INTO `beltcategory` VALUES (69, 91);
INSERT INTO `beltcategory` VALUES (69, 92);
INSERT INTO `beltcategory` VALUES (69, 93);
INSERT INTO `beltcategory` VALUES (70, 94);
INSERT INTO `beltcategory` VALUES (70, 95);
INSERT INTO `beltcategory` VALUES (71, 95);
INSERT INTO `beltcategory` VALUES (71, 96);
INSERT INTO `beltcategory` VALUES (71, 97);
INSERT INTO `beltcategory` VALUES (72, 95);
INSERT INTO `beltcategory` VALUES (72, 98);
INSERT INTO `beltcategory` VALUES (72, 99);
INSERT INTO `beltcategory` VALUES (73, 100);
INSERT INTO `beltcategory` VALUES (74, 101);
INSERT INTO `beltcategory` VALUES (75, 77);
INSERT INTO `beltcategory` VALUES (75, 102);
INSERT INTO `beltcategory` VALUES (76, 77);
INSERT INTO `beltcategory` VALUES (76, 103);
INSERT INTO `beltcategory` VALUES (77, 77);
INSERT INTO `beltcategory` VALUES (77, 103);
INSERT INTO `beltcategory` VALUES (78, 104);
INSERT INTO `beltcategory` VALUES (78, 105);
INSERT INTO `beltcategory` VALUES (79, 104);
INSERT INTO `beltcategory` VALUES (79, 106);
INSERT INTO `beltcategory` VALUES (79, 107);
INSERT INTO `beltcategory` VALUES (80, 108);
INSERT INTO `beltcategory` VALUES (80, 109);

-- ----------------------------
-- Table structure for beltfavorites
-- ----------------------------
DROP TABLE IF EXISTS `beltfavorites`;
CREATE TABLE `beltfavorites`  (
  `beltId` int NOT NULL,
  `favoriteId` int NOT NULL,
  PRIMARY KEY (`beltId`, `favoriteId`) USING BTREE,
  INDEX `favoriteId`(`favoriteId` ASC) USING BTREE,
  CONSTRAINT `beltfavorites_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `beltfavorites_ibfk_2` FOREIGN KEY (`favoriteId`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of beltfavorites
-- ----------------------------
INSERT INTO `beltfavorites` VALUES (1, 37);
INSERT INTO `beltfavorites` VALUES (1, 56);
INSERT INTO `beltfavorites` VALUES (3, 31);
INSERT INTO `beltfavorites` VALUES (6, 17);
INSERT INTO `beltfavorites` VALUES (10, 36);
INSERT INTO `beltfavorites` VALUES (10, 43);
INSERT INTO `beltfavorites` VALUES (11, 35);
INSERT INTO `beltfavorites` VALUES (11, 44);
INSERT INTO `beltfavorites` VALUES (11, 66);
INSERT INTO `beltfavorites` VALUES (12, 15);
INSERT INTO `beltfavorites` VALUES (12, 46);
INSERT INTO `beltfavorites` VALUES (12, 59);
INSERT INTO `beltfavorites` VALUES (12, 77);
INSERT INTO `beltfavorites` VALUES (12, 80);
INSERT INTO `beltfavorites` VALUES (12, 86);
INSERT INTO `beltfavorites` VALUES (13, 47);
INSERT INTO `beltfavorites` VALUES (13, 94);
INSERT INTO `beltfavorites` VALUES (15, 48);
INSERT INTO `beltfavorites` VALUES (15, 60);
INSERT INTO `beltfavorites` VALUES (15, 75);
INSERT INTO `beltfavorites` VALUES (15, 78);
INSERT INTO `beltfavorites` VALUES (16, 49);
INSERT INTO `beltfavorites` VALUES (16, 61);
INSERT INTO `beltfavorites` VALUES (16, 76);
INSERT INTO `beltfavorites` VALUES (16, 79);
INSERT INTO `beltfavorites` VALUES (16, 87);
INSERT INTO `beltfavorites` VALUES (17, 52);
INSERT INTO `beltfavorites` VALUES (17, 81);
INSERT INTO `beltfavorites` VALUES (17, 88);
INSERT INTO `beltfavorites` VALUES (19, 53);
INSERT INTO `beltfavorites` VALUES (19, 58);
INSERT INTO `beltfavorites` VALUES (19, 82);
INSERT INTO `beltfavorites` VALUES (20, 42);
INSERT INTO `beltfavorites` VALUES (20, 57);
INSERT INTO `beltfavorites` VALUES (20, 84);
INSERT INTO `beltfavorites` VALUES (20, 89);
INSERT INTO `beltfavorites` VALUES (21, 65);
INSERT INTO `beltfavorites` VALUES (22, 54);
INSERT INTO `beltfavorites` VALUES (23, 55);
INSERT INTO `beltfavorites` VALUES (25, 103);
INSERT INTO `beltfavorites` VALUES (28, 85);
INSERT INTO `beltfavorites` VALUES (29, 38);
INSERT INTO `beltfavorites` VALUES (31, 39);
INSERT INTO `beltfavorites` VALUES (32, 24);
INSERT INTO `beltfavorites` VALUES (36, 62);
INSERT INTO `beltfavorites` VALUES (37, 28);
INSERT INTO `beltfavorites` VALUES (39, 63);
INSERT INTO `beltfavorites` VALUES (41, 22);
INSERT INTO `beltfavorites` VALUES (42, 64);
INSERT INTO `beltfavorites` VALUES (42, 83);
INSERT INTO `beltfavorites` VALUES (42, 102);
INSERT INTO `beltfavorites` VALUES (43, 23);
INSERT INTO `beltfavorites` VALUES (46, 18);
INSERT INTO `beltfavorites` VALUES (48, 21);
INSERT INTO `beltfavorites` VALUES (50, 97);
INSERT INTO `beltfavorites` VALUES (51, 68);
INSERT INTO `beltfavorites` VALUES (53, 19);
INSERT INTO `beltfavorites` VALUES (54, 95);
INSERT INTO `beltfavorites` VALUES (55, 20);
INSERT INTO `beltfavorites` VALUES (55, 33);
INSERT INTO `beltfavorites` VALUES (55, 96);
INSERT INTO `beltfavorites` VALUES (57, 70);
INSERT INTO `beltfavorites` VALUES (58, 32);
INSERT INTO `beltfavorites` VALUES (58, 71);
INSERT INTO `beltfavorites` VALUES (60, 93);
INSERT INTO `beltfavorites` VALUES (61, 45);
INSERT INTO `beltfavorites` VALUES (61, 74);
INSERT INTO `beltfavorites` VALUES (61, 90);
INSERT INTO `beltfavorites` VALUES (62, 41);
INSERT INTO `beltfavorites` VALUES (62, 51);
INSERT INTO `beltfavorites` VALUES (63, 73);
INSERT INTO `beltfavorites` VALUES (63, 91);
INSERT INTO `beltfavorites` VALUES (64, 40);
INSERT INTO `beltfavorites` VALUES (64, 50);
INSERT INTO `beltfavorites` VALUES (64, 72);
INSERT INTO `beltfavorites` VALUES (64, 92);
INSERT INTO `beltfavorites` VALUES (67, 29);
INSERT INTO `beltfavorites` VALUES (70, 101);
INSERT INTO `beltfavorites` VALUES (72, 34);
INSERT INTO `beltfavorites` VALUES (73, 69);
INSERT INTO `beltfavorites` VALUES (74, 25);
INSERT INTO `beltfavorites` VALUES (74, 30);
INSERT INTO `beltfavorites` VALUES (75, 26);
INSERT INTO `beltfavorites` VALUES (76, 27);
INSERT INTO `beltfavorites` VALUES (78, 16);
INSERT INTO `beltfavorites` VALUES (80, 67);
INSERT INTO `beltfavorites` VALUES (80, 100);

-- ----------------------------
-- Table structure for belts
-- ----------------------------
DROP TABLE IF EXISTS `belts`;
CREATE TABLE `belts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `price` double NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stockQuantity` int NULL DEFAULT 0,
  `releaseDate` date NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  `updatedAt` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `isDeleted` int NULL DEFAULT 0,
  `discountPercent` double NULL DEFAULT 0,
  `materialBelt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of belts
-- ----------------------------
INSERT INTO `belts` VALUES (1, 'Thắt Lưng Hai Mặt LV Shadow 40MM', '<p>Thắt lưng hai mặt LV Shadow 40 mm mang đến 2 lựa chọn biến hóa giúp nâng tầm phong cách cho bộ trang phục. Một mặt của thắt lưng được trang trí họa tiết Monogram lấy cảm hứng từ các sản phẩm bằng da trong bộ sưu tập LV Shadow, mặt còn lại tinh giản hơn với lớp hoàn thiện trơn màu. Khóa cài hình logo LV bằng kim loại màu bạc có hoa văn sọc ngang được tráng men mang đến điểm nhấn hiện đại cho tổng thể thiết kế.</p><p>110 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu da</p><p>Chi tiết kim loại màu bạc với lớp hoàn thiện được tráng men</p><p>Màu xanh hải quân</p><p>Sản xuất tại Tây Ban Nha</p>', 200, 'M', 1212, '2024-12-10', '2024-12-28 11:00:03', '2025-01-03 17:01:44', 0, 12, 'Da');
INSERT INTO `belts` VALUES (2, 'Thắt Lưng Hai Mặt LV Dimension 40MM', '<p>Qua bàn tay biến tấu của Giám đốc sáng tạo Pharrell Williams, thắt lưng hai mặt LV Dimension 40 mm vừa kế thừa dấu ấn di sản, vừa mang phong cách đường phố thời thượng. Với mặt ngoài bằng chất liệu Monogram Canvas và khóa cài hình logo LV Dimension bằng kim loại sáng bóng, thiết kế sẽ là điểm nhấn ấn tượng cho mọi bộ trang phục.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen Eclipse</p><p>Một mặt bằng da và một mặt bằng chất liệu Monogram Canvas</p><p>Khóa cài hình logo LV Dimension màu Palladium</p><p>Sản xuất tại Tây Ban Nha</p>', 123.123, 'M', 100, '2025-01-10', '2025-01-03 16:04:51', '2025-01-03 17:01:50', 0, 5, 'Da');
INSERT INTO `belts` VALUES (3, 'Thắt Lưng Hai Mặt LV Initiales 40MM', '<p>Bộ sưu tập Xuân-Hè 2025 ra mắt phiên bản mới của thắt lưng hai mặt LV Initiales 40 mm. Một mặt thắt lưng được làm từ chất liệu Canvas điểm xuyết mô típ hoa Monogram và logo LV hiệu ứng mờ độc đáo. Mặt còn lại bằng da trơn trong gam màu tinh tế. Khóa cài màu bạc sáng bóng hoàn thiện tổng thể sang trọng.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu Khaki/hiệu ứng chuyển màu</p><p>Chất liệu Canvas</p><p>Chất liệu da</p><p>Thiết kế hai mặt</p><p>Khóa cài màu bạc</p><p>Sản xuất tại Tây Ban Nha</p>', 200, 'M', 20, '2025-01-17', '2025-01-03 16:41:12', '2025-01-03 17:01:56', 0, 20, 'Da');
INSERT INTO `belts` VALUES (4, 'Thắt Lưng Hai Mặt LV Initiales Pearls 40MM', '<p>Thắt lưng hai mặt LV Initiales Pearls 40 mm sở hữu vẻ đẹp tinh giản và thanh lịch với một mặt dây bằng da màu đen dập nổi họa tiết Monogram, trong khi mặt còn lại được làm từ da mịn cao cấp cùng gam màu. Khóa cài LV Initiales bằng kim loại màu vàng ánh kim được điểm xuyết một viên ngọc khắc bông hoa Monogram. Phần đuôi thắt lưng phẳng giúp tăng thêm nét tinh tế cho tổng thể sản phẩm.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>100% da</p><p>Một mặt dây bằng da có họa tiết Monogram, một mặt bằng da mịn</p><p>Khóa cài LV Initiales màu vàng ánh kim</p><p>Sản xuất tại Tây Ban Nha</p>', 500, 'M', 21, '2024-01-17', '2025-01-03 16:48:14', '2025-01-03 17:02:01', 0, 45, 'Da');
INSERT INTO `belts` VALUES (5, 'Thắt Lưng Hai Mặt LV Imprint 40MM', '<p>Là sản phẩm mới thuộc bộ sưu tập (BST) Xuân-Hè 2024, thắt lưng hai mặt LV Imprint 40mm mang đến phong cách đường phố mới mẻ cho kiểu dáng thắt lưng quen thuộc. Lấy cảm hứng từ đế giày thể thao, dây thắt lưng bằng da được tô điểm với dòng chữ “Vuitton” dập nổi, trong khi khóa cài hình logo LV gây ấn tượng với phần viền có màu nổi bật. Phụ kiện thời thượng và dễ phối này có thể kết hợp với các mẫu giày trong cùng BST.</p><p>100 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu trắng</p><p>Chất liệu da</p><p>Chi tiết kim loại màu bạc</p><p>Sản xuất tại Tây Ban Nha</p>', 900, 'M', 12, '2024-07-12', '2025-01-03 16:55:00', '2025-01-03 16:55:49', 0, 0, 'Da');
INSERT INTO `belts` VALUES (6, 'Thắt Lưng Everyday Pin 35MM', '<p>Thắt lưng Everyday Pin 35 mm toát lên nét sang trọng với dây đeo bằng da mịn, điểm xuyết khóa cài bằng đồng thau chạm khắc tên thương hiệu và logo LV nhỏ nhắn trên đỉa thắt lưng. Đường khâu nổi bật mà tinh tế giúp tạo điểm nhấn đẹp mắt trên thiết kế.</p><p>90 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu nâu</p><p>100% da</p><p>Khóa cài khắc tên thương hiệu</p><p>Phụ kiện hình logo LV</p><p>Chi tiết kim loại màu vàng</p><p>Sản xuất tại Tây Ban Nha</p>', 400, 'M', 50, '2023-08-10', '2025-01-03 17:04:40', '2025-01-03 17:10:13', 0, 2, 'Canvas');
INSERT INTO `belts` VALUES (9, 'Thắt Lưng Hai Mặt LV Stitch 40MM', '<p>Thắt lưng hai mặt LV Stitch 40 mm thể hiện kỹ nghệ chế tác thủ công bậc thầy của Maison với chi tiết khóa LV Stitch bằng kim loại màu bạc như được thêu từ những sợi chỉ. Phụ kiện có thể biến tấu theo 2 kiểu, với một mặt bằng chất liệu Canvas có họa tiết Monogram biểu tượng trong 2 gam màu và mặt còn lại bằng da màu đen tinh giản.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>50% chất liệu Canvas, 50% da</p><p>Họa tiết Monogram</p><p>Chi tiết kim loại màu bạc với hiệu ứng ngả màu</p><p>Sản xuất tại Tây Ban Nha</p>', 700, 'M', 12, '2022-06-14', '2025-01-03 17:15:11', '2025-01-03 17:15:38', 0, 10, 'Canvas');
INSERT INTO `belts` VALUES (10, 'Thắt Lưng Hai Mặt LV Dynasty 35MM', '<p>Thắt lưng hai mặt LV Dynasty 35 mm tinh giản mà sang trọng tạo điểm nhấn thanh lịch trên trang phục với hai mặt đều làm bằng da mịn, điểm xuyết khóa cài bằng đồng thau có logo LV cách điệu tinh xảo.</p><p>90 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Chất liệu da</p><p>Chi tiết kim loại bằng đồng thau</p><p>Khóa cài LV Dynasty màu bạc</p><p>Thiết kế hai mặt</p><p>Sản xuất tại Tây Ban Nha</p>', 345.678, 'M', 100, '2019-06-04', '2025-01-03 17:19:02', '2025-01-03 17:19:25', 0, 40, 'Canvas');
INSERT INTO `belts` VALUES (11, 'Thắt Lưng Hai Mặt LV Fiction 30MM', '<p>Thắt lưng hai mặt LV Fiction 30 mm ghi dấu ấn với một biểu tượng mới của Maison, mang ý nghĩa tôn vinh di sản viễn du lâu đời. Được làm từ kim loại sáng bóng, khóa cài LV Fiction hình bầu dục trông như tấm bản đồ thế giới với logo LV nổi bật ở trung tâm, điểm xuyết những đường kẻ mảnh được khắc tinh xảo. Dây thắt lưng bằng da có thể sử dụng cả hai mặt một cách linh hoạt.</p><p>90 x 3 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Một mặt bằng da màu đen và một mặt bằng da màu đen dập nổi họa tiết Monogram</p><p>Chi tiết kim loại bằng đồng thau</p><p>Khóa cài LV Fiction màu bạc ánh kim</p><p>Thiết kế hai mặt</p><p>Sản xuất tại Tây Ban Nha</p>', 965.333, 'M', 50, '2016-06-07', '2025-01-03 17:25:51', '2025-01-03 17:26:17', 0, 34, 'Canvas');
INSERT INTO `belts` VALUES (12, 'Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM', '<p>Thắt lưng hai mặt LV Initiales Damoflage 40 mm gây ấn tượng với gam màu mới của mô típ Damoflage hiệu ứng Pixel do Giám đốc sáng tạo Pharrell Williams thiết kế. Họa tiết đặc trưng nay khoác lên tông màu đen sang trọng đồng điệu với khóa cài hình logo LV, điểm xuyết thêm dòng chữ Marque L.Vuitton Déposée biểu tượng.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Một mặt bằng chất liệu Damoflage Canvas và một mặt bằng da</p><p>Chi tiết kim loại bằng đồng thau</p><p>Khóa cài hình logo LV màu đen</p><p>Sản xuất tại Tây Ban Nha</p>', 765.321, 'M', 10, '2020-05-05', '2025-01-03 17:31:56', '2025-01-03 17:32:21', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (13, 'Thắt Lưng Saint Germain 35MM', '<p>Thắt lưng Saint Germain 35 mm bằng da trơn màu nâu ghi dấu ấn với thiết kế khóa cài đặc trưng. Logo LV điểm xuyết trên mặt khóa tinh giản kết hợp với lớp hoàn thiện màu Palladium sáng bóng tạo nên vẻ ngoài sang trọng, lịch lãm. Mẫu phụ kiện thời thượng này sẽ là điểm nhấn hoàn hảo giúp tôn lên mọi kiểu trang phục.</p><p>85 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu xanh lá Mocha</p><p>Chất liệu da</p><p>Khóa cài phủ màu Palladium</p><p>Sản xuất tại Tây Ban Nha</p>', 231.645, 'M', 34, '2015-08-08', '2025-01-03 17:34:30', '2025-01-03 17:37:34', 0, 5, 'Canvas');
INSERT INTO `belts` VALUES (15, 'Thắt Lưng Pont Neuf 35MM', '<p>Là lựa chọn hoàn hảo cho bộ trang phục công sở lịch lãm, thắt lưng Pont Neuf 35MM được làm bằng da Taiga với phần viền được nhuộm màu độc đáo. Logo LV trên đỉa thắt lưng bằng kim loại tạo nên điểm nhấn tinh tế.</p><p>85 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Da Taiga</p><p>Lớp lót bằng da bê</p><p>Khóa bằng đồng thau tráng Palladium sáng bóng</p><p>Đỉa thắt lưng bằng kim loại được khắc logo LV</p>', 453.268, 'M', 56, '2021-11-09', '2025-01-03 17:41:20', '2025-01-03 17:41:58', 0, 10, 'Da');
INSERT INTO `belts` VALUES (16, 'Thắt Lưng Hai Mặt LV Tag 40MM', '<p>Bộ sưu tập Pre-Fall 2024 của Louis Vuitton dành cho nam lấy chủ đề về chuyến hải trình vòng quanh thế giới của chàng thủy thủ lịch lãm. Là vật kỷ niệm cho cuộc dừng chân tại thiên đường đảo nhiệt đới, thắt lưng hai mặt LV Tag 40 mm sở hữu mô típ lấy cảm hứng từ môn lướt sóng trên một mặt, kết hợp họa tiết Monogram ở mặt còn lại. Khóa cài LV Tag màu vàng ánh kim hoàn thiện mẫu phụ kiện nổi bật.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu xanh dương</p><p>Lớp hoàn thiện màu vàng ánh kim</p><p>Chất liệu Canvas, đồng thau</p><p>Sản xuất tại Tây Ban Nha</p><p><br>&nbsp;</p>', 124.644, 'M', 140, '2025-01-08', '2025-01-03 17:45:24', '2025-01-03 17:45:57', 0, 12, 'Da');
INSERT INTO `belts` VALUES (17, 'Thắt Lưng Hai Mặt LV L9 40MM', '<p>Hành trình sáng tạo nghệ thuật của Giám đốc sáng tạo Pharrell Williams được kết tinh trong thiết kế thắt lưng hai mặt LV Initiales 40 mm. Sản phẩm nổi bật với họa tiết Damier và dòng chữ \"Marque L.Vuitton déposée\" được biến tấu cho mùa mốt Thu-Đông 2024. Mặt ngoài làm từ chất liệu Canvas với 2 phiên bản màu sắc lấy cảm hứng từ không khí biển cả ngày hè, điểm xuyết khóa cài LV bằng kim loại màu vàng ánh kim. Mặt trong bằng da tạo điểm nhấn độc đáo cho bộ âu phục.</p><p>85 x 40 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu Canvas và da</p><p>Màu xanh dương</p><p>Chi tiết kim loại màu bạc với hiệu ứng ngả màu</p><p>Sản xuất tại Tây Ban Nha</p>', 124.644, 'M', 140, '2024-07-11', '2025-01-03 17:50:58', '2025-01-03 17:51:26', 0, 12, 'Da');
INSERT INTO `belts` VALUES (18, 'Thắt Lưng Hai Mặt LV Line 40MM', '<p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,6 inch/4 cm</p><p>Chất liệu Monogram Eclipse Reverse</p><p>Chi tiết kim loại màu xám</p><p>Một mặt bằng chất liệu Monogram Eclipse Reverse</p><p>Một mặt bằng da bê</p><p>Khóa hình logo LV Line</p>', 975.423, 'M', 140, '2022-02-01', '2025-01-03 17:54:42', '2025-01-03 17:55:06', 0, 12, 'Da');
INSERT INTO `belts` VALUES (19, 'Thắt Lưng LV City Pin 35MM', '<p>Quay trở lại trong phiên bản bằng da Taiga màu xanh đậm, thắt lưng LV City Pin 35MM toát lên vẻ đẹp tối giản và thanh lịch. Điểm nhấn nổi bật trên dây đeo bản nhỏ là khóa cài LV City Pin và đỉa thắt lưng bằng kim loại với lớp hoàn thiện phủ Palladium bóng bẩy. Đỉa thắt lưng khắc logo LV tạo nên dấu ấn đặc trưng cho thiết kế của thương hiệu.</p><p>85 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu xanh hải quân</p><p>Da Taiga</p><p>Chi tiết kim loại với lớp hoàn thiện bằng Palladium</p><p>Khắc logo LV</p><p>Sản xuất tại Tây Ban Nha</p>', 653.654, 'M', 250, '2025-07-03', '2025-01-03 17:59:55', '2025-01-03 18:00:16', 0, 50, 'Canvas');
INSERT INTO `belts` VALUES (20, 'Thắt Lưng LV Skyline 35MM', '<p>Thắt lưng LV Skyline 35MM được làm từ da Napa cao cấp với cách phối màu cổ điển. Khóa gài kim với lớp hoàn thiện bằng Palladium cùng logo LV tạo điểm nhấn nam tính cho thiết kế. Với kiểu dáng hiện đại, thắt lưng có thể phối với trang phục công sở hoặc trang phục dự tiệc. Có thể kết hợp với thiết kế giày mới cùng bộ sưu tập để tạo nên tổng thể hài hòa.</p><p>90 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Da Napa</p><p>Chi tiết kim loại với lớp hoàn thiện bằng Palladium</p><p>Sản xuất tại Tây Ban Nha</p>', 653.654, 'M', 250, '2025-01-01', '2025-01-03 18:36:49', '2025-01-03 18:37:21', 0, 25, 'Da');
INSERT INTO `belts` VALUES (21, 'Thắt Lưng Hai Mặt LV Optic 40MM', NULL, 799.643, 'M', 80, '2024-12-11', '2025-01-03 18:40:25', '2025-01-03 18:40:25', 0, 20, 'Canvas');
INSERT INTO `belts` VALUES (22, 'Thắt Lưng Heritage 35MM', '<p>Sở hữu diện mạo mới vô cùng tinh xảo, thắt lưng Heritage 35 mm là mẫu phụ kiện không thể thiếu cho bộ âu phục. Một mặt thắt lưng được làm từ da bò có vân và mặt còn lại bằng da bò trơn. Sản phẩm trông nổi bật hơn nhờ phần khóa cài bằng kim loại màu bạc được đánh bóng. Logo LV ở phần đuôi thắt lưng điểm xuyết dấu ấn đặc trưng cho thiết kế của thương hiệu.</p><p>95 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu da</p><p>Màu nâu Tobacco</p><p>Chi tiết kim loại màu bạc được đánh bóng</p><p>Sản xuất tại Tây Ban Nha</p>', 354.645, 'M', 12, '2023-01-31', '2025-01-03 18:42:46', '2025-01-03 18:43:08', 0, 12, 'Da');
INSERT INTO `belts` VALUES (23, 'Thắt Lưng Hai Mặt LV Shadow 40MM', '<p>Thắt lưng hai mặt LV Shadow 40 mm mang đến 2 lựa chọn biến hóa giúp nâng tầm phong cách cho bộ trang phục. Một mặt của thắt lưng được trang trí họa tiết Monogram lấy cảm hứng từ các sản phẩm bằng da trong bộ sưu tập LV Shadow, mặt còn lại tinh giản hơn với lớp hoàn thiện trơn màu. Khóa cài hình logo LV bằng kim loại màu bạc có hoa văn sọc ngang được tráng men mang đến điểm nhấn hiện đại cho tổng thể thiết kế.</p><p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu da</p><p>Chi tiết kim loại màu bạc với lớp hoàn thiện được tráng men</p><p>Màu trắng</p><p>Sản xuất tại Tây Ban Nha</p>', 623.122, 'M', 67, '2024-01-20', '2025-01-03 18:45:05', '2025-01-03 18:45:24', 0, 15, 'Canvas');
INSERT INTO `belts` VALUES (24, 'Thắt Lưng Hai Mặt LV Initiales Blason 40MM', '<p>Được thiết kế bởi Giám đốc sáng tạo Pharrell Williams, thắt lưng hai mặt LV Initiales Blason 40 mm là sự kết hợp vẻ đẹp hiện đại với những dấu ấn di sản của Maison. Logo LV dập nổi trên chất liệu da mềm mại tạo nên kết cấu có chiều sâu, phản chiếu nổi bật trên khóa cài. Sự kết hợp nhiều chất liệu đặc biệt với các chi tiết đặc trưng tạo nên vẻ đẹp vượt thời gian.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Một mặt bằng da trơn và một mặt bằng da dập nổi logo LV</p><p>Khóa cài màu Palladium</p><p>Sản xuất tại Tây Ban Nha</p>', 465.545, 'M', 12, '2020-02-07', '2025-01-04 14:13:12', '2025-01-04 14:13:36', 0, 41, 'Da');
INSERT INTO `belts` VALUES (25, 'Thắt Lưng Hai Mặt LV Taurillon 40MM', '<p>Sở hữu 2 phiên bản màu tối thanh lịch với khóa cài bằng đồng thau có cùng tông màu với phần da, thắt lưng hai mặt LV Taurillon 40 mm toát lên nét lịch lãm và thời thượng. Sản phẩm được làm từ da Taurillon với một mặt có vân da đẹp mắt và dập nổi họa tiết Monogram, mặt còn lại có bề mặt trơn mịn dễ phối đồ.</p><p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Da Taurillon</p><p>Màu xám</p><p>Chi tiết kim loại màu xám</p><p>Sản xuất tại Tây Ban Nha</p>', 978.543, 'M', 45, '2018-06-30', '2025-01-04 14:16:11', '2025-01-04 14:16:39', 0, 10, 'Canvas');
INSERT INTO `belts` VALUES (26, 'Thắt Lưng LV Aerogram 35MM', NULL, 978.543, 'M', 45, '2025-01-15', '2025-01-04 14:18:53', '2025-01-04 14:18:53', 0, 20, 'Da');
INSERT INTO `belts` VALUES (27, 'Thắt Lưng Hai Mặt LV Party 40MM', '<p>Thắt lưng hai mặt LV Party 40 mm có một mặt làm từ da màu đen và mặt còn lại bằng chất liệu Monogram Eclipse Canvas. Khóa cài bằng kim loại phủ lớp hoàn thiện Palladium thể hiện phong cách Dandy thời thượng, đồng thời tôn vinh vẻ đẹp của dòng trang sức LV Party qua chi tiết các bông hoa Monogram tráng men tinh xảo ở bên phải chữ V.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Kim loại có lớp hoàn thiện màu Eclipse và Palladium&nbsp;</p><p>Mặt trước bằng chất liệu Canvas, mặt sau bằng da</p><p>Sản xuất tại Tây Ban Nha</p>', 541.277, 'M', 45, '2025-06-20', '2025-01-04 14:20:37', '2025-01-04 14:21:27', 0, 20, 'Canvas');
INSERT INTO `belts` VALUES (28, 'Thắt Lưng Hai Mặt LV Shake 40MM', '<p>Trong lần ra mắt này, thắt lưng hai mặt LV Shake 40MM sở hữu thiết kế sang trọng với một mặt làm bằng chất liệu Monogram Eclipse Canvas, mặt còn lại là da bê mềm mịn. Khóa cài LV Shake đặc trưng được phủ Palladium cùng lớp sơn mài màu đen, mang đến điểm nhấn hiện đại cho thiết kế thời thượng.</p><p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu Monogram Eclipse Canvas</p><p>Da bê màu đen</p><p>Khóa cài phủ Palladium và lớp sơn mài màu đen</p><p>Sản xuất tại Tây Ban Nha</p>', 876.565, 'M', 45, '2022-06-16', '2025-01-04 14:23:32', '2025-01-04 14:24:00', 0, 20, 'Canvas');
INSERT INTO `belts` VALUES (29, 'Thắt Lưng Hai Mặt Damier LV 40MM', '<p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,6 inch/4 cm</p><p>Màu xám/đen</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Một mặt bằng da bê màu xám</p><p>Một mặt bằng da bê màu đen</p><p>Khóa hình logo LV</p><p>Khóa được khắc họa tiết Da</p>', 342.343, 'M', 213, '2025-01-16', '2025-01-04 14:26:48', '2025-01-04 14:27:11', 0, 12, 'Da');
INSERT INTO `belts` VALUES (30, 'Thắt Lưng Hai Mặt LV Rodeo 40MM', '<p>Thắt lưng hai mặt LV Rodeo 40 mm tinh xảo thể hiện tinh thần miền viễn Tây của bộ sưu tập Thu-Đông 2024. Một mặt thắt lưng được làm từ da màu đen, trong khi mặt còn lại bằng da màu nâu được trang trí với khóa cài LV Rodeo màu vàng ánh kim có hiệu ứng ngả màu. Đường khâu màu tương phản ở phần viền hoàn thiện tổng thể. Phụ kiện ấn tượng này có thể kết hợp hài hòa với nhiều loại trang phục.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu da</p><p>Màu nâu</p><p>Khóa cài màu vàng ánh kim hiệu ứng ngả màu</p><p>Sản xuất tại Tây Ban Nha</p>', 543.634, 'M', 56, '2025-01-13', '2025-01-04 14:29:19', '2025-01-04 14:29:38', 0, 20, 'Canvas');
INSERT INTO `belts` VALUES (31, 'Thắt Lưng Hai Mặt LV Check 40MM', '<p>Thắt lưng hai mặt LV Check 40 mm là sự kết hợp giữa thiết kế thời thượng và dấu ấn di sản. Một mặt thắt lưng được làm từ da dập nổi mô típ Damier Infini và mặt còn lại bằng chất liệu Damier Canvas, cả hai đều được tô điểm với dòng chữ \"Marque L.Vuitton déposée\". Khóa cài hình logo LV màu Palladium cũng sở hữu vẻ ngoài nổi bật với một bên khóa được khắc họa tiết Damier và bên còn lại có màu xanh dương óng ánh.</p><p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chất liệu Canvas và da</p><p>Màu đen và xanh dương</p><p>Chi tiết kim loại màu bạc</p><p>Sản xuất tại Tây Ban Nha</p>', 763.231, 'M', 12, '2025-01-21', '2025-01-04 14:31:06', '2025-01-04 14:31:23', 0, 53, 'Da');
INSERT INTO `belts` VALUES (32, 'Thắt Lưng Hai Mặt Uptown 35MM', '<p>100 x 3.5 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,4 inch/35 mm</p><p>Một mặt làm từ chất liệu Monogram Eclipse Canvas</p><p>Mặt còn lại làm từ chất liệu da màu đen</p><p>Khóa cài kim loại màu bạc</p><p>Họa tiết Monogram khắc trên khóa</p>', 656.541, 'M', 75, '2025-01-31', '2025-01-04 14:33:04', '2025-01-04 14:33:29', 0, 50, 'Canvas');
INSERT INTO `belts` VALUES (33, 'Thắt Lưng Hai Mặt LV Mega Pixel 40MM', '<p>Thắt lưng hai mặt LV Mega Pixel 40mm trông nổi bật nhờ họa tiết Damoflage màu xanh lá-nâu đặc trưng của mùa Xuân-Hè 2024. Một mặt thắt lưng bằng da Damier và mặt còn lại màu xanh lá trơn. Điểm nhấn của phụ kiện là khóa cài LV Pixel bằng kim loại với bề mặt lì và lớp hoàn thiện cùng tông màu.</p><p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu Green Damoflage</p><p>Chất liệu da</p><p>Khóa cài bằng kim loại</p><p>Sản xuất tại Tây Ban Nha</p>', 345.345, 'M', 243, '2024-09-26', '2025-01-04 14:36:04', '2025-01-04 14:36:19', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (34, 'Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM', '<p><strong>Do nhu cầu mua sản phẩm này khá cao, mong quý khách thông cảm vì đơn hàng có thể đến muộn hơn bình thường. Chúng tôi sẽ cố gắng gửi trong thời gian sớm nhất.</strong><br><br>Thuộc bộ sưu tập hợp tác giữa Louis Vuitton và nghệ sĩ Takashi Murakami trứ danh, thắt lưng hai mặt LV x TM LV D-ring thời thượng ghi dấu ấn với chất liệu Monogram Multicolor Canvas màu trắng, một bản biến tấu sinh động từ họa tiết di sản của Maison. Thiết kế được hoàn thiện với khóa gài màu vàng ánh kim cùng một khoen D-ring để treo chìa khóa hoặc phụ kiện, tạo thành điểm nhấn bắt mắt cho mọi bộ trang phục.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu trắng</p><p>Chất liệu Monogram Multicolor Canvas</p><p>Da bê</p><p>Chi tiết kim loại màu vàng</p>', 675.121, 'N', 34, '2024-06-08', '2025-01-04 15:49:41', '2025-01-04 15:50:26', 0, 0, 'Da');
INSERT INTO `belts` VALUES (35, 'Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM', '<p><strong>Do nhu cầu mua sản phẩm này khá cao, mong quý khách thông cảm vì đơn hàng có thể đến muộn hơn bình thường. Chúng tôi sẽ cố gắng gửi trong thời gian sớm nhất.</strong><br><br>Thắt lưng hai mặt Mini Flowergram là một mảnh ghép của bộ sưu tập hợp tác mới nhất giữa Louis Vuitton và nghệ sĩ Takashi Murakami trứ danh. Một mặt dây ghi dấu ấn với mô típ Monogram Multicolor, bản biến tấu bắt mắt của họa sĩ người Nhật từ hoa văn di sản của Maison, trong khi mặt còn lại được làm từ da màu hồng Fuchsia nữ tính. Thiết kế thanh mảnh được tô điểm khóa cài Flowergram lung linh tựa trang sức, tạo điểm nhấn đẹp mắt cho mọi bộ trang phục.</p><p>90 x 15 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu trắng/hồng Fuchsia</p><p>Chất liệu Monogram Multicolor Canvas</p><p>Chất liệu da</p><p>Chi tiết kim loại màu vàng</p>', 768.673, 'N', 42, '2024-12-14', '2025-01-04 15:52:28', '2025-01-04 15:52:46', 0, 12, 'Canvas');
INSERT INTO `belts` VALUES (36, 'Thắt Lưng Hai Mặt LV Mini 15MM', '<p>Sở hữu vẻ ngoài thanh mảnh và thời thượng, thắt lưng hai mặt LV Mini 15 mm thêm phần tinh tế nhờ dấu ấn đặc trưng của thương hiệu. Một mặt thắt lưng được làm từ da mềm mại và mặt còn lại bằng chất liệu Monogram Canvas, phụ kiện được tạo điểm nhấn với khóa cài hình logo LV bằng kim loại màu vàng ánh kim. Phần đuôi thắt lưng được vát nhọn mang đến nét nữ tính cho thiết kế thanh lịch.</p><p>70 x 15 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 0,6 inch/1,5 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da màu đen</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa hình logo LV</p><p>Đuôi thắt lưng được vát nhọn</p>', 121.212, 'N', 43, '2024-11-13', '2025-01-04 15:54:30', '2025-01-04 15:54:43', 0, 11, 'Da');
INSERT INTO `belts` VALUES (37, 'Thắt Lưng Hai Mặt LV Circle Nautical 20MM', '<p>Thắt lưng hai mặt LV Circle Nautical 20 mm mang đến nét biến tấu mới mẻ cho dấu ấn biểu tượng của nhà mốt Pháp. Một mặt thắt lưng được làm từ da có vân và mặt còn lại bằng chất liệu Monogram Canvas. Kiểu dáng thanh mảnh được tô điểm với khóa cài hình logo LV Circle bằng kim loại màu vàng ánh kim nằm bên trong vòng tròn được cách điệu theo kiểu dây thừng. Cảm hứng từ phong cách thủy thủ nâng tầm mẫu phụ kiện thanh lịch.</p><p>70 x 20 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 0,8 inch/2 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da có vân màu xanh hải quân</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài LV Circle Nautical</p>', 123.123, 'N', 453, '2024-10-17', '2025-01-04 15:56:56', '2025-01-04 15:57:13', 0, 43, 'Canvas');
INSERT INTO `belts` VALUES (38, 'Thắt Lưng Hai Mặt LV Iconic 20MM', '<p>Thắt lưng hai mặt LV Iconic 20mm mang đến hơi thở hiện đại cho thiết kế cổ điển. Với kiểu dáng thanh mảnh, phụ kiện dễ dàng luồn qua đỉa thắt lưng hoặc thắt ngang eo để tạo điểm nhấn. Sản phẩm được tô điểm với khóa cài hình logo LV, trong khi hai mặt dây được làm từ những chất liệu khác nhau, mang đến nhiều lựa chọn đeo linh hoạt.</p><p>85 x 20 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 0,8 inch/2 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da màu xám be</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài hình logo LV</p>', 675.624, 'N', 64, '2024-09-10', '2025-01-04 15:58:46', '2025-01-04 15:59:13', 0, 11, 'Da');
INSERT INTO `belts` VALUES (39, 'Thắt Lưng Hai Mặt Pretty LV Enamel 20MM', '<p>Với thiết kế sang trọng, thắt lưng hai mặt Pretty LV Enamel 20 mm là điểm nhấn sáng tạo và nữ tính cho bộ trang phục. Một mặt của thắt lưng được làm từ chất liệu Monogram Canvas, mặt còn lại làm từ da sang trọng. Phụ kiện thanh lịch này được nhấn nhá với khóa cài hình logo LV tráng men và bông hoa Monogram tinh xảo ở đuôi thắt lưng.</p><p>90 x 20 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng 0,7 inch/2 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da màu trắng</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài được tráng men và có chi tiết hình bông hoa Monogram</p>', 765.756, 'N', 52, '2024-08-17', '2025-01-04 16:01:20', '2025-01-04 16:01:42', 0, 76, 'Canvas');
INSERT INTO `belts` VALUES (40, 'Thắt Lưng LV GO-14 20MM', '<p>Sở hữu kiểu dáng tinh tế và thiết kế sáng tạo, thắt lưng LV GO-14 20 mm là phụ kiện không thể thiếu trong tủ quần áo của phái đẹp. Sản phẩm gây ấn tượng với khóa xoay bằng kim loại màu vàng ánh kim và cơ chế điều chỉnh ở mặt sau giúp mang đến độ vừa vặn hoàn hảo. Chiếc thắt lưng thanh mảnh và trang nhã này là minh chứng cho kỹ nghệ chế tác thủ công điêu luyện của Maison.</p><p>20 cm<br>(Chiều rộng)</p><p>Chiều rộng: 0,8 inch/2 cm</p><p>Màu đen</p><p>Chất liệu da</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Lớp lót có họa tiết Monogram</p><p>Khóa cài LV GO-14</p><p>Cơ chế điều chỉnh độ rộng ở phía sau</p>', 674.213, 'N', 754, '2024-07-16', '2025-01-04 16:03:32', '2025-01-04 16:04:00', 0, 0, 'Da');
INSERT INTO `belts` VALUES (41, 'Thắt Lưng LV Coin De Malle 20MM', '<p>Thắt lưng LV Coin De Malle 20 mm bằng chất liệu Monogram Canvas biểu tượng là sự kết hợp đầy sáng tạo giữa cảm hứng di sản và nét đẹp đương đại. Chi tiết khóa cài tinh xảo được sáng tạo mô phỏng theo các góc được gia cố trên những chiếc rương lịch sử của Louis Vuitton. Với thiết kế dễ đóng mở và điều chỉnh độ rộng, phụ kiện toát lên vẻ đẹp cổ điển vượt thời gian.</p><p>20 cm<br>(Chiều rộng)</p><p>Chiều rộng 0,7 inch/2 cm</p><p>Chất liệu Monogram Canvas</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài lấy cảm hứng từ thiết kế rương</p><p>Có thể điều chỉnh kích cỡ</p>', 675.567, 'N', 234, '2024-06-14', '2025-01-04 16:05:24', '2025-01-04 16:05:42', 0, 78, 'Canvas');
INSERT INTO `belts` VALUES (42, 'Thắt Lưng Hai Mặt LV Sparkle 30MM', '<p>Thắt lưng hai mặt LV Sparkle 30 mm gây ấn tượng với chi tiết trang trí tinh xảo. Khóa cài hình logo LV bằng kim loại màu vàng ánh kim càng thêm nổi bật nhờ được đính pha lê lấp lánh. Với một mặt thắt lưng được làm từ da trơn mịn và mặt còn lại bằng da có vân, phụ kiện thời thượng này sẽ là gợi ý lý tưởng cho bộ trang phục dự tiệc.</p><p>80 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,2 inch/3cm</p><p>Màu đen</p><p>Một mặt bằng da bê mịn</p><p>Mặt còn lại bằng da bê có vân</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài hình logo LV Sparkle</p>', 671.541, 'N', 12, '2024-06-07', '2025-01-04 16:07:17', '2025-01-04 16:07:44', 0, 16, 'Canvas');
INSERT INTO `belts` VALUES (43, 'Thắt Lưng LV Studs 29', '<p>Thiết kế của thắt lưng LV Studs 29 được lấy cảm hứng từ di sản chế tác rương của Maison. Sản phẩm được làm từ da mịn, nhấn nhá 2 chiếc đinh tán bằng kim loại màu vàng ánh kim có khắc tên thương hiệu. Chi tiết này gợi nhớ đến những chiếc đinh tán trên các mẫu rương kinh điển của nhà mốt Pháp. Phụ kiện thanh lịch và tiện dụng này mang đến đa dạng lựa chọn biến tấu cho bộ trang phục.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,1 inch/2,9 cm</p><p>Màu đen</p><p>Chất liệu da</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Lớp lót có họa tiết Monogram</p><p>Chi tiết đinh tán khắc chữ Louis Vuitton lấy cảm hứng từ thiết kế rương</p>', 976.512, 'N', 43, '2024-05-07', '2025-01-04 16:09:44', '2025-01-04 16:10:07', 0, 20, 'Da');
INSERT INTO `belts` VALUES (44, 'Thắt Lưng Hai Mặt Oversized Hook 40MM', '<p>Thời thượng và tiện dụng, thắt lưng hai mặt Oversized Hook 40mm bắt mắt thể hiện dấu ấn thương hiệu. Một mặt của thắt lưng được làm từ da bò cao cấp, mặt còn lại làm từ chất liệu Monogram Canvas. Thiết kế nổi bật với khóa cài màu vàng ánh kim lấy cảm hứng từ dòng sản phẩm bằng da của nhà mốt Pháp. Thắt lưng có thể dễ dàng điều chỉnh độ rộng ở phía sau cho vừa vặn với cơ thể.</p><p>40 cm<br>(Chiều rộng)</p><p>Chiều rộng: 1,6 inch/4 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da màu đen</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài</p><p>Khắc tên Louis Vuitton</p>', 534.645, 'N', 112, '2024-04-18', '2025-01-04 16:21:44', '2025-01-04 16:22:07', 0, 23, 'Canvas');
INSERT INTO `belts` VALUES (45, 'Thắt Lưng LV Wrapped 60MM', '<p>Xuất hiện trong buổi trình diễn bộ sưu tập Xuân-Hè 2024, thắt lưng LV Wrapped 60 mm ghi dấu ấn với thiết kế độc đáo. Được làm từ chất liệu Monogram Canvas, dây thắt lưng to bản có cơ chế cài kiểu nút thắt, với phần đuôi thắt lưng luồn qua lỗ trống để tạo thành nút thắt cố định. Phụ kiện trang nhã này sẽ là điểm nhấn thời thượng cho bộ trang phục.</p><p>60 cm<br>(Chiều rộng)</p><p>Chiều rộng: 2,36 inch/6 cm</p><p>Chất liệu da màu đen</p><p>Thiết kế kiểu thắt dây</p><p>Cơ chế điều chỉnh độ rộng ở phía sau</p>', 423.123, 'N', 123, '2024-03-14', '2025-01-04 16:24:04', '2025-01-04 16:24:30', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (46, 'Thắt Lưng Hai Mặt LV Seaside 30MM', '<p>Với màu sắc tinh tế, thắt lưng 2 mặt LV Seaside 30mm thời thượng và nữ tính mang đến nét biến tấu mới mẻ cho biểu tượng quen thuộc của nhà mốt. Thắt lưng được làm từ da bò cao cấp, với một mặt bằng da trơn và mặt còn lại bằng da có vân dập nổi họa tiết. Thiết kế gây ấn tượng với khóa cài hình logo LV màu vàng ánh kim có hiệu ứng xà cừ tinh xảo.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 0,6 inch/1,6 cm</p><p>Một mặt thắt lưng bằng da màu đen, có vân và được dập nổi họa tiết</p><p>Mặt còn lại bằng da trơn màu đen</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài hình logo LV</p>', 132.412, 'N', 312, '2024-02-10', '2025-01-04 16:26:08', '2025-01-04 16:26:27', 0, 34, 'Da');
INSERT INTO `belts` VALUES (47, 'Thắt Lưng LV Twist 30MM', '<p>3 cm<br>(Chiều dài)</p><p>Chiều rộng: 1,2 inch/3 cm</p><p>Chiều cao khóa: 1,3 inch/3,3 cm</p><p>Chiều rộng khóa: 1,6 inch/4,1 cm</p><p>Một mặt bằng da Epi màu đen</p><p>Một mặt bằng chất liệu da màu đen</p><p>Chi tiết kim loại với lớp hoàn thiện màu bạc và màu vàng ánh kim</p><p>Khóa LV Twist</p>', 435.456, 'N', 112, '2024-01-16', '2025-01-04 16:28:01', '2025-01-04 16:28:26', 0, 90, 'Da');
INSERT INTO `belts` VALUES (48, 'Thắt Lưng LV Maxi Buckle 60MM', '<p>Xuất hiện trong buổi trình diễn bộ sưu tập Cruise mùa Xuân-Hè 2025 tại Barcelona, thắt lưng LV Maxi Buckle 60 mm là minh chứng cho kỹ nghệ chế tác da của nhà mốt Pháp. Thắt lưng sở hữu thiết kế ấn tượng với khóa cài to bản bằng da, điểm xuyết logo LV Circle màu vàng ánh kim tinh tế.</p><p>80 x 60 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Chất liệu da</p><p>Logo LV Circle</p><p>Khóa cài bằng da có logo LV</p>', 234.234, 'N', 123, '2024-01-28', '2025-01-04 16:30:17', '2025-01-04 16:30:42', 0, 95, 'Canvas');
INSERT INTO `belts` VALUES (49, 'Thắt Lưng Hai Mặt Pretty LV 30MM', '<p>Thắt lưng hai mặt Pretty LV là sự tôn vinh dành cho kỹ nghệ chế tác đầy sáng tạo của nhà mốt Pháp. Thiết kế nổi bật với các chi tiết kim loại màu vàng ánh kim gồm khóa cài hình logo LV và họa tiết Monogram 3 cánh nhọn được cắt tinh xảo ở đuôi thắt lưng. Với một mặt bằng da sang trọng, mặt còn lại bằng chất liệu Monogram Canvas cổ điển, mẫu thắt lưng thời thượng này có thể biến hóa theo nhiều phong cách thời trang.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,1 inch/3 cm</p><p>Chiều cao khóa: 1,4 inch/3,5 cm</p><p>Chiều rộng khóa: 1,4 inch/3,5 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da màu đen</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Đuôi thắt lưng có chi tiết kim loại hình hoa Monogram được cắt tinh xảo</p><p>Khóa hình logo LV</p>', 523.423, 'N', 643, '2023-12-03', '2025-01-04 16:32:33', '2025-01-04 16:32:56', 0, 95, 'Da');
INSERT INTO `belts` VALUES (50, 'Thắt Lưng Hai Mặt Initiales LV 120MM', '<p>110 x 40 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 15,74 inch/40 mm</p><p>Chiều cao khóa: 1,77 inch/4,5 cm</p><p>Chiều rộng khóa: 1,77 inch/4,5 cm</p><p>Chất liệu da màu kem</p><p>Chất liệu Damier Azur Canvas</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa hình logo LV</p>', 523.423, 'N', 643, '2023-11-14', '2025-01-04 16:42:11', '2025-01-04 16:42:37', 0, 95, 'Canvas');
INSERT INTO `belts` VALUES (51, 'Thắt Lưng Hai Mặt LV Initiales 220MM', '<p>80 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,2 inch/3 cm</p><p>Chiều cao khóa: 1,4 inch/3,5 cm</p><p>Chiều rộng khóa: 1,4 inch/3,5 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Một mặt bằng chất liệu da màu hồng</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa hình logo LV Initiales</p>', 760.843, 'N', 45, '2022-10-23', '2025-01-04 16:44:30', '2025-01-04 16:45:23', 0, 0, 'Da');
INSERT INTO `belts` VALUES (52, 'Thắt Lưng Hai Mặt LV Pretty Pink 30MM', '<p>95 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,2 inch/3 cm</p><p>Chiều cao khóa: 1,4 inch/3,5 cm</p><p>Chiều rộng khóa: 1,4 inch/3,5 cm</p><p>Mặt trước bằng chất liệu Monogram Canvas</p><p>Mặt sau bằng chất liệu da màu đỏ</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa hình logo LV</p>', 876.922, 'N', 12, '2023-09-15', '2025-01-04 16:48:13', '2025-01-04 16:48:34', 0, 34, 'Canvas');
INSERT INTO `belts` VALUES (53, 'Thắt Lưng Hai Mặt LV Victory 30MM', '<p>Thắt lưng hai mặt LV Initiales bằng da bê màu be là thành viên mới của dòng thắt lưng LV Initiales rực rỡ sắc màu. Thắt lưng có thể đeo 2 mặt, với một mặt bằng chất liệu Monogram Canvas để tạo phong cách cổ điển. Có thể phối thắt lưng với nhiều kiểu trang phục như quần dài hoặc váy.</p><p>85 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,1 inch/3 cm</p><p>Chiều cao khóa: 1,4 inch/3,5 cm</p><p>Chiều rộng khóa: 1,4 inch/3,5 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da bê màu be Tourterelle</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa hình logo LV</p>', 425.342, 'N', 121, '2023-08-14', '2025-01-04 16:51:02', '2025-01-04 16:51:24', 0, 56, 'Canvas');
INSERT INTO `belts` VALUES (54, 'Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM', '<p><strong>Do nhu cầu mua sản phẩm này khá cao, mong quý khách thông cảm vì đơn hàng có thể đến muộn hơn bình thường. Chúng tôi sẽ cố gắng gửi trong thời gian sớm nhất.</strong><br><br>Thuộc bộ sưu tập hợp tác giữa Louis Vuitton và nghệ sĩ Takashi Murakami trứ danh, thắt lưng hai mặt LV x TM LV D-ring thời thượng ghi dấu ấn với chất liệu Monogram Multicolor Canvas màu đen, một bản biến tấu sinh động từ họa tiết di sản của Maison. Thiết kế được hoàn thiện với khóa gài màu Palladium cùng một khoen D-ring để treo chìa khóa hoặc phụ kiện, tạo thành điểm nhấn bắt mắt cho mọi bộ trang phục.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Chất liệu Monogram Multicolor Canvas</p><p>Da bê</p><p>Chi tiết kim loại màu Palladium</p>', 122.111, 'N', 12, '2023-05-11', '2025-01-04 19:25:08', '2025-01-04 19:25:30', 0, 12, 'Canvas');
INSERT INTO `belts` VALUES (55, 'Thắt Lưng Hai Mặt LV Mini Flowergram 10MM', '<p>Phiên bản mới của thắt lưng hai mặt LV Mini Flowergram 15mm sẽ là điểm nhấn tinh tế cho mọi trang phục. Một mặt thắt lưng được làm từ da điểm xuyết đường may diễu, mặt còn lại bằng vải Monogram Canvas. Thiết kế gây ấn tượng với khóa cài hình bông hoa Monogram cánh nhọn tinh xảo. Phần đuôi được vát nhọn giúp tăng thêm vẻ nữ tính cho món phụ kiện thanh mảnh và thời thượng này.</p><p>70 x 15 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 0,6 inch/1,5 cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da có đường khâu màu xám Tourterelle</p><p>Chi tiết kim loại màu Palladium</p><p>Khóa cài hình hoa Monogram cánh nhọn</p><p>Đuôi thắt lưng được vát nhọn</p>', 677.542, 'N', 122, '2023-10-25', '2025-01-04 19:26:59', '2025-01-04 19:27:20', 0, 11, 'Da');
INSERT INTO `belts` VALUES (56, 'Thắt Lưng LV Bloom 10MM', '<p>Thắt lưng LV Bloom 30 mm là sự kết hợp hoàn hảo giữa vẻ đẹp thanh lịch, cổ điển và phong cách hiện đại, táo bạo. Được chế tác tỉ mỉ đến từng chi tiết nhỏ, phụ kiện gây ấn tượng với đỉa thắt lưng được tạo hình từ logo LV và 2 đóa hoa Monogram bằng kim loại màu Palladium. Điểm nhấn tinh tế này giúp nâng tầm bộ trang phục thường nhật lẫn âu phục trang trọng.</p><p>85 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,1 inch/3 cm</p><p>Màu đen</p><p>Da có vân</p><p>Chi tiết kim loại màu Palladium</p><p>Lớp lót có họa tiết Monogram</p><p>Đỉa thắt lưng hình mô típ LV Bloom bằng kim loại</p>', 111.231, 'N', 65, '2025-01-08', '2025-01-04 19:29:30', '2025-01-04 19:29:58', 0, 12, 'Canvas');
INSERT INTO `belts` VALUES (57, 'Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM', '<p><strong>Do nhu cầu mua sản phẩm này khá cao, mong quý khách thông cảm vì đơn hàng có thể đến muộn hơn bình thường. Chúng tôi sẽ cố gắng gửi trong thời gian sớm nhất.</strong><br><br>Thuộc bộ sưu tập hợp tác giữa Louis Vuitton và nghệ sĩ Takashi Murakami trứ danh, thắt lưng hai mặt LV x TM LV D-ring thời thượng ghi dấu ấn với chất liệu Monogram Multicolor Canvas màu trắng, một bản biến tấu sinh động từ họa tiết di sản của Maison. Thiết kế được hoàn thiện với khóa gài màu vàng ánh kim cùng một khoen D-ring để treo chìa khóa hoặc phụ kiện, tạo thành điểm nhấn bắt mắt cho mọi bộ trang phục.</p><p>90 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu trắng</p><p>Chất liệu Monogram Multicolor Canvas</p><p>Da bê</p><p>Chi tiết kim loại màu vàng</p>', 123.121, 'N', 64, '2024-09-17', '2025-01-04 19:32:09', '2025-01-04 19:32:30', 0, 50, 'Da');
INSERT INTO `belts` VALUES (58, 'Thắt Lưng Hai Mặt LV Flowergram 30MM', '<p>Thắt lưng hai mặt LV Flowergram 30 mm tôn vinh họa tiết trứ danh nhất của Louis Vuitton. Xuất hiện nổi bật ở chính giữa thắt lưng là khóa cài tinh xảo, nữ tính lấy cảm hứng từ bông hoa Monogram biểu tượng. Một mặt của thắt lưng được làm từ chất liệu Monogram Canvas, mặt còn lại làm từ da dập nổi họa tiết Monogram. Phụ kiện thanh lịch và tinh xảo này sẽ giúp bộ trang phục thêm phần lộng lẫy.</p><p>80 x 30 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,2 inch/3cm</p><p>Một mặt bằng chất liệu Monogram Canvas</p><p>Mặt còn lại bằng da Monogram Empreinte màu kem</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Khóa cài hình hoa Monogram</p>', 768.674, 'N', 34, '2024-04-18', '2025-01-04 19:34:04', '2025-01-04 19:34:23', 0, 45, 'Canvas');
INSERT INTO `belts` VALUES (59, 'Thắt Lưng LV Chain Pearl', '<p>Thiết kế nữ tính cùng dấu ấn đặc trưng của Maison giúp thắt lưng LV Chain Pearl trở thành phụ kiện lộng lẫy cho buổi dạ tiệc hoặc lễ hội. Xuất hiện nổi bật trên dây thắt lưng dạng dây xích màu vàng ánh kim là các bông hoa Monogram, logo LV và các viên ngọc bằng nhựa Resin sáng bóng. Phụ kiện có thể dễ dàng điều chỉnh độ rộng để vừa với mọi kích cỡ vòng eo.</p><p>10 cm<br>(Chiều rộng)</p><p>Kim loại với lớp hoàn thiện màu vàng ánh kim</p><p>Ngọc bằng nhựa Resin màu trắng</p><p>Logo LV và hoa Monogram</p><p>Có thể điều chỉnh độ rộng</p>', 234.233, 'N', 12, '2023-01-18', '2025-01-04 19:37:44', '2025-01-06 10:57:27', 0, 12, 'Da');
INSERT INTO `belts` VALUES (60, 'Thắt Lưng Hai Mặt LV Fiction 30MM', '<p>Thắt lưng hai mặt LV Fiction 30 mm ghi dấu ấn với một biểu tượng mới của Maison, mang ý nghĩa tôn vinh di sản viễn du lâu đời. Được làm từ kim loại sáng bóng, khóa cài LV Fiction hình bầu dục trông như tấm bản đồ thế giới với logo LV nổi bật ở trung tâm, điểm xuyết những đường kẻ mảnh được khắc tinh xảo. Dây thắt lưng bằng da có thể sử dụng cả hai mặt một cách linh hoạt.</p><p>90 x 3 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Một mặt bằng da màu đen và một mặt bằng da màu đen dập nổi họa tiết Monogram</p><p>Chi tiết kim loại bằng đồng thau</p><p>Khóa cài LV Fiction màu bạc ánh kim</p><p>Thiết kế hai mặt</p><p>Sản xuất tại Tây Ban Nha</p>', 123.123, 'M', 76, '2022-09-13', '2025-01-08 11:44:12', '2025-01-08 11:44:33', 0, 10, 'Da');
INSERT INTO `belts` VALUES (61, 'Thắt Lưng LV Pyramide 40MM', '<p>110 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,6 inch/4 cm</p><p>Chất liệu Monogram Canvas</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Lớp lót bằng da bê</p><p>Khóa hình logo LV Pyramide</p>', 878.678, 'M', 12, '2023-01-23', '2025-01-08 11:46:57', '2025-01-08 11:47:20', 0, 67, 'Canvas');
INSERT INTO `belts` VALUES (62, 'Thắt Lưng Hai Mặt Damier Print 40MM', '<p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p><br>- Dây bằng chất liệu da họa tiết Damier Infini<br>- Lớp lót bằng da họa tiết Damier Infini<br>- Khóa bằng đồng thau phủ satin titanium<br>- Khóa khắc họa tiết Damier<br>- Chiều rộng: 40 mm/1,6 inch</p>', 445.321, 'M', 21, '2024-08-23', '2025-01-08 11:50:05', '2025-01-08 11:50:28', 0, 45, 'Da');
INSERT INTO `belts` VALUES (63, 'Thắt Lưng Hai Mặt LV Initiales 99MM', '<p>Xuất hiện tại buổi trình diễn bộ sưu tập Xuân-Hè 2024 dành cho nam, thắt lưng hai mặt LV Initiales 40mm gây ấn tượng với một mặt làm từ chất liệu Damier Pop Canvas với nhiều gam màu thời thượng, mặt còn lại bằng da bê trơn màu nâu tinh giản. Khóa cài hình logo LV màu vàng ánh kim kết hợp với dòng chữ “Louis Vuitton Maison Déposée” hoàn thiện vẻ ngoài bắt mắt.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu xanh dương</p><p>Chất liệu Damier Pop Canvas</p><p>Da bê</p><p>Chi tiết kim loại màu vàng ánh kim</p><p>Sản xuất tại Tây Ban Nha</p>', 456.541, 'M', 156, '2023-06-19', '2025-01-08 11:53:24', '2025-01-08 11:53:45', 0, 10, 'Canvas');
INSERT INTO `belts` VALUES (64, 'Thắt Lưng Hai Mặt LV Tubular 40MM', '<p>Được ra mắt mùa Xuân-Hè 2024, thắt lưng hai mặt LV Tubular 40mm sở hữu một mặt bằng da màu đen có vân và mặt còn lại bằng da trơn. Khóa cài LV Tubular bằng kim loại màu bạc mang đến nét biến tấu thời thượng cho logo của nhà mốt.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Chất liệu da</p><p>Chi tiết kim loại màu bạc</p><p>Sản xuất tại Tây Ban Nha</p>', 523.247, 'M', 354, '2024-02-10', '2025-01-08 11:56:16', '2025-01-08 11:56:37', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (65, 'Thắt Lưng Signature Chain 35MM', '<p>100 x 35 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,4 inch/3,5 cm</p><p>Chất liệu Monogram Eclipse Canvas</p><p>Lớp lót bằng da bê</p><p>Chi tiết kim loại màu đen có hiệu ứng sáng bóng</p><p>Quai đeo dạng xích có thể tháo rời</p><p>Khóa dạng gài kim khắc chữ ký của Virgil Abloh</p>', 242.344, 'M', 123, '2022-10-15', '2025-01-08 11:58:13', '2025-01-08 11:58:33', 0, 12, 'Da');
INSERT INTO `belts` VALUES (66, 'Thắt Lưng Hai Mặt LV 3 Steps 40MM', '<p>85 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,6 inch/4 cm</p><p>Monogram Eclipse/màu đen</p><p>Một mặt bằng chất liệu Monogram Eclipse Canvas</p><p>Một mặt bằng da bê màu đen</p><p>Khóa hình logo LV với hiệu ứng 3D</p>', 435.341, 'M', 123, '2024-08-21', '2025-01-08 12:01:45', '2025-01-08 12:02:10', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (67, 'Thắt Lưng Hai Mặt LV Tilt 40MM', '<p>110 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Chiều rộng: 1,5 inch/4 cm</p><p>Kích thước: 43,5 inch/110 cm</p><p>Một mặt bằng da bò Taurillon màu nâu Cognac</p><p>Một mặt bằng da bò Taurillon màu xanh hải quân</p><p>Khóa 3D bằng đồng thau với lớp hoàn thiện màu bạc mờ</p>', 312.331, 'M', 42, '2025-01-14', '2025-01-08 12:04:14', '2025-01-08 12:04:35', 0, 0, 'Da');
INSERT INTO `belts` VALUES (68, 'Thắt Lưng Hai Mặt LV Pixel 40MM', '<p>Thắt lưng hai mặt LV Pixel 40mm thời thượng và tiện dụng được biến tấu với thiết kế khóa cài kiểu mới hình logo LV màu bạc có hiệu ứng pixel 3D. Một mặt của thắt lưng được làm từ chất liệu Monogram Canvas biểu tượng, mặt còn lại được làm bằng da màu đen trơn tinh giản.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Màu đen</p><p>Chất liệu Monogram Canvas</p><p>Chất liệu da</p><p>Khóa cài bằng kim loại màu bạc</p><p>Sản xuất tại Tây Ban Nha</p>', 123.123, 'M', 12, '2024-09-08', '2025-01-08 12:06:33', '2025-01-08 12:06:56', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (69, 'Thắt Lưng Hai Mặt LV Initiales 40MM', '<p>Phiên bản thắt lưng hai mặt LV 40mm này sở hữu hoạ tiết nổi bật gợi nhớ đến những mảnh giấy bị cháy, bầu không khí đốt lửa trại và cung bậc cảm xúc của hoạt động ngoài trời. Thiết kế thời thượng được hoàn thiện với khóa cài hình logo LV biểu tượng màu vàng ánh kim có hiệu ứng ngả màu. Một mặt thắt lưng mang màu nâu cổ điển, tạo nên vẻ ngoài tinh tế.</p><p>90 x 4 cm<br>(Chiều dài x Chiều rộng)</p><p>Nhiều màu/nâu</p><p>Chất liệu Monogram Canvas in họa tiết</p><p>Khóa cài bằng kim loại màu vàng ánh kim với hiệu ứng ngả màu</p><p>Sản xuất tại Tây Ban Nha</p>', 864.246, 'M', 1212, '2024-09-16', '2025-01-08 12:12:25', '2025-01-08 12:12:50', 0, 0, 'Da');
INSERT INTO `belts` VALUES (70, 'Thắt Lưng Vải Hai Mặt', '<p>Chiếc thắt lưng golf hai mặt có sử dụng chất liệu tái chế.</p><p>Golf là một bộ môn mang phong cách truyền thống, thể hiện thông qua cả trang phục bạn mặc trên sân. Chiếc thắt lưng vải hai mặt adidas này không chỉ giữ lại nét truyền thống của môn thể thao này mà còn cho phép bạn được lựa chọn outfit phù hợp với mình. Làm từ vải dệt trơn bền chắc, bạn có thể nhanh chóng điều chỉnh và đảm bảo độ ôm thoải mái cho vòng golf trên sân. Sản phẩm này làm từ tối thiểu 50% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm lãng phí và giảm phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</p>', 123.774, 'M', 78, '2022-04-11', '2025-01-08 12:26:11', '2025-01-08 12:27:14', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (71, 'Thắt Lưng Tour 3 Sọc', '<p>Chiếc thắt lưng golf phong cách adidas đơn giản, có sử dụng chất liệu tái chế.</p><p>Từng chi tiết nhỏ đều làm nên sự khác biệt. Hoàn thiện bộ trang phục golf của bạn với chiếc thắt lưng dễ đeo này. Phong cách gọn gàng và đầu khóa 3 Sọc hoàn thiện outfit của bạn theo phong cách adidas classic. Sản phẩm này làm từ tối thiểu 50% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm thiểu lãng phí và hạn chế phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.</p>', 474.213, 'M', 56, '2024-10-19', '2025-01-08 12:29:20', '2025-01-08 12:29:39', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (72, 'Thắt Lưng Da Đan Golf', '<p>Tô điểm nét classic cho trang phục golf của bạn với chiếc thắt lưng da này.</p><p>Thiết kế tiện dụng và phong cách golf classic hòa làm một ở chiếc thắt lưng da đan adidas này. Chất liệu da cao cấp định hình kết cấu dạng đan thanh lịch, khẳng định bạn là một golf thủ khác biệt. Đầu khóa gài được mài bóng và cố định vị trí để đảm bảo độ ôm chắc chắn trong từng cú swing và putt. Lên đồ thật chỉn chu khi tee off để bắt đầu một vòng golf hoặc chuẩn bị sẵn sàng cho các hoạt động còn lại trong ngày.</p>', 632.341, 'M', 31, '2016-06-10', '2025-01-08 12:31:13', '2025-01-08 12:31:34', 0, 0, 'Da');
INSERT INTO `belts` VALUES (73, 'Thắt Lưng Tour Trophy', '<p>Chiếc thắt lưng golf hai mặt với khóa cài logo 3 Bar.</p><p>Chơi trọn vẹn vòng golf theo phong cách 3 Sọc. Chiếc thắt lưng golf adidas này làm nổi bật phong cách trên sân của bạn với chất liệu da tổng hợp và khóa cài màu bạc chải sợi. Dây đeo hai mặt giúp bạn thay đổi phong cách. Kích cỡ thoải mái mang đến độ vừa vặn hoàn hảo.</p>', 567.567, 'M', 34, '2023-01-10', '2025-01-08 14:17:09', '2025-01-08 14:17:40', 0, 0, 'Da');
INSERT INTO `belts` VALUES (74, 'Thắt Lưng Không Lỗ Polyurethane 3 Sọc', '<p>Chiếc thắt lưng golf có khóa cài 3 Sọc.</p><p>Tạo điểm nhấn cho outfit trên sân của bạn với chiếc thắt lưng golf này. Vân bám ở mặt sau đuôi thắt lưng giúp cố định vị trí để hạn chế phân tâm. 3 Sọc dập nổi trên khóa cài mang đậm phong cách adidas.</p>', 345.313, 'M', 123, '2025-01-12', '2025-01-08 14:20:07', '2025-01-08 14:22:34', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (75, 'V2025 Thắt lưng da dây chuyền 2 cm', '<p>Chiếc thắt lưng mỏng này được chế tác từ da bê và được làm giàu với phần cứng chữ \'V\' được tích hợp vào thắt lưng như một dây chuyền.<br>Phần cứng chuỗi V2025<br>Vòng đai<br>Khóa chốt Thành phần bên ngoài: 100% da bê</p>', 234.234, 'N', 12, '2021-12-06', '2025-01-08 14:27:03', '2025-01-08 14:27:44', 0, 12, 'Da');
INSERT INTO `belts` VALUES (76, 'Thắt lưng xích chốt an toàn 1,5 cm', '<p>Một dây đai xích được làm có chốt an toàn đặc trưng. Tất cả các sản phẩm trang sức của Versace đều không chứa chì và niken. Tất cả các vật liệu đều không gây dị ứng.<br>Phần cứng chốt an toàn<br>Đóng móc cài tôm hùm<br>Thành phần: 100% kim loại</p>', 123.123, 'N', 455, '2024-09-16', '2025-01-08 14:31:02', '2025-01-08 14:32:01', 0, 0, 'Canvas');
INSERT INTO `belts` VALUES (77, 'Thắt lưng xích chốt an toàn 3,5 cm', '<p>Được chế tác bằng da dẻo dai, chiếc thắt lưng mỏng này có khóa phần cứng Safety Pin mang tính biểu tượng.<br>Khóa chốt an toàn<br>Đóng đinh tán cổ áo<br>Thành phần bên ngoài: 100% da bê<br>Lớp lót: 100% da bê<br>Da từ xưởng thuộc da được chứng nhận có hiệu suất môi trường cao</p>', 123.123, 'N', 455, '2021-08-16', '2025-01-08 14:38:06', '2025-01-08 14:38:43', 0, 0, 'Da');
INSERT INTO `belts` VALUES (78, 'Thắt lưng da Medusa', NULL, 123.123, 'N', 455, '2024-04-19', '2025-01-08 14:42:41', '2025-01-08 14:42:41', 0, 0, 'Da');
INSERT INTO `belts` VALUES (79, 'Thắt lưng da Medusa Baggie', NULL, 578.563, 'N', 12, '2023-06-12', '2025-01-08 14:45:26', '2025-01-08 14:45:26', 0, 5, 'Da');
INSERT INTO `belts` VALUES (80, 'Thắt lưng Vàng Kim Khóa', '<p>Dây đai xích này được cấu tạo với các liên kết Greca đặc trưng – một biểu tượng thương hiệu, được xây dựng từ một dây chuyền không bị gián đoạn. Tất cả các sản phẩm trang sức của Versace đều không chứa chì và niken. Tất cả các vật liệu đều không gây dị ứng.<br>Phần cứng Greca<br>Đóng móc cài tôm hùm<br>Vật chất: 100% kim loại</p>', 578.563, 'N', 12, '2017-02-01', '2025-01-08 14:47:57', '2025-01-08 14:48:31', 0, 5, 'Canvas');

-- ----------------------------
-- Table structure for beltviews
-- ----------------------------
DROP TABLE IF EXISTS `beltviews`;
CREATE TABLE `beltviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `beltId` int NOT NULL,
  `viewDate` datetime NOT NULL,
  `viewCount` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_belt_view`(`beltId` ASC, `viewDate` ASC) USING BTREE,
  CONSTRAINT `beltviews_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 422 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of beltviews
-- ----------------------------
INSERT INTO `beltviews` VALUES (1, 1, '2024-12-29 00:00:00', 1);
INSERT INTO `beltviews` VALUES (2, 1, '2024-12-30 00:00:00', 1);
INSERT INTO `beltviews` VALUES (3, 1, '2025-01-03 00:00:00', 9);
INSERT INTO `beltviews` VALUES (7, 2, '2025-01-03 00:00:00', 16);
INSERT INTO `beltviews` VALUES (21, 3, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (22, 4, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (23, 5, '2025-01-03 00:00:00', 3);
INSERT INTO `beltviews` VALUES (25, 6, '2025-01-03 00:00:00', 7);
INSERT INTO `beltviews` VALUES (27, 9, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (28, 10, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (32, 11, '2025-01-03 00:00:00', 15);
INSERT INTO `beltviews` VALUES (33, 13, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (34, 16, '2025-01-03 00:00:00', 7);
INSERT INTO `beltviews` VALUES (41, 17, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (42, 18, '2025-01-03 00:00:00', 2);
INSERT INTO `beltviews` VALUES (49, 22, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (50, 15, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (64, 19, '2025-01-03 00:00:00', 1);
INSERT INTO `beltviews` VALUES (69, 23, '2025-01-03 00:00:00', 2);
INSERT INTO `beltviews` VALUES (73, 28, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (74, 1, '2025-01-04 00:00:00', 11);
INSERT INTO `beltviews` VALUES (78, 33, '2025-01-04 00:00:00', 3);
INSERT INTO `beltviews` VALUES (82, 22, '2025-01-04 00:00:00', 8);
INSERT INTO `beltviews` VALUES (83, 18, '2025-01-04 00:00:00', 2);
INSERT INTO `beltviews` VALUES (84, 21, '2025-01-04 00:00:00', 9);
INSERT INTO `beltviews` VALUES (88, 23, '2025-01-04 00:00:00', 6);
INSERT INTO `beltviews` VALUES (90, 25, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (100, 34, '2025-01-04 00:00:00', 3);
INSERT INTO `beltviews` VALUES (103, 27, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (104, 12, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (105, 24, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (106, 29, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (107, 40, '2025-01-04 00:00:00', 3);
INSERT INTO `beltviews` VALUES (124, 19, '2025-01-04 00:00:00', 1);
INSERT INTO `beltviews` VALUES (125, 12, '2025-01-05 00:00:00', 3);
INSERT INTO `beltviews` VALUES (128, 21, '2025-01-05 00:00:00', 1);
INSERT INTO `beltviews` VALUES (129, 29, '2025-01-05 00:00:00', 1);
INSERT INTO `beltviews` VALUES (130, 22, '2025-01-05 00:00:00', 1);
INSERT INTO `beltviews` VALUES (131, 18, '2025-01-05 00:00:00', 1);
INSERT INTO `beltviews` VALUES (132, 1, '2025-01-05 00:00:00', 1);
INSERT INTO `beltviews` VALUES (133, 59, '2025-01-06 00:00:00', 2);
INSERT INTO `beltviews` VALUES (134, 58, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (135, 15, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (136, 26, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (137, 25, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (138, 18, '2025-01-06 00:00:00', 2);
INSERT INTO `beltviews` VALUES (139, 13, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (140, 33, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (142, 23, '2025-01-06 00:00:00', 2);
INSERT INTO `beltviews` VALUES (143, 54, '2025-01-06 00:00:00', 1);
INSERT INTO `beltviews` VALUES (144, 22, '2025-01-06 00:00:00', 2);
INSERT INTO `beltviews` VALUES (148, 21, '2025-01-06 00:00:00', 3);
INSERT INTO `beltviews` VALUES (151, 17, '2025-01-08 00:00:00', 15);
INSERT INTO `beltviews` VALUES (152, 2, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (153, 21, '2025-01-08 00:00:00', 13);
INSERT INTO `beltviews` VALUES (156, 1, '2025-01-08 00:00:00', 25);
INSERT INTO `beltviews` VALUES (157, 63, '2025-01-08 00:00:00', 7);
INSERT INTO `beltviews` VALUES (159, 69, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (160, 70, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (161, 75, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (163, 76, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (164, 77, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (165, 80, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (167, 23, '2025-01-08 00:00:00', 7);
INSERT INTO `beltviews` VALUES (168, 18, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (171, 13, '2025-01-08 00:00:00', 9);
INSERT INTO `beltviews` VALUES (172, 20, '2025-01-08 00:00:00', 7);
INSERT INTO `beltviews` VALUES (175, 22, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (178, 19, '2025-01-08 00:00:00', 7);
INSERT INTO `beltviews` VALUES (181, 16, '2025-01-08 00:00:00', 9);
INSERT INTO `beltviews` VALUES (182, 15, '2025-01-08 00:00:00', 12);
INSERT INTO `beltviews` VALUES (184, 12, '2025-01-08 00:00:00', 13);
INSERT INTO `beltviews` VALUES (185, 11, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (186, 10, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (187, 9, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (188, 6, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (190, 5, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (191, 4, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (192, 3, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (194, 61, '2025-01-08 00:00:00', 4);
INSERT INTO `beltviews` VALUES (196, 60, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (197, 64, '2025-01-08 00:00:00', 5);
INSERT INTO `beltviews` VALUES (199, 78, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (201, 46, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (202, 53, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (203, 55, '2025-01-08 00:00:00', 4);
INSERT INTO `beltviews` VALUES (204, 48, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (205, 41, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (206, 43, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (207, 32, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (208, 74, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (212, 51, '2025-01-08 00:00:00', 9);
INSERT INTO `beltviews` VALUES (218, 50, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (224, 65, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (230, 37, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (231, 58, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (233, 72, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (237, 29, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (238, 31, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (241, 73, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (242, 71, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (255, 62, '2025-01-08 00:00:00', 3);
INSERT INTO `beltviews` VALUES (303, 36, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (304, 39, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (305, 42, '2025-01-08 00:00:00', 2);
INSERT INTO `beltviews` VALUES (313, 57, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (350, 28, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (361, 52, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (362, 54, '2025-01-08 00:00:00', 1);
INSERT INTO `beltviews` VALUES (365, 18, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (366, 21, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (367, 11, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (368, 10, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (369, 1, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (370, 13, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (371, 6, '2025-01-11 00:00:00', 1);
INSERT INTO `beltviews` VALUES (372, 49, '2025-01-12 00:00:00', 2);
INSERT INTO `beltviews` VALUES (374, 21, '2025-01-12 00:00:00', 1);
INSERT INTO `beltviews` VALUES (375, 23, '2025-01-12 00:00:00', 1);
INSERT INTO `beltviews` VALUES (376, 4, '2025-01-12 00:00:00', 2);
INSERT INTO `beltviews` VALUES (378, 1, '2025-01-12 00:00:00', 1);
INSERT INTO `beltviews` VALUES (379, 10, '2025-01-13 00:00:00', 1);
INSERT INTO `beltviews` VALUES (380, 4, '2025-01-14 00:00:00', 1);
INSERT INTO `beltviews` VALUES (381, 1, '2025-01-14 00:00:00', 1);
INSERT INTO `beltviews` VALUES (382, 13, '2025-01-14 00:00:00', 1);
INSERT INTO `beltviews` VALUES (383, 23, '2025-01-14 00:00:00', 1);
INSERT INTO `beltviews` VALUES (384, 73, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (385, 72, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (386, 4, '2025-01-15 00:00:00', 10);
INSERT INTO `beltviews` VALUES (387, 6, '2025-01-15 00:00:00', 4);
INSERT INTO `beltviews` VALUES (390, 21, '2025-01-15 00:00:00', 2);
INSERT INTO `beltviews` VALUES (393, 3, '2025-01-15 00:00:00', 2);
INSERT INTO `beltviews` VALUES (396, 11, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (397, 10, '2025-01-15 00:00:00', 3);
INSERT INTO `beltviews` VALUES (404, 69, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (407, 1, '2025-01-15 00:00:00', 3);
INSERT INTO `beltviews` VALUES (408, 9, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (411, 78, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (414, 54, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (415, 16, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (416, 50, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (417, 33, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (418, 17, '2025-01-15 00:00:00', 1);
INSERT INTO `beltviews` VALUES (419, 1, '2025-06-06 00:00:00', 3);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'đen');
INSERT INTO `categories` VALUES (2, 'hiệu');
INSERT INTO `categories` VALUES (3, 'XL');
INSERT INTO `categories` VALUES (4, 'HOT');
INSERT INTO `categories` VALUES (5, 'Vàng');
INSERT INTO `categories` VALUES (6, 'Mịn');
INSERT INTO `categories` VALUES (7, 'Trắng');
INSERT INTO `categories` VALUES (8, '100CM');
INSERT INTO `categories` VALUES (9, 'Canvas');
INSERT INTO `categories` VALUES (10, 'Nâu');
INSERT INTO `categories` VALUES (11, 'Monogram');
INSERT INTO `categories` VALUES (12, '90CM');
INSERT INTO `categories` VALUES (13, 'Sang');
INSERT INTO `categories` VALUES (14, 'Đắt');
INSERT INTO `categories` VALUES (15, 'Damoflage');
INSERT INTO `categories` VALUES (16, 'German');
INSERT INTO `categories` VALUES (17, 'Neuf');
INSERT INTO `categories` VALUES (18, '35MM');
INSERT INTO `categories` VALUES (19, 'Tag');
INSERT INTO `categories` VALUES (20, '40MM');
INSERT INTO `categories` VALUES (21, 'L9');
INSERT INTO `categories` VALUES (22, 'LINE');
INSERT INTO `categories` VALUES (23, 'RAT');
INSERT INTO `categories` VALUES (24, 'City');
INSERT INTO `categories` VALUES (25, 'Pin');
INSERT INTO `categories` VALUES (26, 'SkyLine');
INSERT INTO `categories` VALUES (27, 'LV');
INSERT INTO `categories` VALUES (28, 'Optic');
INSERT INTO `categories` VALUES (29, 'Heritage');
INSERT INTO `categories` VALUES (30, 'Shadow');
INSERT INTO `categories` VALUES (31, 'Blason');
INSERT INTO `categories` VALUES (32, 'Initiales');
INSERT INTO `categories` VALUES (33, 'Taurilion');
INSERT INTO `categories` VALUES (34, 'Aerigram');
INSERT INTO `categories` VALUES (35, 'Party');
INSERT INTO `categories` VALUES (36, 'M0714V');
INSERT INTO `categories` VALUES (37, 'M0333V');
INSERT INTO `categories` VALUES (38, 'M8727U');
INSERT INTO `categories` VALUES (39, 'M8561V');
INSERT INTO `categories` VALUES (40, 'M0541S');
INSERT INTO `categories` VALUES (41, 'M8470V');
INSERT INTO `categories` VALUES (42, 'M8981U');
INSERT INTO `categories` VALUES (43, 'Flowgergram');
INSERT INTO `categories` VALUES (44, '15MM');
INSERT INTO `categories` VALUES (45, 'Mini');
INSERT INTO `categories` VALUES (46, 'M8869Y');
INSERT INTO `categories` VALUES (47, 'Nautical');
INSERT INTO `categories` VALUES (48, 'Circle');
INSERT INTO `categories` VALUES (49, 'Iconic');
INSERT INTO `categories` VALUES (50, 'Enamel');
INSERT INTO `categories` VALUES (51, '20MM');
INSERT INTO `categories` VALUES (52, 'GO-14');
INSERT INTO `categories` VALUES (53, 'Coin');
INSERT INTO `categories` VALUES (54, 'De');
INSERT INTO `categories` VALUES (55, 'Malle');
INSERT INTO `categories` VALUES (56, 'Sparkle');
INSERT INTO `categories` VALUES (57, '30MM');
INSERT INTO `categories` VALUES (58, 'Studs');
INSERT INTO `categories` VALUES (59, 'Oversize');
INSERT INTO `categories` VALUES (60, 'Hook');
INSERT INTO `categories` VALUES (61, 'Wrapped');
INSERT INTO `categories` VALUES (62, '60MM');
INSERT INTO `categories` VALUES (63, 'SeaSide');
INSERT INTO `categories` VALUES (64, 'Twist');
INSERT INTO `categories` VALUES (65, 'Maxi');
INSERT INTO `categories` VALUES (66, 'Buckle');
INSERT INTO `categories` VALUES (67, 'Pretty');
INSERT INTO `categories` VALUES (68, '');
INSERT INTO `categories` VALUES (69, 'Pink');
INSERT INTO `categories` VALUES (70, 'Hai');
INSERT INTO `categories` VALUES (71, 'Victoria');
INSERT INTO `categories` VALUES (72, 'D-Ring');
INSERT INTO `categories` VALUES (73, 'TM');
INSERT INTO `categories` VALUES (74, 'Flowergram');
INSERT INTO `categories` VALUES (75, 'Bloom');
INSERT INTO `categories` VALUES (76, 'Pearl');
INSERT INTO `categories` VALUES (77, 'Chain');
INSERT INTO `categories` VALUES (78, 'Friction');
INSERT INTO `categories` VALUES (79, 'Pyramide');
INSERT INTO `categories` VALUES (80, 'Damier');
INSERT INTO `categories` VALUES (81, 'Print');
INSERT INTO `categories` VALUES (82, 'Model');
INSERT INTO `categories` VALUES (83, 'Cool');
INSERT INTO `categories` VALUES (84, 'V9');
INSERT INTO `categories` VALUES (85, 'Tubular');
INSERT INTO `categories` VALUES (86, 'Signature');
INSERT INTO `categories` VALUES (87, '3');
INSERT INTO `categories` VALUES (88, 'Step');
INSERT INTO `categories` VALUES (89, 'Tilt');
INSERT INTO `categories` VALUES (90, 'Pixel');
INSERT INTO `categories` VALUES (91, 'LB');
INSERT INTO `categories` VALUES (92, 'Initiation');
INSERT INTO `categories` VALUES (93, 'Return');
INSERT INTO `categories` VALUES (94, '90MM');
INSERT INTO `categories` VALUES (95, 'ADIDAS');
INSERT INTO `categories` VALUES (96, 'Tour');
INSERT INTO `categories` VALUES (97, '3Line');
INSERT INTO `categories` VALUES (98, 'Golf');
INSERT INTO `categories` VALUES (99, 'Da');
INSERT INTO `categories` VALUES (100, 'Trophy');
INSERT INTO `categories` VALUES (101, 'Polyurethane');
INSERT INTO `categories` VALUES (102, 'V2025');
INSERT INTO `categories` VALUES (103, 'Lock');
INSERT INTO `categories` VALUES (104, 'Brand');
INSERT INTO `categories` VALUES (105, 'Propritary');
INSERT INTO `categories` VALUES (106, 'Medusa');
INSERT INTO `categories` VALUES (107, 'Baggie');
INSERT INTO `categories` VALUES (108, 'GOLD');
INSERT INTO `categories` VALUES (109, 'ELITE');

-- ----------------------------
-- Table structure for collectiondetails
-- ----------------------------
DROP TABLE IF EXISTS `collectiondetails`;
CREATE TABLE `collectiondetails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collectiondetails
-- ----------------------------

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `collectionDetailId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `collectionDetailId`(`collectionDetailId` ASC) USING BTREE,
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`collectionDetailId`) REFERENCES `collectiondetails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collections
-- ----------------------------

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discountPercent` double NULL DEFAULT 0,
  `startDate` datetime NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `isActive` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (3, 'ASD456', 12, '2024-12-29 00:00:00', '2025-01-17 00:00:00', 0);
INSERT INTO `coupons` VALUES (4, 'GIAMGIA10', 10, '2025-01-04 00:00:00', '2025-01-20 00:00:00', 0);
INSERT INTO `coupons` VALUES (5, 'HOTSALE', 30, '2024-12-29 00:00:00', '2025-01-30 00:00:00', 0);
INSERT INTO `coupons` VALUES (6, 'GIAMGIA100', 11, '2025-01-10 00:00:00', '2025-01-16 00:00:00', 0);
INSERT INTO `coupons` VALUES (7, 'COOLDOWN11', 57, '2025-01-09 00:00:00', '2025-01-09 00:00:00', 0);
INSERT INTO `coupons` VALUES (8, 'HITWQ', 23, '2024-12-30 00:00:00', '2025-01-10 00:00:00', 1);
INSERT INTO `coupons` VALUES (9, 'HJKID654', 43, '2025-01-04 00:00:00', '2025-01-25 00:00:00', 1);
INSERT INTO `coupons` VALUES (10, 'NEWARRIVAL100', 45, '2024-12-29 00:00:00', '2025-01-16 00:00:00', 1);
INSERT INTO `coupons` VALUES (11, 'ALLDOWN1753', 12, '2025-01-08 00:00:00', '2025-01-03 00:00:00', 1);
INSERT INTO `coupons` VALUES (12, 'NBTFHJ238', 90, '2025-01-04 00:00:00', '2025-01-15 00:00:00', 1);

-- ----------------------------
-- Table structure for couponusage
-- ----------------------------
DROP TABLE IF EXISTS `couponusage`;
CREATE TABLE `couponusage`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `couponId` int NOT NULL,
  `userId` int NOT NULL,
  `orderId` int NOT NULL,
  `usedAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `couponId`(`couponId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  CONSTRAINT `couponusage_ibfk_1` FOREIGN KEY (`couponId`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `couponusage_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `couponusage_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of couponusage
-- ----------------------------

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `beltId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `beltId`(`beltId` ASC) USING BTREE,
  INDEX `userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (15, 12, 4);
INSERT INTO `favorites` VALUES (16, 78, 4);
INSERT INTO `favorites` VALUES (17, 6, 4);
INSERT INTO `favorites` VALUES (18, 46, 4);
INSERT INTO `favorites` VALUES (19, 53, 4);
INSERT INTO `favorites` VALUES (20, 55, 4);
INSERT INTO `favorites` VALUES (21, 48, 4);
INSERT INTO `favorites` VALUES (22, 41, 4);
INSERT INTO `favorites` VALUES (23, 43, 4);
INSERT INTO `favorites` VALUES (24, 32, 4);
INSERT INTO `favorites` VALUES (25, 74, 4);
INSERT INTO `favorites` VALUES (26, 75, 4);
INSERT INTO `favorites` VALUES (27, 76, 4);
INSERT INTO `favorites` VALUES (28, 37, 5);
INSERT INTO `favorites` VALUES (29, 67, 5);
INSERT INTO `favorites` VALUES (30, 74, 5);
INSERT INTO `favorites` VALUES (31, 3, 5);
INSERT INTO `favorites` VALUES (32, 58, 5);
INSERT INTO `favorites` VALUES (33, 55, 5);
INSERT INTO `favorites` VALUES (34, 72, 5);
INSERT INTO `favorites` VALUES (35, 11, 5);
INSERT INTO `favorites` VALUES (36, 10, 5);
INSERT INTO `favorites` VALUES (37, 1, 5);
INSERT INTO `favorites` VALUES (38, 29, 5);
INSERT INTO `favorites` VALUES (39, 31, 5);
INSERT INTO `favorites` VALUES (40, 64, 7);
INSERT INTO `favorites` VALUES (41, 62, 7);
INSERT INTO `favorites` VALUES (42, 20, 7);
INSERT INTO `favorites` VALUES (43, 10, 7);
INSERT INTO `favorites` VALUES (44, 11, 7);
INSERT INTO `favorites` VALUES (45, 61, 7);
INSERT INTO `favorites` VALUES (46, 12, 9);
INSERT INTO `favorites` VALUES (47, 13, 9);
INSERT INTO `favorites` VALUES (48, 15, 9);
INSERT INTO `favorites` VALUES (49, 16, 9);
INSERT INTO `favorites` VALUES (50, 64, 9);
INSERT INTO `favorites` VALUES (51, 62, 9);
INSERT INTO `favorites` VALUES (52, 17, 9);
INSERT INTO `favorites` VALUES (53, 19, 9);
INSERT INTO `favorites` VALUES (54, 22, 10);
INSERT INTO `favorites` VALUES (55, 23, 10);
INSERT INTO `favorites` VALUES (56, 1, 10);
INSERT INTO `favorites` VALUES (57, 20, 10);
INSERT INTO `favorites` VALUES (58, 19, 10);
INSERT INTO `favorites` VALUES (59, 12, 10);
INSERT INTO `favorites` VALUES (60, 15, 10);
INSERT INTO `favorites` VALUES (61, 16, 10);
INSERT INTO `favorites` VALUES (62, 36, 10);
INSERT INTO `favorites` VALUES (63, 39, 10);
INSERT INTO `favorites` VALUES (64, 42, 10);
INSERT INTO `favorites` VALUES (65, 21, 11);
INSERT INTO `favorites` VALUES (66, 11, 11);
INSERT INTO `favorites` VALUES (67, 80, 11);
INSERT INTO `favorites` VALUES (68, 51, 11);
INSERT INTO `favorites` VALUES (69, 73, 11);
INSERT INTO `favorites` VALUES (70, 57, 11);
INSERT INTO `favorites` VALUES (71, 58, 11);
INSERT INTO `favorites` VALUES (72, 64, 11);
INSERT INTO `favorites` VALUES (73, 63, 11);
INSERT INTO `favorites` VALUES (74, 61, 11);
INSERT INTO `favorites` VALUES (75, 15, 11);
INSERT INTO `favorites` VALUES (76, 16, 11);
INSERT INTO `favorites` VALUES (77, 12, 11);
INSERT INTO `favorites` VALUES (78, 15, 12);
INSERT INTO `favorites` VALUES (79, 16, 12);
INSERT INTO `favorites` VALUES (80, 12, 12);
INSERT INTO `favorites` VALUES (81, 17, 12);
INSERT INTO `favorites` VALUES (82, 19, 12);
INSERT INTO `favorites` VALUES (83, 42, 12);
INSERT INTO `favorites` VALUES (84, 20, 12);
INSERT INTO `favorites` VALUES (85, 28, 13);
INSERT INTO `favorites` VALUES (86, 12, 13);
INSERT INTO `favorites` VALUES (87, 16, 13);
INSERT INTO `favorites` VALUES (88, 17, 13);
INSERT INTO `favorites` VALUES (89, 20, 13);
INSERT INTO `favorites` VALUES (90, 61, 13);
INSERT INTO `favorites` VALUES (91, 63, 13);
INSERT INTO `favorites` VALUES (92, 64, 13);
INSERT INTO `favorites` VALUES (93, 60, 13);
INSERT INTO `favorites` VALUES (94, 13, 13);
INSERT INTO `favorites` VALUES (95, 54, 13);
INSERT INTO `favorites` VALUES (96, 55, 13);
INSERT INTO `favorites` VALUES (97, 50, 13);
INSERT INTO `favorites` VALUES (100, 80, 1);
INSERT INTO `favorites` VALUES (101, 70, 1);
INSERT INTO `favorites` VALUES (102, 42, 1);
INSERT INTO `favorites` VALUES (103, 25, 1);

-- ----------------------------
-- Table structure for imageentry
-- ----------------------------
DROP TABLE IF EXISTS `imageentry`;
CREATE TABLE `imageentry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `beltId` int NOT NULL,
  `imageType` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imagePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `beltId`(`beltId` ASC) USING BTREE,
  CONSTRAINT `imageentry_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 599 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of imageentry
-- ----------------------------
INSERT INTO `imageentry` VALUES (1, 1, 'main', '\\uploads\\Thắt Lưng LV\\Thắt Lưng LV_0_1735358403532.png');
INSERT INTO `imageentry` VALUES (2, 1, 'extra', '\\uploads\\Thắt Lưng LV\\Thắt Lưng LV_1_1735358403539.jpg');
INSERT INTO `imageentry` VALUES (3, 1, 'extra', '\\uploads\\Thắt Lưng LV\\Thắt Lưng LV_2_1735358403549.jpg');
INSERT INTO `imageentry` VALUES (4, 1, 'extra', '\\uploads\\Thắt Lưng LV\\Thắt Lưng LV_3_1735358403551.jpg');
INSERT INTO `imageentry` VALUES (5, 1, 'extra', '\\uploads\\Thắt Lưng LV\\Thắt Lưng LV_4_1735358403551.png');
INSERT INTO `imageentry` VALUES (6, 2, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Dimension 40MM\\Thắt Lưng Hai Mặt LV Dimension 40MM_0_1735899759954.png');
INSERT INTO `imageentry` VALUES (7, 2, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dimension 40MM\\Thắt Lưng Hai Mặt LV Dimension 40MM_3_1735899759959.png');
INSERT INTO `imageentry` VALUES (8, 2, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dimension 40MM\\Thắt Lưng Hai Mặt LV Dimension 40MM_3_1735899759959.png');
INSERT INTO `imageentry` VALUES (9, 2, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dimension 40MM\\Thắt Lưng Hai Mặt LV Dimension 40MM_3_1735899759959.png');
INSERT INTO `imageentry` VALUES (10, 2, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dimension 40MM\\Thắt Lưng Hai Mặt LV Dimension 40MM_3_1735899759959.png');
INSERT INTO `imageentry` VALUES (11, 2, 'description', '\\uploads\\_belt2\\2_desc1735896440841.png');
INSERT INTO `imageentry` VALUES (12, 2, 'description', '\\uploads\\_belt2\\2_desc1735896444038.png');
INSERT INTO `imageentry` VALUES (13, 2, 'description', '\\uploads\\_belt2\\2_desc1735896784209.png');
INSERT INTO `imageentry` VALUES (14, 2, 'description', '\\uploads\\_belt2\\2_desc1735896788601.png');
INSERT INTO `imageentry` VALUES (15, 1, 'description', '\\uploads\\_belt1\\1_desc1735897060592.png');
INSERT INTO `imageentry` VALUES (16, 1, 'description', '\\uploads\\_belt1\\1_desc1735897064380.png');
INSERT INTO `imageentry` VALUES (17, 3, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_0_1735897272241.png');
INSERT INTO `imageentry` VALUES (18, 3, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_1_1735897272246.png');
INSERT INTO `imageentry` VALUES (19, 3, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_2_1735897272248.png');
INSERT INTO `imageentry` VALUES (20, 3, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_3_1735897272249.png');
INSERT INTO `imageentry` VALUES (21, 3, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_4_1735897272251.png');
INSERT INTO `imageentry` VALUES (22, 3, 'description', '\\uploads\\_belt3\\3_desc1735897288205.png');
INSERT INTO `imageentry` VALUES (23, 3, 'description', '\\uploads\\_belt3\\3_desc1735897291248.png');
INSERT INTO `imageentry` VALUES (24, 3, 'description', '\\uploads\\_belt3\\3_desc1735897294553.png');
INSERT INTO `imageentry` VALUES (25, 4, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM_0_1735897694860.png');
INSERT INTO `imageentry` VALUES (26, 4, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM_1_1735897694861.png');
INSERT INTO `imageentry` VALUES (27, 4, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM_2_1735897694863.png');
INSERT INTO `imageentry` VALUES (28, 4, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM_3_1735897694864.png');
INSERT INTO `imageentry` VALUES (29, 4, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM\\Thắt Lưng Hai Mặt LV Initiales Pearls 40MM_4_1735897694868.png');
INSERT INTO `imageentry` VALUES (30, 4, 'description', '\\uploads\\_belt4\\4_desc1735897709242.png');
INSERT INTO `imageentry` VALUES (31, 4, 'description', '\\uploads\\_belt4\\4_desc1735897711936.png');
INSERT INTO `imageentry` VALUES (32, 4, 'description', '\\uploads\\_belt4\\4_desc1735897715885.png');
INSERT INTO `imageentry` VALUES (33, 5, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Imprint 40MM\\Thắt Lưng Hai Mặt LV Imprint 40MM_0_1735898100516.png');
INSERT INTO `imageentry` VALUES (34, 5, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Imprint 40MM\\Thắt Lưng Hai Mặt LV Imprint 40MM_1_1735898100517.png');
INSERT INTO `imageentry` VALUES (35, 5, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Imprint 40MM\\Thắt Lưng Hai Mặt LV Imprint 40MM_2_1735898100519.png');
INSERT INTO `imageentry` VALUES (36, 5, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Imprint 40MM\\Thắt Lưng Hai Mặt LV Imprint 40MM_3_1735898100521.png');
INSERT INTO `imageentry` VALUES (37, 5, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Imprint 40MM\\Thắt Lưng Hai Mặt LV Imprint 40MM_4_1735898100525.png');
INSERT INTO `imageentry` VALUES (38, 5, 'description', '\\uploads\\_belt5\\5_desc1735898140456.png');
INSERT INTO `imageentry` VALUES (39, 5, 'description', '\\uploads\\_belt5\\5_desc1735898143086.png');
INSERT INTO `imageentry` VALUES (40, 5, 'description', '\\uploads\\_belt5\\5_desc1735898145648.png');
INSERT INTO `imageentry` VALUES (41, 5, 'description', '\\uploads\\_belt5\\5_desc1735898147904.png');
INSERT INTO `imageentry` VALUES (42, 6, 'description', '\\uploads\\_belt6\\6_desc1735898915263.png');
INSERT INTO `imageentry` VALUES (43, 6, 'description', '\\uploads\\_belt6\\6_desc1735898917982.png');
INSERT INTO `imageentry` VALUES (44, 9, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Stitch 40MM\\Thắt Lưng Hai Mặt LV Stitch 40MM_0_1735899311364.png');
INSERT INTO `imageentry` VALUES (45, 9, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Stitch 40MM\\Thắt Lưng Hai Mặt LV Stitch 40MM_1_1735899311366.png');
INSERT INTO `imageentry` VALUES (46, 9, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Stitch 40MM\\Thắt Lưng Hai Mặt LV Stitch 40MM_2_1735899311368.png');
INSERT INTO `imageentry` VALUES (47, 9, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Stitch 40MM\\Thắt Lưng Hai Mặt LV Stitch 40MM_3_1735899311370.png');
INSERT INTO `imageentry` VALUES (48, 9, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Stitch 40MM\\Thắt Lưng Hai Mặt LV Stitch 40MM_4_1735899311372.png');
INSERT INTO `imageentry` VALUES (49, 9, 'description', '\\uploads\\_belt9\\9_desc1735899331248.png');
INSERT INTO `imageentry` VALUES (50, 9, 'description', '\\uploads\\_belt9\\9_desc1735899333546.png');
INSERT INTO `imageentry` VALUES (51, 9, 'description', '\\uploads\\_belt9\\9_desc1735899336429.png');
INSERT INTO `imageentry` VALUES (52, 10, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Dynasty 35MM\\Thắt Lưng Hai Mặt LV Dynasty 35MM_3_1735899542849.png');
INSERT INTO `imageentry` VALUES (53, 10, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dynasty 35MM\\Thắt Lưng Hai Mặt LV Dynasty 35MM_1_1735899542845.png');
INSERT INTO `imageentry` VALUES (54, 10, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dynasty 35MM\\Thắt Lưng Hai Mặt LV Dynasty 35MM_2_1735899542848.png');
INSERT INTO `imageentry` VALUES (55, 10, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dynasty 35MM\\Thắt Lưng Hai Mặt LV Dynasty 35MM_3_1735899542849.png');
INSERT INTO `imageentry` VALUES (56, 10, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Dynasty 35MM\\Thắt Lưng Hai Mặt LV Dynasty 35MM_4_1735899542851.png');
INSERT INTO `imageentry` VALUES (57, 10, 'description', '\\uploads\\_belt10\\10_desc1735899558897.png');
INSERT INTO `imageentry` VALUES (58, 10, 'description', '\\uploads\\_belt10\\10_desc1735899561411.png');
INSERT INTO `imageentry` VALUES (59, 10, 'description', '\\uploads\\_belt10\\10_desc1735899563582.png');
INSERT INTO `imageentry` VALUES (60, 11, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_0_1735899951640.png');
INSERT INTO `imageentry` VALUES (61, 11, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_1_1735899951641.png');
INSERT INTO `imageentry` VALUES (62, 11, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_2_1735899951643.png');
INSERT INTO `imageentry` VALUES (63, 11, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_3_1735899951645.png');
INSERT INTO `imageentry` VALUES (64, 11, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_4_1735899951648.png');
INSERT INTO `imageentry` VALUES (65, 11, 'description', '\\uploads\\_belt11\\11_desc1735899967011.png');
INSERT INTO `imageentry` VALUES (66, 11, 'description', '\\uploads\\_belt11\\11_desc1735899969375.png');
INSERT INTO `imageentry` VALUES (67, 11, 'description', '\\uploads\\_belt11\\11_desc1735899971840.png');
INSERT INTO `imageentry` VALUES (68, 11, 'description', '\\uploads\\_belt11\\11_desc1735899974519.png');
INSERT INTO `imageentry` VALUES (69, 12, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM_0_1735900316945.png');
INSERT INTO `imageentry` VALUES (70, 12, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM_1_1735900316947.png');
INSERT INTO `imageentry` VALUES (71, 12, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM_2_1735900316950.png');
INSERT INTO `imageentry` VALUES (72, 12, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM_3_1735900316954.png');
INSERT INTO `imageentry` VALUES (73, 12, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM\\Thắt Lưng Hai Mặt LV Initiales Damoflage 40MM_4_1735900316956.png');
INSERT INTO `imageentry` VALUES (74, 12, 'description', '\\uploads\\_belt12\\12_desc1735900330597.png');
INSERT INTO `imageentry` VALUES (75, 12, 'description', '\\uploads\\_belt12\\12_desc1735900333463.png');
INSERT INTO `imageentry` VALUES (76, 12, 'description', '\\uploads\\_belt12\\12_desc1735900335704.png');
INSERT INTO `imageentry` VALUES (77, 13, 'main', '\\uploads\\Thắt Lưng Saint Germain 35MM\\Thắt Lưng Saint Germain 35MM_0_1735900470883.png');
INSERT INTO `imageentry` VALUES (78, 13, 'extra', '\\uploads\\Thắt Lưng Saint Germain 35MM\\Thắt Lưng Saint Germain 35MM_1_1735900470884.png');
INSERT INTO `imageentry` VALUES (79, 13, 'extra', '\\uploads\\Thắt Lưng Saint Germain 35MM\\Thắt Lưng Saint Germain 35MM_2_1735900470891.png');
INSERT INTO `imageentry` VALUES (80, 13, 'extra', '\\uploads\\Thắt Lưng Saint Germain 35MM\\Thắt Lưng Saint Germain 35MM_3_1735900470895.png');
INSERT INTO `imageentry` VALUES (81, 13, 'extra', '\\uploads\\Thắt Lưng Saint Germain 35MM\\Thắt Lưng Saint Germain 35MM_4_1735900470899.png');
INSERT INTO `imageentry` VALUES (87, 13, 'description', '\\uploads\\_belt13\\13_desc1735900647362.png');
INSERT INTO `imageentry` VALUES (88, 13, 'description', '\\uploads\\_belt13\\13_desc1735900651721.png');
INSERT INTO `imageentry` VALUES (89, 15, 'main', '\\uploads\\Thắt Lưng Pont Neuf 35MM\\Thắt Lưng Pont Neuf 35MM_0_1735900881210.png');
INSERT INTO `imageentry` VALUES (90, 15, 'extra', '\\uploads\\Thắt Lưng Pont Neuf 35MM\\Thắt Lưng Pont Neuf 35MM_1_1735900881214.png');
INSERT INTO `imageentry` VALUES (91, 15, 'extra', '\\uploads\\Thắt Lưng Pont Neuf 35MM\\Thắt Lưng Pont Neuf 35MM_2_1735900881219.png');
INSERT INTO `imageentry` VALUES (92, 15, 'extra', '\\uploads\\Thắt Lưng Pont Neuf 35MM\\Thắt Lưng Pont Neuf 35MM_3_1735900881223.png');
INSERT INTO `imageentry` VALUES (93, 15, 'extra', '\\uploads\\Thắt Lưng Pont Neuf 35MM\\Thắt Lưng Pont Neuf 35MM_4_1735900881225.png');
INSERT INTO `imageentry` VALUES (94, 15, 'description', '\\uploads\\_belt15\\15_desc1735900905157.png');
INSERT INTO `imageentry` VALUES (95, 15, 'description', '\\uploads\\_belt15\\15_desc1735900908174.png');
INSERT INTO `imageentry` VALUES (96, 15, 'description', '\\uploads\\_belt15\\15_desc1735900916011.png');
INSERT INTO `imageentry` VALUES (97, 16, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Tag 40MM\\Thắt Lưng Hai Mặt LV Tag 40MM_1_1735901125115.png');
INSERT INTO `imageentry` VALUES (98, 16, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tag 40MM\\Thắt Lưng Hai Mặt LV Tag 40MM_1_1735901125115.png');
INSERT INTO `imageentry` VALUES (99, 16, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tag 40MM\\Thắt Lưng Hai Mặt LV Tag 40MM_2_1735901125119.png');
INSERT INTO `imageentry` VALUES (100, 16, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tag 40MM\\Thắt Lưng Hai Mặt LV Tag 40MM_3_1735901125123.png');
INSERT INTO `imageentry` VALUES (101, 16, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tag 40MM\\Thắt Lưng Hai Mặt LV Tag 40MM_4_1735901125124.png');
INSERT INTO `imageentry` VALUES (102, 16, 'description', '\\uploads\\_belt16\\16_desc1735901143889.png');
INSERT INTO `imageentry` VALUES (103, 16, 'description', '\\uploads\\_belt16\\16_desc1735901148023.png');
INSERT INTO `imageentry` VALUES (104, 16, 'description', '\\uploads\\_belt16\\16_desc1735901152648.png');
INSERT INTO `imageentry` VALUES (105, 16, 'description', '\\uploads\\_belt16\\16_desc1735901155684.png');
INSERT INTO `imageentry` VALUES (106, 17, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV L9 40MM\\Thắt Lưng Hai Mặt LV L9 40MM_0_1735901458132.png');
INSERT INTO `imageentry` VALUES (107, 17, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV L9 40MM\\Thắt Lưng Hai Mặt LV L9 40MM_1_1735901458134.png');
INSERT INTO `imageentry` VALUES (108, 17, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV L9 40MM\\Thắt Lưng Hai Mặt LV L9 40MM_2_1735901458136.png');
INSERT INTO `imageentry` VALUES (109, 17, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV L9 40MM\\Thắt Lưng Hai Mặt LV L9 40MM_3_1735901458137.png');
INSERT INTO `imageentry` VALUES (110, 17, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV L9 40MM\\Thắt Lưng Hai Mặt LV L9 40MM_4_1735901458139.png');
INSERT INTO `imageentry` VALUES (111, 17, 'description', '\\uploads\\_belt17\\17_desc1735901479898.png');
INSERT INTO `imageentry` VALUES (112, 17, 'description', '\\uploads\\_belt17\\17_desc1735901482169.png');
INSERT INTO `imageentry` VALUES (113, 17, 'description', '\\uploads\\_belt17\\17_desc1735901484447.png');
INSERT INTO `imageentry` VALUES (114, 18, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Line 40MM\\Thắt Lưng Hai Mặt LV Line 40MM_0_1735901682351.png');
INSERT INTO `imageentry` VALUES (115, 18, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Line 40MM\\Thắt Lưng Hai Mặt LV Line 40MM_1_1735901682353.png');
INSERT INTO `imageentry` VALUES (116, 18, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Line 40MM\\Thắt Lưng Hai Mặt LV Line 40MM_2_1735901682355.png');
INSERT INTO `imageentry` VALUES (117, 18, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Line 40MM\\Thắt Lưng Hai Mặt LV Line 40MM_3_1735901682360.png');
INSERT INTO `imageentry` VALUES (118, 18, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Line 40MM\\Thắt Lưng Hai Mặt LV Line 40MM_4_1735901682362.png');
INSERT INTO `imageentry` VALUES (119, 18, 'description', '\\uploads\\_belt18\\18_desc1735901697316.png');
INSERT INTO `imageentry` VALUES (120, 18, 'description', '\\uploads\\_belt18\\18_desc1735901700928.png');
INSERT INTO `imageentry` VALUES (121, 18, 'description', '\\uploads\\_belt18\\18_desc1735901703144.png');
INSERT INTO `imageentry` VALUES (122, 19, 'main', '\\uploads\\Thắt Lưng LV City Pin 35MM\\Thắt Lưng LV City Pin 35MM_0_1735901996016.png');
INSERT INTO `imageentry` VALUES (123, 19, 'extra', '\\uploads\\Thắt Lưng LV City Pin 35MM\\Thắt Lưng LV City Pin 35MM_1_1735901996017.png');
INSERT INTO `imageentry` VALUES (124, 19, 'extra', '\\uploads\\Thắt Lưng LV City Pin 35MM\\Thắt Lưng LV City Pin 35MM_2_1735901996019.png');
INSERT INTO `imageentry` VALUES (125, 19, 'extra', '\\uploads\\Thắt Lưng LV City Pin 35MM\\Thắt Lưng LV City Pin 35MM_3_1735901996022.png');
INSERT INTO `imageentry` VALUES (126, 19, 'extra', '\\uploads\\Thắt Lưng LV City Pin 35MM\\Thắt Lưng LV City Pin 35MM_4_1735901996024.png');
INSERT INTO `imageentry` VALUES (127, 19, 'description', '\\uploads\\_belt19\\19_desc1735902010143.png');
INSERT INTO `imageentry` VALUES (128, 19, 'description', '\\uploads\\_belt19\\19_desc1735902012517.png');
INSERT INTO `imageentry` VALUES (129, 19, 'description', '\\uploads\\_belt19\\19_desc1735902014782.png');
INSERT INTO `imageentry` VALUES (130, 20, 'main', '\\uploads\\Thắt Lưng LV Skyline 35MM\\Thắt Lưng LV Skyline 35MM_0_1735904209317.png');
INSERT INTO `imageentry` VALUES (131, 20, 'extra', '\\uploads\\Thắt Lưng LV Skyline 35MM\\Thắt Lưng LV Skyline 35MM_1_1735904209322.png');
INSERT INTO `imageentry` VALUES (132, 20, 'extra', '\\uploads\\Thắt Lưng LV Skyline 35MM\\Thắt Lưng LV Skyline 35MM_2_1735904209325.png');
INSERT INTO `imageentry` VALUES (133, 20, 'extra', '\\uploads\\Thắt Lưng LV Skyline 35MM\\Thắt Lưng LV Skyline 35MM_3_1735904209327.png');
INSERT INTO `imageentry` VALUES (134, 20, 'extra', '\\uploads\\Thắt Lưng LV Skyline 35MM\\Thắt Lưng LV Skyline 35MM_4_1735904209330.png');
INSERT INTO `imageentry` VALUES (135, 20, 'description', '\\uploads\\_belt20\\20_desc1735904235602.png');
INSERT INTO `imageentry` VALUES (136, 20, 'description', '\\uploads\\_belt20\\20_desc1735904237866.png');
INSERT INTO `imageentry` VALUES (137, 20, 'description', '\\uploads\\_belt20\\20_desc1735904240201.png');
INSERT INTO `imageentry` VALUES (138, 21, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Optic 40MM\\Thắt Lưng Hai Mặt LV Optic 40MM_0_1735904426148.png');
INSERT INTO `imageentry` VALUES (139, 21, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Optic 40MM\\Thắt Lưng Hai Mặt LV Optic 40MM_1_1735904426149.png');
INSERT INTO `imageentry` VALUES (140, 21, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Optic 40MM\\Thắt Lưng Hai Mặt LV Optic 40MM_2_1735904426151.png');
INSERT INTO `imageentry` VALUES (141, 21, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Optic 40MM\\Thắt Lưng Hai Mặt LV Optic 40MM_3_1735904426155.png');
INSERT INTO `imageentry` VALUES (142, 21, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Optic 40MM\\Thắt Lưng Hai Mặt LV Optic 40MM_4_1735904426156.png');
INSERT INTO `imageentry` VALUES (143, 22, 'main', '\\uploads\\Thắt Lưng Heritage 35MM\\Thắt Lưng Heritage 35MM_0_1735904566763.png');
INSERT INTO `imageentry` VALUES (144, 22, 'extra', '\\uploads\\Thắt Lưng Heritage 35MM\\Thắt Lưng Heritage 35MM_1_1735904566764.png');
INSERT INTO `imageentry` VALUES (145, 22, 'description', '\\uploads\\_belt22\\22_desc1735904584314.png');
INSERT INTO `imageentry` VALUES (146, 22, 'description', '\\uploads\\_belt22\\22_desc1735904586639.png');
INSERT INTO `imageentry` VALUES (147, 23, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Shadow 40MM\\Thắt Lưng Hai Mặt LV Shadow 40MM_0_1735904705217.png');
INSERT INTO `imageentry` VALUES (148, 23, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shadow 40MM\\Thắt Lưng Hai Mặt LV Shadow 40MM_1_1735904705219.png');
INSERT INTO `imageentry` VALUES (149, 23, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shadow 40MM\\Thắt Lưng Hai Mặt LV Shadow 40MM_2_1735904705222.png');
INSERT INTO `imageentry` VALUES (150, 23, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shadow 40MM\\Thắt Lưng Hai Mặt LV Shadow 40MM_3_1735904705223.png');
INSERT INTO `imageentry` VALUES (151, 23, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shadow 40MM\\Thắt Lưng Hai Mặt LV Shadow 40MM_4_1735904705224.png');
INSERT INTO `imageentry` VALUES (152, 23, 'description', '\\uploads\\_belt23\\23_desc1735904719289.png');
INSERT INTO `imageentry` VALUES (153, 23, 'description', '\\uploads\\_belt23\\23_desc1735904721318.png');
INSERT INTO `imageentry` VALUES (154, 23, 'description', '\\uploads\\_belt23\\23_desc1735904723310.png');
INSERT INTO `imageentry` VALUES (157, 6, 'main', '\\uploads\\Thắt Lưng Everyday Pin 35MM\\Thắt Lưng Everyday Pin 35MM_0_1735906169526.png');
INSERT INTO `imageentry` VALUES (158, 6, 'extra', '\\uploads\\Thắt Lưng Everyday Pin 35MM\\Thắt Lưng Everyday Pin 35MM_1_1735906169531.png');
INSERT INTO `imageentry` VALUES (159, 6, 'extra', '\\uploads\\Thắt Lưng Everyday Pin 35MM\\Thắt Lưng Everyday Pin 35MM_2_1735906169533.png');
INSERT INTO `imageentry` VALUES (160, 6, 'extra', '\\uploads\\Thắt Lưng Everyday Pin 35MM\\Thắt Lưng Everyday Pin 35MM_3_1735906169535.png');
INSERT INTO `imageentry` VALUES (161, 6, 'extra', '\\uploads\\Thắt Lưng Everyday Pin 35MM\\Thắt Lưng Everyday Pin 35MM_4_1735906169537.png');
INSERT INTO `imageentry` VALUES (162, 24, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM_0_1735974792832.png');
INSERT INTO `imageentry` VALUES (163, 24, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM_1_1735974792838.png');
INSERT INTO `imageentry` VALUES (164, 24, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM_2_1735974792842.png');
INSERT INTO `imageentry` VALUES (165, 24, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM_3_1735974792844.png');
INSERT INTO `imageentry` VALUES (166, 24, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM\\Thắt Lưng Hai Mặt LV Initiales Blason 40MM_4_1735974792847.png');
INSERT INTO `imageentry` VALUES (167, 24, 'description', '\\uploads\\_belt24\\24_desc1735974810877.png');
INSERT INTO `imageentry` VALUES (168, 24, 'description', '\\uploads\\_belt24\\24_desc1735974812617.png');
INSERT INTO `imageentry` VALUES (169, 24, 'description', '\\uploads\\_belt24\\24_desc1735974814485.png');
INSERT INTO `imageentry` VALUES (170, 25, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Taurillon 40MM\\Thắt Lưng Hai Mặt LV Taurillon 40MM_0_1735974971590.png');
INSERT INTO `imageentry` VALUES (171, 25, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Taurillon 40MM\\Thắt Lưng Hai Mặt LV Taurillon 40MM_1_1735974971591.png');
INSERT INTO `imageentry` VALUES (172, 25, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Taurillon 40MM\\Thắt Lưng Hai Mặt LV Taurillon 40MM_2_1735974971593.png');
INSERT INTO `imageentry` VALUES (173, 25, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Taurillon 40MM\\Thắt Lưng Hai Mặt LV Taurillon 40MM_3_1735974971596.png');
INSERT INTO `imageentry` VALUES (174, 25, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Taurillon 40MM\\Thắt Lưng Hai Mặt LV Taurillon 40MM_4_1735974971598.png');
INSERT INTO `imageentry` VALUES (175, 25, 'description', '\\uploads\\_belt25\\25_desc1735974993234.png');
INSERT INTO `imageentry` VALUES (176, 25, 'description', '\\uploads\\_belt25\\25_desc1735974995280.png');
INSERT INTO `imageentry` VALUES (177, 25, 'description', '\\uploads\\_belt25\\25_desc1735974997716.png');
INSERT INTO `imageentry` VALUES (178, 26, 'main', '\\uploads\\Thắt Lưng LV Aerogram 35MM\\Thắt Lưng LV Aerogram 35MM_0_1735975133758.png');
INSERT INTO `imageentry` VALUES (179, 26, 'extra', '\\uploads\\Thắt Lưng LV Aerogram 35MM\\Thắt Lưng LV Aerogram 35MM_1_1735975133760.png');
INSERT INTO `imageentry` VALUES (180, 26, 'extra', '\\uploads\\Thắt Lưng LV Aerogram 35MM\\Thắt Lưng LV Aerogram 35MM_2_1735975133763.png');
INSERT INTO `imageentry` VALUES (181, 26, 'extra', '\\uploads\\Thắt Lưng LV Aerogram 35MM\\Thắt Lưng LV Aerogram 35MM_3_1735975133765.png');
INSERT INTO `imageentry` VALUES (182, 26, 'extra', '\\uploads\\Thắt Lưng LV Aerogram 35MM\\Thắt Lưng LV Aerogram 35MM_4_1735975133769.png');
INSERT INTO `imageentry` VALUES (183, 27, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Party 40MM\\Thắt Lưng Hai Mặt LV Party 40MM_0_1735975237769.png');
INSERT INTO `imageentry` VALUES (184, 27, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Party 40MM\\Thắt Lưng Hai Mặt LV Party 40MM_1_1735975237771.png');
INSERT INTO `imageentry` VALUES (185, 27, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Party 40MM\\Thắt Lưng Hai Mặt LV Party 40MM_2_1735975237773.png');
INSERT INTO `imageentry` VALUES (186, 27, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Party 40MM\\Thắt Lưng Hai Mặt LV Party 40MM_3_1735975237774.png');
INSERT INTO `imageentry` VALUES (187, 27, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Party 40MM\\Thắt Lưng Hai Mặt LV Party 40MM_4_1735975237776.png');
INSERT INTO `imageentry` VALUES (188, 27, 'description', '\\uploads\\_belt27\\27_desc1735975281921.png');
INSERT INTO `imageentry` VALUES (189, 27, 'description', '\\uploads\\_belt27\\27_desc1735975283826.png');
INSERT INTO `imageentry` VALUES (190, 27, 'description', '\\uploads\\_belt27\\27_desc1735975285707.png');
INSERT INTO `imageentry` VALUES (191, 28, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Shake 40MM\\Thắt Lưng Hai Mặt LV Shake 40MM_0_1735975413009.png');
INSERT INTO `imageentry` VALUES (192, 28, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shake 40MM\\Thắt Lưng Hai Mặt LV Shake 40MM_1_1735975413011.png');
INSERT INTO `imageentry` VALUES (193, 28, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shake 40MM\\Thắt Lưng Hai Mặt LV Shake 40MM_2_1735975413013.png');
INSERT INTO `imageentry` VALUES (194, 28, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shake 40MM\\Thắt Lưng Hai Mặt LV Shake 40MM_3_1735975413015.png');
INSERT INTO `imageentry` VALUES (195, 28, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Shake 40MM\\Thắt Lưng Hai Mặt LV Shake 40MM_4_1735975413016.png');
INSERT INTO `imageentry` VALUES (196, 28, 'description', '\\uploads\\_belt28\\28_desc1735975421030.png');
INSERT INTO `imageentry` VALUES (197, 28, 'description', '\\uploads\\_belt28\\28_desc1735975435867.png');
INSERT INTO `imageentry` VALUES (198, 28, 'description', '\\uploads\\_belt28\\28_desc1735975437656.png');
INSERT INTO `imageentry` VALUES (199, 29, 'main', '\\uploads\\Thắt Lưng Hai Mặt Damier LV 40MM\\Thắt Lưng Hai Mặt Damier LV 40MM_0_1735975608069.png');
INSERT INTO `imageentry` VALUES (200, 29, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier LV 40MM\\Thắt Lưng Hai Mặt Damier LV 40MM_1_1735975608071.png');
INSERT INTO `imageentry` VALUES (201, 29, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier LV 40MM\\Thắt Lưng Hai Mặt Damier LV 40MM_2_1735975608073.png');
INSERT INTO `imageentry` VALUES (202, 29, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier LV 40MM\\Thắt Lưng Hai Mặt Damier LV 40MM_3_1735975608075.png');
INSERT INTO `imageentry` VALUES (203, 29, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier LV 40MM\\Thắt Lưng Hai Mặt Damier LV 40MM_4_1735975608077.png');
INSERT INTO `imageentry` VALUES (204, 29, 'description', '\\uploads\\_belt29\\29_desc1735975626356.png');
INSERT INTO `imageentry` VALUES (205, 29, 'description', '\\uploads\\_belt29\\29_desc1735975628291.png');
INSERT INTO `imageentry` VALUES (206, 29, 'description', '\\uploads\\_belt29\\29_desc1735975630094.png');
INSERT INTO `imageentry` VALUES (207, 30, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Rodeo 40MM\\Thắt Lưng Hai Mặt LV Rodeo 40MM_0_1735975759812.png');
INSERT INTO `imageentry` VALUES (208, 30, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Rodeo 40MM\\Thắt Lưng Hai Mặt LV Rodeo 40MM_1_1735975759813.png');
INSERT INTO `imageentry` VALUES (209, 30, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Rodeo 40MM\\Thắt Lưng Hai Mặt LV Rodeo 40MM_2_1735975759815.png');
INSERT INTO `imageentry` VALUES (210, 30, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Rodeo 40MM\\Thắt Lưng Hai Mặt LV Rodeo 40MM_3_1735975759817.png');
INSERT INTO `imageentry` VALUES (211, 30, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Rodeo 40MM\\Thắt Lưng Hai Mặt LV Rodeo 40MM_4_1735975759819.png');
INSERT INTO `imageentry` VALUES (212, 30, 'description', '\\uploads\\_belt30\\30_desc1735975772994.png');
INSERT INTO `imageentry` VALUES (213, 30, 'description', '\\uploads\\_belt30\\30_desc1735975774805.png');
INSERT INTO `imageentry` VALUES (214, 30, 'description', '\\uploads\\_belt30\\30_desc1735975776732.png');
INSERT INTO `imageentry` VALUES (215, 31, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Check 40MM\\Thắt Lưng Hai Mặt LV Check 40MM_0_1735975866232.png');
INSERT INTO `imageentry` VALUES (216, 31, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Check 40MM\\Thắt Lưng Hai Mặt LV Check 40MM_1_1735975866234.png');
INSERT INTO `imageentry` VALUES (217, 31, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Check 40MM\\Thắt Lưng Hai Mặt LV Check 40MM_2_1735975866237.png');
INSERT INTO `imageentry` VALUES (218, 31, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Check 40MM\\Thắt Lưng Hai Mặt LV Check 40MM_3_1735975866240.png');
INSERT INTO `imageentry` VALUES (219, 31, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Check 40MM\\Thắt Lưng Hai Mặt LV Check 40MM_4_1735975866241.png');
INSERT INTO `imageentry` VALUES (220, 31, 'description', '\\uploads\\_belt31\\31_desc1735975878152.png');
INSERT INTO `imageentry` VALUES (221, 31, 'description', '\\uploads\\_belt31\\31_desc1735975880031.png');
INSERT INTO `imageentry` VALUES (222, 31, 'description', '\\uploads\\_belt31\\31_desc1735975882028.png');
INSERT INTO `imageentry` VALUES (223, 32, 'main', '\\uploads\\Thắt Lưng Hai Mặt Uptown 35MM\\Thắt Lưng Hai Mặt Uptown 35MM_0_1735975984678.png');
INSERT INTO `imageentry` VALUES (224, 32, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Uptown 35MM\\Thắt Lưng Hai Mặt Uptown 35MM_1_1735975984680.png');
INSERT INTO `imageentry` VALUES (225, 32, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Uptown 35MM\\Thắt Lưng Hai Mặt Uptown 35MM_2_1735975984680.png');
INSERT INTO `imageentry` VALUES (226, 32, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Uptown 35MM\\Thắt Lưng Hai Mặt Uptown 35MM_3_1735975984682.png');
INSERT INTO `imageentry` VALUES (227, 32, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Uptown 35MM\\Thắt Lưng Hai Mặt Uptown 35MM_4_1735975984684.png');
INSERT INTO `imageentry` VALUES (228, 32, 'description', '\\uploads\\_belt32\\32_desc1735976002450.png');
INSERT INTO `imageentry` VALUES (229, 32, 'description', '\\uploads\\_belt32\\32_desc1735976004665.png');
INSERT INTO `imageentry` VALUES (230, 32, 'description', '\\uploads\\_belt32\\32_desc1735976007755.png');
INSERT INTO `imageentry` VALUES (231, 33, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM_0_1735976164888.png');
INSERT INTO `imageentry` VALUES (232, 33, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM_1_1735976164890.png');
INSERT INTO `imageentry` VALUES (233, 33, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM_2_1735976164891.png');
INSERT INTO `imageentry` VALUES (234, 33, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM_3_1735976164893.png');
INSERT INTO `imageentry` VALUES (235, 33, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM\\Thắt Lưng Hai Mặt LV Mega Pixel 40MM_4_1735976164896.png');
INSERT INTO `imageentry` VALUES (236, 33, 'description', '\\uploads\\_belt33\\33_desc1735976173308.png');
INSERT INTO `imageentry` VALUES (237, 33, 'description', '\\uploads\\_belt33\\33_desc1735976175490.png');
INSERT INTO `imageentry` VALUES (238, 33, 'description', '\\uploads\\_belt33\\33_desc1735976177978.png');
INSERT INTO `imageentry` VALUES (239, 34, 'description', '\\uploads\\_belt34\\34_desc1735980617046.png');
INSERT INTO `imageentry` VALUES (240, 34, 'description', '\\uploads\\_belt34\\34_desc1735980618832.png');
INSERT INTO `imageentry` VALUES (241, 34, 'description', '\\uploads\\_belt34\\34_desc1735980625233.png');
INSERT INTO `imageentry` VALUES (242, 35, 'main', '\\uploads\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM_0_1735980749093.png');
INSERT INTO `imageentry` VALUES (243, 35, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM_1_1735980749095.png');
INSERT INTO `imageentry` VALUES (244, 35, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM_2_1735980749097.png');
INSERT INTO `imageentry` VALUES (245, 35, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM_3_1735980749099.png');
INSERT INTO `imageentry` VALUES (246, 35, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM\\Thắt Lưng Hai Mặt Mini Flowergram 15MM LV x TM_4_1735980749101.png');
INSERT INTO `imageentry` VALUES (247, 35, 'description', '\\uploads\\_belt35\\35_desc1735980761076.png');
INSERT INTO `imageentry` VALUES (248, 35, 'description', '\\uploads\\_belt35\\35_desc1735980762808.png');
INSERT INTO `imageentry` VALUES (249, 35, 'description', '\\uploads\\_belt35\\35_desc1735980764553.png');
INSERT INTO `imageentry` VALUES (250, 36, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Mini 15MM\\Thắt Lưng Hai Mặt LV Mini 15MM_0_1735980870543.png');
INSERT INTO `imageentry` VALUES (251, 36, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini 15MM\\Thắt Lưng Hai Mặt LV Mini 15MM_1_1735980870545.png');
INSERT INTO `imageentry` VALUES (252, 36, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini 15MM\\Thắt Lưng Hai Mặt LV Mini 15MM_2_1735980870550.png');
INSERT INTO `imageentry` VALUES (253, 36, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini 15MM\\Thắt Lưng Hai Mặt LV Mini 15MM_3_1735980870552.png');
INSERT INTO `imageentry` VALUES (254, 36, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini 15MM\\Thắt Lưng Hai Mặt LV Mini 15MM_4_1735980870555.png');
INSERT INTO `imageentry` VALUES (255, 36, 'description', '\\uploads\\_belt36\\36_desc1735980878036.png');
INSERT INTO `imageentry` VALUES (256, 36, 'description', '\\uploads\\_belt36\\36_desc1735980879929.png');
INSERT INTO `imageentry` VALUES (257, 36, 'description', '\\uploads\\_belt36\\36_desc1735980881837.png');
INSERT INTO `imageentry` VALUES (258, 37, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM_0_1735981016431.png');
INSERT INTO `imageentry` VALUES (259, 37, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM_1_1735981016432.png');
INSERT INTO `imageentry` VALUES (260, 37, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM_2_1735981016435.png');
INSERT INTO `imageentry` VALUES (261, 37, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM\\Thắt Lưng Hai Mặt LV Circle Nautical 20MM_3_1735981016436.png');
INSERT INTO `imageentry` VALUES (262, 37, 'description', '\\uploads\\_belt37\\37_desc1735981028251.png');
INSERT INTO `imageentry` VALUES (263, 37, 'description', '\\uploads\\_belt37\\37_desc1735981029982.png');
INSERT INTO `imageentry` VALUES (264, 37, 'description', '\\uploads\\_belt37\\37_desc1735981032032.png');
INSERT INTO `imageentry` VALUES (265, 38, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Iconic 20MM\\Thắt Lưng Hai Mặt LV Iconic 20MM_0_1735981126867.png');
INSERT INTO `imageentry` VALUES (266, 38, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Iconic 20MM\\Thắt Lưng Hai Mặt LV Iconic 20MM_1_1735981126869.png');
INSERT INTO `imageentry` VALUES (267, 38, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Iconic 20MM\\Thắt Lưng Hai Mặt LV Iconic 20MM_2_1735981126871.png');
INSERT INTO `imageentry` VALUES (268, 38, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Iconic 20MM\\Thắt Lưng Hai Mặt LV Iconic 20MM_3_1735981126873.png');
INSERT INTO `imageentry` VALUES (269, 38, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Iconic 20MM\\Thắt Lưng Hai Mặt LV Iconic 20MM_4_1735981126874.png');
INSERT INTO `imageentry` VALUES (270, 38, 'description', '\\uploads\\_belt38\\38_desc1735981147357.png');
INSERT INTO `imageentry` VALUES (271, 38, 'description', '\\uploads\\_belt38\\38_desc1735981150218.png');
INSERT INTO `imageentry` VALUES (272, 38, 'description', '\\uploads\\_belt38\\38_desc1735981152360.png');
INSERT INTO `imageentry` VALUES (273, 39, 'main', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM_0_1735981280352.png');
INSERT INTO `imageentry` VALUES (274, 39, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM_1_1735981280353.png');
INSERT INTO `imageentry` VALUES (275, 39, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM_2_1735981280355.png');
INSERT INTO `imageentry` VALUES (276, 39, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM_3_1735981280356.png');
INSERT INTO `imageentry` VALUES (277, 39, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM\\Thắt Lưng Hai Mặt Pretty LV Enamel 20MM_4_1735981280358.png');
INSERT INTO `imageentry` VALUES (278, 39, 'description', '\\uploads\\_belt39\\39_desc1735981296592.png');
INSERT INTO `imageentry` VALUES (279, 39, 'description', '\\uploads\\_belt39\\39_desc1735981298929.png');
INSERT INTO `imageentry` VALUES (280, 39, 'description', '\\uploads\\_belt39\\39_desc1735981301217.png');
INSERT INTO `imageentry` VALUES (281, 40, 'main', '\\uploads\\Thắt Lưng LV GO-14 20MM\\Thắt Lưng LV GO-14 20MM_0_1735981412921.png');
INSERT INTO `imageentry` VALUES (282, 40, 'extra', '\\uploads\\Thắt Lưng LV GO-14 20MM\\Thắt Lưng LV GO-14 20MM_1_1735981412922.png');
INSERT INTO `imageentry` VALUES (283, 40, 'extra', '\\uploads\\Thắt Lưng LV GO-14 20MM\\Thắt Lưng LV GO-14 20MM_2_1735981412925.png');
INSERT INTO `imageentry` VALUES (284, 40, 'extra', '\\uploads\\Thắt Lưng LV GO-14 20MM\\Thắt Lưng LV GO-14 20MM_3_1735981412928.png');
INSERT INTO `imageentry` VALUES (285, 40, 'extra', '\\uploads\\Thắt Lưng LV GO-14 20MM\\Thắt Lưng LV GO-14 20MM_4_1735981412931.png');
INSERT INTO `imageentry` VALUES (286, 40, 'description', '\\uploads\\_belt40\\40_desc1735981428575.png');
INSERT INTO `imageentry` VALUES (287, 40, 'description', '\\uploads\\_belt40\\40_desc1735981431731.png');
INSERT INTO `imageentry` VALUES (288, 40, 'description', '\\uploads\\_belt40\\40_desc1735981438254.png');
INSERT INTO `imageentry` VALUES (289, 41, 'main', '\\uploads\\Thắt Lưng LV Coin De Malle 20MM\\Thắt Lưng LV Coin De Malle 20MM_0_1735981524798.png');
INSERT INTO `imageentry` VALUES (290, 41, 'extra', '\\uploads\\Thắt Lưng LV Coin De Malle 20MM\\Thắt Lưng LV Coin De Malle 20MM_1_1735981524799.png');
INSERT INTO `imageentry` VALUES (291, 41, 'description', '\\uploads\\_belt41\\41_desc1735981538504.png');
INSERT INTO `imageentry` VALUES (292, 41, 'description', '\\uploads\\_belt41\\41_desc1735981540638.png');
INSERT INTO `imageentry` VALUES (293, 42, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Sparkle 30MM\\Thắt Lưng Hai Mặt LV Sparkle 30MM_0_1735981637941.png');
INSERT INTO `imageentry` VALUES (294, 42, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Sparkle 30MM\\Thắt Lưng Hai Mặt LV Sparkle 30MM_1_1735981637942.png');
INSERT INTO `imageentry` VALUES (295, 42, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Sparkle 30MM\\Thắt Lưng Hai Mặt LV Sparkle 30MM_2_1735981637944.png');
INSERT INTO `imageentry` VALUES (296, 42, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Sparkle 30MM\\Thắt Lưng Hai Mặt LV Sparkle 30MM_3_1735981637946.png');
INSERT INTO `imageentry` VALUES (297, 42, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Sparkle 30MM\\Thắt Lưng Hai Mặt LV Sparkle 30MM_4_1735981637947.png');
INSERT INTO `imageentry` VALUES (298, 42, 'description', '\\uploads\\_belt42\\42_desc1735981656829.png');
INSERT INTO `imageentry` VALUES (299, 42, 'description', '\\uploads\\_belt42\\42_desc1735981658892.png');
INSERT INTO `imageentry` VALUES (300, 42, 'description', '\\uploads\\_belt42\\42_desc1735981662513.png');
INSERT INTO `imageentry` VALUES (301, 43, 'main', '\\uploads\\Thắt Lưng LV Studs 29\\Thắt Lưng LV Studs 29_0_1735981784593.png');
INSERT INTO `imageentry` VALUES (302, 43, 'extra', '\\uploads\\Thắt Lưng LV Studs 29\\Thắt Lưng LV Studs 29_1_1735981784595.png');
INSERT INTO `imageentry` VALUES (303, 43, 'extra', '\\uploads\\Thắt Lưng LV Studs 29\\Thắt Lưng LV Studs 29_2_1735981784597.png');
INSERT INTO `imageentry` VALUES (304, 43, 'extra', '\\uploads\\Thắt Lưng LV Studs 29\\Thắt Lưng LV Studs 29_3_1735981784600.png');
INSERT INTO `imageentry` VALUES (305, 43, 'extra', '\\uploads\\Thắt Lưng LV Studs 29\\Thắt Lưng LV Studs 29_4_1735981784603.png');
INSERT INTO `imageentry` VALUES (306, 43, 'description', '\\uploads\\_belt43\\43_desc1735981801045.png');
INSERT INTO `imageentry` VALUES (307, 43, 'description', '\\uploads\\_belt43\\43_desc1735981803376.png');
INSERT INTO `imageentry` VALUES (308, 43, 'description', '\\uploads\\_belt43\\43_desc1735981805687.png');
INSERT INTO `imageentry` VALUES (309, 34, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_0_1735982158069.png');
INSERT INTO `imageentry` VALUES (310, 34, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_1_1735982158076.png');
INSERT INTO `imageentry` VALUES (311, 34, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_2_1735982158080.png');
INSERT INTO `imageentry` VALUES (312, 34, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_3_1735982158085.png');
INSERT INTO `imageentry` VALUES (313, 34, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_4_1735982158088.png');
INSERT INTO `imageentry` VALUES (314, 44, 'main', '\\uploads\\Thắt Lưng Hai Mặt Oversized Hook 40MM\\Thắt Lưng Hai Mặt Oversized Hook 40MM_0_1735982504495.png');
INSERT INTO `imageentry` VALUES (315, 44, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Oversized Hook 40MM\\Thắt Lưng Hai Mặt Oversized Hook 40MM_1_1735982504497.png');
INSERT INTO `imageentry` VALUES (316, 44, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Oversized Hook 40MM\\Thắt Lưng Hai Mặt Oversized Hook 40MM_2_1735982504502.png');
INSERT INTO `imageentry` VALUES (317, 44, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Oversized Hook 40MM\\Thắt Lưng Hai Mặt Oversized Hook 40MM_3_1735982504504.png');
INSERT INTO `imageentry` VALUES (318, 44, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Oversized Hook 40MM\\Thắt Lưng Hai Mặt Oversized Hook 40MM_4_1735982504507.png');
INSERT INTO `imageentry` VALUES (319, 44, 'description', '\\uploads\\_belt44\\44_desc1735982519871.png');
INSERT INTO `imageentry` VALUES (320, 44, 'description', '\\uploads\\_belt44\\44_desc1735982523065.png');
INSERT INTO `imageentry` VALUES (321, 44, 'description', '\\uploads\\_belt44\\44_desc1735982525891.png');
INSERT INTO `imageentry` VALUES (322, 45, 'main', '\\uploads\\Thắt Lưng LV Wrapped 60MM\\Thắt Lưng LV Wrapped 60MM_0_1735982645098.png');
INSERT INTO `imageentry` VALUES (323, 45, 'extra', '\\uploads\\Thắt Lưng LV Wrapped 60MM\\Thắt Lưng LV Wrapped 60MM_1_1735982645100.png');
INSERT INTO `imageentry` VALUES (324, 45, 'extra', '\\uploads\\Thắt Lưng LV Wrapped 60MM\\Thắt Lưng LV Wrapped 60MM_2_1735982645103.png');
INSERT INTO `imageentry` VALUES (325, 45, 'extra', '\\uploads\\Thắt Lưng LV Wrapped 60MM\\Thắt Lưng LV Wrapped 60MM_3_1735982645105.png');
INSERT INTO `imageentry` VALUES (326, 45, 'extra', '\\uploads\\Thắt Lưng LV Wrapped 60MM\\Thắt Lưng LV Wrapped 60MM_4_1735982645108.png');
INSERT INTO `imageentry` VALUES (327, 45, 'description', '\\uploads\\_belt45\\45_desc1735982663183.png');
INSERT INTO `imageentry` VALUES (328, 45, 'description', '\\uploads\\_belt45\\45_desc1735982665925.png');
INSERT INTO `imageentry` VALUES (329, 45, 'description', '\\uploads\\_belt45\\45_desc1735982668821.png');
INSERT INTO `imageentry` VALUES (330, 46, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Seaside 30MM\\Thắt Lưng Hai Mặt LV Seaside 30MM_0_1735982768219.png');
INSERT INTO `imageentry` VALUES (331, 46, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Seaside 30MM\\Thắt Lưng Hai Mặt LV Seaside 30MM_1_1735982768220.png');
INSERT INTO `imageentry` VALUES (332, 46, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Seaside 30MM\\Thắt Lưng Hai Mặt LV Seaside 30MM_2_1735982768225.png');
INSERT INTO `imageentry` VALUES (333, 46, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Seaside 30MM\\Thắt Lưng Hai Mặt LV Seaside 30MM_3_1735982768226.png');
INSERT INTO `imageentry` VALUES (334, 46, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Seaside 30MM\\Thắt Lưng Hai Mặt LV Seaside 30MM_4_1735982768228.png');
INSERT INTO `imageentry` VALUES (335, 46, 'description', '\\uploads\\_belt46\\46_desc1735982780961.png');
INSERT INTO `imageentry` VALUES (336, 46, 'description', '\\uploads\\_belt46\\46_desc1735982783499.png');
INSERT INTO `imageentry` VALUES (337, 46, 'description', '\\uploads\\_belt46\\46_desc1735982786199.png');
INSERT INTO `imageentry` VALUES (338, 47, 'main', '\\uploads\\Thắt Lưng LV Twist 30MM\\Thắt Lưng LV Twist 30MM_0_1735982881978.png');
INSERT INTO `imageentry` VALUES (339, 47, 'extra', '\\uploads\\Thắt Lưng LV Twist 30MM\\Thắt Lưng LV Twist 30MM_1_1735982881980.png');
INSERT INTO `imageentry` VALUES (340, 47, 'extra', '\\uploads\\Thắt Lưng LV Twist 30MM\\Thắt Lưng LV Twist 30MM_2_1735982881982.png');
INSERT INTO `imageentry` VALUES (341, 47, 'extra', '\\uploads\\Thắt Lưng LV Twist 30MM\\Thắt Lưng LV Twist 30MM_3_1735982881984.png');
INSERT INTO `imageentry` VALUES (342, 47, 'extra', '\\uploads\\Thắt Lưng LV Twist 30MM\\Thắt Lưng LV Twist 30MM_4_1735982881985.png');
INSERT INTO `imageentry` VALUES (343, 47, 'description', '\\uploads\\_belt47\\47_desc1735982898744.png');
INSERT INTO `imageentry` VALUES (344, 47, 'description', '\\uploads\\_belt47\\47_desc1735982902220.png');
INSERT INTO `imageentry` VALUES (345, 47, 'description', '\\uploads\\_belt47\\47_desc1735982904814.png');
INSERT INTO `imageentry` VALUES (346, 48, 'main', '\\uploads\\Thắt Lưng LV Maxi Buckle 60MM\\Thắt Lưng LV Maxi Buckle 60MM_0_1735983017975.png');
INSERT INTO `imageentry` VALUES (347, 48, 'extra', '\\uploads\\Thắt Lưng LV Maxi Buckle 60MM\\Thắt Lưng LV Maxi Buckle 60MM_1_1735983017976.png');
INSERT INTO `imageentry` VALUES (348, 48, 'extra', '\\uploads\\Thắt Lưng LV Maxi Buckle 60MM\\Thắt Lưng LV Maxi Buckle 60MM_2_1735983017979.png');
INSERT INTO `imageentry` VALUES (349, 48, 'extra', '\\uploads\\Thắt Lưng LV Maxi Buckle 60MM\\Thắt Lưng LV Maxi Buckle 60MM_3_1735983017983.png');
INSERT INTO `imageentry` VALUES (350, 48, 'extra', '\\uploads\\Thắt Lưng LV Maxi Buckle 60MM\\Thắt Lưng LV Maxi Buckle 60MM_4_1735983017986.png');
INSERT INTO `imageentry` VALUES (351, 48, 'description', '\\uploads\\_belt48\\48_desc1735983032732.png');
INSERT INTO `imageentry` VALUES (352, 48, 'description', '\\uploads\\_belt48\\48_desc1735983036789.png');
INSERT INTO `imageentry` VALUES (353, 48, 'description', '\\uploads\\_belt48\\48_desc1735983040719.png');
INSERT INTO `imageentry` VALUES (354, 49, 'main', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV 30MM\\Thắt Lưng Hai Mặt Pretty LV 30MM_0_1735983153243.png');
INSERT INTO `imageentry` VALUES (355, 49, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV 30MM\\Thắt Lưng Hai Mặt Pretty LV 30MM_1_1735983153245.png');
INSERT INTO `imageentry` VALUES (356, 49, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV 30MM\\Thắt Lưng Hai Mặt Pretty LV 30MM_2_1735983153248.png');
INSERT INTO `imageentry` VALUES (357, 49, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV 30MM\\Thắt Lưng Hai Mặt Pretty LV 30MM_3_1735983153252.png');
INSERT INTO `imageentry` VALUES (358, 49, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Pretty LV 30MM\\Thắt Lưng Hai Mặt Pretty LV 30MM_4_1735983153256.png');
INSERT INTO `imageentry` VALUES (359, 49, 'description', '\\uploads\\_belt49\\49_desc1735983167899.png');
INSERT INTO `imageentry` VALUES (360, 49, 'description', '\\uploads\\_belt49\\49_desc1735983170807.png');
INSERT INTO `imageentry` VALUES (361, 49, 'description', '\\uploads\\_belt49\\49_desc1735983173803.png');
INSERT INTO `imageentry` VALUES (362, 50, 'main', '\\uploads\\Thắt Lưng Hai Mặt Initiales LV 120MM\\Thắt Lưng Hai Mặt Initiales LV 120MM_0_1735983731518.png');
INSERT INTO `imageentry` VALUES (363, 50, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Initiales LV 120MM\\Thắt Lưng Hai Mặt Initiales LV 120MM_1_1735983731525.png');
INSERT INTO `imageentry` VALUES (364, 50, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Initiales LV 120MM\\Thắt Lưng Hai Mặt Initiales LV 120MM_2_1735983731528.png');
INSERT INTO `imageentry` VALUES (365, 50, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Initiales LV 120MM\\Thắt Lưng Hai Mặt Initiales LV 120MM_3_1735983731532.png');
INSERT INTO `imageentry` VALUES (366, 50, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Initiales LV 120MM\\Thắt Lưng Hai Mặt Initiales LV 120MM_4_1735983731535.png');
INSERT INTO `imageentry` VALUES (367, 50, 'description', '\\uploads\\_belt50\\50_desc1735983747796.png');
INSERT INTO `imageentry` VALUES (368, 50, 'description', '\\uploads\\_belt50\\50_desc1735983750524.png');
INSERT INTO `imageentry` VALUES (369, 50, 'description', '\\uploads\\_belt50\\50_desc1735983753013.png');
INSERT INTO `imageentry` VALUES (370, 51, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 220MM\\Thắt Lưng Hai Mặt LV Initiales 220MM_0_1735983900164.png');
INSERT INTO `imageentry` VALUES (371, 51, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 220MM\\Thắt Lưng Hai Mặt LV Initiales 220MM_1_1735983900166.png');
INSERT INTO `imageentry` VALUES (372, 51, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 220MM\\Thắt Lưng Hai Mặt LV Initiales 220MM_2_1735983900168.png');
INSERT INTO `imageentry` VALUES (373, 51, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 220MM\\Thắt Lưng Hai Mặt LV Initiales 220MM_3_1735983900169.png');
INSERT INTO `imageentry` VALUES (374, 51, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 220MM\\Thắt Lưng Hai Mặt LV Initiales 220MM_4_1735983900171.png');
INSERT INTO `imageentry` VALUES (375, 51, 'description', '\\uploads\\_belt51\\51_desc1735983915241.png');
INSERT INTO `imageentry` VALUES (376, 51, 'description', '\\uploads\\_belt51\\51_desc1735983919142.png');
INSERT INTO `imageentry` VALUES (377, 51, 'description', '\\uploads\\_belt51\\51_desc1735983921967.png');
INSERT INTO `imageentry` VALUES (378, 52, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM_0_1735984093828.png');
INSERT INTO `imageentry` VALUES (379, 52, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM_1_1735984093830.png');
INSERT INTO `imageentry` VALUES (380, 52, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM_2_1735984093834.png');
INSERT INTO `imageentry` VALUES (381, 52, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM_3_1735984093837.png');
INSERT INTO `imageentry` VALUES (382, 52, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM\\Thắt Lưng Hai Mặt LV Pretty Pink 30MM_4_1735984093839.png');
INSERT INTO `imageentry` VALUES (383, 52, 'description', '\\uploads\\_belt52\\52_desc1735984106453.png');
INSERT INTO `imageentry` VALUES (384, 52, 'description', '\\uploads\\_belt52\\52_desc1735984109813.png');
INSERT INTO `imageentry` VALUES (385, 52, 'description', '\\uploads\\_belt52\\52_desc1735984112665.png');
INSERT INTO `imageentry` VALUES (386, 53, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Victory 30MM\\Thắt Lưng Hai Mặt LV Victory 30MM_0_1735984262744.png');
INSERT INTO `imageentry` VALUES (387, 53, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Victory 30MM\\Thắt Lưng Hai Mặt LV Victory 30MM_1_1735984262745.png');
INSERT INTO `imageentry` VALUES (388, 53, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Victory 30MM\\Thắt Lưng Hai Mặt LV Victory 30MM_2_1735984262748.png');
INSERT INTO `imageentry` VALUES (389, 53, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Victory 30MM\\Thắt Lưng Hai Mặt LV Victory 30MM_3_1735984262752.png');
INSERT INTO `imageentry` VALUES (390, 53, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Victory 30MM\\Thắt Lưng Hai Mặt LV Victory 30MM_4_1735984262754.png');
INSERT INTO `imageentry` VALUES (391, 53, 'description', '\\uploads\\_belt53\\53_desc1735984277068.png');
INSERT INTO `imageentry` VALUES (392, 53, 'description', '\\uploads\\_belt53\\53_desc1735984280408.png');
INSERT INTO `imageentry` VALUES (393, 53, 'description', '\\uploads\\_belt53\\53_desc1735984283405.png');
INSERT INTO `imageentry` VALUES (394, 54, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM_0_1735993508554.png');
INSERT INTO `imageentry` VALUES (395, 54, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM_1_1735993508559.png');
INSERT INTO `imageentry` VALUES (396, 54, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM_2_1735993508562.png');
INSERT INTO `imageentry` VALUES (397, 54, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM_3_1735993508567.png');
INSERT INTO `imageentry` VALUES (398, 54, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 12MM LV x TM_4_1735993508569.png');
INSERT INTO `imageentry` VALUES (399, 54, 'description', '\\uploads\\_belt54\\54_desc1735993524433.png');
INSERT INTO `imageentry` VALUES (400, 54, 'description', '\\uploads\\_belt54\\54_desc1735993526705.png');
INSERT INTO `imageentry` VALUES (401, 54, 'description', '\\uploads\\_belt54\\54_desc1735993528747.png');
INSERT INTO `imageentry` VALUES (402, 55, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM_0_1735993619149.png');
INSERT INTO `imageentry` VALUES (403, 55, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM_1_1735993619150.png');
INSERT INTO `imageentry` VALUES (404, 55, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM_2_1735993619153.png');
INSERT INTO `imageentry` VALUES (405, 55, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM_3_1735993619156.png');
INSERT INTO `imageentry` VALUES (406, 55, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM\\Thắt Lưng Hai Mặt LV Mini Flowergram 10MM_4_1735993619158.png');
INSERT INTO `imageentry` VALUES (407, 55, 'description', '\\uploads\\_belt55\\55_desc1735993634575.png');
INSERT INTO `imageentry` VALUES (408, 55, 'description', '\\uploads\\_belt55\\55_desc1735993636655.png');
INSERT INTO `imageentry` VALUES (409, 55, 'description', '\\uploads\\_belt55\\55_desc1735993638659.png');
INSERT INTO `imageentry` VALUES (410, 56, 'main', '\\uploads\\Thắt Lưng LV Bloom 10MM\\Thắt Lưng LV Bloom 10MM_0_1735993770844.png');
INSERT INTO `imageentry` VALUES (411, 56, 'extra', '\\uploads\\Thắt Lưng LV Bloom 10MM\\Thắt Lưng LV Bloom 10MM_1_1735993770846.png');
INSERT INTO `imageentry` VALUES (412, 56, 'extra', '\\uploads\\Thắt Lưng LV Bloom 10MM\\Thắt Lưng LV Bloom 10MM_2_1735993770850.png');
INSERT INTO `imageentry` VALUES (413, 56, 'extra', '\\uploads\\Thắt Lưng LV Bloom 10MM\\Thắt Lưng LV Bloom 10MM_3_1735993770851.png');
INSERT INTO `imageentry` VALUES (414, 56, 'extra', '\\uploads\\Thắt Lưng LV Bloom 10MM\\Thắt Lưng LV Bloom 10MM_4_1735993770853.png');
INSERT INTO `imageentry` VALUES (415, 56, 'description', '\\uploads\\_belt56\\56_desc1735993794598.png');
INSERT INTO `imageentry` VALUES (416, 56, 'description', '\\uploads\\_belt56\\56_desc1735993797301.png');
INSERT INTO `imageentry` VALUES (417, 57, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_0_1735993930015.png');
INSERT INTO `imageentry` VALUES (418, 57, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_1_1735993930017.png');
INSERT INTO `imageentry` VALUES (419, 57, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_2_1735993930021.png');
INSERT INTO `imageentry` VALUES (420, 57, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_3_1735993930025.png');
INSERT INTO `imageentry` VALUES (421, 57, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM\\Thắt Lưng Hai Mặt LV D-Ring 30MM LV x TM_4_1735993930027.png');
INSERT INTO `imageentry` VALUES (422, 57, 'description', '\\uploads\\_belt57\\57_desc1735993942580.png');
INSERT INTO `imageentry` VALUES (423, 57, 'description', '\\uploads\\_belt57\\57_desc1735993944582.png');
INSERT INTO `imageentry` VALUES (424, 58, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Flowergram 30MM\\Thắt Lưng Hai Mặt LV Flowergram 30MM_0_1735994044167.png');
INSERT INTO `imageentry` VALUES (425, 58, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Flowergram 30MM\\Thắt Lưng Hai Mặt LV Flowergram 30MM_1_1735994044170.png');
INSERT INTO `imageentry` VALUES (426, 58, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Flowergram 30MM\\Thắt Lưng Hai Mặt LV Flowergram 30MM_2_1735994044174.png');
INSERT INTO `imageentry` VALUES (427, 58, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Flowergram 30MM\\Thắt Lưng Hai Mặt LV Flowergram 30MM_3_1735994044175.png');
INSERT INTO `imageentry` VALUES (428, 58, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Flowergram 30MM\\Thắt Lưng Hai Mặt LV Flowergram 30MM_4_1735994044177.png');
INSERT INTO `imageentry` VALUES (429, 58, 'description', '\\uploads\\_belt58\\58_desc1735994058254.png');
INSERT INTO `imageentry` VALUES (430, 58, 'description', '\\uploads\\_belt58\\58_desc1735994060105.png');
INSERT INTO `imageentry` VALUES (431, 58, 'description', '\\uploads\\_belt58\\58_desc1735994062175.png');
INSERT INTO `imageentry` VALUES (437, 59, 'description', '\\uploads\\_belt59\\59_desc1735994279474.png');
INSERT INTO `imageentry` VALUES (438, 59, 'description', '\\uploads\\_belt59\\59_desc1735994281828.png');
INSERT INTO `imageentry` VALUES (439, 59, 'main', '\\uploads\\Thắt Lưng LV Chain Pearl\\Thắt Lưng LV Chain Pearl_0_1736135847875.png');
INSERT INTO `imageentry` VALUES (440, 59, 'extra', '\\uploads\\Thắt Lưng LV Chain Pearl\\Thắt Lưng LV Chain Pearl_1_1736135847880.png');
INSERT INTO `imageentry` VALUES (441, 59, 'extra', '\\uploads\\Thắt Lưng LV Chain Pearl\\Thắt Lưng LV Chain Pearl_2_1736135847882.png');
INSERT INTO `imageentry` VALUES (442, 59, 'extra', '\\uploads\\Thắt Lưng LV Chain Pearl\\Thắt Lưng LV Chain Pearl_3_1736135847884.png');
INSERT INTO `imageentry` VALUES (443, 59, 'extra', '\\uploads\\Thắt Lưng LV Chain Pearl\\Thắt Lưng LV Chain Pearl_4_1736135847886.png');
INSERT INTO `imageentry` VALUES (444, 60, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_0_1736311452946.png');
INSERT INTO `imageentry` VALUES (445, 60, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_1_1736311452949.png');
INSERT INTO `imageentry` VALUES (446, 60, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_2_1736311452953.png');
INSERT INTO `imageentry` VALUES (447, 60, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_3_1736311452955.png');
INSERT INTO `imageentry` VALUES (448, 60, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Fiction 30MM\\Thắt Lưng Hai Mặt LV Fiction 30MM_4_1736311452963.png');
INSERT INTO `imageentry` VALUES (449, 60, 'description', '\\uploads\\_belt60\\60_desc1736311466698.png');
INSERT INTO `imageentry` VALUES (450, 60, 'description', '\\uploads\\_belt60\\60_desc1736311469049.png');
INSERT INTO `imageentry` VALUES (451, 60, 'description', '\\uploads\\_belt60\\60_desc1736311471823.png');
INSERT INTO `imageentry` VALUES (452, 61, 'main', '\\uploads\\Thắt Lưng LV Pyramide 40MM\\Thắt Lưng LV Pyramide 40MM_0_1736311617178.png');
INSERT INTO `imageentry` VALUES (453, 61, 'extra', '\\uploads\\Thắt Lưng LV Pyramide 40MM\\Thắt Lưng LV Pyramide 40MM_1_1736311617178.png');
INSERT INTO `imageentry` VALUES (454, 61, 'extra', '\\uploads\\Thắt Lưng LV Pyramide 40MM\\Thắt Lưng LV Pyramide 40MM_2_1736311617188.png');
INSERT INTO `imageentry` VALUES (455, 61, 'extra', '\\uploads\\Thắt Lưng LV Pyramide 40MM\\Thắt Lưng LV Pyramide 40MM_3_1736311617188.png');
INSERT INTO `imageentry` VALUES (456, 61, 'extra', '\\uploads\\Thắt Lưng LV Pyramide 40MM\\Thắt Lưng LV Pyramide 40MM_4_1736311617192.png');
INSERT INTO `imageentry` VALUES (457, 61, 'description', '\\uploads\\_belt61\\61_desc1736311633229.png');
INSERT INTO `imageentry` VALUES (458, 61, 'description', '\\uploads\\_belt61\\61_desc1736311636098.png');
INSERT INTO `imageentry` VALUES (459, 61, 'description', '\\uploads\\_belt61\\61_desc1736311638910.png');
INSERT INTO `imageentry` VALUES (460, 62, 'main', '\\uploads\\Thắt Lưng Hai Mặt Damier Print 40MM\\Thắt Lưng Hai Mặt Damier Print 40MM_0_1736311805852.png');
INSERT INTO `imageentry` VALUES (461, 62, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier Print 40MM\\Thắt Lưng Hai Mặt Damier Print 40MM_1_1736311805853.png');
INSERT INTO `imageentry` VALUES (462, 62, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier Print 40MM\\Thắt Lưng Hai Mặt Damier Print 40MM_2_1736311805857.png');
INSERT INTO `imageentry` VALUES (463, 62, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier Print 40MM\\Thắt Lưng Hai Mặt Damier Print 40MM_3_1736311805857.png');
INSERT INTO `imageentry` VALUES (464, 62, 'extra', '\\uploads\\Thắt Lưng Hai Mặt Damier Print 40MM\\Thắt Lưng Hai Mặt Damier Print 40MM_4_1736311805862.png');
INSERT INTO `imageentry` VALUES (465, 62, 'description', '\\uploads\\_belt62\\62_desc1736311820971.png');
INSERT INTO `imageentry` VALUES (466, 62, 'description', '\\uploads\\_belt62\\62_desc1736311823804.png');
INSERT INTO `imageentry` VALUES (467, 62, 'description', '\\uploads\\_belt62\\62_desc1736311826857.png');
INSERT INTO `imageentry` VALUES (468, 63, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 99MM\\Thắt Lưng Hai Mặt LV Initiales 99MM_0_1736312004395.png');
INSERT INTO `imageentry` VALUES (469, 63, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 99MM\\Thắt Lưng Hai Mặt LV Initiales 99MM_1_1736312004398.png');
INSERT INTO `imageentry` VALUES (470, 63, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 99MM\\Thắt Lưng Hai Mặt LV Initiales 99MM_2_1736312004404.png');
INSERT INTO `imageentry` VALUES (471, 63, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 99MM\\Thắt Lưng Hai Mặt LV Initiales 99MM_3_1736312004407.png');
INSERT INTO `imageentry` VALUES (472, 63, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 99MM\\Thắt Lưng Hai Mặt LV Initiales 99MM_4_1736312004410.png');
INSERT INTO `imageentry` VALUES (473, 63, 'description', '\\uploads\\_belt63\\63_desc1736312017933.png');
INSERT INTO `imageentry` VALUES (474, 63, 'description', '\\uploads\\_belt63\\63_desc1736312021027.png');
INSERT INTO `imageentry` VALUES (475, 63, 'description', '\\uploads\\_belt63\\63_desc1736312024356.png');
INSERT INTO `imageentry` VALUES (476, 64, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Tubular 40MM\\Thắt Lưng Hai Mặt LV Tubular 40MM_0_1736312177105.png');
INSERT INTO `imageentry` VALUES (477, 64, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tubular 40MM\\Thắt Lưng Hai Mặt LV Tubular 40MM_1_1736312177106.png');
INSERT INTO `imageentry` VALUES (478, 64, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tubular 40MM\\Thắt Lưng Hai Mặt LV Tubular 40MM_2_1736312177109.png');
INSERT INTO `imageentry` VALUES (479, 64, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tubular 40MM\\Thắt Lưng Hai Mặt LV Tubular 40MM_3_1736312177111.png');
INSERT INTO `imageentry` VALUES (480, 64, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tubular 40MM\\Thắt Lưng Hai Mặt LV Tubular 40MM_4_1736312177114.png');
INSERT INTO `imageentry` VALUES (481, 64, 'description', '\\uploads\\_belt64\\64_desc1736312189943.png');
INSERT INTO `imageentry` VALUES (482, 64, 'description', '\\uploads\\_belt64\\64_desc1736312192739.png');
INSERT INTO `imageentry` VALUES (483, 64, 'description', '\\uploads\\_belt64\\64_desc1736312195997.png');
INSERT INTO `imageentry` VALUES (484, 65, 'main', '\\uploads\\Thắt Lưng Signature Chain 35MM\\Thắt Lưng Signature Chain 35MM_0_1736312293787.png');
INSERT INTO `imageentry` VALUES (485, 65, 'extra', '\\uploads\\Thắt Lưng Signature Chain 35MM\\Thắt Lưng Signature Chain 35MM_1_1736312293787.png');
INSERT INTO `imageentry` VALUES (486, 65, 'extra', '\\uploads\\Thắt Lưng Signature Chain 35MM\\Thắt Lưng Signature Chain 35MM_2_1736312293787.png');
INSERT INTO `imageentry` VALUES (487, 65, 'extra', '\\uploads\\Thắt Lưng Signature Chain 35MM\\Thắt Lưng Signature Chain 35MM_3_1736312293794.png');
INSERT INTO `imageentry` VALUES (488, 65, 'extra', '\\uploads\\Thắt Lưng Signature Chain 35MM\\Thắt Lưng Signature Chain 35MM_4_1736312293796.png');
INSERT INTO `imageentry` VALUES (489, 65, 'description', '\\uploads\\_belt65\\65_desc1736312309406.png');
INSERT INTO `imageentry` VALUES (490, 65, 'description', '\\uploads\\_belt65\\65_desc1736312312497.png');
INSERT INTO `imageentry` VALUES (491, 66, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV 3 Steps 40MM\\Thắt Lưng Hai Mặt LV 3 Steps 40MM_0_1736312505304.png');
INSERT INTO `imageentry` VALUES (492, 66, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV 3 Steps 40MM\\Thắt Lưng Hai Mặt LV 3 Steps 40MM_1_1736312505305.png');
INSERT INTO `imageentry` VALUES (493, 66, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV 3 Steps 40MM\\Thắt Lưng Hai Mặt LV 3 Steps 40MM_2_1736312505309.png');
INSERT INTO `imageentry` VALUES (494, 66, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV 3 Steps 40MM\\Thắt Lưng Hai Mặt LV 3 Steps 40MM_3_1736312505312.png');
INSERT INTO `imageentry` VALUES (495, 66, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV 3 Steps 40MM\\Thắt Lưng Hai Mặt LV 3 Steps 40MM_4_1736312505314.png');
INSERT INTO `imageentry` VALUES (496, 66, 'description', '\\uploads\\_belt66\\66_desc1736312517937.png');
INSERT INTO `imageentry` VALUES (497, 66, 'description', '\\uploads\\_belt66\\66_desc1736312521249.png');
INSERT INTO `imageentry` VALUES (498, 66, 'description', '\\uploads\\_belt66\\66_desc1736312524828.png');
INSERT INTO `imageentry` VALUES (499, 66, 'description', '\\uploads\\_belt66\\66_desc1736312529113.png');
INSERT INTO `imageentry` VALUES (500, 67, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Tilt 40MM\\Thắt Lưng Hai Mặt LV Tilt 40MM_0_1736312654447.png');
INSERT INTO `imageentry` VALUES (501, 67, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tilt 40MM\\Thắt Lưng Hai Mặt LV Tilt 40MM_1_1736312654448.png');
INSERT INTO `imageentry` VALUES (502, 67, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tilt 40MM\\Thắt Lưng Hai Mặt LV Tilt 40MM_2_1736312654451.png');
INSERT INTO `imageentry` VALUES (503, 67, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tilt 40MM\\Thắt Lưng Hai Mặt LV Tilt 40MM_3_1736312654453.png');
INSERT INTO `imageentry` VALUES (504, 67, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Tilt 40MM\\Thắt Lưng Hai Mặt LV Tilt 40MM_4_1736312654454.png');
INSERT INTO `imageentry` VALUES (505, 67, 'description', '\\uploads\\_belt67\\67_desc1736312668005.png');
INSERT INTO `imageentry` VALUES (506, 67, 'description', '\\uploads\\_belt67\\67_desc1736312670914.png');
INSERT INTO `imageentry` VALUES (507, 67, 'description', '\\uploads\\_belt67\\67_desc1736312674224.png');
INSERT INTO `imageentry` VALUES (508, 68, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Pixel 40MM\\Thắt Lưng Hai Mặt LV Pixel 40MM_0_1736312793255.png');
INSERT INTO `imageentry` VALUES (509, 68, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pixel 40MM\\Thắt Lưng Hai Mặt LV Pixel 40MM_1_1736312793256.png');
INSERT INTO `imageentry` VALUES (510, 68, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pixel 40MM\\Thắt Lưng Hai Mặt LV Pixel 40MM_2_1736312793259.png');
INSERT INTO `imageentry` VALUES (511, 68, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pixel 40MM\\Thắt Lưng Hai Mặt LV Pixel 40MM_3_1736312793260.png');
INSERT INTO `imageentry` VALUES (512, 68, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Pixel 40MM\\Thắt Lưng Hai Mặt LV Pixel 40MM_4_1736312793261.png');
INSERT INTO `imageentry` VALUES (513, 68, 'description', '\\uploads\\_belt68\\68_desc1736312807850.png');
INSERT INTO `imageentry` VALUES (514, 68, 'description', '\\uploads\\_belt68\\68_desc1736312810613.png');
INSERT INTO `imageentry` VALUES (515, 68, 'description', '\\uploads\\_belt68\\68_desc1736312815241.png');
INSERT INTO `imageentry` VALUES (516, 69, 'main', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_0_1736313145212.png');
INSERT INTO `imageentry` VALUES (517, 69, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_1_1736313145213.png');
INSERT INTO `imageentry` VALUES (518, 69, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_2_1736313145215.png');
INSERT INTO `imageentry` VALUES (519, 69, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_3_1736313145217.png');
INSERT INTO `imageentry` VALUES (520, 69, 'extra', '\\uploads\\Thắt Lưng Hai Mặt LV Initiales 40MM\\Thắt Lưng Hai Mặt LV Initiales 40MM_4_1736313145219.png');
INSERT INTO `imageentry` VALUES (521, 69, 'description', '\\uploads\\_belt69\\69_desc1736313160336.png');
INSERT INTO `imageentry` VALUES (522, 69, 'description', '\\uploads\\_belt69\\69_desc1736313164412.png');
INSERT INTO `imageentry` VALUES (523, 69, 'description', '\\uploads\\_belt69\\69_desc1736313168621.png');
INSERT INTO `imageentry` VALUES (524, 70, 'main', '\\uploads\\Thắt Lưng Vải Hai Mặt\\Thắt Lưng Vải Hai Mặt_0_1736313971604.png');
INSERT INTO `imageentry` VALUES (525, 70, 'extra', '\\uploads\\Thắt Lưng Vải Hai Mặt\\Thắt Lưng Vải Hai Mặt_1_1736313971604.png');
INSERT INTO `imageentry` VALUES (526, 70, 'extra', '\\uploads\\Thắt Lưng Vải Hai Mặt\\Thắt Lưng Vải Hai Mặt_2_1736313971610.png');
INSERT INTO `imageentry` VALUES (527, 70, 'extra', '\\uploads\\Thắt Lưng Vải Hai Mặt\\Thắt Lưng Vải Hai Mặt_3_1736313971611.png');
INSERT INTO `imageentry` VALUES (528, 70, 'extra', '\\uploads\\Thắt Lưng Vải Hai Mặt\\Thắt Lưng Vải Hai Mặt_4_1736313971613.png');
INSERT INTO `imageentry` VALUES (529, 70, 'description', '\\uploads\\_belt70\\70_desc1736314030926.png');
INSERT INTO `imageentry` VALUES (530, 71, 'main', '\\uploads\\Thắt Lưng Tour 3 Sọc\\Thắt Lưng Tour 3 Sọc_0_1736314160362.png');
INSERT INTO `imageentry` VALUES (531, 71, 'extra', '\\uploads\\Thắt Lưng Tour 3 Sọc\\Thắt Lưng Tour 3 Sọc_1_1736314160364.png');
INSERT INTO `imageentry` VALUES (532, 71, 'extra', '\\uploads\\Thắt Lưng Tour 3 Sọc\\Thắt Lưng Tour 3 Sọc_2_1736314160366.png');
INSERT INTO `imageentry` VALUES (533, 71, 'extra', '\\uploads\\Thắt Lưng Tour 3 Sọc\\Thắt Lưng Tour 3 Sọc_3_1736314160368.png');
INSERT INTO `imageentry` VALUES (534, 71, 'extra', '\\uploads\\Thắt Lưng Tour 3 Sọc\\Thắt Lưng Tour 3 Sọc_4_1736314160369.png');
INSERT INTO `imageentry` VALUES (535, 71, 'description', '\\uploads\\_belt71\\71_desc1736314174499.png');
INSERT INTO `imageentry` VALUES (536, 71, 'description', '\\uploads\\_belt71\\71_desc1736314178224.png');
INSERT INTO `imageentry` VALUES (537, 72, 'main', '\\uploads\\Thắt Lưng Da Đan Golf\\Thắt Lưng Da Đan Golf_0_1736314273435.png');
INSERT INTO `imageentry` VALUES (538, 72, 'extra', '\\uploads\\Thắt Lưng Da Đan Golf\\Thắt Lưng Da Đan Golf_1_1736314273437.png');
INSERT INTO `imageentry` VALUES (539, 72, 'extra', '\\uploads\\Thắt Lưng Da Đan Golf\\Thắt Lưng Da Đan Golf_2_1736314273440.png');
INSERT INTO `imageentry` VALUES (540, 72, 'extra', '\\uploads\\Thắt Lưng Da Đan Golf\\Thắt Lưng Da Đan Golf_3_1736314273443.png');
INSERT INTO `imageentry` VALUES (541, 72, 'extra', '\\uploads\\Thắt Lưng Da Đan Golf\\Thắt Lưng Da Đan Golf_4_1736314273446.png');
INSERT INTO `imageentry` VALUES (542, 72, 'description', '\\uploads\\_belt72\\72_desc1736314283771.png');
INSERT INTO `imageentry` VALUES (543, 72, 'description', '\\uploads\\_belt72\\72_desc1736314290477.png');
INSERT INTO `imageentry` VALUES (544, 72, 'description', '\\uploads\\_belt72\\72_desc1736314292623.png');
INSERT INTO `imageentry` VALUES (545, 73, 'main', '\\uploads\\Thắt Lưng Tour Trophy\\Thắt Lưng Tour Trophy_0_1736320629943.png');
INSERT INTO `imageentry` VALUES (546, 73, 'extra', '\\uploads\\Thắt Lưng Tour Trophy\\Thắt Lưng Tour Trophy_1_1736320629948.png');
INSERT INTO `imageentry` VALUES (547, 73, 'extra', '\\uploads\\Thắt Lưng Tour Trophy\\Thắt Lưng Tour Trophy_2_1736320629951.png');
INSERT INTO `imageentry` VALUES (548, 73, 'extra', '\\uploads\\Thắt Lưng Tour Trophy\\Thắt Lưng Tour Trophy_3_1736320629953.png');
INSERT INTO `imageentry` VALUES (549, 73, 'extra', '\\uploads\\Thắt Lưng Tour Trophy\\Thắt Lưng Tour Trophy_4_1736320629955.png');
INSERT INTO `imageentry` VALUES (550, 73, 'description', '\\uploads\\_belt73\\73_desc1736320653266.png');
INSERT INTO `imageentry` VALUES (551, 73, 'description', '\\uploads\\_belt73\\73_desc1736320656854.png');
INSERT INTO `imageentry` VALUES (552, 73, 'description', '\\uploads\\_belt73\\73_desc1736320659202.png');
INSERT INTO `imageentry` VALUES (553, 74, 'main', '\\uploads\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc_0_1736320807912.png');
INSERT INTO `imageentry` VALUES (554, 74, 'extra', '\\uploads\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc_1_1736320807913.png');
INSERT INTO `imageentry` VALUES (555, 74, 'extra', '\\uploads\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc_2_1736320807916.png');
INSERT INTO `imageentry` VALUES (556, 74, 'extra', '\\uploads\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc_3_1736320807917.png');
INSERT INTO `imageentry` VALUES (557, 74, 'extra', '\\uploads\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc\\Thắt Lưng Không Lỗ Polyurethane 3 Sọc_4_1736320807919.png');
INSERT INTO `imageentry` VALUES (558, 74, 'description', '\\uploads\\_belt74\\74_desc1736320948916.png');
INSERT INTO `imageentry` VALUES (559, 74, 'description', '\\uploads\\_belt74\\74_desc1736320952644.png');
INSERT INTO `imageentry` VALUES (560, 75, 'description', '\\uploads\\_belt75\\75_desc1736321260859.png');
INSERT INTO `imageentry` VALUES (561, 75, 'description', '\\uploads\\_belt75\\75_desc1736321263524.png');
INSERT INTO `imageentry` VALUES (562, 75, 'main', '\\uploads\\V2025 Thắt lưng da dây chuyền 2 cm\\V2025 Thắt lưng da dây chuyền 2 cm_0_1736321335919.png');
INSERT INTO `imageentry` VALUES (563, 75, 'extra', '\\uploads\\V2025 Thắt lưng da dây chuyền 2 cm\\V2025 Thắt lưng da dây chuyền 2 cm_1_1736321335921.png');
INSERT INTO `imageentry` VALUES (564, 75, 'extra', '\\uploads\\V2025 Thắt lưng da dây chuyền 2 cm\\V2025 Thắt lưng da dây chuyền 2 cm_2_1736321335923.png');
INSERT INTO `imageentry` VALUES (565, 75, 'extra', '\\uploads\\V2025 Thắt lưng da dây chuyền 2 cm\\V2025 Thắt lưng da dây chuyền 2 cm_3_1736321335924.png');
INSERT INTO `imageentry` VALUES (566, 75, 'extra', '\\uploads\\V2025 Thắt lưng da dây chuyền 2 cm\\V2025 Thắt lưng da dây chuyền 2 cm_4_1736321335926.png');
INSERT INTO `imageentry` VALUES (567, 76, 'main', '\\uploads\\Thắt lưng xích chốt an toàn 1,5 cm\\Thắt lưng xích chốt an toàn 1,5 cm_0_1736321463077.png');
INSERT INTO `imageentry` VALUES (568, 76, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 1,5 cm\\Thắt lưng xích chốt an toàn 1,5 cm_1_1736321463079.png');
INSERT INTO `imageentry` VALUES (569, 76, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 1,5 cm\\Thắt lưng xích chốt an toàn 1,5 cm_2_1736321463080.png');
INSERT INTO `imageentry` VALUES (570, 76, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 1,5 cm\\Thắt lưng xích chốt an toàn 1,5 cm_3_1736321463083.png');
INSERT INTO `imageentry` VALUES (571, 76, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 1,5 cm\\Thắt lưng xích chốt an toàn 1,5 cm_4_1736321463085.png');
INSERT INTO `imageentry` VALUES (572, 76, 'description', '\\uploads\\_belt76\\76_desc1736321517894.png');
INSERT INTO `imageentry` VALUES (573, 76, 'description', '\\uploads\\_belt76\\76_desc1736321520252.png');
INSERT INTO `imageentry` VALUES (574, 77, 'main', '\\uploads\\Thắt lưng xích chốt an toàn 3,5 cm\\Thắt lưng xích chốt an toàn 3,5 cm_0_1736321886455.png');
INSERT INTO `imageentry` VALUES (575, 77, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 3,5 cm\\Thắt lưng xích chốt an toàn 3,5 cm_1_1736321886456.png');
INSERT INTO `imageentry` VALUES (576, 77, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 3,5 cm\\Thắt lưng xích chốt an toàn 3,5 cm_2_1736321886458.png');
INSERT INTO `imageentry` VALUES (577, 77, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 3,5 cm\\Thắt lưng xích chốt an toàn 3,5 cm_3_1736321886459.png');
INSERT INTO `imageentry` VALUES (578, 77, 'extra', '\\uploads\\Thắt lưng xích chốt an toàn 3,5 cm\\Thắt lưng xích chốt an toàn 3,5 cm_4_1736321886464.png');
INSERT INTO `imageentry` VALUES (579, 77, 'description', '\\uploads\\_belt77\\77_desc1736321917539.png');
INSERT INTO `imageentry` VALUES (580, 77, 'description', '\\uploads\\_belt77\\77_desc1736321919679.png');
INSERT INTO `imageentry` VALUES (581, 77, 'description', '\\uploads\\_belt77\\77_desc1736321922221.png');
INSERT INTO `imageentry` VALUES (582, 78, 'main', '\\uploads\\Thắt lưng da Medusa\\Thắt lưng da Medusa_0_1736322161767.png');
INSERT INTO `imageentry` VALUES (583, 78, 'extra', '\\uploads\\Thắt lưng da Medusa\\Thắt lưng da Medusa_1_1736322161768.png');
INSERT INTO `imageentry` VALUES (584, 78, 'extra', '\\uploads\\Thắt lưng da Medusa\\Thắt lưng da Medusa_2_1736322161769.png');
INSERT INTO `imageentry` VALUES (585, 78, 'extra', '\\uploads\\Thắt lưng da Medusa\\Thắt lưng da Medusa_3_1736322161771.png');
INSERT INTO `imageentry` VALUES (586, 78, 'extra', '\\uploads\\Thắt lưng da Medusa\\Thắt lưng da Medusa_4_1736322161772.png');
INSERT INTO `imageentry` VALUES (587, 79, 'main', '\\uploads\\Thắt lưng da Medusa Baggie\\Thắt lưng da Medusa Baggie_0_1736322326282.png');
INSERT INTO `imageentry` VALUES (588, 79, 'extra', '\\uploads\\Thắt lưng da Medusa Baggie\\Thắt lưng da Medusa Baggie_1_1736322326284.png');
INSERT INTO `imageentry` VALUES (589, 79, 'extra', '\\uploads\\Thắt lưng da Medusa Baggie\\Thắt lưng da Medusa Baggie_2_1736322326286.png');
INSERT INTO `imageentry` VALUES (590, 79, 'extra', '\\uploads\\Thắt lưng da Medusa Baggie\\Thắt lưng da Medusa Baggie_3_1736322326287.png');
INSERT INTO `imageentry` VALUES (591, 79, 'extra', '\\uploads\\Thắt lưng da Medusa Baggie\\Thắt lưng da Medusa Baggie_4_1736322326289.png');
INSERT INTO `imageentry` VALUES (592, 80, 'main', '\\uploads\\Thắt lưng Vàng Kim Khóa\\Thắt lưng Vàng Kim Khóa_0_1736322477751.png');
INSERT INTO `imageentry` VALUES (593, 80, 'extra', '\\uploads\\Thắt lưng Vàng Kim Khóa\\Thắt lưng Vàng Kim Khóa_1_1736322477752.png');
INSERT INTO `imageentry` VALUES (594, 80, 'extra', '\\uploads\\Thắt lưng Vàng Kim Khóa\\Thắt lưng Vàng Kim Khóa_2_1736322477754.png');
INSERT INTO `imageentry` VALUES (595, 80, 'extra', '\\uploads\\Thắt lưng Vàng Kim Khóa\\Thắt lưng Vàng Kim Khóa_3_1736322477756.png');
INSERT INTO `imageentry` VALUES (596, 80, 'extra', '\\uploads\\Thắt lưng Vàng Kim Khóa\\Thắt lưng Vàng Kim Khóa_4_1736322477758.png');
INSERT INTO `imageentry` VALUES (597, 80, 'description', '\\uploads\\_belt80\\80_desc1736322507556.png');
INSERT INTO `imageentry` VALUES (598, 80, 'description', '\\uploads\\_belt80\\80_desc1736322509981.png');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `price` double NOT NULL,
  `beltId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`orderId` ASC) USING BTREE,
  INDEX `beltId`(`beltId` ASC) USING BTREE,
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (54, 13, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (55, 13, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (56, 13, 858.372, 18, 1);
INSERT INTO `orderdetails` VALUES (57, 13, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (58, 14, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (59, 14, 160, 3, 1);
INSERT INTO `orderdetails` VALUES (60, 14, 275, 4, 1);
INSERT INTO `orderdetails` VALUES (61, 14, 900, 5, 1);
INSERT INTO `orderdetails` VALUES (62, 14, 392, 6, 1);
INSERT INTO `orderdetails` VALUES (63, 14, 630, 9, 1);
INSERT INTO `orderdetails` VALUES (64, 14, 207.407, 10, 1);
INSERT INTO `orderdetails` VALUES (65, 14, 637.12, 11, 1);
INSERT INTO `orderdetails` VALUES (66, 14, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (67, 14, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (68, 14, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (69, 14, 109.687, 16, 1);
INSERT INTO `orderdetails` VALUES (70, 14, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (71, 14, 858.372, 18, 1);
INSERT INTO `orderdetails` VALUES (72, 14, 326.827, 19, 1);
INSERT INTO `orderdetails` VALUES (73, 14, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (74, 14, 639.714, 21, 1);
INSERT INTO `orderdetails` VALUES (75, 14, 312.088, 22, 1);
INSERT INTO `orderdetails` VALUES (76, 14, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (77, 15, 523.247, 64, 1);
INSERT INTO `orderdetails` VALUES (78, 15, 110.811, 60, 10);
INSERT INTO `orderdetails` VALUES (79, 15, 289.964, 61, 1);
INSERT INTO `orderdetails` VALUES (80, 16, 392, 6, 2);
INSERT INTO `orderdetails` VALUES (81, 16, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (82, 16, 123.123, 78, 1);
INSERT INTO `orderdetails` VALUES (83, 16, 87.392, 46, 1);
INSERT INTO `orderdetails` VALUES (84, 17, 11.712, 48, 1);
INSERT INTO `orderdetails` VALUES (85, 17, 187.15, 53, 1);
INSERT INTO `orderdetails` VALUES (86, 17, 603.012, 55, 1);
INSERT INTO `orderdetails` VALUES (87, 18, 328.271, 32, 1);
INSERT INTO `orderdetails` VALUES (88, 18, 148.625, 41, 1);
INSERT INTO `orderdetails` VALUES (89, 18, 781.21, 43, 1);
INSERT INTO `orderdetails` VALUES (90, 19, 345.313, 74, 18);
INSERT INTO `orderdetails` VALUES (91, 19, 206.126, 75, 1);
INSERT INTO `orderdetails` VALUES (92, 19, 123.123, 76, 1);
INSERT INTO `orderdetails` VALUES (93, 20, 11.712, 48, 1);
INSERT INTO `orderdetails` VALUES (94, 20, 26.17115000000001, 50, 1);
INSERT INTO `orderdetails` VALUES (95, 21, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (96, 21, 213.263, 65, 1);
INSERT INTO `orderdetails` VALUES (97, 22, 176, 1, 15);
INSERT INTO `orderdetails` VALUES (98, 23, 407.9412, 15, 1);
INSERT INTO `orderdetails` VALUES (99, 24, 639.7144000000001, 21, 11);
INSERT INTO `orderdetails` VALUES (100, 25, 639.7144000000001, 21, 1);
INSERT INTO `orderdetails` VALUES (101, 26, 70.18, 37, 1);
INSERT INTO `orderdetails` VALUES (102, 26, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (103, 26, 603.012, 55, 1);
INSERT INTO `orderdetails` VALUES (104, 26, 632.341, 72, 12);
INSERT INTO `orderdetails` VALUES (105, 26, 422.771, 58, 1);
INSERT INTO `orderdetails` VALUES (106, 27, 207.407, 10, 1);
INSERT INTO `orderdetails` VALUES (107, 27, 637.12, 11, 1);
INSERT INTO `orderdetails` VALUES (108, 28, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (109, 28, 301.262, 29, 1);
INSERT INTO `orderdetails` VALUES (110, 28, 358.719, 31, 1);
INSERT INTO `orderdetails` VALUES (111, 29, 474.213, 71, 8);
INSERT INTO `orderdetails` VALUES (112, 29, 567.567, 73, 1);
INSERT INTO `orderdetails` VALUES (113, 29, 345.313, 74, 1);
INSERT INTO `orderdetails` VALUES (114, 29, 123.123, 76, 1);
INSERT INTO `orderdetails` VALUES (115, 30, 220.06275, 13, 1);
INSERT INTO `orderdetails` VALUES (116, 31, 639.7144000000001, 21, 1);
INSERT INTO `orderdetails` VALUES (117, 32, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (118, 33, 326.827, 19, 10);
INSERT INTO `orderdetails` VALUES (119, 33, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (120, 33, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (121, 34, 109.687, 16, 1);
INSERT INTO `orderdetails` VALUES (122, 34, 220.06275, 13, 1);
INSERT INTO `orderdetails` VALUES (123, 34, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (124, 35, 523.247, 64, 1);
INSERT INTO `orderdetails` VALUES (125, 35, 244.927, 62, 1);
INSERT INTO `orderdetails` VALUES (126, 35, 410.887, 63, 1);
INSERT INTO `orderdetails` VALUES (127, 36, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (128, 36, 207.407, 10, 1);
INSERT INTO `orderdetails` VALUES (129, 36, 637.12, 11, 1);
INSERT INTO `orderdetails` VALUES (130, 37, 109.68672000000001, 17, 1);
INSERT INTO `orderdetails` VALUES (131, 38, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (132, 39, 289.964, 61, 1);
INSERT INTO `orderdetails` VALUES (133, 39, 407.941, 15, 2);
INSERT INTO `orderdetails` VALUES (134, 40, 858.37224, 18, 1);
INSERT INTO `orderdetails` VALUES (135, 41, 639.7144000000001, 21, 1);
INSERT INTO `orderdetails` VALUES (136, 42, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (137, 43, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (138, 43, 639.714, 21, 1);
INSERT INTO `orderdetails` VALUES (139, 43, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (140, 44, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (141, 44, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (142, 44, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (143, 45, 109.687, 16, 11);
INSERT INTO `orderdetails` VALUES (144, 45, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (145, 45, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (146, 46, 187.15, 53, 10);
INSERT INTO `orderdetails` VALUES (147, 46, 603.012, 55, 6);
INSERT INTO `orderdetails` VALUES (148, 47, 529.6537, 23, 1);
INSERT INTO `orderdetails` VALUES (149, 48, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (150, 49, 109.68672000000001, 17, 1);
INSERT INTO `orderdetails` VALUES (151, 50, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (152, 50, 301.26184, 29, 1);
INSERT INTO `orderdetails` VALUES (153, 51, 109.687, 16, 13);
INSERT INTO `orderdetails` VALUES (154, 51, 523.247, 64, 1);
INSERT INTO `orderdetails` VALUES (155, 51, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (156, 51, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (157, 51, 244.927, 62, 1);
INSERT INTO `orderdetails` VALUES (158, 51, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (159, 51, 410.887, 63, 1);
INSERT INTO `orderdetails` VALUES (160, 52, 109.687, 16, 1);
INSERT INTO `orderdetails` VALUES (161, 52, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (162, 52, 326.827, 19, 1);
INSERT INTO `orderdetails` VALUES (163, 52, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (164, 53, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (165, 53, 326.827, 19, 1);
INSERT INTO `orderdetails` VALUES (166, 53, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (167, 53, 312.088, 22, 1);
INSERT INTO `orderdetails` VALUES (168, 53, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (169, 54, 109.687, 16, 1);
INSERT INTO `orderdetails` VALUES (170, 54, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (171, 54, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (172, 55, 107.879, 36, 1);
INSERT INTO `orderdetails` VALUES (173, 55, 183.781, 39, 1);
INSERT INTO `orderdetails` VALUES (174, 55, 564.094, 42, 1);
INSERT INTO `orderdetails` VALUES (175, 56, 109.68672000000001, 17, 1);
INSERT INTO `orderdetails` VALUES (176, 57, 312.08759999999995, 22, 1);
INSERT INTO `orderdetails` VALUES (177, 58, 109.68672000000001, 17, 1);
INSERT INTO `orderdetails` VALUES (178, 59, 407.9412, 15, 1);
INSERT INTO `orderdetails` VALUES (179, 60, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (180, 61, 639.714, 21, 1);
INSERT INTO `orderdetails` VALUES (181, 61, 567.567, 73, 1);
INSERT INTO `orderdetails` VALUES (182, 61, 61.56, 57, 1);
INSERT INTO `orderdetails` VALUES (183, 61, 422.771, 58, 1);
INSERT INTO `orderdetails` VALUES (184, 62, 523.247, 64, 1);
INSERT INTO `orderdetails` VALUES (185, 62, 289.964, 61, 1);
INSERT INTO `orderdetails` VALUES (186, 62, 410.887, 63, 1);
INSERT INTO `orderdetails` VALUES (187, 63, 109.68672000000001, 17, 1);
INSERT INTO `orderdetails` VALUES (188, 64, 109.687, 16, 14);
INSERT INTO `orderdetails` VALUES (189, 64, 765.321, 12, 2);
INSERT INTO `orderdetails` VALUES (190, 64, 407.941, 15, 8);
INSERT INTO `orderdetails` VALUES (191, 65, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (192, 66, 639.7144000000001, 21, 1);
INSERT INTO `orderdetails` VALUES (193, 67, 109.687, 16, 12);
INSERT INTO `orderdetails` VALUES (194, 67, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (195, 67, 326.827, 19, 2);
INSERT INTO `orderdetails` VALUES (196, 67, 564.094, 42, 6);
INSERT INTO `orderdetails` VALUES (197, 67, 765.321, 12, 4);
INSERT INTO `orderdetails` VALUES (198, 67, 407.941, 15, 1);
INSERT INTO `orderdetails` VALUES (199, 68, 176, 1, 7);
INSERT INTO `orderdetails` VALUES (200, 69, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (201, 69, 326.827, 19, 1);
INSERT INTO `orderdetails` VALUES (202, 69, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (203, 70, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (204, 70, 326.827, 19, 1);
INSERT INTO `orderdetails` VALUES (205, 70, 639.714, 21, 1);
INSERT INTO `orderdetails` VALUES (206, 70, 529.654, 23, 1);
INSERT INTO `orderdetails` VALUES (207, 71, 701.2520000000001, 28, 1);
INSERT INTO `orderdetails` VALUES (208, 72, 109.687, 16, 1);
INSERT INTO `orderdetails` VALUES (209, 72, 109.687, 17, 1);
INSERT INTO `orderdetails` VALUES (210, 72, 490.24, 20, 1);
INSERT INTO `orderdetails` VALUES (211, 72, 765.321, 12, 1);
INSERT INTO `orderdetails` VALUES (212, 73, 289.964, 61, 1);
INSERT INTO `orderdetails` VALUES (213, 73, 244.927, 62, 1);
INSERT INTO `orderdetails` VALUES (214, 74, 523.247, 64, 1);
INSERT INTO `orderdetails` VALUES (215, 74, 110.811, 60, 1);
INSERT INTO `orderdetails` VALUES (216, 74, 410.887, 63, 1);
INSERT INTO `orderdetails` VALUES (217, 75, 26.171, 50, 10);
INSERT INTO `orderdetails` VALUES (218, 75, 107.458, 54, 1);
INSERT INTO `orderdetails` VALUES (219, 75, 603.012, 55, 1);
INSERT INTO `orderdetails` VALUES (220, 75, 220.063, 13, 1);
INSERT INTO `orderdetails` VALUES (221, 76, 176, 1, 1);
INSERT INTO `orderdetails` VALUES (222, 77, 176, 1, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `paymentMethodId` int NULL DEFAULT NULL,
  `addressesId` int NULL DEFAULT NULL,
  `orderDate` datetime NULL DEFAULT current_timestamp,
  `orderTotal` double NOT NULL,
  `orderStatus` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isDeleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paymentMethodId`(`paymentMethodId` ASC) USING BTREE,
  INDEX `userID`(`userID` ASC) USING BTREE,
  INDEX `addressesId`(`addressesId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`addressesId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (13, 1, 1, 2, '2025-01-08 00:00:00', 1688.713, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (14, 1, 1, 2, '2025-01-19 00:00:00', 8162.120999999999, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (15, 4, 1, 3, '2025-01-06 00:00:00', 1936.321, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (16, 4, 1, 3, '2025-01-06 00:00:00', 1774.836, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (17, 4, 1, 3, '2025-01-14 00:00:00', 816.8739999999999, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (18, 4, 1, 3, '2025-01-23 00:00:00', 1273.106, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (19, 4, 1, 3, '2025-01-08 00:00:00', 6559.883, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (20, 4, 1, 3, '2025-02-08 00:00:00', 52.883150000000015, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (21, 4, 1, 3, '2025-02-10 00:00:00', 337.95, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (22, 4, 1, 3, '2025-02-26 00:00:00', 2865, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (23, 4, 1, 3, '2025-02-17 00:00:00', 422.9412, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (24, 5, 1, 7, '2025-01-10 00:00:00', 7201.858400000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (25, 5, 1, 7, '2025-02-09 00:00:00', 654.7144000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (26, 5, 1, 7, '2025-02-23 00:00:00', 9228.709, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (27, 5, 1, 7, '2025-02-17 00:00:00', 859.527, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (28, 5, 1, 7, '2025-03-13 00:00:00', 850.981, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (29, 5, 1, 7, '2025-03-15 00:00:00', 4844.707, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (30, 5, 1, 7, '2025-03-17 00:00:00', 235.06275, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (31, 7, 1, 9, '2025-03-10 00:00:00', 654.7144000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (32, 7, 1, 9, '2025-03-25 00:00:00', 780.321, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (33, 7, 1, 9, '2025-03-28 00:00:00', 3993.5730000000003, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (34, 7, 1, 9, '2025-03-23 00:00:00', 752.69075, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (35, 7, 1, 9, '2025-03-28 00:00:00', 1194.061, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (36, 7, 1, 9, '2025-03-12 00:00:00', 1349.767, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (37, 7, 1, 9, '2025-04-09 00:00:00', 124.68672000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (38, 7, 1, 9, '2025-04-07 00:00:00', 780.321, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (39, 7, 1, 9, '2025-04-06 00:00:00', 1135.846, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (40, 7, 1, 9, '2025-04-07 00:00:00', 873.37224, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (41, 8, 1, 11, '2025-03-12 00:00:00', 654.7144000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (42, 8, 1, 11, '2025-04-10 00:00:00', 191, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (43, 8, 1, 11, '2025-04-12 00:00:00', 1360.368, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (44, 8, 1, 11, '2025-04-17 00:00:00', 1408.325, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (45, 8, 1, 11, '2025-04-21 00:00:00', 2394.819, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (46, 8, 1, 11, '2025-01-25 00:00:00', 5579.572, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (47, 9, 1, 19, '2025-01-08 00:00:00', 544.6537, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (48, 9, 1, 19, '2025-01-08 00:00:00', 780.321, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (49, 9, 1, 19, '2025-01-08 00:00:00', 124.68672000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (50, 9, 1, 19, '2025-01-08 00:00:00', 492.26184, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (51, 9, 1, 19, '2025-01-08 00:00:00', 4013.317, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (52, 9, 1, 19, '2025-01-08 00:00:00', 781.264, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (53, 10, 1, 20, '2025-01-08 00:00:00', 1849.809, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (54, 10, 1, 20, '2025-01-08 00:00:00', 1297.949, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (55, 10, 1, 20, '2025-01-08 00:00:00', 870.7540000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (56, 11, 1, 21, '2025-01-08 00:00:00', 124.68672000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (57, 11, 1, 21, '2025-01-08 00:00:00', 327.08759999999995, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (58, 11, 1, 21, '2025-01-08 00:00:00', 124.68672000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (59, 11, 1, 21, '2025-01-08 00:00:00', 422.9412, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (60, 11, 1, 21, '2025-01-08 00:00:00', 191, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (61, 11, 1, 21, '2025-01-08 00:00:00', 1706.6119999999999, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (62, 11, 1, 21, '2025-01-08 00:00:00', 1239.098, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (63, 11, 1, 21, '2025-01-08 00:00:00', 124.68672000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (64, 11, 1, 21, '2025-01-08 00:00:00', 6449.7880000000005, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (65, 11, 1, 21, '2025-01-08 00:00:00', 780.321, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (66, 12, 1, 25, '2025-01-08 00:00:00', 654.7144000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (67, 12, 1, 25, '2025-01-08 00:00:00', 8948.374000000002, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (68, 12, 1, 25, '2025-01-08 00:00:00', 1337, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (69, 12, 1, 25, '2025-01-08 00:00:00', 941.754, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (70, 13, 1, 27, '2025-01-08 00:00:00', 1687.1950000000002, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (71, 13, 1, 27, '2025-01-08 00:00:00', 716.2520000000001, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (72, 13, 1, 27, '2025-01-08 00:00:00', 1489.935, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (73, 13, 1, 27, '2025-01-08 00:00:00', 549.891, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (74, 13, 1, 27, '2025-01-08 00:00:00', 1059.945, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (75, 13, 1, 27, '2025-01-08 00:00:00', 1207.243, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (76, 7, 1, 9, '2025-06-06 00:00:00', 191, 'Đang xử lý', 0);
INSERT INTO `orders` VALUES (77, 7, 1, 9, '2025-06-06 00:00:00', 191, 'Đang xử lý', 0);

-- ----------------------------
-- Table structure for paymentmethods
-- ----------------------------
DROP TABLE IF EXISTS `paymentmethods`;
CREATE TABLE `paymentmethods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isActive` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paymentmethods
-- ----------------------------
INSERT INTO `paymentmethods` VALUES (1, 'GooglePay', 1);
INSERT INTO `paymentmethods` VALUES (2, 'Delivery', 1);
INSERT INTO `paymentmethods` VALUES (3, 'Bank', 1);

-- ----------------------------
-- Table structure for public_keys
-- ----------------------------
DROP TABLE IF EXISTS `public_keys`;
CREATE TABLE `public_keys`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `key_version` int NOT NULL,
  `public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `is_active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `key_version` ASC) USING BTREE,
  CONSTRAINT `public_keys_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_keys
-- ----------------------------
INSERT INTO `public_keys` VALUES (1, 7, 1, 'pub1', '2025-06-06 21:18:50', 1);
INSERT INTO `public_keys` VALUES (2, 7, 2, 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfsNglFZoPt8IUPfjUcqitgrdKHmGSktCX0WvoOwxBS9t2ySwVjqMJyz/ZtVdHWVHBIkwZJehlcDULZAtgncDdcnL2lMRWoAD8AeVLqwH0W/Odc/qDtnYCLS0TgA1PJBA+u/BQ6hdiylHVg0ovtEM78yTZFjggoJ/9e63WTPeSGQIDAQAB', '2025-06-06 21:19:07', 1);
INSERT INTO `public_keys` VALUES (3, 4, 1, 'a1', '2025-06-06 21:19:27', 1);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `beltId` int NOT NULL,
  `userId` int NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ratingStar` int NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `beltId`(`beltId` ASC) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`beltId`) REFERENCES `belts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (4, 1, 10, 'Mua một lần rồi , giờ mua lại sản phẩm vẫn tốt và đẹp ', 5, '2025-01-08 00:00:00');
INSERT INTO `reviews` VALUES (5, 1, 12, 'Sản phẩm tốt nhưng quá đắt tiền , không đáng mua', 2, '2025-01-08 00:00:00');
INSERT INTO `reviews` VALUES (6, 1, 12, 'Vừa được hỗ trợ đổi trả lại sản phẩm lỗi này , chất lượng mới khá tốt , cảm ơn shop', 5, '2025-01-08 00:00:00');
INSERT INTO `reviews` VALUES (7, 1, 8, '  Sản phẩm chất lượng cao , phù hợp với giá tiền', 5, '2025-01-08 00:00:00');
INSERT INTO `reviews` VALUES (8, 1, 8, '              ', 5, '2025-01-08 00:00:00');

-- ----------------------------
-- Table structure for signatures
-- ----------------------------
DROP TABLE IF EXISTS `signatures`;
CREATE TABLE `signatures`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `key_version` int NOT NULL,
  `signature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC, `key_version` ASC) USING BTREE,
  CONSTRAINT `signatures_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `signatures_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `signatures_ibfk_3` FOREIGN KEY (`user_id`, `key_version`) REFERENCES `public_keys` (`user_id`, `key_version`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signatures
-- ----------------------------
INSERT INTO `signatures` VALUES (1, 40, 7, 2, 'alo1', '2025-06-06 21:20:34');

-- ----------------------------
-- Table structure for userpaymentmethods
-- ----------------------------
DROP TABLE IF EXISTS `userpaymentmethods`;
CREATE TABLE `userpaymentmethods`  (
  `userId` int NOT NULL,
  `paymentMethodId` int NOT NULL,
  `isUse` int NOT NULL,
  PRIMARY KEY (`userId`, `paymentMethodId`) USING BTREE,
  INDEX `paymentMethodId`(`paymentMethodId` ASC) USING BTREE,
  CONSTRAINT `userpaymentmethods_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userpaymentmethods_ibfk_2` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userpaymentmethods
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateOfBirth` datetime NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT current_timestamp,
  `isDeleted` int NULL DEFAULT 0,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNumber` bigint NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isActive` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'erterter Huynh Minh Thang', 'huynhminhthang246@gmail.com', '2024-12-04 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2024-12-28 00:00:00', 0, 'M', 356176054, 1, '4d470df9-3289-4071-9c28-9173b805fdcb', 1);
INSERT INTO `users` VALUES (4, 'huynhminhthang247@gmail.com', 'huynhminhthang247@gmail.com', '2012-02-22 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 12312321, 0, NULL, 1);
INSERT INTO `users` VALUES (5, 'huynhminhthang248@gmail.com', 'huynhminhthang248@gmail.com', '2025-02-05 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 356176054, 1, NULL, 1);
INSERT INTO `users` VALUES (6, '546456456456', '23423423@gmail.com', '2025-01-02 00:00:00', 'd41d8cd98f00b204e9800998ecf8427e', NULL, '2025-01-08 00:00:00', 0, 'F', 1233213, 0, NULL, 1);
INSERT INTO `users` VALUES (7, 'huynhminhthang246@gmail.com', '123@gmail.com', '2024-09-10 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'F', 123123, 1, NULL, 1);
INSERT INTO `users` VALUES (8, 'rgdfgdfg', '456@gmail.com', '2025-01-05 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 32423, 1, NULL, 1);
INSERT INTO `users` VALUES (9, 'mbnmbnmbnmbnmbnm', 'asd@gmail.com', '2025-01-06 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 546456, 0, NULL, 1);
INSERT INTO `users` VALUES (10, 'sdfsfsdfsdf', 'qwe@gmail.com', '2023-06-27 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'F', 21313, 1, NULL, 1);
INSERT INTO `users` VALUES (11, 'asdasdasd', 'rty@gmail.com', '2024-01-08 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 342342, 0, NULL, 1);
INSERT INTO `users` VALUES (12, 'huynhminhthang246@gmail.com', 'zxc@gmail.com', '2024-04-15 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'M', 123123, 1, NULL, 1);
INSERT INTO `users` VALUES (13, 'dfgdfgdfgdfgfd', 'fgh@gmail.com', '2024-02-19 00:00:00', '202cb962ac59075b964b07152d234b70', NULL, '2025-01-08 00:00:00', 0, 'F', 21312312, 0, NULL, 1);

-- ----------------------------
-- Triggers structure for table public_keys
-- ----------------------------
DROP TRIGGER IF EXISTS `before_insert_public_key`;
delimiter ;;
CREATE TRIGGER `before_insert_public_key` BEFORE INSERT ON `public_keys` FOR EACH ROW BEGIN
    DECLARE max_version INT;

    SELECT COALESCE(MAX(key_version), 0)
    INTO max_version
    FROM public_keys
    WHERE user_id = NEW.user_id;

    SET NEW.key_version = max_version + 1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
