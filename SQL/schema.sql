-- Create database items if not exists.
CREATE DATABASE IF NOT EXISTS items;

-- Create table item
CREATE TABLE Item(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  genre_id     INT NOT NULL,
  author_id    INT NOT NULL,
  label_id     INT NOT NULL,
  publish_date DATE NOT NULL,
  archived     BOOLEAN NOT NULL,
  CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES Labels (id),
  CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),
  CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES Genres (id)
);



