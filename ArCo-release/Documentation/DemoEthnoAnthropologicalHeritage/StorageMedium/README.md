# StorageMedium 


**UPDATE PATTERN**


![StorageMedium pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/DemoEthnoAnthropologicalHeritage/StorageMedium/StorageMedium-Pattern.drawio.png?raw=true)



## Competency questions

**QC1**   

What is the type of storage medium of recording x?   
Qual è il tipo di supporto memoria della registrazione x?  

select ?type where {  
?x a-cd:hasStorageMedium ?med .  
?med core:hasType ?type .  
}  

 

**QC2**  
What events/changes involved audio storage medium x?  
Quali eventi/cambiamenti hanno coinvolto il supporto audio x?  

select ?event where {  
?x a a-cd:StorageMedium ;  
a-cd:hasRelatedEvent ?event .  
}  

  

**QC3**   
What is the location of storage medium x?  
Qual è la collocazione del supporto audio x?  

select ?cis where {  
	?x a a-cd:StorageMedium ;  
	<<http://dati.beniculturali.it/cis/hasCIS>> ?cis .  
}  

 
