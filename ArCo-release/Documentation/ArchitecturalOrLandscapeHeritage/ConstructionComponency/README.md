# ConstructionComponency

**UPDATE PATTERN**


![ConstructionComponency pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/ArchitecturalOrLandscapeHeritage/ConstructionComponency/ConstructionComponency-Pattern.drawio.png?raw=true)



## Competency questions


**CQ1**  
How many components make up cp x?  
Quante parti costituiscono il bene x? 

select (count(?part) as ?count) where {  
?x a a-conConstruction .  
?x a-core:hasPart ?part .  
}  


**CQ2**
What are the spaces that constitute co x?  
Quali sono gli spazi che costituiscono il bene x?  

select ?space where {  
?x a-con:hasConstructionSpace ?space .  
}  
