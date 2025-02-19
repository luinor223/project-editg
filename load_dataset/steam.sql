DROP DATABASE IF EXISTS steam;
CREATE DATABASE steam;
USE steam;

-- game: Main table containing details about the games, such as title, release date, and other metadata.
DROP TABLE IF EXISTS steam.game;
CREATE TABLE steam.game (
    appid INT PRIMARY KEY,
    name VARCHAR(255),
    release_date DATE,
    is_free BOOLEAN,
    price_overview JSON,
    languages TEXT,
    type VARCHAR(10)
);

-- game_genre: Genres assigned to each game.
DROP TABLE IF EXISTS steam.game_genre;
CREATE TABLE steam.game_genre (
    appid INT,
    genre VARCHAR(255),
    PRIMARY KEY (appid, genre)
);

-- game_tag: Tags associated with each game, such as "Indie", "Action", etc.
DROP TABLE IF EXISTS steam.game_tag;
CREATE TABLE steam.game_tag (
    appid INT,
    tag VARCHAR(255),
    PRIMARY KEY (appid, tag)
);

-- reviews: Review data for the games, including Steam ratings and review counts.
DROP TABLE IF EXISTS steam.review;
CREATE TABLE steam.review (
    appid INT PRIMARY KEY,
    positive_reviews INT,
    negative_reviews INT,
    total_reviews INT,
    positive_percent FLOAT
);

-- steamspy_insights: Insights gathered from SteamSpy, such as estimated sales, playtime, and more.
DROP TABLE IF EXISTS steam.steamspy_insight;
CREATE TABLE steam.steamspy_insight (
    appid INT PRIMARY KEY,
    developer VARCHAR(255),
    publisher VARCHAR(255),
    owner_range VARCHAR(255),
    concurrent_users_yesterday INT,
    playtime_average_forever INT,
    playtime_average_2weeks INT,
    playtime_median_forever INT,
    playtime_median_2weeks INT,
    price INT,
    initial_price INT,
    discount INT
);

-- descriptions: Full and summary text descriptions of each game.
DROP TABLE IF EXISTS steam.game_description;
CREATE TABLE steam.game_description (
    appid INT PRIMARY KEY,
    summary TEXT,
    extensive TEXT,
    about TEXT
);

-- promotional: Links and metadata for promotional materials, such as trailers and screenshots.
DROP TABLE IF EXISTS steam.promotional;
CREATE TABLE steam.promotional (
    appid INT PRIMARY KEY,
    header_image TEXT,
    background_image TEXT,
    screenshots JSON,
    movies JSON
);

-- categories: Information about the different Steam categories that games belong to (e.g., "Single-player", "Full controller support", etc.).
DROP TABLE IF EXISTS steam.game_category;
CREATE TABLE steam.game_category (
    appid INT,
    category VARCHAR(255),
    PRIMARY KEY (appid, category)
);