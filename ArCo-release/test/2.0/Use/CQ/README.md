**CQ1**

Quali sono stati gli usi del bene x? che tipo di usi sono?

What are the usages of cp1? What type of usage are?

SELECT distinct ?function ?type where {
ex:cp1 a-cd:hasUse ?use.
?use core:hasType ?type;
a-cd:hasUseFunction ?function .

}
limit 100

**CQ2**

In quale circostanza il bene ha avuto un dato uso?

What circumstances involve the usage1 of cp1?

select distinct ?circumstance where {
?entity a-cd:hasUse ?use.
?use a-cd:hasCircumstance ?circumstance;
}
LIMIT 100


**CQ3**

Chi ha usato il bene cp1?

Who used cp1?

SELECT distinct ?user where {
ex:cp1 a-cd:hasUse ?use.
?use a-core:hasAgentRole ?agentrole.
?agentrole a-core:hasAgent ?user .
}
LIMIT 100
