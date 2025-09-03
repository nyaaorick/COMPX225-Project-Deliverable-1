
INSERT INTO CUSTOMER (FirstName, LastName, Email, Phone) VALUES
('Alice', 'Johnson', 'alice.j@email.com', '021-123-4567'),
('Bob', 'Williams', 'bob.w@email.com', '022-987-6543'),
('Charlie', 'Brown', 'charlie.b@email.com', '027-555-1234'),
('Diana', 'Miller', 'diana.m@email.com', '021-888-9999');


INSERT INTO CATEGORY (CategoryName) VALUES
('Movies'),
('Historical'),
('Halloween'),
('Video Games');


INSERT INTO BRANCH (LocationName, Address, Phone, ManagerID) VALUES
('Hamilton CBD', '123 Victoria Street, Hamilton', '07-839-1234', NULL),
('Tauranga Central', '456 The Strand, Tauranga', '07-578-5678', NULL),
('Rotorua Lakefront', '789 Tutanekai Street, Rotorua', '07-348-9012', NULL),
('Hamilton East', '321 Grey Street, Hamilton', '07-856-4321', NULL);


INSERT INTO STAFF (FirstName, LastName, Role, BranchID) VALUES
('Eve', 'Davis', 'Manager', 1),    -- StaffID 1, Hamilton CBD Manager
('Frank', 'Green', 'Staff', 1),      -- StaffID 2, Hamilton CBD Staff
('Grace', 'Harris', 'Manager', 2),  -- StaffID 3, Tauranga Central Manager
('Henry', 'Clark', 'Staff', 2);      -- StaffID 4, Tauranga Central Staff


UPDATE BRANCH SET ManagerID = 1 WHERE BranchID = 1;
UPDATE BRANCH SET ManagerID = 3 WHERE BranchID = 2;


INSERT INTO COSTUME_TYPE (Name, Description, ItemType, Size, HirePrice, CategoryID) VALUES
('Deluxe Batman Costume', 'High-quality Batman suit from "The Dark Knight". Includes cape and cowl.', 'Suit', 'Adult Large', 75.00, 1),
('Queen Elizabeth I Gown', 'A regal and historically accurate gown.', 'Dress', 'Adult Medium', 90.00, 2),
('Vampire Lord Cape', 'A long, flowing black and red cape, perfect for a classic vampire look.', 'Robe', 'One Size Fits All', 40.00, 3),
('Super Mario Jumpsuit', 'Iconic blue overalls with a red shirt, hat, and mustache.', 'Suit', 'Adult Medium', 55.00, 4);


INSERT INTO COSTUME_INSTANCE (`Condition`, Status, CostumeTypeID, BranchID) VALUES
('New', 'Available', 1, 1),   -- Batman in Hamilton CBD
('Good', 'Available', 2, 2),  -- Queen Elizabeth in Tauranga
('Good', 'Hired', 3, 1),      -- Vampire Cape in Hamilton CBD (currently hired)
('Damaged', 'Available', 4, 2); -- Super Mario in Tauranga (damaged but available)

INSERT INTO RENTAL (RentalDate, DueDate, ReturnDate, TotalCost, Status, CustomerID, CostumeID, StaffID) VALUES
('2025-09-01', '2025-09-04', NULL, 40.00, 'Active', 1, 3, 2), -- Alice rents Vampire Cape, processed by Frank
('2025-08-20', '2025-08-22', '2025-08-22', 75.00, 'Returned', 2, 1, 2), -- Bob rented Batman, processed by Frank
('2025-09-02', '2025-09-09', NULL, 55.00, 'Booked', 3, 4, 4), -- Charlie books Super Mario, processed by Henry
('2025-08-15', '2025-08-18', '2025-08-19', 95.00, 'Overdue', 4, 2, 4); -- Diana returned Queen Gown late, processed by Henry


INSERT INTO REPAIR (RepairDate, DamageDescription, RepairFee, RentalID, StaffID) VALUES
('2025-08-20', 'Customer Diana Miller returned the gown with a tear. Charged repair fee.', 30.00, 4, 4), -- Repair for Diana's rental, done by Henry
('2025-08-23', 'Minor stitching came loose on the sleeve after Bob William''s rental. No charge to customer.', 0.00, 2, 2),
('2024-12-10', 'Large stain on the front of the cape. Required professional cleaning and repair.', 50.00, 1, 2),
('2025-01-05', 'The mustache accessory was lost. Customer was charged for a replacement.', 15.00, 3, 4);



-- SELECT * FROM CUSTOMER;
-- SELECT * FROM CATEGORY;
-- SELECT * FROM BRANCH;
-- SELECT * FROM STAFF;
-- SELECT * FROM COSTUME_TYPE;
-- SELECT * FROM COSTUME_INSTANCE;
-- SELECT * FROM RENTAL;
-- SELECT * FROM REPAIR;