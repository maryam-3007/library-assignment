--NAME:MARYAM ILYAS
--SEAT NO:B23110106027
--YEAR:BSSE-II(4th SEM)

CREATE TABLE books(
book_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(150) NOT NULL,
year_published INT NOT NULL,
isAvailable BOOLEAN,
price NUMERIC(10,2)NOT NULL,
publication VARCHAR(150)NOT NULL
);

INSERT INTO books(title, author, year_published, isAvailable, price, publication)
VALUES('Shadows of Dawn', 'Amara Cole', 1999, TRUE, 480.00, 'Silver Quill Press'),
('Fragments of Tomorrow', 'Liam Everett', 2003, FALSE, 525.00, 'Northern Star Books'),
('Echoes in the Fog', 'Nadia Raines', 2011, TRUE, 310.00, 'Harbor House'),
('Beneath Crimson Skies', 'Theo Hart', 2017, TRUE, 720.00, 'XYZ'),
('Dust and Thunder', 'Sofia Lang', 2005, TRUE, 595.50, 'Claymore Publishers'),
('The Memory Cartographer', 'Julian West', 2020, FALSE, 645.00, 'XYZ'),
('Lanterns in the Dark', 'Mae Lin', 2008, TRUE, 570.00, 'Pearl Leaf Publishing'),
('The Algorithm Code', 'Kiran Dev', 2016, TRUE, 540.00, 'TechVerse Press'),
('Through the Glass River', 'Isla Monroe', 2013, TRUE, 580.00, 'Opal Tree House'),
('A Quiet Rebellion', 'Zane Cross', 2019, TRUE, 680.00, 'XYZ'),
('The Last Archivist', 'Eli Stone', 2021, TRUE, 499.00, 'Dust & Ink'),
('Rain Over Eldenhill', 'Faye Carter', 2001, TRUE, 455.00, 'Emerald Grove'),
('Blueprints of Silence', 'Kai Morgan', 2004, FALSE, 400.00, 'Newline Works'),
('Glass Feathers', 'Nova Reid', 2018, TRUE, 530.00, 'XYZ'),
('The Fire Between Pages', 'Rhea Whitman', 2015, TRUE, 620.00, 'Blackrock Books');

SELECT * FROM books

SELECT * FROM books
WHERE year_published > 2000;

SELECT * FROM books
WHERE price < 599.00
ORDER BY price DESC;

SELECT * FROM books
ORDER BY price DESC
LIMIT 3;

SELECT * FROM books
ORDER BY year_published DESC
OFFSET 2 LIMIT 2;

SELECT * FROM books
WHERE publication = 'XYZ'
ORDER BY title ASC;