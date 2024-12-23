USE [HMS]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([department_id], [name], [description]) VALUES (1, N'Front Desk', N'Handles guest check-ins and check-outs')
INSERT [dbo].[Department] ([department_id], [name], [description]) VALUES (2, N'Housekeeping', N'Responsible for cleaning and maintaining rooms')
INSERT [dbo].[Department] ([department_id], [name], [description]) VALUES (3, N'Maintenance', N'Handles repairs and maintenance tasks')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employee_id], [department_id], [first_name], [last_name], [email], [password_hash], [password_salt], [position], [hire_date], [is_admin]) VALUES (1, 1, N'John', N'Doe', N'john.doe@example.com', N'hashedpassword1', N'salt1', N'Receptionist', CAST(N'2023-01-15' AS Date), 0)
INSERT [dbo].[Employee] ([employee_id], [department_id], [first_name], [last_name], [email], [password_hash], [password_salt], [position], [hire_date], [is_admin]) VALUES (2, 2, N'Jane', N'Smith', N'jane.smith@example.com', N'hashedpassword2', N'salt2', N'Housekeeper', CAST(N'2023-02-20' AS Date), 0)
INSERT [dbo].[Employee] ([employee_id], [department_id], [first_name], [last_name], [email], [password_hash], [password_salt], [position], [hire_date], [is_admin]) VALUES (3, 3, N'Emily', N'Johnson', N'emily.johnson@example.com', N'hashedpassword3', N'salt3', N'Maintenance Worker', CAST(N'2023-03-10' AS Date), 0)
INSERT [dbo].[Employee] ([employee_id], [department_id], [first_name], [last_name], [email], [password_hash], [password_salt], [position], [hire_date], [is_admin]) VALUES (4, 1, N'AdminUser', N'Admin', N'admin@example.com', N'hashedadminpassword', N'adminsalt', N'Manager', CAST(N'2023-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin ] ON 

INSERT [dbo].[Admin ] ([admin_id], [employee_id ], [username ], [password_hash ], [password_salt ]) VALUES (3, 4, N'admin', N'adminUser', N'admin....')
SET IDENTITY_INSERT [dbo].[Admin ] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([hotel_id], [name], [address]) VALUES (1, N'Hotel California', N'123 Sunset Blvd, Los Angeles, CA')
INSERT [dbo].[Hotel] ([hotel_id], [name], [address]) VALUES (2, N'The Grand Hotel', N'456 Ocean Drive, Miami, FL')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([room_type_id], [type_name], [description], [base_price]) VALUES (1, N'Single Room', N'A room for one person.', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[RoomType] ([room_type_id], [type_name], [description], [base_price]) VALUES (2, N'Double Room', N'A room for two persons.', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[RoomType] ([room_type_id], [type_name], [description], [base_price]) VALUES (3, N'Suite', N'A luxurious suite with a living area.', CAST(250.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id], [room_number], [floor], [status]) VALUES (1, 1, 1, N'101', 1, N'Available')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id], [room_number], [floor], [status]) VALUES (2, 1, 2, N'102', 1, N'Available')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id], [room_number], [floor], [status]) VALUES (3, 1, 3, N'201', 2, N'Occupied')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id], [room_number], [floor], [status]) VALUES (4, 2, 1, N'301', 3, N'Available')
INSERT [dbo].[Room] ([room_id], [hotel_id], [room_type_id], [room_number], [floor], [status]) VALUES (5, 2, 2, N'302', 3, N'Occupied')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([guest_id], [first_name], [last_name], [email], [password_hash], [password_salt], [phone]) VALUES (1, N'Alice', N'Brown', N'alice.brown@example.com', N'hashedguestpassword1', N'guestsalt1', N'(555) 123-4567')
INSERT [dbo].[Guest] ([guest_id], [first_name], [last_name], [email], [password_hash], [password_salt], [phone]) VALUES (2, N'Bob', N'White', N'bob.white@example.com', N'hashedguestpassword2', N'guestsalt2', N'(555) 987-6543')
INSERT [dbo].[Guest] ([guest_id], [first_name], [last_name], [email], [password_hash], [password_salt], [phone]) VALUES (3, N'Charlie', N'Davis', N'charlie.davis@example.com', N'hashedguestpassword3', N'guestsalt3', N'(555) 234-5678')
INSERT [dbo].[Guest] ([guest_id], [first_name], [last_name], [email], [password_hash], [password_salt], [phone]) VALUES (4, N'Diana', N'Evans', N'diana.evans@example.com', N'hashedguestpassword4', N'guestsalt4', N'(555) 345-6789')
INSERT [dbo].[Guest] ([guest_id], [first_name], [last_name], [email], [password_hash], [password_salt], [phone]) VALUES (5, N'Ethan', N'Garcia', N'ethan.garcia@example.com', N'hashedguestpassword5', N'guestsalt5', N'(555) 456-7890')
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([booking_id], [room_id], [guest_id], [check_in_date], [check_out_date], [total_price], [status]) VALUES (3, 1, 2, CAST(N'2024-01-10' AS Date), CAST(N'2024-01-15' AS Date), CAST(250.00 AS Decimal(10, 2)), N'confirmed')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice ] ON 

INSERT [dbo].[Invoice ] ([invoice_id], [booking_id ], [issue_date ], [total_amount ]) VALUES (2, 3, CAST(N'2024-01-10' AS Date), CAST(250.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Invoice ] OFF
GO
