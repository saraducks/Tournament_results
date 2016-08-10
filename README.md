# Tournament_results
This project works by connecting database to python using the PYSCOPG2 which is the adapter for python.The database created using psql in the vagrant VM and the .py file fetches records from database is created and executed in the same VM.The test file is executed to check the query and .py file works fine and gives the expected output.

##Tournament.sql
The database Tournament is created in vagrant VM and create the following tables and views.
  *Registerplayers : The Registerplayers table contains the name and auto generated id for the registered players.The id must be primary key since it is unique for each and every  player.
  *Match: The match table contains the winner and loser which reference to the register player id. It contains the winner id in winner column and loser id in loser column.
  The views are created using the tables, Views helps to reuse the table and reduce the complexity in building the query.
   * Wincount : This view contains the win count which is retrieved by joining the above tables.
   * Losercount: This view  contains the loser count which can be fetched using the registerplayers and match table.
   * Matchcount: This match count view will contain the total match count of each player which is computed using the win count and loser count view table.
   *Standings: The standings view contains the entire details about the player id,name,wins,matchtotalcount

 ##Tournament.py
 The .py file contains the queries to fetch the recored from the tournament database. 
  * import psycopg2: This will import all the necessary functions required to connect to database and include all the inbuilt functions.

 * connect(): The connect function will connect to database using inbuilt functions.
                   psycopg2.connect("dbname=tournament")
 * deleteMatches(): It will delete all the matches nice the game is over.
                   "TRUNCATE table tablename”
 * deletePlayers():  It will delete all the players name from the register player table once the game is over.
                   “DELETE from table name”
 * countPlayers(): It will count the total number of registered players
 
 * registerPlayer(name): It will register the player name in registerplayers table.
 
 * playerStandings(): It will return the player id,name, wins,matchtotalcount which is required for matching players in next round.

 * reportMatch(winner, loser): It will return the result of single match between two players.
 
 * swissPairings(): It will return the players to play in next round by finding the nearest match. 

##Tournament_test.py
The test .py file will run the test to check whether the input gives the expected output or not. It contains 10 test cases.

##References
 Vagrant 1.8.1
