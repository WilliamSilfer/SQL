# Conexão com banco de dados
import mysql.connector

conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "chase009",
    database = 'fifaWorldCup'
)

print('Connection Successful')
