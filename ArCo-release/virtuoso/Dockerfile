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
ADD http://dati.beniculturali.it/dataset/dataset-thesaurus_definizione_del_bene_reperti_archeologici.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-luoghi.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-eventi.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-anagrafeBiblioteche.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriFisici.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-contenitoriGiuridici.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/
ADD http://dati.beniculturali.it/dataset/dataset-archiviStato.ttl /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/

# Add ArCo data
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-1.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco1/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-2.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco2/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-3.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco3/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-4.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco4/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-5.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco5/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-6.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco6/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-7.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco7/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-8.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco8/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-9.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco9/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.3/arco_dataset-part-10.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco10/

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