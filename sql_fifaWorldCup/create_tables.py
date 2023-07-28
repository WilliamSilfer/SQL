import conexao
conexao

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
# Create table WorldCups
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
mycursor.execute(create_table_worldcups)
mycursor.execute(create_table_worldcupPlayers)
conexao.conn.commit()
#----------------------------------------------------------------------------

print('\nTables Created\n')

show_tables_query = 'SHOW TABLES'
mycursor.execute(show_tables_query)
tabelas = mycursor.fetchall()
[print(i) for i in tabelas]
conexao.conn.commit()


mycursor.close()
conexao.conn.close()
print('Cursor close')