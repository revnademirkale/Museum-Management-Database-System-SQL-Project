DROP DATABASE IF EXISTS museumdb;

CREATE DATABASE museumdb;

USE museumdb;

CREATE TABLE Museum (
  museum_id INT PRIMARY KEY,
  m_name CHAR(50),
  m_city CHAR(30),
  established_year INT
);
INSERT INTO Museum (museum_id, m_name, m_city, established_year) VALUES
(1, 'Istanbul Modern', 'Istanbul', 2004),
(2, 'Pera Museum', 'Istanbul', 2005),
(3, 'Sabanci Museum', 'Istanbul', 2002),
(4, 'Ankara Art Museum', 'Ankara', 1998),
(5, 'Izmir Painting Museum', 'Izmir', 1985),
(6, 'Bursa Fine Arts Museum', 'Bursa', 1990),
(7, 'Antalya Museum', 'Antalya', 1972),
(8, 'Konya Art Gallery', 'Konya', 2008),
(9, 'Van Heritage Museum', 'Van', 2015),
(10, 'Mardin Culture Museum', 'Mardin', 2010);

CREATE TABLE Curator (
  curator_id INT PRIMARY KEY,
  c_name CHAR(50),
  c_specialization CHAR(50),
  museum_id INT NOT NULL,
  FOREIGN KEY (museum_id) REFERENCES Museum(museum_id)
  ON DELETE CASCADE
);

INSERT INTO Curator (curator_id, c_name, c_specialization, museum_id) VALUES
(1, 'Aylin Demir', 'Modern Art', 1),
(2, 'Cem Kaya', 'Historical Exhibits', 2),
(3, 'Selin Arslan', 'Sculpture', 3),
(4, 'Deniz Yilmaz', 'Photography', 4),
(5, 'Ece Korkmaz', 'Contemporary Art', 5),
(6, 'Ahmet Guler', 'Cultural Heritage', 6),
(7, 'Burcu Aydin', 'Ancient Art', 7),
(8, 'Okan Yavuz', 'Textile Art', 8),
(9, 'Merve Cinar', 'Ceramic Art', 9),
(10, 'Nil Acar', 'Folk Art', 10);

CREATE TABLE Artist (
  artist_id INT PRIMARY KEY,
  a_name CHAR(50),
  nationality CHAR(30),
  birth_year INT
);

INSERT INTO Artist (artist_id, a_name, nationality, birth_year) VALUES
(1, 'Pablo Picasso', 'Spanish', 1881),
(2, 'Frida Kahlo', 'Mexican', 1907),
(3, 'Salvador Dali', 'Spanish', 1904),
(4, 'Leonardo da Vinci', 'Italian', 1452),
(5, 'Michelangelo', 'Italian', 1475),
(6, 'Claude Monet', 'French', 1840),
(7, 'Andy Warhol', 'American', 1928),
(8, 'Edvard Munch', 'Norwegian', 1863),
(9, 'Diego Rivera', 'Mexican', 1886),
(10, 'Joan Miro', 'Spanish', 1893);

CREATE TABLE Artwork (
  artwork_id INT PRIMARY KEY,
  art_title CHAR(50),
  art_type CHAR(30),
  art_year INT,
  art_value INT,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
  ON DELETE CASCADE
);

INSERT INTO Artwork (artwork_id, art_title, art_type, art_year, art_value, artist_id) VALUES
(1, 'Guernica', 'Painting', 1937, 1000000, 1),
(2, 'The Two Fridas', 'Painting', 1939, 700000, 2),
(3, 'The Persistence of Memory', 'Painting', 1931, 950000, 3),
(4, 'Mona Lisa', 'Painting', 1503, 2000000, 4),
(5, 'David', 'Sculpture', 1504, 2500000, 5),
(6, 'Water Lilies', 'Painting', 1916, 850000, 6),
(7, 'Marilyn Diptych', 'Print', 1962, 600000, 7),
(8, 'The Scream', 'Painting', 1893, 1200000, 8),
(9, 'Man at the Crossroads', 'Mural', 1934, 750000, 9),
(10, 'The Farm', 'Painting', 1921, 500000, 10);


CREATE TABLE Exhibit (
  exhibit_id INT PRIMARY KEY,
  e_title CHAR(50),
  e_theme CHAR(50),
  start_date DATE,
  end_date DATE,
  museum_id INT NOT NULL,
  curator_id INT NOT NULL,
  FOREIGN KEY (museum_id) REFERENCES Museum(museum_id)
  ON DELETE CASCADE,
  FOREIGN KEY (curator_id) REFERENCES Curator(curator_id)
  ON DELETE CASCADE
);

