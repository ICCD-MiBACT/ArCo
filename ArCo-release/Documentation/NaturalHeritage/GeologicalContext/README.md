# GeologicalContext 


**UPDATE PATTERN**


![GeologicalContext pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/NaturalHeritage/GeologicalContext/GeologicalContext-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1**   

What is the type of outcrop from which cp x comes?   
Qual è il tipo di affioramento da cui proviene il bene x?  

select ?type where {  
?x spe:hasSpecimenHarvesting ?spehar .  
?spehar a-loc:hasTimeIndexedTypedLocation ?titl .  
?titl a-spe:hasGeologicalContext ?geocont .  
?geocont a-spe:hasOutcrop ?out .  
?out core:hasType ?type .  
}  


 

**CQ2**  
From what type of storage/deposit is cp x derived?  
Da che tipo di deposito/giacimento deriva il bene x? 

select ?type where {  
?x spe:hasSpecimenHarvesting ?spehar .  
?spehar a-loc:hasTimeIndexedTypedLocation ?titl .  
?titl a-spe:hasGeologicalContext ?geocont .  
?geocont spe:hasMineralDeposit ?mindep .  
?mindep core:hasType ?type .  
}  

