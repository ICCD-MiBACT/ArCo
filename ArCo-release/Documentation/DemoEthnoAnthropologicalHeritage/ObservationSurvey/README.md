# ObservationSurvey 

**UPDATE PATTERN**


![ObservationSurvey pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/ObservationSurvey/ObservationSurvey.drawio.png?raw=true)


## Competency questions

**QC1**  
When was the survey (photo-video) of the cp made?  
Quando è stata fatta la rilevazione (foto-video) del bene?  

select ?time where {  
?x a a-cd:ObservationSurvey;  
<https://w3id.org/italia/onto/TI/TimeInterval> ?time .  
}  

 

**QC2a**  
Who was the video operator of the observation survey?  
Chi era l’operatore video della rilevazione?  

select ?operator where {  
?x core:hasAgentRole ?agentRole .  
?agentRole core:hasAgent ?operator ;  
core:hasRole ?role .  
FILTER (regex(?role, “operatore video”, “i”))  
}  

 

**QC2b**  
select ?operator where {  
?x a-lite:hasVideoOperator ?operator .  
}  
  
 
