**CQ1**

Qual è l'agente che ha ricoperto il ruolo di committente per l'opera x?

Who was the committent of cultural property x?

SELECT DISTINCT ?agent WHERE{
ex:commissionex core:hasAgentRole ?agentrole .
?agentrole core:hasAgent ?agent ;
core:hasRole ex:committente .
}
limit 100

**CQ2**

Che ruolo ha ricoperto l'agente x nell'acquisizione del bene y?

Which was the role of agent x with respect of cp y acquisition?

SELECT DISTINCT ?role WHERE{
ex:acquisizionex core:hasAgentRole ?agentrole .
?agentrole core:hasAgent ex:agentx ;
core:hasRole ?role .
}
limit 100
