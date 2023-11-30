**CQ1**

Quando è stato classificato il bene x?

When cultural property x was classified by agent Y?

select ?time where {
?x core:hasClassificationInTime ?class .
?class <https://w3id.org/italia/onto/TI/hasTemporalEntity> ?time ;
core:involvesAgent ?agent . 
}


**CQ2**

Secondo quale sistema di classificazione è stato classificato il bene x?

According to which classification system was cultural property x classified?

select ?time ?syst where {
?x core:hasClassificationInTime ?class .
?class core:hasConcept ?concept .
?concept core:isDefinedByClassificationSystem ?syst .
}
