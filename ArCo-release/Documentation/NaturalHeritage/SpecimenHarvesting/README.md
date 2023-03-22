# SpecimenHarvesting 


**UPDATE PATTERN**


![SpecimenHarvesting pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/NaturalHeritage/SpecimenHarvesting/SpecimenHarvesting-Pattern.drawio.png?raw=true)


## Competency questions


**CQ1**   
Who collected the sample of cp x and at what time?  
Chi ha raccolto il campione del bene x e in quale momento?

select ?agent ?time where {  
?x a-spe:hasSpecimenHarvesting ?spehar .  
?spehar core:hasAgentRole ?hagrol .  
?agrol core:hasAgent ?agent .  
?spehar <<https://w3id.org/italia/onto/TI/atTime>> ?time .  
}  

 

**CQ2**  
What is the method used and the motivation for collecting cp x?  
Qual è il metodo utilizzato e il motivo della raccolta del bene x?   

select ?method ?motivation where {  
?x a-spe:hasSpecimenHarvesting ?spehar .   
?spehar a-spe:hasHarvestingMethod ?method ;   
a-spe:hasHarvestingMotivation ?motivation .   
}   


