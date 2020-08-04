FROM tenforce/virtuoso:virtuoso7.2.5

ARG KG_VERSION

RUN apt-get update && apt-get install -y wget

COPY download_release.sh /download_release.sh

RUN /bin/bash /download_release.sh ${KG_VERSION}

# Add ontologies
RUN mkdir /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/arco/arco.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/core/core.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/catalogue/catalogue.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/denotative-description/denotative-description.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/cultural-event/cultural-event.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/location/location.owl /ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/context-description/context-description.owl /ontologies

# Add DB Unico
RUN mkdir /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-thesaurus_definizione_del_bene_reperti_archeologici.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-luoghi.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-eventi.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-anagrafeBiblioteche.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-contenitoriFisici.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-contenitoriGiuridici.ttl.gz /d/cis
ADD http://arco.istc.cnr.it/arco-data/cis/dataset-archiviStato.ttl.gz /d/cis


# Add Virtuoso config
COPY virtuoso.ini /virtuoso.ini

# Add startup script
COPY virtuoso.sh /virtuoso.sh


EXPOSE 8890
EXPOSE 1111

VOLUME /data
WORKDIR /data
VOLUME /usr/local/virtuoso-opensource/share/virtuoso/vad/

CMD ["/bin/bash", "/virtuoso.sh"]
