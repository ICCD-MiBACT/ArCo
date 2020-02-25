FROM tenforce/virtuoso:virtuoso7.2.5

RUN mkdir /toLoad

ARG KG_VERSION

# Add ontologies

RUN mkdir /opt/d

ADD http://etna.istc.cnr.it/arco-data/${KG_VERSION}/index.txt /opt/d

RUN apt-get update && apt-get install -y wget


RUN cd /opt/d && \
	while read in; do wget "http://etna.istc.cnr.it/arco-data/${KG_VERSION}/$in"; done < index.txt  && \
	mkdir /usr/local/virtuoso-opensource/share/virtuoso/vad/1/ && \
	mv * /usr/local/virtuoso-opensource/share/virtuoso/vad/1/ 


ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/arco/arco.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/core/core.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/catalogue/catalogue.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/denotative-description/denotative-description.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/cultural-event/cultural-event.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/location/location.owl /toLoad
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/context-description/context-description.owl /toLoad

# Add DB Unico
ADD http://dati.beniculturali.it/dataset/dataset-thesaurus_definizione_del_bene_reperti_archeologici.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-luoghi.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-eventi.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-anagrafeBiblioteche.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriFisici.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriGiuridici.ttl /toLoad
ADD http://dati.beniculturali.it/dataset/dataset-archiviStato.ttl /toLoad


# Add Virtuoso config
COPY virtuoso.ini /virtuoso.ini

COPY start.sh /start.sh

EXPOSE 8890
EXPOSE 1111

VOLUME /data
WORKDIR /data

CMD ["/bin/bash", "/start.sh"]
