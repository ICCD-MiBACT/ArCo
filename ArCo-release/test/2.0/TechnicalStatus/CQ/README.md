**CQ1**

Chi è l’autore dell’opera x?

Who is the author of cultural property x?

select distinct ?cp ?aut  where {
?cp a-lite:hasAuthor ?aut
}
LIMIT 100
or
select distinct ?cp ?aut  where {
?cp a-cd:hasResponsibility ?resp.
?resp a-cd:hasInterventionRole ?role ;
a-cd:hasAgentWithResponsibility ?aut .
FILTER regex(?role, “autore”, “i”)
}

LIMIT 100



**CQ2**

Quali sono le opere di Y?

What are Y's works?

select distinct ?cp ?aut  where {
?cp a-lite:hasAuthor ?aut
}
LIMIT 100

or

select distinct ?cp ?aut  where {
?cp a-cd:hasResponsibility ?resp.
?resp a-cd:hasInterventionRole ?role ;
a-cd:hasAgentWithResponsibility ?aut .
FILTER regex(?role, “autore”, “i”)
}

LIMIT 100



**CQ3**

Quale è la responsabilità alternativa dell’opera x? In base a quale fonte? 

What is the alternative responsibility of the cultural property x? According to what source?

SELECT DISTINCT * WHERE{
?entity a-dd:hasTechnicalStatus ?Status.
?Status ti:hasTemporalEntity ?time
}
limit 100

