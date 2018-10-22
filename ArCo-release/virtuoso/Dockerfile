FROM tenforce/virtuoso:1.3.1-virtuoso7.2.2


# Add ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/catalogue/catalogue.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/denotative-description/denotative-description.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/cultural-event/cultural-event.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/location/location.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/core/core.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/context-description/context-description.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/

# Add DB Unico
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-luoghi.ttl.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-th-ra.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-luoghi.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-eventi.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-anagrafeBiblioteche.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriFisici.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriGiuridici.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-archiviStato.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/

# Add ArCo data
ADD http://stlab.istc.cnr.it/arco/docker_data/arco_dataset-v0.3.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco/

#RUN cd /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/ \
#		&& tar -xvzf ontologies.tar.gz \
#		&& rm ontologies.tar.gz

# Add Virtuoso bin to the PATH
ENV PATH /usr/local/virtuoso-opensource/bin/:$PATH

# Add Virtuoso config
COPY virtuoso.ini /virtuoso.ini
COPY virtuoso.ini /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini

# Add dump_nquads_procedure
COPY dump_nquads_procedure.sql /dump_nquads_procedure.sql

# Add Virtuoso log cleaning script
COPY clean-logs.sh /clean-logs.sh

# Add startup script
COPY virtuoso.sh /virtuoso.sh

RUN rm -rf /data

VOLUME /data
WORKDIR /data
EXPOSE 8890
EXPOSE 1111

CMD ["/bin/bash", "/virtuoso.sh"]