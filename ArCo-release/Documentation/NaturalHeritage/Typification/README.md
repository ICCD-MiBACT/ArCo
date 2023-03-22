# Typification 


**UPDATE PATTERN**


![Typification pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/NaturalHeritage/Typification/Typification-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1**  
Which type does sample x represent?    
Quale tipo rappresenta il campione x?  

select ?type where {  
?x spe:hasTypification ?typification .  
?typification spe:hasTypeOgTypeSpecimen ?type .  
}  




**CQ2**  
Who typified sample x and at what time?     
Chi ha tipificato il campione x e in quale momento?  

select ?agent ?time where {  
?x spe:hasTypification ?typification .  
?typification core:involvesAgent ?agent ;  
<https://w3id.org/italia/onto/TI/atTime> ?time .  
}  
 


