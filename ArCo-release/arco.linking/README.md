# ArCo's linking framework

Here you can find the instructions in order to link ArCo's Knowledge Graph to other datasets (such as DBpedia, CulturaItalia etc.).
Although new software has been developed to align the KG to certain datasets, the framework mainly relies on link discovery frameworks such as [LIMES](https://github.com/dice-group/LIMES) and [SILK](http://silkframework.org/).

### Linking MiBACT's cultural sites

ArCo's sites can be linked to MiBACT's cultural sites by using [LIMES](https://github.com/dice-group/LIMES).
Limes' configuration can be found in [MiBACTSites](MiBACTSites) folder.


```
java -Xmx16g -jar /path/to/limes/limes-core-1.7.1-SNAPSHOT.jar MiBACTSites/fullAddressMatching/limes.xml
java -Xmx16g -jar /path/to/limes/limes-core-1.7.1-SNAPSHOT.jar MiBACTSites/label/limes.xml
java -Xmx16g -jar /path/to/limes/limes-core-1.7.1-SNAPSHOT.jar CISCulturalInstituteOrSite/label/limes.xml
```

### Linking CulturaItalia

You can link ArCo's KG to CulturaItalia (cf. [Issue #2](https://github.com/ICCD-MiBACT/ArCo/issues/2)) by using the **arco.linking** module.

The **arco.linking** can be installed and run with maven as follows.

```
git clone https://github.com/ICCD-MiBACT/ArCo.git
cd ArCo/ArCo-release/arco.linking
mvn clean install
mvn exec:java -Dexec.mainClass="it.cnr.istc.stlab.arco.linking.CulturaItalia" -Dexec.args="src/main/resources/config.properties" 
```





