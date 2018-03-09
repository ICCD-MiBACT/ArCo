if [ ! -f ".data_loaded" -a -d "toLoad" ] ;
then
    echo "Start data loading from toLoad folder"
    pwd="dba"
    graph="http://localhost:8890/DAV"
    
    echo "Loaded" > .data_loaded

    if [ "$DBA_PASSWORD" ]; then pwd="$DBA_PASSWORD" ; fi
    if [ "$DEFAULT_GRAPH" ]; then graph="$DEFAULT_GRAPH" ; fi
    echo "ld_dir('toLoad', '*', '$graph');" >> /load_data.sql
    echo "rdf_loader_run();" >> /load_data.sql
    echo "exec('checkpoint');" >> /load_data.sql
    echo "WAIT_FOR_CHILDREN; " >> /load_data.sql
    echo "$(cat /load_data.sql)"
    isql-v -U dba -P "$pwd" < /load_data.sql
    #kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
fi

if [ ! -f ".arco_ontologies_loaded" -a -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/" ] ;
then
	pwd="dba" ;
	echo "Loading ArCo ontologies." ;
	echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/', '*.owl', 'https://w3id.org/arco/ontology');" >> /load_arco_ontologies.sql
    echo "rdf_loader_run();" >> /load_arco_ontologies.sql
    echo "exec('checkpoint');" >> /load_arco_ontologies.sql
    echo "WAIT_FOR_CHILDREN; " >> /load_arco_ontologies.sql
    echo "$(cat /load_arco_ontologies.sql)"
    isql-v -U dba -P "$pwd" < /load_arco_ontologies.sql
    #kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
    echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > .arco_ontologies_loaded
fi

if [ ! -f ".dbunico_loaded" -a -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/" ] ;
then
	pwd="dba" ;
	echo "Loading DB Unico" ;
	echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/dbunico/', '*.gz', 'https://w3id.org/arco/dbunico');" >> /load_dbunico.sql
    echo "rdf_loader_run();" >> /load_dbunico.sql
    echo "exec('checkpoint');" >> /load_dbunico.sql
    echo "WAIT_FOR_CHILDREN; " >> /load_dbunico.sql
    echo "$(cat /load_dbunico.sql)"
    isql-v -U dba -P "$pwd" < /load_dbunico.sql
    #kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
    echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > .dbunico_loaded
fi

if [ ! -f ".arco_data_loaded" -a -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/arco/" ] ;
then
	pwd="dba" ;
	echo "Loading DB ArCo data" ;
	echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/arco/', '*.gz', 'https://w3id.org/arco/data');" >> /load_arco_data.sql
    echo "rdf_loader_run();" >> /load_arco_data.sql
    echo "exec('checkpoint');" >> /load_arco_data.sql
    echo "WAIT_FOR_CHILDREN; " >> /load_arco_data.sql
    echo "$(cat /load_arco_data.sql)"
    isql-v -U dba -P "$pwd" < /load_arco_data.sql
    #kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
    echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > .arco_data_loaded
fi