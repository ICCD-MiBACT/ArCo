**CQ1**

Quale è il supporto dell’iscrizione x?

What is the support of inscription x?

SELECT DISTINCT ?entity ?support WHERE{
?entity a a-dd:AffixedElement;
core:hasType a-dd:Inscription;
a-dd:hasSupport ?support.
}
limit 100


**CQ2**

Di quale materiale è fatto l’emblema x?

What material is emblem x made of?

SELECT DISTINCT ?material WHERE{
?entity a a-dd:AffixedElement;
core:hasType a-dd:Emblem;
a-dd:hasTechnicalStatus ?TS.
?TS a-dd:includesTechnicalCharacteristic ?material.
?material a-dd:isCharacteristicClassifiedBy a-dd:Material
}
limit 100

