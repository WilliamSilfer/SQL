# Criação de tabelas

import conexao
conexao
# Conexão com banco de dados
mycursor = conexao.conn.cursor()
mycursor.execute("CREATE DATABASE IF NOT EXISTS fifaWorldCup")

mycursor.execute("SHOW DATABASES")

[print(i) for i in mycursor]
print('\n-----------------------------------------------------------')
mycursor.execute("use fifaWorldCup")
print("fifaWorldCup database use now")
print('-----------------------------------------------------------')
print('\nCreating tables')
#---------------------------------------------------------
# Create tables
create_table_worldcups = '''CREATE TABLE IF NOT EXISTS WorldCups
    (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Year DATE NOT NULL,
    Country varchar(60) NOT NULL,
    Winner varchar(60) NOT NULL,
    RunnersUp varchar(60) NOT NULL,
    Third varchar(60) NOT NULL,
    Fourth varchar(60) NOT NULL,
    GoalsScored int(3) NOT NULL,
    QualifiedTeams int(2) NOT NULL,
    MatchesPlayed int(2) NOT NULL,
    Attendance float(10) NOT NULL
    );

    '''
create_table_worldcupPlayers = '''
    CREATE TABLE IF NOT EXISTS WorldCupPlayers 
    (
    id INT AUTO_INCREMENT PRIMARY KEY,
    RoundID int,
    MatchID int,
    CoachName varchar(60),
    LineUp char(2),
    ShirtNumber int(2),
    PlayerName varchar(60),
    Position varchar(10),
    Event varchar(30)
    );
    '''
create_table_worldCupMatches = '''
    CREATE TABLE IF NOT EXISTS WorldCupMatches 
    (
    id INT AUTO_INCREMENT PRIMARY KEY,
    year DATE,
    date date,
    time time,
    Stage varchar(30),
    Stadium varchar(70),
    City varchar(70),
    HomeTeamName varchar(50),
    HomeTeamGoals int(2),
    AwayTeamGoals int(2),
    AwayTeamName varchar(50),
    WinCondition varchar(70),
    Attendance int(7),
    HalfTimeHomeGoals int(3),
    HalfTimeAwayGoals int(3),
    Referee varchar(60),
    Assistant1 varchar(70),
    Assistant2 varchar(70),
    RoundID int,
    MatchID int,
    HomeTeamInitials varchar(10),
    AwayTeamInitials varchar(10)
    );
'''

mycursor.execute(create_table_worldcups)
mycursor.execute(create_table_worldcupPlayers)
mycursor.execute(create_table_worldCupMatches)
conexao.conn.commit()
#----------------------------------------------------------------------------
# SHOW TABLES
print('\nTables Created\n')

show_tables_query = 'SHOW TABLES'
mycursor.execute(show_tables_query)
tabelas = mycursor.fetchall()
[print(i) for i in tabelas]
conexao.conn.commit()

mycursor.close()
conexao.conn.close()
print('Cursor close')