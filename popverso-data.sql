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

-- SQL script to insert data
INSERT INTO characters (id, name, age, shadow, description) VALUES
(1, 'Gerry Scotti', 675, FALSE, 'Il leggendario portatore di risate. La sua risata disintegra il male e protegge i buoni.'),
(2, 'Giulia De Lellis', 28, FALSE, "La Lancia d'Ambizione, determinata e impavida. Al principio concentrata solo su se stessa, ma destinata a crescere."),
(3, 'Enrico Papi', 158, TRUE, 'Il Signore delle Sigle, maestro del caos e del fascino disarmante. Dietro il suo sorriso si cela un piano oscuro.'),
(4, 'Giovanni Brumotti', 333, TRUE, "Il Cavaliere delle Due Ruote. Agisce nell'ombra, armato del potere della velocità e dell'equilibrio assoluto."),
(5, 'Pippo Franco', 2538, FALSE, 'Il Folle Stratega, con battute tanto confuse quanto geniali. La sua imprevedibilità è la sua arma migliore.');

INSERT INTO abilities (id, character_id, name, description) VALUES
(1, 1, 'Risata Devastante', 'La risata di Gerry disintegra qualsiasi nemico entro un raggio di 10 metri.'),
(2, 2, "Lancia d'Ambizione", "Un'arma che cresce di potenza con la determinazione del suo portatore."),
(3, 3, 'Sigla Ipnotica', 'Enrico può ipnotizzare chiunque con le sigle dei suoi game show.'),
(4, 4, 'Acrobazie Oscure', 'Brumotti sfrutta acrobazie impossibili per disorientare e attaccare.'),
(5, 5, 'Confusione Totale', 'Pippo crea caos totale con battute incomprensibili ma efficaci.');

INSERT INTO teams (id, name, description) VALUES
(1, 'Leggende della Risata', "Un gruppo dedicato a proteggere il mondo con il potere dell'umorismo."),
(2, 'Ambiziosi Oscuri', 'Una squadra formata da individui che perseguono i propri obiettivi a ogni costo.'),
(3, 'Caos Calcolato', 'Personaggi imprevedibili che giocano con il destino stesso.');

INSERT INTO character_teams (id, character_id, team_id, is_spy) VALUES
(1, 1, 1, FALSE),
(2, 2, 2, FALSE),
(3, 3, 2, FALSE),
(4, 4, 3, TRUE), -- Brumotti infiltrates team 3 as a spy
(5, 5, 3, FALSE),
(6, 2, 1, TRUE), -- Giulia spies on Leggende della Risata
(7, 3, 3, TRUE); -- Enrico spies on Caos Calcolato