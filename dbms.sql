
CREATE DATABASE st_data1;
USE st_data1;

CREATE TABLE users (
    u_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);
CREATE TABLE tracks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    song_singer VARCHAR(255) NOT NULL,
    song_link VARCHAR(255) NOT NULL,
    coverURL VARCHAR(255) NOT NULL
);
CREATE TABLE playlist (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(255),
    u_id INT REFERENCES users(u_id)
);
CREATE TABLE albums (
    al_id INT PRIMARY KEY,
    a_name VARCHAR(255),
    r_date DATE,
    a_img VARCHAR(255)
);
CREATE TABLE billboard (
    b_id INT PRIMARY KEY,
    ranks INT
);
CREATE TABLE venue_rec (
    v_id INT PRIMARY KEY,
    up_shows INT
);
CREATE TABLE artists (
    a_id INT PRIMARY KEY,
    a_name VARCHAR(255),
    genre VARCHAR(255),
    ar_img VARCHAR(255),
    al_id INT REFERENCES albums(al_id),
    v_id INT REFERENCES venue_rec(v_id)
);
CREATE TABLE user_rec (
    w_stream INT,
    m_stream INT,
    a_stream INT,
    t_id INT REFERENCES tracks(t_id),
    u_id INT REFERENCES users(u_id)
);
CREATE TABLE artist_rec (
    top5_cst INT,
    top5_ast INT,
    a_id INT REFERENCES artists(a_id)
);

CREATE TABLE mix_streams (
	title VARCHAR(255) NOT NULL,
    m_id INT AUTO_INCREMENT PRIMARY KEY,
    u_id INT REFERENCES users(u_id),
    t_id INT REFERENCES tracks(t_id),
    frequency INT
);
CREATE TABLE likes (
    l_id INT PRIMARY KEY,
    u_id INT REFERENCES users(u_id),
    t_id INT REFERENCES tracks(t_id),
    like_date DATE
);
CREATE TABLE followers (
    f_id INT PRIMARY KEY,
    u_id INT REFERENCES users(u_id),
    a_id INT REFERENCES artists(a_id),
    follow_date DATE
);
DROP TABLE user_rec;

CREATE TABLE user_rec (
    rec_id INT PRIMARY KEY,
    u_id INT REFERENCES users(u_id),
    total_likes INT DEFAULT 0,
    total_follows INT DEFAULT 0,
    w_stream INT,
    m_stream INT,
    a_stream INT,
    t_id INT REFERENCES tracks(t_id)
);
CREATE TABLE demo( 
d_id INT PRIMARY KEY
);
DROP TABLE demo;

