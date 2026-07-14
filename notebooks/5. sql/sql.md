
---

## 🔍 Verify SQL Server is Working

### Check Service Status

```bash
sudo systemctl status mssql-server --no-pager
```

### Test Connection

```bash
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT @@VERSION"
```

### List Databases

```bash
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT name FROM sys.databases"
```

### Create a Test Database

```bash
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "CREATE DATABASE TestDB"
```

---

## 📝 Important Note About SQL Server Version

You're running **SQL Server 2022**, not 2025. SQL Server 2025 is not yet officially released. The repository you added was for SQL Server 2022.

### If You Want SQL Server 2025 (When Available)

When Microsoft releases SQL Server 2025, you can upgrade with:

```bash
# Remove current installation
sudo systemctl stop mssql-server
sudo apt-get remove --purge -y mssql-server

# Add SQL Server 2025 repository (when available)
curl -fsSL https://packages.microsoft.com/config/ubuntu/24.04/mssql-server-2025.list | sudo tee /etc/apt/sources.list.d/mssql-server-2025.list

# Install
sudo apt-get update
sudo apt-get install -y mssql-server

# Configure
sudo /opt/mssql/bin/mssql-conf setup
```

---

## 📋 SQL Server 2022 Management Commands

### Service Management

```bash
# Check status
sudo systemctl status mssql-server --no-pager

# Start
sudo systemctl start mssql-server

# Stop
sudo systemctl stop mssql-server

# Restart
sudo systemctl restart mssql-server
```

### Connect and Query

```bash
# Connect interactively
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C

# Run a query
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT @@VERSION"

# Create a database
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "CREATE DATABASE MyDB"

# List databases
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT name FROM sys.databases"
```

### View Logs

```bash
# View error log
sudo tail -f /var/opt/mssql/log/errorlog

# View system journal
sudo journalctl -xeu mssql-server.service --since "5 minutes ago"
```

### Check Port

```bash
sudo ss -tulpn | grep 1433
```

---

## 📊 Quick Reference Card

```bash
# ── Service ──
sudo systemctl status mssql-server --no-pager
sudo systemctl start mssql-server
sudo systemctl stop mssql-server
sudo systemctl restart mssql-server

# ── Connect ──
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C

# ── Query ──
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT @@VERSION"

# ── Create DB ──
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "CREATE DATABASE MyDB"

# ── List DBs ──
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT name FROM sys.databases"

# ── Logs ──
sudo tail -f /var/opt/mssql/log/errorlog

# ── Port ──
sudo ss -tulpn | grep 1433
```

---


## 🔍 Step 1: Check Your SQL Server Version

### Check Version

```sql
SELECT @@VERSION;
GO
```

### Check Version with Server Property

```sql
SELECT 
    SERVERPROPERTY('ProductVersion') AS Version,
    SERVERPROPERTY('ProductLevel') AS Level,
    SERVERPROPERTY('Edition') AS Edition;
GO
```

### Check Build Number

```sql
SELECT 
    SERVERPROPERTY('ProductVersion') AS ProductVersion,
    SERVERPROPERTY('ProductMajorVersion') AS MajorVersion,
    SERVERPROPERTY('ProductMinorVersion') AS MinorVersion;
GO
```

---

## 📊 Basic Commands (Beginner Level)

### Database Operations

```sql
-- List all databases
SELECT name FROM sys.databases;
GO

-- Create a new database
CREATE DATABASE MyDatabase;
GO

-- Use/switch to a database
USE MyDatabase;
GO

-- Drop/delete a database
DROP DATABASE MyDatabase;
GO

-- Check database size
EXEC sp_spaceused;
GO
```

### Table Operations

```sql
-- Create a table
CREATE TABLE Employees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    Salary DECIMAL(18,2),
    HireDate DATE DEFAULT GETDATE()
);
GO

-- List all tables
SELECT name FROM sysobjects WHERE xtype='U';
GO

-- Describe table structure
EXEC sp_help 'Employees';
GO

-- Drop table
DROP TABLE Employees;
GO
```

