CREATE DATABASE IF NOT EXISTS KiwiKloset;
USE KiwiKloset;

DROP TABLE IF EXISTS REPAIR, RENTAL, COSTUME_INSTANCE, COSTUME_TYPE, CATEGORY, STAFF, BRANCH, CUSTOMER;

-- -----------------------------------------------------
-- Table `CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE CUSTOMER (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  Phone VARCHAR(50) NOT NULL
);

-- -----------------------------------------------------
-- Table `CATEGORY`
-- -----------------------------------------------------
CREATE TABLE CATEGORY (
  CategoryID INT PRIMARY KEY AUTO_INCREMENT,
  CategoryName VARCHAR(255) NOT NULL UNIQUE
);

-- -----------------------------------------------------
-- Table `BRANCH`
-- -----------------------------------------------------
CREATE TABLE BRANCH (
  BranchID INT PRIMARY KEY AUTO_INCREMENT,
  LocationName VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Phone VARCHAR(50) NOT NULL,
  ManagerID INT NULL
);

-- -----------------------------------------------------
-- Table `STAFF`
-- -----------------------------------------------------
CREATE TABLE STAFF (
  StaffID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  Role ENUM('Staff', 'Manager') NOT NULL,
  BranchID INT NOT NULL,
  CONSTRAINT fk_Staff_Branch
    FOREIGN KEY (BranchID)
    REFERENCES BRANCH (BranchID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Adding the FOREIGN KEY constraint for BRANCH.ManagerID
-- -----------------------------------------------------
ALTER TABLE BRANCH
ADD CONSTRAINT fk_Branch_Manager
FOREIGN KEY (ManagerID)
REFERENCES STAFF (StaffID)
ON DELETE SET NULL
ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table `COSTUME_TYPE`
-- -----------------------------------------------------
CREATE TABLE COSTUME_TYPE (
  CostumeTypeID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Description TEXT,
  ItemType ENUM('Suit', 'Dress', 'Wig', 'Robe', 'Accessory') NOT NULL,
  Size VARCHAR(50),
  HirePrice DECIMAL(10, 2) NOT NULL,
  CategoryID INT NOT NULL,
  CONSTRAINT fk_CostumeType_Category
    FOREIGN KEY (CategoryID)
    REFERENCES CATEGORY (CategoryID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT chk_HirePrice CHECK (HirePrice >= 0)
);


-- -----------------------------------------------------
-- Table `COSTUME_INSTANCE`
-- -----------------------------------------------------
CREATE TABLE COSTUME_INSTANCE (
  CostumeID INT PRIMARY KEY AUTO_INCREMENT,
  `Condition` ENUM('New', 'Good', 'Damaged', 'Under Repair') NOT NULL,
  Status ENUM('Available', 'Hired', 'Cleaning') NOT NULL,
  CostumeTypeID INT NOT NULL,
  BranchID INT NOT NULL,
  CONSTRAINT fk_CostumeInstance_CostumeType
    FOREIGN KEY (CostumeTypeID)
    REFERENCES COSTUME_TYPE (CostumeTypeID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_CostumeInstance_Branch
    FOREIGN KEY (BranchID)
    REFERENCES BRANCH (BranchID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `RENTAL`
-- -----------------------------------------------------
CREATE TABLE RENTAL (
  RentalID INT PRIMARY KEY AUTO_INCREMENT,
  RentalDate DATE NOT NULL,
  DueDate DATE NOT NULL,
  ReturnDate DATE NULL,
  TotalCost DECIMAL(10, 2) NOT NULL,
  Status ENUM('Booked', 'Active', 'Returned', 'Overdue') NOT NULL,
  CustomerID INT NOT NULL,
  CostumeID INT NOT NULL,
  StaffID INT NOT NULL,
  CONSTRAINT fk_Rental_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES CUSTOMER (CustomerID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Rental_CostumeInstance
    FOREIGN KEY (CostumeID)
    REFERENCES COSTUME_INSTANCE (CostumeID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Rental_Staff
    FOREIGN KEY (StaffID)
    REFERENCES STAFF (StaffID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `REPAIR`
-- -----------------------------------------------------
CREATE TABLE REPAIR (
  RepairID INT PRIMARY KEY AUTO_INCREMENT,
  RepairDate DATE NOT NULL,
  DamageDescription TEXT NOT NULL,
  RepairFee DECIMAL(10, 2) NOT NULL,
  RentalID INT NOT NULL,
  StaffID INT NOT NULL,
  CONSTRAINT fk_Repair_Rental
    FOREIGN KEY (RentalID)
    REFERENCES RENTAL (RentalID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_Repair_Staff
    FOREIGN KEY (StaffID)
    REFERENCES STAFF (StaffID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT chk_RepairFee CHECK (RepairFee >= 0)
);