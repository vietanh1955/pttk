CREATE DATABASE IF NOT EXISTS `libman_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `libman_db`;

-- 1. Bảng Thành viên
CREATE TABLE `tblMember1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `DOB` DATE NULL,
    `address` VARCHAR(255) NULL,
    `email` VARCHAR(100) NULL,
    `phoneNumber` VARCHAR(15) NULL,
    `role` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- 2. Bảng Bạn đọc (Kế thừa tblMember1)
CREATE TABLE `tblReader1` (
    `tblMember1id` INT(10) NOT NULL,
    `readerType` VARCHAR(50) NOT NULL,
    `department` VARCHAR(100) NULL,
    PRIMARY KEY (`tblMember1id`),
    CONSTRAINT `fk_reader_member` FOREIGN KEY (`tblMember1id`) REFERENCES `tblMember1`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. Bảng Nhân viên (Kế thừa tblMember1)
CREATE TABLE `tblStaff1` (
    `tblMember1id` INT(10) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`tblMember1id`),
    CONSTRAINT `fk_staff_member` FOREIGN KEY (`tblMember1id`) REFERENCES `tblMember1`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. Bảng Thẻ bạn đọc
CREATE TABLE `tblLibraryCard1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `issueDate` DATE NOT NULL,
    `expiryDate` DATE NOT NULL,
    `status` VARCHAR(30) NOT NULL,
    `tblReader1id` INT(10) NOT NULL UNIQUE,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_card_reader` FOREIGN KEY (`tblReader1id`) REFERENCES `tblReader1`(`tblMember1id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Bảng Tài liệu
CREATE TABLE `tblDocument1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(200) NOT NULL,
    `author` VARCHAR(150) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    `publisher` VARCHAR(150) NOT NULL,
    `documentType` VARCHAR(50) NOT NULL,
    `publishYear` INT(10) NOT NULL,
    `stockQuantity` INT(10) NOT NULL,
    `price` DECIMAL(12,2) NOT NULL,
    `description` VARCHAR(255) NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- 6. Bảng Phiếu mượn
CREATE TABLE `tblBorrowSlip1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `borrowDate` DATE NOT NULL,
    `dueDate` DATE NOT NULL,
    `tblLibraryCard1id` INT(10) NOT NULL,
    `tblStaff1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_borrow_card` FOREIGN KEY (`tblLibraryCard1id`) REFERENCES `tblLibraryCard1`(`id`),
    CONSTRAINT `fk_borrow_staff` FOREIGN KEY (`tblStaff1id`) REFERENCES `tblStaff1`(`tblMember1id`)
) ENGINE=InnoDB;

-- 7. Bảng Chi tiết phiếu mượn
CREATE TABLE `tblBorrowDetail1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `quantity` INT(10) NOT NULL,
    `tblBorrowSlip1id` INT(10) NOT NULL,
    `tblDocument1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_detail_slip` FOREIGN KEY (`tblBorrowSlip1id`) REFERENCES `tblBorrowSlip1`(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_detail_doc` FOREIGN KEY (`tblDocument1id`) REFERENCES `tblDocument1`(`id`)
) ENGINE=InnoDB;

-- 8. Bảng Phiếu trả
CREATE TABLE `tblReturnSlip1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `returnDate` DATE NOT NULL,
    `totalFineAmount` DECIMAL(12,2) NOT NULL,
    `tblBorrowSlip1id` INT(10) NOT NULL,
    `tblStaff1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_return_borrow` FOREIGN KEY (`tblBorrowSlip1id`) REFERENCES `tblBorrowSlip1`(`id`),
    CONSTRAINT `fk_return_staff` FOREIGN KEY (`tblStaff1id`) REFERENCES `tblStaff1`(`tblMember1id`)
) ENGINE=InnoDB;

-- 9. Bảng Chi tiết phiếu trả
CREATE TABLE `tblReturnDetail1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `quantity` INT(10) NOT NULL,
    `bookCondition` VARCHAR(100) NOT NULL,
    `fineAmount` DECIMAL(12,2) NOT NULL,
    `tblReturnSlip1id` INT(10) NOT NULL,
    `tblDocument1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_retdetail_slip` FOREIGN KEY (`tblReturnSlip1id`) REFERENCES `tblReturnSlip1`(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_retdetail_doc` FOREIGN KEY (`tblDocument1id`) REFERENCES `tblDocument1`(`id`)
) ENGINE=InnoDB;

-- 10. Bảng Nhà cung cấp
CREATE TABLE `tblSupplier1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(150) NOT NULL,
    `address` VARCHAR(255) NULL,
    `phoneNumber` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- 11. Bảng Phiếu nhập
CREATE TABLE `tblImportSlip1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `importDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `totalAmount` DECIMAL(15,2) NOT NULL,
    `tblSupplier1id` INT(10) NOT NULL,
    `tblStaff1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_import_supplier` FOREIGN KEY (`tblSupplier1id`) REFERENCES `tblSupplier1`(`id`),
    CONSTRAINT `fk_import_staff` FOREIGN KEY (`tblStaff1id`) REFERENCES `tblStaff1`(`tblMember1id`)
) ENGINE=InnoDB;

-- 12. Bảng Chi tiết phiếu nhập
CREATE TABLE `tblImportDetail1` (
    `id` INT(10) NOT NULL AUTO_INCREMENT,
    `quantity` INT(10) NOT NULL,
    `unitPrice` DECIMAL(12,2) NOT NULL,
    `amount` DECIMAL(15,2) NOT NULL,
    `tblImportSlip1id` INT(10) NOT NULL,
    `tblDocument1id` INT(10) NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_impdetail_slip` FOREIGN KEY (`tblImportSlip1id`) REFERENCES `tblImportSlip1`(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_impdetail_doc` FOREIGN KEY (`tblDocument1id`) REFERENCES `tblDocument1`(`id`)
) ENGINE=InnoDB;

-- =========================================================================
-- DỮ LIỆU MẪU KHỚP KỊCH BẢN BÁO CÁO
-- =========================================================================
INSERT INTO `tblMember1` (`id`, `username`, `password`, `name`, `DOB`, `address`, `email`, `phoneNumber`, `role`) VALUES
(1, 'B23DCAT021', '123456', 'Trần Việt Anh', '2005-05-19', 'Hà Nội', 'vietanh@ptit.edu.vn', '0912345678', 'Reader'),
(2, 'B23DCCN001', '123456', 'Nguyễn Văn A', '2005-01-10', 'Hà Nội', 'vana@ptit.edu.vn', '0987654321', 'Reader'),
(3, 'GV002', '123456', 'Lê Thị B', '1985-08-20', 'Hà Nội', 'thib@ptit.edu.vn', '0909112233', 'Reader'),
(4, 'hienle', '123456', 'Hiền Lê', '1990-03-15', 'Hà Nội', 'hienle@ptit.edu.vn', '0911223344', 'Librarian'),
(5, 'admin_ql', '123456', 'Đỗ Thị Bích Ngọc', '1980-11-20', 'Hà Nội', 'ngocdtb@ptit.edu.vn', '0933445566', 'Manager');

INSERT INTO `tblReader1` (`tblMember1id`, `readerType`, `department`) VALUES
(1, 'Sinh viên', 'An toàn thông tin'),
(2, 'Sinh viên', 'Công nghệ thông tin'),
(3, 'Giảng viên', 'Cơ bản 1');

INSERT INTO `tblStaff1` (`tblMember1id`, `position`) VALUES
(4, 'Thủ thư'),
(5, 'Quản lý thư viện');

INSERT INTO `tblLibraryCard1` (`id`, `issueDate`, `expiryDate`, `status`, `tblReader1id`) VALUES
(1, '2023-09-01', '2027-09-01', 'Active', 1),
(2, '2023-09-01', '2027-09-01', 'Active', 2),
(3, '2020-09-01', '2030-09-01', 'Active', 3);

INSERT INTO `tblDocument1` (`id`, `title`, `author`, `category`, `publisher`, `documentType`, `publishYear`, `stockQuantity`, `price`, `description`) VALUES
(1, 'Giáo trình Công nghệ phần mềm', 'Nguyễn Mạnh Hùng', 'Giáo trình', 'Bưu điện', 'Giáo trình', 2020, 15, 55000, 'Giáo trình CNPM học viện PTIT'),
(2, 'Mạng máy tính căn bản', 'Đỗ Thị Bích Ngọc', 'Giáo trình', 'Bưu điện', 'Giáo trình', 2020, 12, 48000, 'Tài liệu mạng máy tính'),
(3, 'An toàn hệ điều hành', 'Đinh Trường Duy', 'Giáo trình', 'Bưu điện', 'Giáo trình', 2022, 10, 60000, 'Giáo trình ATTT'),
(5, 'Phân tích thiết kế HTTT', 'Đỗ Thị Bích Ngọc', 'Sách', 'Bưu điện', 'Sách chuyên khảo', 2021, 8, 65000, 'Tài liệu PTTK hệ thống');

INSERT INTO `tblBorrowSlip1` (`id`, `borrowDate`, `dueDate`, `tblLibraryCard1id`, `tblStaff1id`) VALUES
(101, '2026-01-10', '2026-01-24', 1, 4),
(215, '2026-02-15', '2026-03-01', 1, 4),
(301, '2026-01-12', '2026-01-26', 2, 4);

INSERT INTO `tblBorrowDetail1` (`id`, `quantity`, `tblBorrowSlip1id`, `tblDocument1id`) VALUES
(1, 1, 101, 1),
(2, 1, 101, 2),
(3, 1, 101, 3),
(4, 2, 215, 5),
(5, 1, 301, 1);

INSERT INTO `tblReturnSlip1` (`id`, `returnDate`, `totalFineAmount`, `tblBorrowSlip1id`, `tblStaff1id`) VALUES
(1, '2026-01-26', 10000, 101, 4);

INSERT INTO `tblReturnDetail1` (`id`, `quantity`, `bookCondition`, `fineAmount`, `tblReturnSlip1id`, `tblDocument1id`) VALUES
(1, 1, 'Bình thường', 0, 1, 1),
(2, 1, 'Bình thường', 0, 1, 2),
(3, 1, 'Quá hạn 2 ngày', 10000, 1, 3);