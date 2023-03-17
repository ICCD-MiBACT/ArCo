# ConnectionElement


**UPDATE PATTERN**


![ConnectionElement pattern graph](https://github.com/ICCD-MiBACT/ArCo/blob/DEV-1.3.0/ArCo-release/Documentation/ArchitecturalOrLandscapeHeritage/Connection%20Element/ConnectionElement.drawio.png?raw=true)


## Competency questions


**CQ1** 
Which type of vertical connection element has cp x?   
Che tipo di elemento di connessione verticale ha il bene X?  

select ?type where {  
?x a-con:hasConstructionElement ?y .   
?y a a-con:VerticalConnection .  
?y a-core:hasType ?type .  
}  
