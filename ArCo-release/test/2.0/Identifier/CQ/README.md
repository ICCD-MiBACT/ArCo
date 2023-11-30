**CQ1**

Che tipo di identificativo è collegato al bene x?

Which identifier type is connected to cultural property x?

select ?id ?type {
?x core:hasIdentifier ?id .
?id core:hasType ?type
}

limit 100


**CQ2**

Quale organizzazione ha rilasciato l’identificativo del bene x?

Which organization has issued the cpX identifier? 

select ?org {
?x core:hasIdentifier ?id .
?id core:issuedBy ?org .
}


**CQ3**

Quali id ha rilasciato l'organizzazione X?

Which IDs has organization X issued?  

select ?org ?id {
?identifier core:issuedBy ?org;
core:identifier ?id .
}
