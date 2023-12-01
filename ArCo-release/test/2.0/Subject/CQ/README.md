**CQ1**

Quali sono i soggetti rappresentati nel bene x?

What are the subjects represented in cultural property x?

SELECT DISTINCT ?concept WHERE{
?x a-cd:hasSubject ?subject .
?subject core:isClassifiedBy ?concept .
}
limit 100


**CQ2**

Quali sono le informazioni descrittive del soggetto rappresentato nel bene x??

What are the descriptive information of the cultural property x subject?

SELECT DISTINCT ?desc WHERE{
?x a-cd:hasSubject ?subject .
?subject a-cd:subjectDescription ?desc.

}
limit 100
