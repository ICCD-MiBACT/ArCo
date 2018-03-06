# ArCo

ArCo is an initiative of the ICCD (Istituto Centrale per il Catalogo e la Documentazione) and the CNR (Italian National Research Council), as part of the project dati.beniculturali.it, for cultural heritage enhancement through the publication of LOD.

ArCo aims at making available data from the Catalogo generale dei beni culturali following the paradigm of the Linked Data initiative, in an open format, in order to ensure accessibility to users and interoperability.

The main activities of the project will include:

the definition of a network of ontologies for representing the informations contained in the general catalogue, in relation to different types of cultural objects, taking into account the actual ICCD standards the publication of the data processed in the SiGeC (Sistema Generale del Catalogo, following the Linked Open Data principles, to populate the MiBACT SDL (semantic digital library).

# Docker
This release provides a package:

 * the ontologies of ArCo;
 * a SPARQL endpoint with the data;
 * a detailed guide about how to use the ontologies and query the data.

The package relies on [Docker](https://www.docker.com/community-edition). Hence, you need to install Docker if you do not have it on your machine.

## Installation and execution
Launch the docker daemon on your machine, e.g.:
```sh
$ sudo service docker start
```

Move to the home folder of the package (i.e. the folder containing this README and the docker-compose.yml file). Then, build the package with docker-compose, i.e.:
```sh
$ docker-compose build
```
Once the build process ends you can run the package with the following command
```sh
$ docker-compose up
```
We remark that the very first run might require time (~5minutes) as the SPARQL endpoint is populated with data (~6GB).

Finally, the docker installation will made available the following endpoints:
 * the [project homepage](http://localhost:8080/) with the documentation and links to the ontologies and the data dumps;
 * the [SPARQL endpoint](http://localhost:8890/sparql) to query the data.
 


