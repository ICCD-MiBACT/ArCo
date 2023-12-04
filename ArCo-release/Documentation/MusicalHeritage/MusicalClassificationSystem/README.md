# MusicalClassificationSystem 

**UPDATE PATTERN**


![MusicalClassificationSystem pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/MusicalHeritage/MusicalClassificationSystem/MusicalClassificationSystem.drawio.png?raw=true)



## Competency questions

**CQ1**    
A quale sistema di classificazione si riferisce la classe dello strumento x?  
Which classification system does the instrument class x refer to?  

SELECT DISTINCT ?entity ?classSyst   
WHERE{  
?entity core:isClassifiedBy ?class;  
?entity a arco:MusicHeritage.  
?class core:refersToClassificationSystem ?classSyst  
}  
limit 100  
 
 
 

**CQ2**  
Chi è l’autore del sistema di classificazione?  
Who is the author of the classification system?  

SELECT DISTINCT ?classSyst ?aut  
WHERE{  
?classSyst a core:ClassificationSystem ;
a-lite:hasAuthor ?aut  
}  
limit 100  


**CQ3**
A quale classe Hornbostel-Sachs appartiene lo strumento musicale?  
Which Hornbostel-Sachs class does the musical instrument belong to?  

SELECT DISTINCT ?entity ?num ?def ?edi   
WHERE{  
?entity core:isClassifiedBy ?class.  
?class a a-mi:Honrbostel-SachsClass;  
a-mi:HSNumber ?num;  
a-mi:HSDefinition ?def;  
a-mi:HSEdition ?edi  
}  
limit 100
 
  
