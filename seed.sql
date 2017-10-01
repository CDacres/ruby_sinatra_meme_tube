DROP TABLE IF EXISTS meme;

CREATE TABLE meme (
id SERIAL PRIMARY KEY,
title VARCHAR,
description TEXT,
url TEXT,
genre VARCHAR
);

INSERT INTO meme (title, description, url, genre) VALUES ('"Game Of Thrones" Ultimate Birthday Rap Battle (featuring Taryn Southern) ORIGINAL', 'Game of Thrones rap battle summarising story up to season 3 just before the red wedding.', 'https://www.youtube.com/embed/M3vcReSWDY8', 'Music Video');
INSERT INTO meme (title, description, url, genre) VALUES ('HOGWARTS: Which House Are You?', 'Gryffindors are brave, Ravenclaws are smart, Slytherins are cunning, but what the hell is a Hufflepuff?', 'https://www.youtube.com/embed/y0Z5_wipT2o', 'Sketch');
INSERT INTO meme (title, description, url, genre) VALUES ('Shy Ronnie 2: Ronnie and Clyde (feat. Rihanna)', 'Video by the Lonely Island featuring Rihanna. Use your outside voice!', 'https://www.youtube.com/embed/6_W_xLWtNa0', 'Music Video');