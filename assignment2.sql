-- Type creation (if needed)
--CREATE TYPE...;

-- Table creations
--CREATE TABLE account (...);
--CREATE TABLE classification (...);
--CREATE TABLE inventory (...);

-- Create account table if it doesn't exist
CREATE TABLE IF NOT EXISTS account (
    account_id INT PRIMARY KEY,
    account_firstname VARCHAR(50) NOT NULL,
    account_lastname VARCHAR(50) NOT NULL,
    account_email VARCHAR(255) NOT NULL UNIQUE,
    account_password VARCHAR(60) NOT NULL
);
 

-- 1. Insert Tony Stark 
INSERT INTO account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n'),
       ('Henry', 'John', 'henry@john.com', 'Nephi7ronMo@');

-- 2. Update Tony to Admin
UPDATE account 
SET account_type = 'Admin'
WHERE account_email = 'tony@starkent.com';

-- 3. Delete Tony Stark
DELETE FROM account 
WHERE account_email = 'tony@starkent.com';

-- Create classification table if it doesn't exist
CREATE TABLE IF NOT EXISTS classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR NOT NULL UNIQUE
);

-- Insert initial classification data (only if not exists)
INSERT INTO classification (classification_name) VALUES 
('Custom'),
('Sport'),
('SUV'),
('Truck'),
('Sedan')
;

-- Create inventory table if it doesn't exist
CREATE TABLE IF NOT EXISTS inventory (
    inv_id SERIAL PRIMARY KEY,
    inv_make VARCHAR NOT NULL,
    inv_model VARCHAR NOT NULL,
    inv_year INTEGER NOT NULL,
    inv_description TEXT NOT NULL,
    inv_image VARCHAR NOT NULL,
    inv_thumbnail VARCHAR NOT NULL,
    inv_price DECIMAL(9,2) NOT NULL,
    inv_miles INTEGER NOT NULL,
    inv_color VARCHAR NOT NULL,
    classification_id INTEGER REFERENCES classification(classification_id)
);

-- Insert initial inventory data (only if not exists)
INSERT INTO inventory (
    inv_make, inv_model, inv_year, inv_description, 
    inv_image, inv_thumbnail, inv_price, inv_miles, inv_color, classification_id
) VALUES 
('GM', 'Hummer', 2020, 'Do you have 6 kids and like to go offroading? The Hummer gives you a small interiors with enough room for your kids.', 
'/images/vehicles/hummer.jpg', '/images/vehicles/hummer-tn.jpg', 58890.00, 5123, 'Yellow', 3),
('Jeep', 'Wrangler', 2019, 'The Jeep Wrangler is small and compact with enough power to get you where you want to go.', 
'/images/vehicles/wrangler.jpg', '/images/vehicles/wrangler-tn.jpg', 32995.00, 41205, 'Orange', 3)
;

-- 4. Update GM Hummer description
UPDATE inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- 5. Sport vehicles join (classification_id = 2 for Sport)
SELECT inv_make, inv_model, classification_name
FROM inventory
INNER JOIN classification 
  ON inventory.classification_id = classification.classification_id
WHERE classification.classification_id = 2;

-- 6. Update image paths
UPDATE inventory
SET 
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');