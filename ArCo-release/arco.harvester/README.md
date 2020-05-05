# ArCo OAI Harverster

A simple tool for harvesting OAI records from MiBACT's OAI endpoint.


## Installation
Prerequisite: maven

```
mvn clean install
```

## Usage

1. Define a configuration file, e.g. ``src/main/resources/config.properties``
2. Run OAI-Harvester using maven

```
mvn exec:java -Dexec.mainClass="it.cnr.istc.stlab.arco.harverster.OAIHarvester" -Dexec.args="src/main/resources/config.properties"
```

## Licence

ArCo OAI Havester is distributed under license [Apache 2.0](LICENSE).
