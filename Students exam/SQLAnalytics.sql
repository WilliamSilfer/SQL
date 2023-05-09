# Teste para ver o Dataset
SELECT * FROM `students-exam.Students_exams.Students_exams` LIMIT 100;

#1 - Qual o grupo que obteve melhor média de notas
SELECT DISTINCT EthnicGroup as Grupos, ROUND(AVG(MathScore) + AVG(ReadingScore)+ AVG(WritingScore), 2) as Media_total,
FROM `students-exam.Students_exams.Students_exams` 
WHERE EthnicGroup != 'null'
GROUP BY Grupos
ORDER BY Media_total;
#R: Grupo E

#2 - Qual gênero obteve melhor média de notas
SELECT DISTINCT Gender, ROUND(AVG(MathScore) + AVG(ReadingScore)+ AVG(WritingScore), 2) as Media_total
FROM `students-exam.Students_exams.Students_exams`
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY Media_total;
#R: Female

#3 - Média de Notas de cada teste
SELECT ROUND(AVG(MathScore),2) AS Matematica, ROUND(AVG(ReadingScore),2) AS Leitura, ROUND(AVG(WritingScore),2) AS Escrita,
FROM `students-exam.Students_exams.Students_exams`;
#R: Matematica 66.56 / Leitura 69.38 / Escrita 68.42

#4 - Média de notas para horas estudadas (menos de 5; entre 5 e 10; mais do que 10)
SELECT WklyStudyHours, ROUND(AVG(MathScore),2) AS Matematica, ROUND(AVG(ReadingScore),2) AS Leitura, ROUND(AVG(WritingScore),2) AS Escrita
FROM `students-exam.Students_exams.Students_exams` 
WHERE WklyStudyHours IS NOT NULL
GROUP BY WklyStudyHours
ORDER BY WklyStudyHours;

#5 Descubra a quantidade de pais que contém ensino superior 
SELECT  DISTINCT ParentEduc as Escolaridade, COUNT(ParentEduc) as QTD_ES, 
FROM `students-exam.Students_exams.Students_exams`
WHERE ParentEduc != 'some high school' and ParentEduc != 'high school'
GROUP BY ParentEduc;

#6 - Qual o tipo de almoço mais popular?
SELECT DISTINCT (LunchType) AS tipo_almoco, COUNT(LunchType) as Almoco_total,  
FROM `students-exam.Students_exams.Students_exams`
GROUP BY tipo_almoco
ORDER BY LunchType Desc;

#7 - Qual a correlação entre as colunas?
# Por ter muitos dados categóricos, deixarei esta questão para fazer em python

#8 - Mostre a média de notas entre os estudantes com preparo e sem preparo
SELECT DISTINCT TestPrep, COUNT(TestPrep) AS qtd_aluno,ROUND(AVG(MathScore),2) AS Matematica, ROUND(AVG(ReadingScore),2) AS Leitura, ROUND(AVG(WritingScore),2) AS Escrita,
FROM `students-exam.Students_exams.Students_exams`
WHERE TestPrep IS NOT NULL
GROUP BY TestPrep;

#9 - Qual a frequencia dos estudantes que praticam esporte?
SELECT  COUNT(PracticeSport) as Quantidade,
CASE WHEN PracticeSport = 'regularly' THEN 'Regular'
      WHEN PracticeSport = 'sometimes' THEN 'As vezes'
      ELSE 'Nunca' END AS Categoria
FROM `students-exam.Students_exams.Students_exams` 
WHERE PracticeSport IS NOT NULL
GROUP BY PracticeSport;

#10 - De acordo com a frequencia daqueles que praticam esporte, mostre as médias de notas dos mesmos

#9 - Qual a frequencia dos estudantes que praticam esporte?
SELECT  COUNT(PracticeSport) as Quantidade,ROUND(AVG(MathScore),2) AS Matematica, ROUND(AVG(ReadingScore),2) AS Leitura, ROUND(AVG(WritingScore),2) AS Escrita,
CASE WHEN PracticeSport = 'regularly' THEN 'Regular'
      WHEN PracticeSport = 'sometimes' THEN 'As vezes'
      ELSE 'Nunca' END AS Categoria
FROM `students-exam.Students_exams.Students_exams` 
WHERE PracticeSport IS NOT NULL
GROUP BY PracticeSport;

#11 - O número de crianças que vão a escola por onibus escolar e privada
SELECT COUNT(TransportMeans) as numero,
CASE  WHEN TransportMeans = 'school_bus' THEN 'Onibus Escolar'
      WHEN TransportMeans = 'private' THEN 'Privado'
      END as Transporte
FROM `students-exam.Students_exams.Students_exams`
WHERE TransportMeans IS NOT NULL
GROUP BY TransportMeans;

#12 - Mostre a quantidade total de alunos que zeraram cada prova
SELECT  COUNT(MathScore), COUNT(ReadingScore), COUNT(WritingScore), 
FROM `students-exam.Students_exams.Students_exams`
WHERE MathScore < 1 OR ReadingScore < 1 OR WritingScore < 1
GROUP BY MathScore, ReadingScore, WritingScore;





