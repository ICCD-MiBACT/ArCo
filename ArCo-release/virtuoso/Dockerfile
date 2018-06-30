FROM tenforce/virtuoso:1.3.1-virtuoso7.2.2


# Add ontologies
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/objective/objective.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/catalogue/catalogue.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/culturalevent/culturalevent.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/location/location.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/core/core.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/subjective/subjective.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/

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