**CQ1**

Chi è stato il precedente proprietario del bene?

Who was the transferor of the cultural property?

SELECT DISTINCT ?entity ?transferor WHERE{
?entity a-cd:hasAcquisition ?acq.
?acq core:hasAgentRole ?agentrole.
?agentrole core:hasAgent ?transferor;
core:hasRole <https://w3id.org/arco/resource/Role/Transferor> .
}


**CQ2**

Quanto è costata l’acquisizione del bene culturale x?

How much did the acquisition of cultural property x cost?

SELECT DISTINCT ?entity ?loc ?cost WHERE{
?entity a-cd:hasAcquisition ?acq.
?acq a-cd:acquisitionLocation ?loc;
?acq a-cd:acquisitionCost ?cost
}

limit 100
