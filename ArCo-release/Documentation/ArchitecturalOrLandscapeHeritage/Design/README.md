# Design


**UPDATE PATTERN**


![Design pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/ArchitecturalOrLandscapeHeritage/Design/Design-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1**  
What are the characteristics of cp x's design?  
Quali sono le caratteristiche del design del bene x?


select ?z ?y where {  
?x a-con:hasDesign ?design .  
?desing ?z ?y .  
}

