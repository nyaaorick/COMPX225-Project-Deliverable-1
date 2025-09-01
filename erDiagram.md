erDiagram
    CUSTOMER {
        int CustomerID PK
        string FirstName
        string LastName
        string Email
        string Phone
    }

    BRANCH {
        int BranchID PK
        string LocationName
        string Address
        string Phone
        int ManagerID FK
    }

    STAFF {
        int StaffID PK
        string FirstName
        string LastName
        string Role
        int BranchID FK
    }

    CATEGORY {
        int CategoryID PK
        string CategoryName
    }

    COSTUME_TYPE {
        int CostumeTypeID PK
        string Name
        string Description
        string ItemType
        string Size
        decimal HirePrice
        int CategoryID FK
    }

    COSTUME_INSTANCE {
        int CostumeID PK
        string Condition
        string Status
        int CostumeTypeID FK
        int BranchID FK
    }

    RENTAL {
        int RentalID PK
        date RentalDate
        date DueDate
        date ReturnDate
        decimal TotalCost
        string Status
        int CustomerID FK
        int CostumeID FK
        int StaffID FK
    }

    REPAIR {
        int RepairID PK
        date RepairDate
        string DamageDescription
        decimal RepairFee
        int RentalID FK
        int StaffID FK
    }


    BRANCH }|--|| STAFF : "employs (1,*) / employed by (1,1)"
    BRANCH ||--|o STAFF : "managed by (1,1) / is manager of (0,1)"

    CUSTOMER }o--|| RENTAL : "makes (0,*) / made by (1,1)"
    BRANCH }o--|| COSTUME_INSTANCE : "houses (0,*) / housed in (1,1)"
    STAFF }o--|| RENTAL : "processes (0,*) / processed by (1,1)"
    STAFF }o--|| REPAIR : "performs (0,*) / performed by (1,1)"
    CATEGORY }o--|| COSTUME_TYPE : "contains (0,*) / contained in (1,1)"
    COSTUME_TYPE }|--|| COSTUME_INSTANCE : "has (1,*) / is instance of (1,1)"
    COSTUME_INSTANCE }o--|| RENTAL : "is part of (0,*) / includes (1,1)"
    RENTAL |o--|| REPAIR : "results in (0,1) / results from (1,1)"