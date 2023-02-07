##CQ1

Quali sono gli accessori associati al bene x?

What are accessories associated to the cultural property x?

SELECT DISTINCT ?accessory WHERE{
?x a-dd:hasAccessory ?accessory.
}
limit 100

##CQ2

Di che tipo sono gli accessori collegati ai beni musicali?

What type of accessories are related to musical instruments?

SELECT DISTINCT ?type WHERE{
?entity a arco:MusicalHeritage;
a-dd:hasAccessory ?accessory.
?accessory arco-core:hasType ?type.
}
limit 100
