**CQ1**

Qual è il formato del documento x collegato al bene y?

What’s the documentation file format of cultural property y?

SELECT DISTINCT ?format where {
?x a-cd:hasDocumentation ?doc .
?doc a-dd:hasFormat ?format .
} 
LIMIT 100


**CQ2**

Secondo quale licenza posso usare la foto x?

Under what license can photo x be used?

SELECT DISTINCT ?license where {
?x a a-cd:PhotographicDocumentation ;
a-cd:hasLicense ?license .
}
LIMIT 100

