# Recording 

**UPDATE PATTERN**


![Recording pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/Recording/Recording-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1a**  

What is the audio recording of cp x in which person y is present?  
Qual è la registrazione audio del bene x in cui è presente la persona y?  
select ?rec where {  
?x a-cd:hasRecording ?rec .  
?y a a-cd:AudioRecording ;   
core:hasAgentRole ?agro .  
?agro core:hasAgent ?agent .  
}  
 
 
**CQ1b**

select ?rec where {  
?x a-cd:hasRecording ?rec .  
?y a a-cd:AudioRecording ;  
lite:hasRecordedAgent ?agent .  
}  


**CQ2**  
What is the duration of registration x?   
Qual è la durata della registrazione x?  

select ?dur where {  
?x a a-cd:Recording ;  
a-dd:hasMeasurementCollection ?mescol .
?meascol a-dd:hasMeasurement ?dur .  
}  
 
 
