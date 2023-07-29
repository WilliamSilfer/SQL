import conexao
import pandas as pd
conexao
mycursor = conexao.conn.cursor()

df = pd.read_csv('sql_fifaworldcup/dados/fifaworld/worldcups.csv', sep = ';')
print(df.head())




mycursor.close()
conexao.conn.close()