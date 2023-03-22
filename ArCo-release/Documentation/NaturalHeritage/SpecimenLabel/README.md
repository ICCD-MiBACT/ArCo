# SpecimenLabel 


**UPDATE PATTERN**


![SpecimenLabel pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/NaturalHeritage/SpecimenLabel/SpecimenLabel-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1**  
What tags or labels are on specimen x? and in what language are they written?  
Quali cartellini o etichette sono presenti sul campione x? e in quale lingua sono scritti?  

select ?spelab ?lang where {  
?x spe:hasSpecimenLabel ?spelab .  
?spelab <<https://w3id.org/italia/onto/Language/hasLanguage>> ?lang .  
}  



**CQ2**  
What is the header and text on the tag of cp x?    
Qual è il l’intestazione e il testo riportato sul cartellino del bene x?   

select ?head ?text where {  
?x spe:hasSpecimenLabel ?spelab .  
?spelab a-dd:headingTranscript ?head ;  
a-dd:bodyTranscript ?text .  
