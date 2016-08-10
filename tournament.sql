--It will register the player name with serial id
CREATE TABLE registerplayers(id serial primary key,name VARCHAR(300));

--The match table contains the winner id and loser id
CREATE TABLE match(id serial primary key,winner int REFERENCES registerplayers(id),loser int 
	REFERENCES registerplayers(id));

--The wincount view table contains the winner id and count of wins
CREATE VIEW wincount AS SELECT registerplayers.id,registerplayers.name,count(match.winner) AS wins 
	FROM registerplayers LEFT JOIN match 
    ON registerplayers.id = match.winner
    GROUP BY registerplayers.id;

--The losercount contains the loserid and the no. of times they lost
CREATE VIEW losercount AS SELECT registerplayers.id,registerplayers.name,count(match.winner) AS losses 
   FROM registerplayers LEFT JOIN match
   ON registerplayers.id = match.loser
   GROUP BY registerplayers.id;

--The matchcount contains the wincount and losercount of each and every player
CREATE VIEW matchcount AS SELECT wincount.id,wincount.name,wincount.wins+losercount.losses AS matches
	FROM wincount,losercount 
	WHERE wincount.id = losercount.id;
	
--The standings will show the list sorted according to wins 
CREATE VIEW standings AS SELECT wincount.id,wincount.name,wincount.wins,matchcount.matches
	FROM wincount,matchcount WHERE wincount.id=matchcount.id
	GROUP BY wincount.id,wincount.name,wincount.wins,matchcount.matches
	ORDER BY wincount.wins DESC;








