

**CUSTOMER** (\<u\>CustomerID\</u\>, FirstName, LastName, Email, Phone)

  * **Foreign Keys**: None

-----

**BRANCH** (\<u\>BranchID\</u\>, LocationName, Address, Phone, **ManagerID**)

  * **Foreign Keys**:
      * **`ManagerID` references STAFF(`StaffID`)**

-----

**STAFF** (\<u\>StaffID\</u\>, FirstName, LastName, Role, BranchID)

  * **Foreign Keys**:
      * `BranchID` references BRANCH(`BranchID`)

-----

**CATEGORY** (\<u\>CategoryID\</u\>, CategoryName)

  * **Foreign Keys**: None

-----

**COSTUME\_TYPE** (\<u\>CostumeTypeID\</u\>, Name, Description, **ItemType**, Size, HirePrice, CategoryID)

  * **Foreign Keys**:
      * `CategoryID` references CATEGORY(`CategoryID`)

-----

**COSTUME\_INSTANCE** (\<u\>CostumeID\</u\>, Condition, Status, CostumeTypeID, BranchID)

  * **Foreign Keys**:
      * `CostumeTypeID` references COSTUME\_TYPE(`CostumeTypeID`)
      * `BranchID` references BRANCH(`BranchID`)

-----

**RENTAL** (\<u\>RentalID\</u\>, RentalDate, DueDate, ReturnDate, TotalCost, Status, CustomerID, CostumeID, StaffID)

  * **Foreign Keys**:
      * `CustomerID` references CUSTOMER(`CustomerID`)
      * `CostumeID` references COSTUME\_INSTANCE(`CostumeID`)
      * `StaffID` references STAFF(`StaffID`)

-----

**REPAIR** (\<u\>RepairID\</u\>, RepairDate, DamageDescription, RepairFee, RentalID, StaffID)

  * **Foreign Keys**:
      * `RentalID` references RENTAL(`RentalID`)
      * `StaffID` references STAFF(`StaffID`)