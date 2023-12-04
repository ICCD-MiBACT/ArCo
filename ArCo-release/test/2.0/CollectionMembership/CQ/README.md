**CQ1**

In che periodo il bene ha fatto parte della collezione x?

In what period was the cultural property a member of collection x?

SELECT DISTINCT ?entity ?time ?Collection WHERE{
?entity a-cd:isMemberOfCollectionOf ?collectionmemb.
?collectionmemb <https://w3id.org/italia/onto/TI/hasTemporalEntity> ?time;
a-cd:hasCollection ?Collection
}
limit 100


**CQ2**

Per quale motivo il bene culturale ha lasciato la collezione y?

Why did cultural property x leave the collection y?

SELECT DISTINCT ?entity ?reason ?Collection WHERE{
?entity a-cd:isMemberOfCollectionOf ?collectionmemb.
?collectionmemb a-cd:collectionLeavingReason ?reason;
a-cd:hasCollection ?Collection
}
limit 100

