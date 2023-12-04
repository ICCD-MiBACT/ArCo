# RecurrentSituationSeries 

**UPDATE PATTERN**


![RecurrentSituationSeries pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/RecurrentSituationSeries/RecurrentSituation-Pattern.drawio.png?raw=true)



## Competency questions

**CQ1**    
How often does event x recur?  
Con quale scadenza ricorre l'evento x?  

select ?recurrentTime ?value ?unit where {  
?x a:ce:hasRecurrentTimePeriod ?recurrentTime .  
?recurrentTime a-ce:hasTimePeriodMeasurementUnit ?unit;  
a-ce:timePeriodValue ?value .  
}  
 
 

**CQ2**  

What are the unifying factors of RecurrentSituationSeries x events?  
Quali sono i fattori unificanti degli eventi della RecurrentSituationSeries x?  

select ?factor where {  
?x a:ce:hasUnifyingFactor ?factor.  
}  
  
