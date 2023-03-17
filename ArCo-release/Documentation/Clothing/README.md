# Clothing


**UPDATE PATTERN**


![Clothing pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/Clothing/Clothing-Pattern.drawio.png?raw=true)


## Competency questions


**CQ1**  
What kind of decoration does the sleeve of dress x have?  
Che tipo di decorazione ha la manica del vestito x?  
select ?type where {  
?x clo:hasClothingElement ?elem .  
?elem a clo:Sleeve ;  
core:hasType ?type .  
}  


**CQ2a**  
What is the waist circumference of dress x?  
Qual è la circonferenza della vita del vestito x?  
select ?len where {  
?x a-dd:hasTechnicalStatus ?stat .  
?stat a-dd:includesTechnicalCharacteristic ?circ .  
?circ a-dd:isClassifiedBy a-dd:WaistCircumference .  
}  

**CQ2b**  

select ?circ where {  
?x a-lite:hasWaistCircumference ?circ  
}  


**CQ3**  
What is the subject of costume x and the occasion for which it was made?  
Qual è il soggetto del costume x e l’occasione per cui è stato realizzato?  
select ?sub ?circ where {  
?x a clo:Costume ;  
clo:hasSubject ?subj ;  
clo:hasCircumstances ?circ  
}  

