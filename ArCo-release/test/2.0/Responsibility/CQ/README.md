**CQ1**

Chi è l'autore del bene x?

Who is the author of cultural property x?

select distinct ?cp ?aut  where {
?cp a-cd:hasResponsibility ?resp.
?resp a-cd:hasInterventionRole ?role ;
a-cd:hasAgentWithResponsibility ?aut .
FILTER regex(?role, “autore”, “i”)
}


**CQ2**

Che ruolo ha avuto Y nella realizzazione dell'opera x?

What role did Y play in the realization of work x?

select distinct ?x ?y ?role where {
?x a-cd:hasResponsibility ?resp.
?resp a-cd:hasAgentWithResponsibility ?y;
a-cd:hasInterventionRole ?role
}


**CQ3**

Qual è la fonte d'informazione che attribuisce la responsabilità alternativa a Y per la realizzazione dell'opera x?

What is the source of information that attributes alternative responsibility to Y for the realization of work x?

select distinct ?source where {
?x a-cd:hasResponsibility ?resp.
?resp core:hasType a-cd:AlternativeOrOutdatedResponsibility;
core:informationSource ?source .
}
LIMIT 100
