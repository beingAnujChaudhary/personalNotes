## 🗄️ SQL Server 2025 Complete Workflow Guide (Docker)

Here's your complete end-to-end guide for managing SQL Server 2025 in Docker on Ubuntu/WSL.

---

## 📋 Table of Contents

1. [Start SQL Server](#1-start-sql-server)
2. [Connect and Run Queries](#2-connect-and-run-queries)
3. [Save Queries to Files](#3-save-queries-to-files)
4. [Run Saved Query Files](#4-run-saved-query-files)
5. [View and Manage Data](#5-view-and-manage-data)
6. [Stop and Check Status](#6-stop-and-check-status)
7. [Quick Reference](#-quick-reference)

---

## 1. Start SQL Server

### Check if SQL Server is Running

```bash
# Check running containers
docker ps

# Check all containers (including stopped)
docker ps -a
```

### Start SQL Server

```bash
# If container exists but is stopped
docker start sqlserver2025

# If container doesn't exist, create it
docker run -e "ACCEPT_EULA=Y" \
   -e "MSSQL_SA_PASSWORD=MyStrongPassword123!" \
   -p 1433:1433 \
   --name sqlserver2025 \
   -d mcr.microsoft.com/mssql/server:2025-latest

# Wait for initialization
sleep 15

# Verify it's running
docker ps
```

### Check Logs

```bash
# View startup logs
docker logs sqlserver2025

# Follow logs in real-time (Ctrl+C to exit)
docker logs -f sqlserver2025
```

---

## 2. Connect and Run Queries

### Connect to SQL Server

```bash
# Enter interactive SQL session
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C
```

**You'll see:** `1>`

### Run SQL Commands

```sql
-- Check SQL Server version
SELECT @@VERSION;
GO

-- List all databases
SELECT name FROM sys.databases;
GO

-- Create a new database
CREATE DATABASE MyDatabase;
GO

-- Switch to the database
USE MyDatabase;
GO

-- Create a table
CREATE TABLE Employees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(100),
    Salary DECIMAL(18,2),
    HireDate DATE DEFAULT GETDATE()
);
GO

-- Insert sample data
INSERT INTO Employees (Name, Position, Salary) 
VALUES ('John Doe', 'Developer', 75000);
GO

INSERT INTO Employees (Name, Position, Salary) 
VALUES ('Jane Smith', 'Manager', 95000);
GO

INSERT INTO Employees (Name, Position, Salary) 
VALUES ('Bob Johnson', 'Designer', 65000);
GO

-- Query data
SELECT * FROM Employees;
GO

-- Exit SQL session
QUIT
```

---

## 3. Save Queries to Files

### Create a SQL Script File

```bash
# Create a SQL script file
nano ~/my_queries.sql
```

### Add Your SQL Queries

```sql
-- my_queries.sql
-- This is my SQL script file

-- Create database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    CREATE DATABASE MyDatabase;
END
GO

USE MyDatabase;
GO

-- Create table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Employees' AND xtype='U')
BEGIN
    CREATE TABLE Employees (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        Position VARCHAR(100),
        Salary DECIMAL(18,2),
        HireDate DATE DEFAULT GETDATE()
    );
END
GO

-- Insert sample data
INSERT INTO Employees (Name, Position, Salary) 
VALUES ('John Doe', 'Developer', 75000);
GO

INSERT INTO Employees (Name, Position, Salary) 
VALUES ('Jane Smith', 'Manager', 95000);
GO

-- Query all employees
SELECT * FROM Employees;
GO
```

### Save and Exit

```bash
# In nano:
# Ctrl+O to save
# Enter to confirm filename
# Ctrl+X to exit
```

---

## 4. Run Saved Query Files

### Run the Script from Local Machine

```bash
# Execute the SQL script
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -i ~/my_queries.sql
```

### Copy Script to Container First

```bash
# Copy script to container
docker cp ~/my_queries.sql sqlserver2025:/tmp/my_queries.sql

# Run from container
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -i /tmp/my_queries.sql
```

### Run Multiple Scripts

```bash
# Run multiple scripts in order
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -i /tmp/script1.sql
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -i /tmp/script2.sql
```

---

## 5. View and Manage Data

### View Data from Command Line

```bash
# Query all employees
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "SELECT * FROM MyDatabase.dbo.Employees"

# With formatted output
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "SELECT Id, Name, Position, Salary, HireDate FROM MyDatabase.dbo.Employees" -W
```

### Export Data to CSV

```bash
# Export query results to CSV
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "SELECT * FROM MyDatabase.dbo.Employees" -W -s "," > ~/employees.csv

# View the CSV
cat ~/employees.csv
```

### Interactive Data Management

```sql
-- Connect to SQL Server
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C

-- Switch to your database
USE MyDatabase;
GO

-- Update data
UPDATE Employees SET Salary = 85000 WHERE Name = 'John Doe';
GO

-- Delete data
DELETE FROM Employees WHERE Name = 'Bob Johnson';
GO

-- Query to verify
SELECT * FROM Employees;
GO

-- Count records
SELECT COUNT(*) AS TotalEmployees FROM Employees;
GO

-- Group by position
SELECT Position, COUNT(*) AS Count, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Position;
GO

-- Exit
QUIT
```

---

## 6. Stop and Check Status

### Check Status

```bash
# Check if SQL Server is running
docker ps

# Show detailed container info
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# Check container details
docker inspect sqlserver2025 | grep -A 10 "State"

# Check logs
docker logs sqlserver2025 --tail 50
```

### Stop SQL Server

```bash
# Stop the container
docker stop sqlserver2025

# Verify it's stopped
docker ps

# It should not show sqlserver2025 in the list
```

### Start SQL Server Again

```bash
# Start the container
docker start sqlserver2025

# Wait for initialization
sleep 10

# Verify it's running
docker ps
```

### Restart SQL Server

```bash
# Restart the container
docker restart sqlserver2025

# Wait for initialization
sleep 10

# Verify
docker ps
```

---

## 🧹 Clean Up

### Remove Container (⚠️ Deletes Data)

```bash
# Stop and remove (data will be lost!)
docker stop sqlserver2025
docker rm sqlserver2025

# Or force remove
docker rm -f sqlserver2025
```

### Backup Data Before Removing

```bash
# Create backup
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "BACKUP DATABASE MyDatabase TO DISK='/var/opt/mssql/backup/MyDatabase.bak'"

# Copy backup to local machine
docker cp sqlserver2025:/var/opt/mssql/backup/MyDatabase.bak ~/MyDatabase.bak
```

---

## 📝 Quick Reference

### Essential Commands

```bash
# ── Start ──
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=MyStrongPassword123!" -p 1433:1433 --name sqlserver2025 -d mcr.microsoft.com/mssql/server:2025-latest
docker start sqlserver2025

# ── Connect ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C

# ── Query ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "SELECT @@VERSION"

# ── Run Script ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -i /tmp/my_queries.sql

# ── Status ──
docker ps
docker logs sqlserver2025 --tail 50

# ── Stop ──
docker stop sqlserver2025

# ── Restart ──
docker restart sqlserver2025

# ── Remove ──
docker rm -f sqlserver2025
```

### SQL Commands Reference

| Command | Purpose |
|---------|---------|
| `SELECT @@VERSION; GO` | Check version |
| `CREATE DATABASE name; GO` | Create database |
| `USE database; GO` | Switch database |
| `CREATE TABLE ...; GO` | Create table |
| `INSERT INTO ...; GO` | Insert data |
| `SELECT * FROM ...; GO` | Query data |
| `UPDATE ... SET ...; GO` | Update data |
| `DELETE FROM ...; GO` | Delete data |
| `QUIT` or `EXIT` | Exit sqlcmd |

---

## ✅ Success Checklist

- [ ] `docker ps` shows `sqlserver2025` with status `Up`
- [ ] `docker logs sqlserver2025` shows "SQL Server is now ready"
- [ ] Connection works with `sqlcmd`
- [ ] Can run `SELECT @@VERSION`
- [ ] Can create databases and tables
- [ ] Can insert and query data
- [ ] Can save queries to files and run them

---

**🎉 You're all set! SQL Server 2025 is running and ready for your data!** 🚀

## 🚀 SQL Server 2025: Complete Advanced Guide

Now that you have SQL Server 2025 running in Docker, here's everything else you can do with it!

---

## 📋 Table of Contents

1. [Advanced SQL Operations](#1-advanced-sql-operations)
2. [Data Import/Export](#2-data-importexport)
3. [Backup and Restore](#3-backup-and-restore)
4. [User Management & Security](#4-user-management--security)
5. [Performance Monitoring](#5-performance-monitoring)
6. [Automation & Scheduling](#6-automation--scheduling)
7. [Integration with Other Tools](#7-integration-with-other-tools)
8. [Troubleshooting](#8-troubleshooting)

---

## 1. Advanced SQL Operations

### Stored Procedures

```sql
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
```

### Views

```sql
-- Create a view
CREATE VIEW HighSalaryEmployees AS
SELECT Name, Position, Salary
FROM Employees
WHERE Salary > 70000;
GO

-- Query the view
SELECT * FROM HighSalaryEmployees;
GO
```

### Indexes

```sql
-- Create an index for faster queries
CREATE INDEX idx_employee_name ON Employees(Name);
GO

-- Create a unique index
CREATE UNIQUE INDEX idx_employee_email ON Employees(Email);
GO

-- Check existing indexes
EXEC sp_helpindex 'Employees';
GO
```

### Transactions

```sql
-- Begin a transaction
BEGIN TRANSACTION;

-- Perform multiple operations
UPDATE Employees SET Salary = 80000 WHERE Name = 'John Doe';
INSERT INTO Employees (Name, Position, Salary) VALUES ('New Employee', 'Intern', 40000);

-- Commit if everything is correct
COMMIT TRANSACTION;

-- Or rollback if something went wrong
ROLLBACK TRANSACTION;
GO
```

### Complex Queries

```sql
-- Joins
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentId = d.Id;
GO

-- Subqueries
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
GO

-- Window Functions
SELECT Name, Position, Salary,
    RANK() OVER (PARTITION BY Position ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
GO
```

---

## 2. Data Import/Export

### Import CSV Files

```bash
# Create a CSV file
echo "Name,Position,Salary" > ~/import.csv
echo "Alice,Developer,70000" >> ~/import.csv
echo "Bob,Manager,90000" >> ~/import.csv

# Copy to container
docker cp ~/import.csv sqlserver2025:/tmp/import.csv

# Import using bcp (bulk copy)
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/bcp -S localhost -U SA -P 'MyStrongPassword123!' -d MyDatabase -t, -f /tmp/import.fmt -T -i /tmp/import.csv
```

### Import Using SQL

```sql
-- Create a table for import
CREATE TABLE ImportData (
    Name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(18,2)
);
GO

-- Import using BULK INSERT
BULK INSERT ImportData
FROM '/tmp/import.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
GO

-- Verify import
SELECT * FROM ImportData;
GO
```

### Export Data to CSV

```bash
# Export query to CSV
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -d MyDatabase -Q "SELECT * FROM Employees" -W -s "," > ~/export.csv

# Export using bcp
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/bcp "SELECT * FROM MyDatabase.dbo.Employees" queryout ~/employees.csv -c -t, -S localhost -U SA -P 'MyStrongPassword123!'
```

### Import JSON Data

```sql
-- Create table for JSON data
CREATE TABLE JsonData (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Data NVARCHAR(MAX)
);
GO

-- Insert JSON data
INSERT INTO JsonData (Data)
VALUES ('{"name":"John","age":30,"city":"New York"}');
GO

-- Query JSON data
SELECT
    JSON_VALUE(Data, '$.name') AS Name,
    JSON_VALUE(Data, '$.age') AS Age
FROM JsonData;
GO
```

---

## 3. Backup and Restore

### Create Backup

```bash
# Create backup directory (if not exists)
docker exec -it sqlserver2025 mkdir -p /var/opt/mssql/backup

# Backup database
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "BACKUP DATABASE MyDatabase TO DISK='/var/opt/mssql/backup/MyDatabase.bak' WITH FORMAT"

# Copy backup to local machine
docker cp sqlserver2025:/var/opt/mssql/backup/MyDatabase.bak ~/MyDatabase.bak
```

### Restore Database

```bash
# Copy backup file to container
docker cp ~/MyDatabase.bak sqlserver2025:/var/opt/mssql/backup/MyDatabase.bak

# Restore database
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "RESTORE DATABASE MyDatabase FROM DISK='/var/opt/mssql/backup/MyDatabase.bak' WITH REPLACE"
```

### Automated Backup Script

```bash
#!/bin/bash
# save as backup.sh

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="MyDatabase_$TIMESTAMP"

echo "Creating backup: $BACKUP_NAME"

docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "BACKUP DATABASE MyDatabase TO DISK='/var/opt/mssql/backup/$BACKUP_NAME.bak'"

docker cp sqlserver2025:/var/opt/mssql/backup/$BACKUP_NAME.bak ~/backups/$BACKUP_NAME.bak

echo "Backup saved to ~/backups/$BACKUP_NAME.bak"
```

---

## 4. User Management & Security

### Create Users

```sql
-- Create a login
CREATE LOGIN app_user WITH PASSWORD = 'AppUserPassword123!';
GO

-- Create a user in the database
USE MyDatabase;
GO
CREATE USER app_user FOR LOGIN app_user;
GO

-- Grant permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Employees TO app_user;
GO

-- Grant only read access
GRANT SELECT ON Employees TO app_user;
GO
```

### Manage Permissions

```sql
-- Revoke permissions
REVOKE DELETE ON Employees FROM app_user;
GO

-- Grant admin rights
ALTER ROLE db_owner ADD MEMBER app_user;
GO

-- Check user permissions
EXEC sp_helpuser;
GO
```

### Create Roles

```sql
-- Create a custom role
CREATE ROLE DataReader;
GO

-- Grant permissions to role
GRANT SELECT ON Employees TO DataReader;
GO

-- Add user to role
EXEC sp_addrolemember 'DataReader', 'app_user';
GO
```

### Encrypt Data

```sql
-- Create a master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MasterKeyPassword123!';
GO

-- Create a certificate
CREATE CERTIFICATE EmployeeCert WITH SUBJECT = 'Employee Data Encryption';
GO

-- Create a symmetric key
CREATE SYMMETRIC KEY EmployeeKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE EmployeeCert;
GO

-- Encrypt data
OPEN SYMMETRIC KEY EmployeeKey DECRYPTION BY CERTIFICATE EmployeeCert;

CREATE TABLE SecureEmployees (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    EncryptedSSN VARBINARY(MAX)
);
GO

INSERT INTO SecureEmployees (Name, EncryptedSSN)
VALUES ('John Doe', EncryptByKey(Key_GUID('EmployeeKey'), '123-45-6789'));
GO

-- Decrypt data
SELECT
    Name,
    CONVERT(VARCHAR, DecryptByKey(EncryptedSSN)) AS SSN
FROM SecureEmployees;
GO

CLOSE SYMMETRIC KEY EmployeeKey;
GO
```

---

## 5. Performance Monitoring

### Check Query Performance

```sql
-- Show running queries
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

-- Show query execution plan
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

-- Analyze your query
SELECT * FROM Employees WHERE Salary > 50000;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO
```

### Monitor Server Health

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
```

### Create Performance Dashboard

```sql
-- Create a view for monitoring
CREATE VIEW ServerHealth AS
SELECT
    GETDATE() AS CheckTime,
    (SELECT COUNT(*) FROM sys.dm_exec_sessions) AS ActiveSessions,
    (SELECT COUNT(*) FROM sys.dm_exec_requests) AS ActiveRequests,
    (SELECT total_physical_memory_kb/1024/1024 FROM sys.dm_os_sys_memory) AS TotalMemoryGB
GO

-- Query the view
SELECT * FROM ServerHealth;
GO
```

---

## 6. Automation & Scheduling

### Create Scheduled Tasks (Inside Container)

```bash
# Create a script
docker exec -it sqlserver2025 bash -c "echo '#!/bin/bash' > /usr/local/bin/daily_backup.sh"
docker exec -it sqlserver2025 bash -c "echo '/opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P MyStrongPassword123! -C -Q \"BACKUP DATABASE MyDatabase TO DISK=\"/var/opt/mssql/backup/MyDatabase_$(date +%Y%m%d).bak\"\"' >> /usr/local/bin/daily_backup.sh"
docker exec -it sqlserver2025 chmod +x /usr/local/bin/daily_backup.sh

# Create cron job (if cron is available)
docker exec -it sqlserver2025 apt-get update && apt-get install -y cron
docker exec -it sqlserver2025 bash -c "echo '0 2 * * * /usr/local/bin/daily_backup.sh' >> /etc/crontab"
docker exec -it sqlserver2025 service cron start
```

### Create SQL Agent Jobs (SQL Server Agent)

```sql
-- Note: SQL Server Agent is not available in Developer Edition
-- Use Docker scheduling or external tools instead
```

### Schedule Tasks from Ubuntu

```bash
# Create a backup script on your local machine
cat > ~/daily-backup.sh << 'EOF'
#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d")
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "BACKUP DATABASE MyDatabase TO DISK='/var/opt/mssql/backup/MyDatabase_$TIMESTAMP.bak'"
docker cp sqlserver2025:/var/opt/mssql/backup/MyDatabase_$TIMESTAMP.bak ~/backups/
EOF

chmod +x ~/daily-backup.sh

# Add to cron
(crontab -l 2>/dev/null; echo "0 2 * * * ~/daily-backup.sh") | crontab -
```

---

## 7. Integration with Other Tools

### Connect from Python

```python
# Install pyodbc
# pip install pyodbc

import pyodbc

# Connection string
conn_str = (
    'DRIVER={ODBC Driver 18 for SQL Server};'
    'SERVER=localhost,1433;'
    'UID=SA;'
    'PWD=MyStrongPassword123!;'
    'TrustServerCertificate=yes;'
)

# Connect and query
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()
cursor.execute("SELECT * FROM MyDatabase.dbo.Employees")

for row in cursor:
    print(row)

conn.close()
```

### Connect from Node.js

```javascript
// Install mssql package
// npm install mssql

const sql = require('mssql');

const config = {
    user: 'SA',
    password: 'MyStrongPassword123!',
    server: 'localhost',
    port: 1433,
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

async function getEmployees() {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .query('SELECT * FROM MyDatabase.dbo.Employees');
        console.log(result.recordset);
    } catch (err) {
        console.error(err);
    }
}

getEmployees();
```

### Connect from R

```r
# Install RODBC
# install.packages("RODBC")

library(RODBC)

conn <- odbcConnect(
    "Driver={ODBC Driver 18 for SQL Server};Server=localhost,1433;UID=SA;PWD=MyStrongPassword123!;TrustServerCertificate=yes;"
)

query <- "SELECT * FROM MyDatabase.dbo.Employees"
data <- sqlQuery(conn, query)
print(data)

close(conn)
```

### Connect from PHP

```php
<?php
$serverName = "localhost,1433";
$connectionOptions = array(
    "Database" => "MyDatabase",
    "UID" => "SA",
    "PWD" => "MyStrongPassword123!",
    "TrustServerCertificate" => true
);

$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn) {
    $sql = "SELECT * FROM Employees";
    $stmt = sqlsrv_query($conn, $sql);
    
    while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        echo $row['Name'] . "\n";
    }
} else {
    echo "Connection failed.";
}

sqlsrv_close($conn);
?>
```

### Connect from VS Code

```bash
# Install MS SQL extension
code --install-extension ms-mssql.mssql

# Connect in VS Code
# 1. Press F1
# 2. Type: MS SQL: Connect
# 3. Enter connection details:
#    - Server: localhost
#    - User: SA
#    - Password: MyStrongPassword123!
#    - Database: MyDatabase
```

---

## 8. Troubleshooting

### Common Issues and Fixes

#### Issue: Container won't start

```bash
# Check logs
docker logs sqlserver2025

# Check memory
docker stats

# Restart with more memory
docker stop sqlserver2025
docker rm sqlserver2025
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=MyStrongPassword123!" -p 1433:1433 --memory=4g --name sqlserver2025 -d mcr.microsoft.com/mssql/server:2025-latest
```

#### Issue: Can't connect

```bash
# Check if port is open
sudo netstat -tulpn | grep 1433

# Check container IP
docker inspect sqlserver2025 | grep IPAddress

# Try connecting with IP
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S $(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sqlserver2025) -U SA -P 'MyStrongPassword123!' -C
```

#### Issue: Low disk space

```bash
# Check disk usage
docker exec -it sqlserver2025 df -h

# Clean up logs
docker exec -it sqlserver2025 rm -rf /var/opt/mssql/log/*

# Clean up Docker
docker system prune -a
```

#### Issue: Performance slow

```bash
# Check memory usage
docker stats sqlserver2025

# Increase memory limit
docker update --memory 4g sqlserver2025

# Check SQL Server logs
docker logs sqlserver2025
```

---

## 📝 Quick Reference: Advanced Commands

```bash
# ── Backup ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "BACKUP DATABASE MyDatabase TO DISK='/var/opt/mssql/backup/MyDatabase.bak'"

# ── Restore ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "RESTORE DATABASE MyDatabase FROM DISK='/var/opt/mssql/backup/MyDatabase.bak'"

# ── Copy backup to local ──
docker cp sqlserver2025:/var/opt/mssql/backup/MyDatabase.bak ~/

# ── Create user ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "CREATE LOGIN new_user WITH PASSWORD='Password123!'"

# ── Monitor connections ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'MyStrongPassword123!' -C -Q "SELECT * FROM sys.dm_exec_sessions"

# ── Export data ──
docker exec -it sqlserver2025 /opt/mssql-tools18/bin/bcp "SELECT * FROM MyDatabase.dbo.Employees" queryout ~/employees.csv -c -t, -S localhost -U SA -P 'MyStrongPassword123!'
```

---

## ✅ What You Can Now Do

| Task | How |
|------|-----|
| **Backup** | Backup database and copy to local |
| **Restore** | Restore from backup file |
| **Users** | Create and manage users |
| **Permissions** | Grant/revoke access |
| **Performance** | Monitor and optimize queries |
| **Automation** | Schedule tasks and backups |
| **Import/Export** | CSV, JSON, SQL files |
| **Security** | Encrypt sensitive data |
| **Integration** | Connect from Python, Node.js, PHP, R |
| **Monitoring** | Check health and connections |

---

**🎉 You're now a SQL Server 2025 power user!** 🚀