### CRUD Operations

```sql
-- INSERT data
INSERT INTO Employees (Name, Position, Salary) 
VALUES ('John Doe', 'Developer', 75000);
GO

-- INSERT multiple rows
INSERT INTO Employees (Name, Position, Salary) VALUES 
('Jane Smith', 'Manager', 95000),
('Bob Johnson', 'Designer', 65000);
GO

-- SELECT data
SELECT * FROM Employees;
GO

-- SELECT with conditions
SELECT * FROM Employees WHERE Salary > 70000;
GO

-- UPDATE data
UPDATE Employees SET Salary = 80000 WHERE Name = 'John Doe';
GO

-- DELETE data
DELETE FROM Employees WHERE Name = 'Bob Johnson';
GO
```

---

## 📈 Medium Commands (Intermediate Level)

### Advanced Queries

```sql
-- JOIN two tables
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentId = d.Id;
GO

-- LEFT JOIN
SELECT e.Name, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentId = d.Id;
GO

-- Subquery
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
GO

-- Group by with aggregation
SELECT Position, COUNT(*) AS Count, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Position;
GO

-- HAVING clause
SELECT Position, COUNT(*) AS Count
FROM Employees
GROUP BY Position
HAVING COUNT(*) > 1;
GO

-- ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC;
GO

-- TOP/LIMIT
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;
GO

-- DISTINCT
SELECT DISTINCT Position FROM Employees;
GO
```

### Views and Stored Procedures

```sql
-- Create a view
CREATE VIEW HighSalaryEmployees AS
SELECT Name, Position, Salary
FROM Employees
WHERE Salary > 70000;
GO

-- Query a view
SELECT * FROM HighSalaryEmployees;
GO

-- Create a stored procedure
CREATE PROCEDURE GetEmployeesByPosition
    @Position VARCHAR(100)
AS
BEGIN
    SELECT * FROM Employees WHERE Position = @Position;
END
GO

-- Execute stored procedure
EXEC GetEmployeesByPosition 'Developer';
GO

-- Create a stored procedure with output parameter
CREATE PROCEDURE GetEmployeeCount
    @Position VARCHAR(100),
    @Count INT OUTPUT
AS
BEGIN
    SELECT @Count = COUNT(*) FROM Employees WHERE Position = @Position;
END
GO
```

### Indexes

```sql
-- Create an index
CREATE INDEX idx_employee_name ON Employees(Name);
GO

-- Create a unique index
CREATE UNIQUE INDEX idx_employee_id ON Employees(Id);
GO

-- List all indexes
EXEC sp_helpindex 'Employees';
GO

-- Drop an index
DROP INDEX idx_employee_name ON Employees;
GO
```

### Constraints

```sql
-- Add a constraint
ALTER TABLE Employees ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
GO

-- Add a default constraint
ALTER TABLE Employees ADD CONSTRAINT DF_HireDate DEFAULT GETDATE() FOR HireDate;
GO

-- Add a foreign key
ALTER TABLE Employees ADD CONSTRAINT FK_DepartmentId 
FOREIGN KEY (DepartmentId) REFERENCES Departments(Id);
GO

-- Drop a constraint
ALTER TABLE Employees DROP CONSTRAINT CHK_Salary;
GO
```

### Transactions

```sql
-- Begin a transaction
BEGIN TRANSACTION;

-- Perform operations
UPDATE Employees SET Salary = 80000 WHERE Name = 'John Doe';
INSERT INTO Employees (Name, Position, Salary) VALUES ('New Employee', 'Intern', 40000);

-- Commit if successful
COMMIT TRANSACTION;

-- Or rollback if there's an error
ROLLBACK TRANSACTION;
GO
```

---

## 🚀 Advanced Commands (Expert Level)

### Window Functions

