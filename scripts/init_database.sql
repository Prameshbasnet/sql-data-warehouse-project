-- Switch to the master database to perform database-level operations
USE master;
GO 

-- Check if a database named 'DataWarehouse' already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Set the database to SINGLE_USER mode and rollback any open transactions
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the existing 'DataWarehouse' database
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a new database named 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created 'DataWarehouse' database
USE DataWarehouse;
GO

-- Create schema 'bronze' to represent raw/ingested data
CREATE SCHEMA bronze;
GO

-- Create schema 'silver' to represent cleansed/transformed data
CREATE SCHEMA silver;
GO

-- Create schema 'gold' to represent aggregated/curated data for analytics
CREATE SCHEMA gold;
GO
