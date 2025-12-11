# Museum-Management-Database-System-SQL-Project
This project implements a relational database system for managing museums, exhibits, artworks, artists, tickets, curators, sponsors, and locations.
It includes ER design, SQL schema creation, sample data insertion, triggers, and stored procedures.

# Triggers Implemented
Minimum Ticket Price Trigger
BEFORE INSERT on Ticket
Automatically sets invalid prices (≤ 0) to 30 TL.
Artwork Value Update History Trigger
AFTER UPDATE on Artwork
Logs old & new values into artwork_value_history table.
Automatic Sponsor Assignment Trigger
AFTER INSERT on Exhibit
Adds default matching sponsor to new exhibit in Sponsor_Exhibit table.

# Stored Procedures
List Exhibits of a Museum
Returns exhibit details filtered by museum_id.
Automatic Ticket Creation (Dynamic Pricing)
Calculates ticket price based on museum’s established year.
Inserts ticket & returns new ticket_id.
Calculate Total Artwork Value of an Artist
Returns total artwork count + total value for a given artist.