```sql
-- ROW_NUMBER
SELECT 
    Name, 
    Position, 
    Salary,
    ROW_NUMBER() OVER (PARTITION BY Position ORDER BY Salary DESC) AS Rank
FROM Employees;
GO

-- RANK
SELECT 
    Name, 
    Position, 
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
GO

-- DENSE_RANK
SELECT 
    Name, 
    Position, 
    Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank
FROM Employees;
GO

-- NTILE (quartiles)
SELECT 
    Name, 
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC) AS Quartile
FROM Employees;
GO

-- LAG and LEAD
SELECT 
    Name, 
    Salary,
    LAG(Salary, 1, 0) OVER (ORDER BY Salary) AS PreviousSalary,
    LEAD(Salary, 1, 0) OVER (ORDER BY Salary) AS NextSalary
FROM Employees;
GO
```

### Common Table Expressions (CTE)

```sql
-- Basic CTE
WITH EmployeeCTE AS (
    SELECT Name, Position, Salary
    FROM Employees
    WHERE Salary > 50000
)
SELECT * FROM EmployeeCTE;
GO

-- Recursive CTE
WITH EmployeeHierarchy AS (
    SELECT Id, Name, ManagerId, 0 AS Level
    FROM Employees
    WHERE ManagerId IS NULL
    UNION ALL
    SELECT e.Id, e.Name, e.ManagerId, eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerId = eh.Id
)
SELECT * FROM EmployeeHierarchy;
GO
```

### JSON Operations

```sql
-- Create table for JSON data
CREATE TABLE JsonData (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Data NVARCHAR(MAX)
);
GO

-- Insert JSON
INSERT INTO JsonData (Data) VALUES 
('{"name":"John","age":30,"city":"New York"}'),
('{"name":"Jane","age":25,"city":"Boston"}');
GO

-- Query JSON
SELECT
    JSON_VALUE(Data, '$.name') AS Name,
    JSON_VALUE(Data, '$.age') AS Age,
    JSON_QUERY(Data, '$.city') AS City
FROM JsonData;
GO

-- Update JSON
UPDATE JsonData
SET Data = JSON_MODIFY(Data, '$.age', 31)
WHERE JSON_VALUE(Data, '$.name') = 'John';
GO
```

### Dynamic SQL

```sql
-- Dynamic SQL with parameters
DECLARE @TableName NVARCHAR(100) = 'Employees';
DECLARE @SQL NVARCHAR(MAX);

SET @SQL = 'SELECT * FROM ' + @TableName;
EXEC sp_executesql @SQL;
GO
```

### Performance Tuning

```sql
-- Query execution plan
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- Analyze a query
SELECT * FROM Employees WHERE Salary > 50000;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- Check running queries
SELECT
    session_id,
    status,
    command,
    blocking_session_id,
    wait_type,
    wait_time,
    cpu_time,
    total_elapsed_time
FROM sys.dm_exec_requests;
GO
```

### Backup and Restore

```sql
-- Create a backup
BACKUP DATABASE MyDatabase TO DISK = '/var/opt/mssql/backup/MyDatabase.bak';
GO

-- Restore a database
RESTORE DATABASE MyDatabase FROM DISK = '/var/opt/mssql/backup/MyDatabase.bak';
GO

-- Backup with compression
BACKUP DATABASE MyDatabase TO DISK = '/var/opt/mssql/backup/MyDatabase.bak' WITH COMPRESSION;
GO
```

### User Management

```sql
-- Create a login
CREATE LOGIN app_user WITH PASSWORD = 'UserPassword123!';
GO

-- Create a database user
USE MyDatabase;
GO
CREATE USER app_user FOR LOGIN app_user;
GO

-- Grant permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO app_user;
GO

-- Grant execute permission
GRANT EXECUTE ON GetEmployeesByPosition TO app_user;
GO

-- Revoke permissions
REVOKE DELETE ON Employees FROM app_user;
GO

-- Grant admin role
ALTER ROLE db_owner ADD MEMBER app_user;
GO
```

### System Monitoring

