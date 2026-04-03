CREATE TABLE january_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 01;
    /* The above SQL statement creates a new table called "january_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 01 (January). This allows us to focus on orders that were placed in January for further analysis or processing. */
CREATE TABLE february_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 02;
    /* Similar to the previous statement, this SQL statement creates a new table called "february_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 02 (February). This allows us to focus on orders that were placed in February for further analysis or processing. */
CREATE TABLE march_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 03;
    /* Similar to the previous statement, this SQL statement creates a new table called "march_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 03 (March). This allows us to focus on orders that were placed in March for further analysis or processing. */
CREATE TABLE april_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 04;
    /* Similar to the previous statements, this SQL statement creates a new table called "april_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 04 (April). This allows us to focus on orders that were placed in April for further analysis or processing. */
CREATE TABLE may_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 05;
    /* Similar to the previous statements, this SQL statement creates a new table called "may_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 05 (May). This allows us to focus on orders that were placed in May for further analysis or processing. */
CREATE TABLE june_orders AS
    SELECT * 
    FROM superstorec
    WHERE EXTRACT(MONTH FROM order_date) = 06;
    /* Similar to the previous statements, this SQL statement creates a new table called "june_orders" and populates it with data from the "superstorec" table. The SELECT statement retrieves all columns from the "superstorec" table, but only includes rows where the month extracted from the "order_date" column is equal to 06 (June). This allows us to focus on orders that were placed in June for further analysis or processing. */