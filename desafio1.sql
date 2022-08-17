DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
  
CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(20) NOT NULL,
  price DECIMAL(4,2)
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  signature_date DATE NOT NULL,
  plan_id INT,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  release_year YEAR NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.musics(
  music_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.reproduction_history(
  music_id INT NOT NULL,
  user_id INT NOT NULL,
  reproduction_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, music_id),
  FOREIGN KEY (music_id) REFERENCES SpotifyClone.musics(music_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_artists(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.plan (plan_type, price)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (user_name, age, signature_date, plan_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);
    
INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO SpotifyClone.album (album_name, artist_id, release_year)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
    
INSERT INTO SpotifyClone.musics (title, duration, album_id)
  VALUES
    ('VIRGO’S GROOVE', 369, 1),
    ('Feeling Good', 100, 8),
    ('Samba em Paris', 267, 6),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Don’t Stop Me Now', 203, 2),
    ('The Bard’s Song', 244, 7),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Under Pressure', 152, 3),
    ('BREAK MY SOUL"', 279, 1),
    ('Como Nossos Pais', 105, 4);
    
INSERT INTO SpotifyClone.reproduction_history (music_id, user_id, reproduction_date)
  VALUES
    (1, 1, '2020-05-02 05:30:35'),
    (2, 1, '2020-03-06 11:22:33'),
    (3, 1, '2022-02-28 10:45:55'),
    (4, 2, '2020-01-02 07:40:33'),
    (2, 2, '2022-08-05 08:05:17'),
    (1, 3, '2020-12-05 18:38:30'),
    (2, 3, '2020-11-13 16:55:13'),
    (3, 4, '2021-08-15 17:10:10'),
    (8, 5, '2020-08-06 15:23:43'),
    (3, 5, '2022-01-09 01:44:33'),
    (9, 6, '2017-10-12 12:35:20'),
    (4, 6, '2017-01-24 00:31:17'),
    (5, 7, '2011-12-15 22:30:49'),
    (5, 8, '2012-03-17 14:56:41'),
    (6, 9, '2022-02-24 21:14:22'),
    (7, 10, '2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
