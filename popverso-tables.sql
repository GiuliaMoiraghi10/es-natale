-- SQL Schema: Table Creation
CREATE TABLE characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    shadow BOOLEAN NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE abilities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (character_id) REFERENCES characters(id)
);

CREATE TABLE teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE character_teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    character_id INT NOT NULL,
    team_id INT NOT NULL,
    is_spy BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (character_id) REFERENCES characters(id),
    FOREIGN KEY (team_id) REFERENCES teams(id)
);