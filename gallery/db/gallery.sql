DROP TABLE exhibits;
DROP TABLE artists;

CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE exhibits(
  id SERIAL8 PRIMARY KEY,
  exhibit_name VARCHAR(255),
  type VARCHAR(255),
  year VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
);
