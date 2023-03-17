# WaterSystem 

**UPDATE PATTERN**


![WaterSystem pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/ArchitecturalOrLandscapeHeritage/WaterSystem/WaterSystem-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1a**

Which type of fountain has the garden and how's named?  
Che tipo di fontana ha il giardino x e come si chiama?  

select ?name ?type where {  
?x a-con:hasTechnicalSystem ?y .  
?y a a-con:WaterSystem .  
?y a-con:hasWaterElement ?fount .  
?fount a-core:hasType ?type .  
?fount a-cd:hasDesignationInTime ?designat .  
?designat l0:name ?name.  
}  


**CQ1b**  

select ?name ?type where {  
?x a-con:hasTechnicalSystem ?y .  
?y a a-con:WaterSystem .  
?y a-con:hasWaterElement ?fount .  
?fount a-core:hasType ?type .  
?fount a-lite:assignedDesignation ?name.  
}  


**CQ2a**

What are technical chracteristic of fountain x?  
Che catatteristiche tecniche (materiale e tecnica) ha la fontana x?  

select ?caratt where {  
?x a a-con:Fountain ;  
a-dd:hasTechnicalStatus ?techstat .  
?techstat a-dd:includesTechnicalCharacteristic ?caratt .  
}   


**CQ2b**

select ?mat ?techn where {  
?x a-con:Fountain ;  
a-lite:hasMaterial ?mat ;  
a-lite:hasTechnique ?techn .  
}  


**CQ3**  

Which type of water system has cp x?  
Quale è il tipo di sistema delle acque del bene x?  

select ?x ?type where {  
?x a-con:hasTechnicalSystem ?y .  
?y a a-con:WaterSystem    
a-core:hasType ?type .  
}  

**CQ4**

Which mode of irrigation has cp x?  
Quale è la modalità di irrigazione usata nel bene x?  

select ?x ?mode where {  
?x a-con:hasTechnicalSystem ?y .  
?y a a-con:WaterSystem    
a-con:hasModeOfIrrigation ?mode .  
}  


**CQ5**

Which is the water distribution of cp x?  
Quale è la distribuzione delle acque nel bene x?  

select ?x ?dist where {  
?x a-con:hasTechnicalSystem ?y .  
?y a a-con:WaterSystem    
a-con:hasWaterDistribution ?dist .  
}  
