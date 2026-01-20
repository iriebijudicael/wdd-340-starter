-- INSERT Tony Stark (account_id and account_type handled automatically)
INSERT INTO public.account (
  account_firstname,
  account_lastname,
  account_email,
  account_password
)
VALUES (
  'Tony',
  'Stark',
  'tony@starkent.com',
  'Iam1ronM@n'
);

--------------------------------------------------

-- UPDATE Tony Stark account_type to Admin
UPDATE public.account
SET account_type = 'Admin'
WHERE account_email = 'tony@starkent.com';

--------------------------------------------------

-- DELETE Tony Stark record
DELETE FROM public.account
WHERE account_email = 'tony@starkent.com';

--------------------------------------------------

-- UPDATE GM Hummer description using REPLACE
UPDATE public.inventory
SET inv_description = REPLACE(
  inv_description,
  'small interiors',
  'a huge interior'
)
WHERE inv_make = 'GM'
AND inv_model = 'Hummer';

--------------------------------------------------

-- SELECT inventory make & model with classification name (Sport)
SELECT
  i.inv_make,
  i.inv_model,
  c.classification_name
FROM public.inventory i
INNER JOIN public.classification c
  ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';

--------------------------------------------------

-- UPDATE image paths to include /vehicles
UPDATE public.inventory
SET
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
