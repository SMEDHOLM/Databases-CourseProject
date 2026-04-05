# Automotive Service Database Project

## Overview

This repository contains a relational database design and sample data for an automotive service workshop. The schema is built to manage:
- customers and vehicle ownership
- repair and maintenance orders
- workforce and device scheduling
- invoicing, reminders, and billing adjustments

The project uses a normalized schema with foreign key constraints and example SQL queries to support common service center workflows.

## Key Features

- Customer and vehicle tracking
- Order and invoice management
- Repair and regular maintenance planning
- Employee availability and device reservation support
- Reminder-based billing updates and overdue invoice reporting

## Schema Summary

### Main entities
- `Customer`: workshop clients linked to cars
- `Car`: vehicles tracked by license number and mileage
- `Invoice`: orders with customer, employee, deadline, status, and billing totals
- `Repair`: repair work associated with an invoice and vehicle
- `Regular_maintenance`: maintenance requests based on mileage and a linked invoice
- `SparePart`: parts used in a repair order
- `Reminder`: billing reminder adjustments for invoices
- `Employe`: technician records and availability
- `Device`: equipment used for operations
- `Reservation_of_operation`: booking employees and devices for orders
- `Absences`: employee absence periods
- `Owner`: vehicle owner records linked to a car
- `Operation`: named service operations with duration and device requirements

### Important relationships
- `Customer.LicenNum` → `Car.LicenNum`
- `Invoice.CustomerID` → `Customer.CurstomerID`
- `Invoice.EmployeID` → `Employe.ID`
- `Repair.OrderID` → `Invoice.OrderID`
- `Regular_maintenance.OrderID` → `Invoice.OrderID`
- `Reservation_of_operation.OrderID` → `Invoice.OrderID`
- `Reservation_of_operation.EmployeID` → `Employe.ID`
- `Reservation_of_operation.DeviceID` → `Device.DeviceID`
- `Reminder.OrderID` → `Invoice.OrderID`

## Sample Use Cases

The repository includes example queries for common tasks:
- find available employees between dates
- retrieve customer contact details for a repair
- identify required operations for regular maintenance
- look up parts consumed by an order
- list customers with unpaid invoices
- count reminders per invoice
- retrieve vehicle owners for a license plate
- book available devices for work slots
- find invoices due today
- inspect employee absences and reservations

## Files

- `create and populate sql format.sql`: complete SQLite schema and sample data inserts
- `create and populate database.txt`: table definitions for the database model
- `sql queries for typical use cases.txt`: representative SQL queries for the schema
- `ProjectPart1.pdf` / `Project part 2.pdf`: project documentation and assignment details

## Setup

1. Open the repository in a SQLite client.
2. Run the SQL script in `create and populate sql format.sql` to create the schema and load sample data.
3. Use the sample queries in `sql queries for typical use cases.txt` to verify functionality.

## Notes

- The current sample data uses SQLite-compatible SQL and `DATETIME` values.
- Table and column names follow the original course project design; review names like `CurstomerID` and `Employe` before adapting for production.
- Additional indexes are defined on `DeviceType` and `Reminder.OrderID` to support workload queries.

