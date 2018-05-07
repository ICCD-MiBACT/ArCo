FROM tenforce/virtuoso:1.3.1-virtuoso7.2.2


#ADD http://stlab.istc.cnr.it/arco/docker_data/ontologies.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/

# Add ontologies
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/Identificativi_bene_scheda/identifiers.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/bene_description/cp-description.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/catalogue_record/catalogue-record.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/event_exhibition/cultural-event.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/localizzazione_geo_amm/location-geoamm.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/modulo_core/arco-core.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/MiBACT-LinkedOpenData/ArCo/master/ArCo-release/ontologie/cultural-definition/cultural-definition.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/

# Add DB Unico
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-luoghi.ttl.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/

# Add ArCo data
ADD http://stlab.istc.cnr.it/arco/docker_data/arco_dataset-v0.2.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/arco/

#RUN cd /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/ \
#		&& tar -xvzf ontologies.tar.gz \
#		&& rm ontologies.tar.gz

# Add Virtuoso bin to the PATH
ENV PATH /usr/local/virtuoso-opensource/bin/:$PATH

# Add Virtuoso config
COPY virtuoso.ini /virtuoso.ini

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