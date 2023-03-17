# ClassificationInTime (NaturalHeritage variant) 


**UPDATE PATTERN**


![ClassificationInTime pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/NaturalHeritage/ClassificationInTime-NatHeritage/ClassificationInTimeNaturalHeritage.drawio.png?raw=true)



## Competency questions

**CQ1a**   
According to which classification system was cp x classified?  
Secondo quale sistema di classificazione è stato classificato il bene x?  

select ?syst where {  
?x core:hasClassificationInTime ?class .  
?class spee:hasTaxon ?taxon .  
?concept core:refersToClassificationSystem ?syst .  


**CQ1b**  
select ?syst where {  
?x lite:isClassifiedByCurrentTaxon ?taxon .  
?taxon core:refersToClassificationSystem ?syst .  
}  



**CQ2**    
What are the studies and tests that led to the current classification of cp x?
Quali sono gli studi e i test che hanno portato alla classificazione corrente del bene x?

select ?y where {  
?x core:hasClassificationInTime ?cit .  
?cit core:isConsequence of ?y .  
}   
 