ALTER TABLE users ADD COLUMN hashed_password VARCHAR(255);
ALTER TABLE users ADD COLUMN salt VARCHAR(255);
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (1, 'The Weekend', 'pop', 'artist_image.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (2, 'olivia rodrigo', 'pop', 'artist_image.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (3, 'Bad Bunny', 'pop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (4, 'AC/DC', 'rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (5, 'Aerosmith', 'rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (6, 'The Rolling Stones', 'rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (7, 'Pharell Williams', 'hip-hop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (8, 'Kanye West', 'hip-hop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (9, 'Taylor the creator', 'hip-hop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (10, 'avicci', 'electronic', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (11, 'David guetta', 'electronic', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (12, 'Martin Garrix', 'electronic', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (13, 'Arctic Monkeys', 'indie-rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (14, 'Maroon-5', 'rock-pop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (15, 'ABBA', 'rock-pop', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (16, 'The Neighbourhood', 'indie-rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (17, 'The Strokes', 'indie-rock', 'artist_image1.jpg');
INSERT INTO artists (a_id, a_name, genre, ar_img)
VALUES (18, 'The Chemical Romance', 'rock-pop', 'artist_image1.jpg');
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (1, 'is it over now', '2', '',1);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (2, '505', '2', '',2);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (3, 'Do you wanna know?', '2', '',2);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (4, 'get lucky', '2', '',3);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (5, 'lay all your love on me', '2', '',4);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (6, 'earfquake', '2', '',5);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (7, 'runaway', '2', '',6);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (8, 'i wonder', '2', '',6);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (9, 'animals', '2', '',7);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (10, 'titanium', '2', '',8);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (11, 'star boy', '2', '',9);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (12, 'the nights', '2', '',9);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (13, 'save your tears', '2', '',9);
INSERT INTO tracks (t_id, t_name, duration, f_path,b_id)
VALUES (14, 'payphone', '2', '',10);
INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (1, 'AM', '2023-01-15', 'path/to/album1.jpg');

INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (2, 'graduation', '2022-07-20', 'path/to/album2.jpg');

INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (3, 'GKMC', '2021-03-10', 'path/to/album3.jpg');
INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (4, 'sour', '2023-01-15', 'path/to/album1.jpg');

INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (5, 'lover', '2022-07-20', 'path/to/album2.jpg');

INSERT INTO albums (al_id, a_name, r_date, a_img)
VALUES (6, 'wiped out', '2021-03-10', 'path/to/album3.jpg');

INSERT INTO billboard(b_id,ranks)
VALUES(1,1);
INSERT INTO billboard(b_id,ranks)
VALUES(2,2);
INSERT INTO billboard(b_id,ranks)
VALUES(3,3);
INSERT INTO billboard(b_id,ranks)
VALUES(4,4);
INSERT INTO billboard(b_id,ranks)
VALUES(5,5);
INSERT INTO billboard(b_id,ranks)
VALUES(6,6);
INSERT INTO billboard(b_id,ranks)
VALUES(7,7);
INSERT INTO billboard(b_id,ranks)
VALUES(8,8);
INSERT INTO billboard(b_id,ranks)
VALUES(9,9);
INSERT INTO billboard(b_id,ranks)
VALUES(10,10);
DELIMITER $$
DELIMITER $$
CREATE TRIGGER before_user_update 
BEFORE UPDATE ON users 
FOR EACH ROW 
BEGIN
  SET NEW.last_modified = CURRENT_TIMESTAMP();
END$$
DELIMITER ;
ALTER TABLE users ADD COLUMN role ENUM('user', 'admin') DEFAULT 'user';
DELIMITER $$

CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255)  -- Assuming you have a role column as ENUM
)
BEGIN
    -- Insert the new user into the users table
    INSERT INTO users (name, email, password) 
    VALUES (p_name, p_email, p_password);
END$$

DELIMITER ;


DELIMITER $$

UPDATE billboard b 
JOIN (
    SELECT t_id, COUNT(*) as total_likes
    FROM likes 
    GROUP BY t_id 
    ORDER BY total_likes DESC
) ranked_tracks ON b.b_id = ranked_tracks.t_id
SET b.ranks = ranked_tracks.total_likes;
-- This is a simplified example that treats all streams as if they were all-time streams.
UPDATE user_rec ur
JOIN (
    SELECT u_id, t_id, COUNT(*) AS stream_count
    FROM mix_streams
    GROUP BY u_id, t_id
) AS stream_counts ON ur.u_id = stream_counts.u_id AND ur.t_id = stream_counts.t_id
SET ur.a_stream = stream_counts.stream_count;
UPDATE mix_streams
SET frequency = frequency + 1
WHERE u_id = %s AND t_id = %s;
DELIMITER $$

CREATE PROCEDURE IncrementStreamCount(
    IN user_id INT,
    IN track_id INT
)
BEGIN
    DECLARE existing_frequency INT;

    -- Check if there's already a record for this user and track
    SELECT frequency INTO existing_frequency FROM mix_streams WHERE u_id = user_id AND t_id = track_id LIMIT 1;

    IF existing_frequency IS NOT NULL THEN
        -- If the record exists, increment the frequency
        UPDATE mix_streams SET frequency = frequency + 1 WHERE u_id = user_id AND t_id = track_id;
    ELSE
        -- If not, insert a new record with a frequency of 1
        INSERT INTO mix_streams (u_id, t_id, frequency) VALUES (user_id, track_id, 1);
    END IF;
END$$

DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'st_data1';

SELECT name FROM st_data1.users;

INSERT INTO tracks (title, song_singer, song_link, coverURL) VALUES
    ('Animals', 'Maroon 5', 'assets/songs/music_Sec/Animals.mp3', 'assets/images/Animals.jpeg'),
    ('Do I Wanna Know', 'Artic Monkey', 'assets/songs/music_Sec/Do I Wanna Know.mp3', 'assets/images/Do i wanna k.png'),
    ('Earfquake', 'Tyler', 'assets/songs/music_Sec/EARFQUAKE.mp3', 'assets/images/earfquake.jpeg'),
    ('Get Lucky', 'Daft Punk', 'assets/songs/music_Sec/Get Lucky.mp3', 'assets/images/get lucky.jpeg'),
    ('favourite worst nightmare', 'Artic Monkeys', 'assets/song/music_Sec/Favourite Worst Nightmare.mp3', 'assets/images/Favourite worst nightmare.jpeg'),
    ('I wonder', 'Kanye west', 'assets/songs/music_Sec/I Wonder.mp3', 'assets/images/I wonder.jpeg'),
    ('In the night', 'Weeknd', 'assets/songs/music_Sec/InThe Night.mp3', 'assets/images/In the night.jpeg'),
    ('Is it over now', 'Taylor Swift', 'assets/songs/music_Sec/Is It Over Now.mp3', 'assets/images/is it over now.jpeg'),
    ('Lay all your love on me', 'Abba', 'assets/songs/music_Sec/Lay All Your Love On Me.mp3', 'assets/images/lay all yor love on me.jpeg'),
    ('Payphone', 'Maroon 5', 'assets/songs/music_Sec/Payphone.mp3', 'assets/images/payphone.jpeg'),
    ('Runaway', 'Kanye West', 'assets/songs/music_Sec/Runaway.mp3', 'assets/images/runaway.jpeg'),
    ('Save your tears', 'Weeknd', 'assets/songs/music_Sec/Save Your Tears.mp3', 'assets/images/save_your_tears.jpeg'),
    ('Starboy', 'Weeknd', 'assets/songs/music_Sec/Starboy.mp3', 'assets/images/starboy.jpeg'),
    ('Titanium', 'David Guetta', 'assets/songs/music_Sec/Titanium (feat. Sia).mp3', 'assets/images/titanium.jpeg');
    
    
ALTER TABLE users ADD COLUMN last_modified TIMESTAMP;

-- First, let's clear the current data in the billboard table
TRUNCATE TABLE billboard;

-- Then, populate it with the top 10 most streamed tracks
INSERT INTO billboard (b_id, ranks)
SELECT t_id, ROW_NUMBER() OVER (ORDER BY frequency DESC) as ranks
FROM (
    SELECT t_id, SUM(frequency) as frequency
    FROM mix_streams
    GROUP BY t_id
    ORDER BY frequency DESC
    LIMIT 10 -- Change this limit according to the number of top tracks you want
) AS top_tracks;
