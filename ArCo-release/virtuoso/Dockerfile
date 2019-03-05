vad/FROM tenforce/virtuoso:1.3.1-virtuoso7.2.2


# Add ontologies

ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/arco/arco.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/core/core.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/catalogue/catalogue.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/denotative-description/denotative-description.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/cultural-event/cultural-event.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
ADD https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/master/ArCo-release/ontologie/location/location.owl /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/
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
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_aa.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/1/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ab.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/2/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ac.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/3/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ad.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/4/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ae.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/5/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_af.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/6/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ag.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/7/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ah.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/8/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ai.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/9/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_aj.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/10/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ak.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/11/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_al.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/12/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_am.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/13/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_an.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/14/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ao.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/15/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ap.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/16/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_aq.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/17/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_ar.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/18/
ADD http://stlab.istc.cnr.it/arco/docker_data/dataset-v0.5/arco_as.nt.tar.gz /usr/local/virtuoso-opensource/share/virtuoso/vad/19/

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

VOLUME /usr/local/virtuoso-opensource/share/virtuoso/vad/graphs
VOLUME /data
WORKDIR /data
EXPOSE 8890
EXPOSE 1111

CMD ["/bin/bash", "/virtuoso.sh"]