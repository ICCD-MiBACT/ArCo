**CQ1**

Di quale materiale è fatto il bene x?

What material is cultural property x made of?

SELECT DISTINCT ?entity ?material WHERE{
?entity a-dd:hasTechnicalStatus ?Status.
?Status a-dd:includesTechnicalCharacteristic ?material.
?material a-dd:isCharacteristicClassifiedBy a-dd:Material
}
limit 100

or

select distinct ?entity ?material Where {
?entity a-lite:hasMaterial ?material .
}


**CQ2**

Quale è lo stato tecnico attuale del bene culturale x?

What is the current technical state of cultural property x?

SELECT DISTINCT * WHERE{
?entity a-dd:hasTechnicalStatus ?Status.
?Status a-dd:current "true"
}
limit 100


**CQ3**

In quale periodo di tempo è stato valido lo stato tecnico del bene x?

In what period of time was the technical state of good x valid?

SELECT DISTINCT * WHERE{
?entity a-dd:hasTechnicalStatus ?Status.
?Status ti:hasTemporalEntity ?time
}
limit 100

