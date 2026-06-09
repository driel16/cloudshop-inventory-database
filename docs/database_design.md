\# CloudShop Database Design



\## Overview



CloudShop Inventory \& Analytics Platform is a relational database designed to manage products, suppliers, customers, orders, and inventory transactions.



The database follows normalization principles and uses primary keys and foreign keys to maintain data integrity.



\## Tables



\### Roles



\* role\_id (PK)

\* role\_name



\### Users



\* user\_id (PK)

\* role\_id (FK)

\* full\_name

\* email

\* password

\* created\_at



\### Categories



\* category\_id (PK)

\* category\_name



\### Suppliers



\* supplier\_id (PK)

\* supplier\_name

\* contact\_person

\* phone

\* email



\### Products



\* product\_id (PK)

\* category\_id (FK)

\* supplier\_id (FK)

\* product\_name

\* description

\* unit\_price

\* stock\_quantity



\### Customers



\* customer\_id (PK)

\* customer\_name

\* phone

\* email



\### Orders



\* order\_id (PK)

\* customer\_id (FK)

\* user\_id (FK)

\* order\_date

\* total\_amount



\### Order\_Items



\* order\_item\_id (PK)

\* order\_id (FK)

\* product\_id (FK)

\* quantity

\* unit\_price

\* subtotal



\### Inventory\_Transactions



\* transaction\_id (PK)

\* product\_id (FK)

\* user\_id (FK)

\* transaction\_type

\* quantity

\* transaction\_date



\## Relationships



\* Roles 1:M Users

\* Categories 1:M Products

\* Suppliers 1:M Products

\* Customers 1:M Orders

\* Orders 1:M Order\_Items

\* Products 1:M Order\_Items

\* Products 1:M Inventory\_Transactions

\* Users 1:M Inventory\_Transactions



