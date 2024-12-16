-- 1. Delete from dependent tables (child tables) first
DELETE FROM dbo.Payment;     -- Remove payments
DELETE FROM dbo.Invoice;     -- Remove invoices
DELETE FROM dbo.Booking;     -- Remove bookings
DELETE FROM dbo.Guest;       -- Remove guests
DELETE FROM dbo.Room;        -- Remove rooms
DELETE FROM dbo.RoomType;    -- Remove room types

-- 2. Now, delete from the main tables (parent tables)
DELETE FROM dbo.Employee;    -- Remove employees
DELETE FROM dbo.Admin;       -- Remove admin accounts
DELETE FROM dbo.Hotel;       -- Remove hotels
DELETE FROM dbo.Department;  -- Remove departments
-- Add cascading delete to the foreign key relationship
ALTER TABLE dbo.Employee
DROP CONSTRAINT FK_Employee_Department;

ALTER TABLE dbo.Employee
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (department_id) REFERENCES dbo.Department(department_id) ON DELETE CASCADE;
