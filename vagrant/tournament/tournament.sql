-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament;

CREATE TABLE players ( username TEXT,
                     id SERIAL);

CREATE TABLE matches ( winner INTEGER,
                       loser INTEGER,
                       id SERIAL);


-- View to get the number of wins by left joining players with matches
-- Players can exist without matches

CREATE view numWins as
SELECT players.id as winID,count(winner) as winNum
FROM players left join matches on players.id = matches.winner
GROUP BY players.id
ORDER BY winNum DESC;


-- View to get the number of matches of each player by left joining players with matches

CREATE view numMatches as
SELECT players.id as matchID,count(matches.id) as matchesNum
FROM players left join matches on players.id = matches.winner or players.id = matches.loser
GROUP BY players.id;


-- View to get the standings format, that results in ID,name,wins,matches

CREATE view standings as
SELECT players.id as ID,players.username as name,numWins.winNum as wins
,numMatches.matchesNum as matches
FROM numWins,players, numMatches
WHERE players.id = winID and players.id = numMatches.matchID
ORDER by wins DESC
