# ArCo

ArCo is an initiative of ICCD (Istituto Centrale per il Catalogo e la Documentazione) and  CNR (Italian National Research Council), as part of dati.beniculturali.it, for cultural heritage enhancement through the publication of LOD.

ArCo aims at making available data from the Catalogo generale dei beni culturali following the paradigm of the Linked Data initiative, in an open format, in order to ensure accessibility to users and interoperability.

The main activities of the project will include:

the definition of a network of ontologies for representing the informations contained in the general catalogue, in relation to different types of cultural objects, taking into account the actual ICCD standards the publication of the data processed in the SiGeC (Sistema Generale del Catalogo, following the Linked Open Data principles, to populate the MiBACT SDL (semantic digital library).

# Release
This release provides a package containing:

 * the ArCo ontology network;
 * a SPARQL endpoint;
 * a detailed guide about how to use the ontologies and query the data.

The package relies on [Docker](https://www.docker.com/community-edition), an application you need to install if you do not have it on your machine. Please, refer to the [official documentation](https://docs.docker.com/get-started/#containers-and-virtual-machines) for detailed information about Docker and how to install it.

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
We remark that the command ``docker-compose build`` should be executed only once for building the release. Additionally, the very first run (i.e. ``$ docker-compose up``) might require time (~5minutes) as the SPARQL endpoint is populated with data (~6GB).

Finally, the docker installation will made available the following endpoints:
 * the [project homepage](http://localhost:8080/) with the documentation and links to the ontologies and the data dumps;
 * the [SPARQL endpoint](http://localhost:8890/sparql) to query the data.
 


