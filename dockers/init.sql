-- Create a new database
CREATE DATABASE IF NOT EXISTS template_java_mysql;

-- Use the created database
USE template_java_mysql;

-- Create a new table
CREATE TABLE IF NOT EXISTS TableName (
    column1 VARCHAR(255),
    column2 VARCHAR(255)
);

-- Insert values into the table
INSERT INTO TableName (column1, column2) VALUES ('value1', 'value2');