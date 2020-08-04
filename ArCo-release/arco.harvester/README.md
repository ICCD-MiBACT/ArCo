# ArCo OAI Harverster

A simple tool for harvesting OAI records from MiBACT's OAI endpoint.


## Installation
Prerequisite: maven

```
mvn clean install
```

## Usage

In order to harvest all the catalogue records and EMM documents

1. Define a configuration file, e.g. ``src/main/resources/config.properties``
2. Run OAI-Harvester using maven

```
mvn exec:java -Dexec.mainClass="it.cnr.istc.stlab.arco.harverster.OAIHarvester" -Dexec.args="src/main/resources/config.properties"
```


where ``config.properties`` specifies i) the absolute path where the harvested files will be stored ``outputFolder`` and ii) the OAI endpoint that publishes the XML documents to gather.

In order to harvest a list of catalogue records only.

```
mvn exec:java -Dexec.mainClass="it.cnr.istc.stlab.arco.harverster.OAIHarvester" -Dexec.args="OAI_Endpoint OUTPUT_FOLDER CATALOGUE_RECORD_IDs" 
```

For example

```
mvn exec:java -Dexec.mainClass="it.cnr.istc.stlab.arco.harverster.Harvester" -Dexec.args="http://catalogo.beniculturali.it/oaitarget/OAIHandler? harvest ICCD12270285 ICCD2092056"
 
```


## Output

OAI harvester will create a folder for storing catalogue records, named *records*, and a folder for storing multimedia records, named *multimedia_records*. Both folders contains XML documents organised in subfolders (1000 per subfolder) and two files, namely ``paths.txt`` which lists the paths of the all XML documents and    ``keys.txt`` which stores metadata related to catalogue records.

## Licence

ArCo OAI Havester is distributed under license [Apache 2.0](LICENSE).