INSERT INTO Exhibit (exhibit_id, e_title, e_theme, start_date, end_date, museum_id, curator_id) VALUES
(1, 'Modern Reflections', 'Modern Art', '2025-01-10', '2025-03-10', 1, 1),
(2, 'Echoes of Time', 'History', '2025-02-01', '2025-05-01', 2, 2),
(3, 'Stone Stories', 'Sculpture', '2025-03-15', '2025-06-15', 3, 3),
(4, 'Captured Moments', 'Photography', '2025-04-20', '2025-07-20', 4, 4),
(5, 'New Waves', 'Contemporary', '2025-05-05', '2025-08-05', 5, 5),
(6, 'Past to Present', 'Cultural Heritage', '2025-06-10', '2025-09-10', 6, 6),
(7, 'Timeless Beauty', 'Ancient Art', '2025-07-01', '2025-10-01', 7, 7),
(8, 'Threads of Art', 'Textile Art', '2025-08-01', '2025-11-01', 8, 8),
(9, 'Clay Expressions', 'Ceramics', '2025-09-10', '2025-12-10', 9, 9),
(10, 'Folk Colors', 'Folk Art', '2025-10-01', '2026-01-01', 10, 10);


CREATE TABLE Ticket (
  ticket_id INT PRIMARY KEY,
  t_price INT,
  issue_date DATE,
  museum_id INT NOT NULL,
  curator_id INT NOT NULL,
  FOREIGN KEY (museum_id) REFERENCES Museum(museum_id)
  ON DELETE CASCADE,
  FOREIGN KEY (curator_id) REFERENCES Curator(curator_id)
  ON DELETE CASCADE
);

INSERT INTO Ticket (ticket_id, t_price, issue_date, museum_id, curator_id) VALUES
(1, 50, '2025-01-10', 1, 1),
(2, 40, '2025-02-01', 2, 2),
(3, 60, '2025-03-15', 3, 3),
(4, 35, '2025-04-20', 4, 4),
(5, 55, '2025-05-05', 5, 5),
(6, 45, '2025-06-10', 6, 6),
(7, 50, '2025-07-01', 7, 7),
(8, 30, '2025-08-01', 8, 8),
(9, 40, '2025-09-10', 9, 9),
(10, 50, '2025-10-01', 10, 10);

CREATE TABLE Sponsor (
  sponsor_id INT PRIMARY KEY,
  s_name CHAR(50),
  s_contact CHAR(50)
);

INSERT INTO Sponsor (sponsor_id, s_name, s_contact) VALUES
(1, 'Arkas Holding', 'arkas@arkas.com'),
(2, 'Koc Holding', 'info@koc.com'),
(3, 'Sabanci Foundation', 'info@sabanci.org'),
(4, 'Borusan', 'contact@borusan.com'),
(5, 'Eczacibasi', 'hello@eczacibasi.com'),
(6, 'Dogus Group', 'info@dogus.com'),
(7, 'Turkcell', 'support@turkcell.com'),
(8, 'Zorlu Holding', 'info@zorlu.com'),
(9, 'Garanti BBVA', 'bank@garantibbva.com'),
(10, 'Anadolu Group', 'info@anadolu.com');


CREATE TABLE Location (
  location_id INT PRIMARY KEY,
  loc_address CHAR(100),
  museum_id INT UNIQUE NOT NULL,
  FOREIGN KEY (museum_id) REFERENCES Museum(museum_id)
  ON DELETE CASCADE
);

INSERT INTO Location (location_id, loc_address, museum_id) VALUES
(1, 'Karakoy Mah., Istanbul', 1),
(2, 'Tepebasi Cad., Istanbul', 2),
(3, 'Emirgan Cad., Istanbul', 3),
(4, 'Cankaya, Ankara', 4),
(5, 'Alsancak, Izmir', 5),
(6, 'Heykel Meydani, Bursa', 6),
(7, 'Ataturk Bulv., Antalya', 7),
(8, 'Merkez, Konya', 8),
(9, 'Cumhuriyet Cad., Van', 9),
(10, 'Yeni Mahalle, Mardin', 10);


CREATE TABLE Museum_Sponsor (
  museum_id INT,
  sponsor_id INT,
  PRIMARY KEY (museum_id, sponsor_id),
  FOREIGN KEY (museum_id) REFERENCES Museum(museum_id)
  ON DELETE CASCADE,
  FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id)
  ON DELETE CASCADE
);

INSERT INTO Museum_Sponsor (museum_id, sponsor_id) VALUES
(1,1),(1,2),(2,3),(3,4),(4,5),
(5,6),(6,7),(7,8),(8,9),(9,10);

CREATE TABLE Exhibit_Artwork (
  exhibit_id INT,
  artwork_id INT,
  PRIMARY KEY (exhibit_id, artwork_id),
  FOREIGN KEY (exhibit_id) REFERENCES Exhibit(exhibit_id)
  ON DELETE CASCADE,
  FOREIGN KEY (artwork_id) REFERENCES Artwork(artwork_id)
  ON DELETE CASCADE
);

INSERT INTO Exhibit_Artwork (exhibit_id, artwork_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

CREATE TABLE Sponsor_Exhibit (
  sponsor_id INT,
  exhibit_id INT,
  PRIMARY KEY (sponsor_id, exhibit_id),
  FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id)
  ON DELETE CASCADE,
  FOREIGN KEY (exhibit_id) REFERENCES Exhibit(exhibit_id)
  ON DELETE CASCADE
);

INSERT INTO Sponsor_Exhibit (sponsor_id, exhibit_id) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);