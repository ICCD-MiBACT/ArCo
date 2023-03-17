# CommunicationMedium 

**DEPRECATED VERSION**



**UPDATE PATTERN**


![CommunicationMedium pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/CommunicationMedium/CommunicationMedium-Pattern.drawio.png?raw=true)



![CommunicationMedium pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/CommunicationMedium/CommunicationMedium-Versione1.2.drawio.png?raw=true)



## Competency questions

**QC1**  
What are the accompanying instruments of cp x?  
Quali sono gli strumenti di accompagnamento del bene x?  

select ?strum where {  
?x a a-dd:CommunicationMedium;  
a-mi:involvesSoloInstrument ?strum  
}  
 

**QC2**
Which goods have a type of kinetic communication?  
Quali beni hanno un tipo di comunicazione cinetica?  

select ?x {  
?x a-dd:hasCommunicationMedium ?commed .  
?commed core:hasType <https://w3id.org/arco/ontology/denotative-description/KineticCommunication> .  
}  
  


**QC3**  
How many male participants did cp x have?  
Quanti partecipanti uomini ha avuto il bene x?  

select ?men where {  
?x a-dd:hasCommunicationMedium ?commed .  
?commed a-dd:numberOfMaleParticipants ?men .  
}  
 
