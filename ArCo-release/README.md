# ArCo

ArCo is an initiative of ICCD (Istituto Centrale per il Catalogo e la Documentazione) and  CNR (Italian National Research Council) in the context of dati.beniculturali.it. Its aim is to contribute to the valorisation of cultural heritage with the publication of Linked Open Data.

Notice: this release mainly contains documentation in Italian. In the future we will also add the English version.

# Documentation
The ontology network documentation focusing on patterns can be found here: [ontology patterns documentation](https://github.com/ICCD-MiBACT/ArCo/tree/master/ArCo-release/Documentation)

# Release
This release is a package containing:

 * the ArCo ontology network;
 * a SPARQL endpoint;
 * a detailed guide about how to use the ontologies and query the data.
 

In order to use the release you have to install  [Docker](https://www.docker.com/community-edition). Please, refer to the [official documentation](https://docs.docker.com/get-started/#containers-and-virtual-machines) for detailed information about Docker and how to install it.

The list of the knowledge graph releases is available at the following [link](KG_release_notes.md).



## Installation and execution of ArCo Release
Launch Docker on your machine, e.g.:

```sh
$ sudo service docker start
```

Open a terminal and go to the home folder, i.e. it's the folder containing this README file and the docker-compose.yml file. Then, build the package with the following command:

```sh
$ docker-compose build
```
Once the build process ends (this can take a while) you can run the package with the following command:

```sh
$ docker-compose up
```
Notice that that the command ``docker-compose build`` should be executed only once, for building the release. The very first run (i.e. ``$ docker-compose up``) might require some time (~5 minutes), because it will download the datasets that will populate the SPARQL endpoint (~6 GB).

When the installation will be done, go to:
 * the [project homepage](http://localhost:8080/), where you will find documentation and links to the ontologies and the data dumps;
 * the [SPARQL endpoint](http://localhost:8890/sparql), where you can query the data.
 
 Enjoy!


