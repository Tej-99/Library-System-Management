# Library Management System

## Project Overview

This project involves the creation and management of a **Library Management System** using SQL. It includes the design and implementation of a relational database to store and manage data about books, members, employees, and the status of issued and returned books.

The system is designed to:
- Track book rentals, including rental price, availability, and category.
- Manage member information, including registration dates and addresses.
- Manage employee records and their respective branch information.
- Keep track of issued books and their return status.

## Key Features

- **Relational Database Design**: Created tables for books, members, employees, issued status, and return status.
- **SQL Queries**: Developed multiple SQL queries to insert, update, delete, and retrieve records across the database.
- **CTAS (Create Table As Select)**: Used for summarizing book issuance data and analyzing rental income by category.
- **ERD (Entity-Relationship Diagram)**: The system's database design is visually represented in an ERD.

## Database Schema

The library management system includes the following core tables:
- **Books**: Contains details about books such as ISBN, title, category, rental price, and author.
- **Branch**: Stores information about library branches and their managers.
- **Employees**: Contains data about employees working at each branch.
- **Members**: Stores details about library members, including their names, addresses, and registration dates.
- **Issued_Status**: Tracks books issued by employees to members, including issue dates and employee details.
- **Return_Status**: Tracks the return status of books issued to members.

### ERD

The **Entity-Relationship Diagram (ERD)** of the Library Management System represents the relationships between the tables. 
![ERD](Library_ERD.png)