```sql
-- Check database size
SELECT
    name,
    size/128.0 AS SizeMB
FROM sys.master_files;
GO

-- Check connections
SELECT
    session_id,
    login_name,
    status,
    program_name,
    host_name
FROM sys.dm_exec_sessions;
GO

-- Check memory usage
SELECT
    total_physical_memory_kb/1024/1024 AS TotalMemoryGB,
    available_physical_memory_kb/1024/1024 AS AvailableMemoryGB
FROM sys.dm_os_sys_memory;
GO

-- Check CPU usage
SELECT TOP 10
    total_worker_time/1000000 AS CPU_Seconds,
    total_elapsed_time/1000000 AS Elapsed_Seconds,
    execution_count,
    query_hash,
    SUBSTRING(st.text, (qs.statement_start_offset/2)+1,
        ((CASE qs.statement_end_offset
            WHEN -1 THEN DATALENGTH(st.text)
            ELSE qs.statement_end_offset
        END - qs.statement_start_offset)/2) + 1) AS query_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY total_worker_time DESC;
GO
```

---

## 🐍 Connect from Other Languages

### Python

```python
import pyodbc

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 18 for SQL Server};'
    'SERVER=localhost,1433;'
    'UID=SA;'
    'PWD=@Nuj2685SQL;'
    'TrustServerCertificate=yes;'
)

cursor = conn.cursor()
cursor.execute("SELECT @@VERSION")
row = cursor.fetchone()
print(row[0])
conn.close()
```

### Node.js

```javascript
const sql = require('mssql');

const config = {
    user: 'SA',
    password: '@Nuj2685SQL',
    server: 'localhost',
    port: 1433,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

async function getVersion() {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query('SELECT @@VERSION');
        console.log(result.recordset);
    } catch (err) {
        console.error(err);
    }
}
getVersion();
```

### Command Line (sqlcmd)

```bash
# Basic connection
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C

# Run a query
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT @@VERSION"

# Run a query with output to file
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -Q "SELECT * FROM Employees" -o output.txt

# Execute a SQL script file
sqlcmd -S localhost -U SA -P '@Nuj2685SQL' -C -i /path/to/script.sql
```

---

## 📊 Quick Reference Card

### Basic Commands

```sql
SELECT @@VERSION; GO
SELECT name FROM sys.databases; GO
CREATE DATABASE MyDB; GO
USE MyDB; GO
CREATE TABLE TableName (Id INT, Name VARCHAR(100)); GO
INSERT INTO TableName VALUES (1, 'Name'); GO
SELECT * FROM TableName; GO
UPDATE TableName SET Name = 'NewName' WHERE Id = 1; GO
DELETE FROM TableName WHERE Id = 1; GO
DROP TABLE TableName; GO
DROP DATABASE MyDB; GO
```

### Medium Commands

```sql
SELECT * FROM Table1 INNER JOIN Table2 ON Table1.Id = Table2.Id; GO
SELECT Column1, COUNT(*) FROM Table GROUP BY Column1; GO
CREATE VIEW ViewName AS SELECT * FROM Table; GO
CREATE PROC ProcName AS BEGIN SELECT * FROM Table END; GO
CREATE INDEX idx_name ON Table(Column); GO
BEGIN TRANSACTION; ... COMMIT/ROLLBACK; GO
```

### Advanced Commands

```sql
ROW_NUMBER() OVER (PARTITION BY Column ORDER BY Column) AS RowNum; GO
WITH CTE AS (SELECT * FROM Table) SELECT * FROM CTE; GO
JSON_VALUE(Data, '$.key') AS Value; GO
BACKUP DATABASE MyDB TO DISK = '/path/backup.bak'; GO
CREATE LOGIN user WITH PASSWORD = 'pass'; GO
GRANT SELECT ON Table TO user; GO
```

---

## ✅ Summary

| Category | What You Can Do |
|----------|-----------------|
| **Basic** | Create DBs/tables, CRUD operations, simple queries |
| **Medium** | Joins, views, stored procedures, indexes, transactions |
| **Advanced** | Window functions, CTEs, JSON, dynamic SQL, performance tuning |

---
