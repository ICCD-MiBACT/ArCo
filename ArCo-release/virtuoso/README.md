# ArCo's Virtuoso container

The ArCo's virtuoso container container allows you to deploy on your compture a SPARQL endpoint containing ArCo Knowledge Graph.

## Preliminaries

You only need docker to be installed and running on your computer.

## Build 

You can build the container with

```
docker build --build-arg KG_VERSION=<KG_VERSION> --no-cache . -t arco_virtuoso_pr<KG_VERSION>
```

where <KG_VERSION> is the the identifier of the version of the ArCo's KG that you want to deploy.

## Run

You can run the container with

```
docker run -p 8890:8890 --restart=always --name arco_virtuoso_pr<KG_VERSION> -it arco_virtuoso_pr<KG_VERSION>
```

The SPARQL endpoint will be then available at [http://localhost:8890/sparql](http://localhost:8890/sparql)
