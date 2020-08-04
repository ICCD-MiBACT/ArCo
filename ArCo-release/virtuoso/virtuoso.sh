#!/bin/bash

echo "Deploying Virtuoso for ArCo"



SETTINGS_DIR=/settings
mkdir -p $SETTINGS_DIR

cd /data

mkdir -p dumps

if [ ! -f ./virtuoso.ini ];
then
  mv /virtuoso.ini . 2>/dev/null
fi

chmod +x /clean-logs.sh
mv /clean-logs.sh . 2>/dev/null

original_port=`crudini --get virtuoso.ini HTTPServer ServerPort`
# NOTE: prevents virtuoso to expose on port 8890 before we actually run
#		the server
crudini --set virtuoso.ini HTTPServer ServerPort 27015

if [ ! -f "$SETTINGS_DIR/.config_set" ];
then
  echo "Converting environment variables to ini file"
  printenv | grep -P "^VIRT_" | while read setting
  do
    section=`echo "$setting" | grep -o -P "^VIRT_[^_]+" | sed 's/^.\{5\}//g'`
    key=`echo "$setting" | sed -E 's/^VIRT_[^_]+_(.*)=.*$/\1/g'`
    value=`echo "$setting" | grep -o -P "=.*$" | sed 's/^=//g'`
    echo "Registering $section[$key] to be $value"
    crudini --set virtuoso.ini $section $key "$value"
  done
  echo "`date +%Y-%m%-dT%H:%M:%S%:z`" >  $SETTINGS_DIR/.config_set
  echo "Finished converting environment variables to ini file"
fi

if [ ! -f ".backup_restored" -a -d "backups" -a ! -z "$BACKUP_PREFIX" ] ;
then
    echo "Start restoring a backup with prefix $BACKUP_PREFIX"
    cd backups
    virtuoso-t +restore-backup $BACKUP_PREFIX +configfile /data/virtuoso.ini
    if [ $? -eq 0 ]; then
        cd /data
        echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > .backup_restored
    else
        exit -1
    fi
fi

if [ ! -f ".dba_pwd_set" ];
then
  touch /sql-query.sql
  if [ "$DBA_PASSWORD" ]; then echo "user_set_password('dba', '$DBA_PASSWORD');" >> /sql-query.sql ; fi
  if [ "$SPARQL_UPDATE" = "true" ]; then echo "GRANT SPARQL_UPDATE to \"SPARQL\";" >> /sql-query.sql ; fi
  virtuoso-t +wait && isql-v -U dba -P dba < /dump_nquads_procedure.sql && isql-v -U dba -P dba < /sql-query.sql
  kill "$(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')"
  echo "`date +%Y-%m-%dT%H:%M:%S%:z`" >  .dba_pwd_set
fi

if [ ! -f ".data_loaded" -a -d "toLoad" ] ;
then
    echo "Start data loading from toLoad folder"
    pwd="dba"
    graph="http://localhost:8890/DAV"

    if [ "$DBA_PASSWORD" ]; then pwd="$DBA_PASSWORD" ; fi
    if [ "$DEFAULT_GRAPH" ]; then graph="$DEFAULT_GRAPH" ; fi
    echo "ld_dir('toLoad', '*', '$graph');" >> /load_data.sql
    echo "rdf_loader_run();" >> /load_data.sql
    echo "exec('checkpoint');" >> /load_data.sql
    echo "WAIT_FOR_CHILDREN; " >> /load_data.sql
    echo "$(cat /load_data.sql)"
    virtuoso-t +wait && isql-v -U dba -P "$pwd" < /load_data.sql
    kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
    echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > .data_loaded
fi

DOWNLOAD_DIR=/d
echo "$DOWNLOAD_DIR"
if [  -d "$DOWNLOAD_DIR" ]; then
    echo "$DOWNLOAD_DIR exist, moving to /usr/local/virtuoso-opensource/share/virtuoso/vad"
    #ls $DOWNLOAD_DIR
    mv $DOWNLOAD_DIR/* /usr/local/virtuoso-opensource/share/virtuoso/vad/ 
else
	echo "$DOWNLOAD_DIR does not exist"
fi




pwd="dba" ;
for D in /usr/local/virtuoso-opensource/share/virtuoso/vad/*; 
do
	if [ -d "${D}" ]; 
	then
    	if [ ! -f "${D}/.arco_data_loaded" ] ;
    	then
    		echo "Loading DB ArCo data - segment ${D}" ;
    		echo "File in ${D}: ";
    		ls ${D}
    		echo "ld_dir_all('${D}', '*.gz', 'https://w3id.org/arco/data');" > /load_arco_data.sql
			echo "rdf_loader_run();" >> /load_arco_data.sql
			echo "exec('checkpoint');" >> /load_arco_data.sql
			echo "WAIT_FOR_CHILDREN; " >> /load_arco_data.sql
			echo "$(cat /load_arco_data.sql)"
			virtuoso-t +wait && isql-v -U dba -P "$pwd" < /load_arco_data.sql
			kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
			echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > ${D}/.arco_data_loaded
    	fi
    fi
done


if [  -d "/ontologies" ]; then
    echo "/ontologies exist, moving to /usr/local/virtuoso-opensource/share/virtuoso/vad"
    mv /ontologies /usr/local/virtuoso-opensource/share/virtuoso/vad/ 
else
	echo "/ontologies does not exist"
fi
if [ -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies" ]; 
	then
    if [ ! -f "/usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/.arco_data_loaded" ] ;
    then
    	echo "Loading DB ArCo data - segment ontologies" ;
    	echo "File in /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies: ";
   		ls /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies
   		echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies', '*.owl', 'https://w3id.org/arco/ontologies');" > /load_arco_data.sql
		echo "rdf_loader_run();" >> /load_arco_data.sql
		echo "exec('checkpoint');" >> /load_arco_data.sql
		echo "WAIT_FOR_CHILDREN; " >> /load_arco_data.sql
		echo "$(cat /load_arco_data.sql)"
		virtuoso-t +wait && isql-v -U dba -P "$pwd" < /load_arco_data.sql
		kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
		echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > /usr/local/virtuoso-opensource/share/virtuoso/vad/ontologies/.arco_data_loaded
	fi
fi


if [  -d "/linking" ]; then
    echo "/linking exist, moving to /usr/local/virtuoso-opensource/share/virtuoso/vad"
    mv /linking /usr/local/virtuoso-opensource/share/virtuoso/vad/ 
else
	echo "/linking does not exist"
fi
if [ -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/linking" ]; 
	then
    if [ ! -f "/usr/local/virtuoso-opensource/share/virtuoso/vad/linking/.arco_data_loaded" ] ;
    then
    	echo "Loading DB ArCo data - segment linking" ;
    	echo "File in /usr/local/virtuoso-opensource/share/virtuoso/vad/linking: ";
   		ls /usr/local/virtuoso-opensource/share/virtuoso/vad/linking
   		echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/linking', '*.gz', 'https://w3id.org/arco/data/linking');" > /load_arco_data.sql
		echo "rdf_loader_run();" >> /load_arco_data.sql
		echo "exec('checkpoint');" >> /load_arco_data.sql
		echo "WAIT_FOR_CHILDREN; " >> /load_arco_data.sql
		echo "$(cat /load_arco_data.sql)"
		virtuoso-t +wait && isql-v -U dba -P "$pwd" < /load_arco_data.sql
		kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
		echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > /usr/local/virtuoso-opensource/share/virtuoso/vad/linking/.arco_data_loaded
	fi
fi



if [  -d "/quarantine" ]; then
    echo "/quarantine exist, moving to /usr/local/virtuoso-opensource/share/virtuoso/vad"
    mv /quarantine /usr/local/virtuoso-opensource/share/virtuoso/vad/ 
else
	echo "/quarantine does not exist"
fi
if [ -d "/usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine" ]; 
	then
    if [ ! -f "/usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine/.arco_data_loaded" ] ;
    then
    	echo "Loading DB ArCo data - segment quarantine" ;
    	echo "File in /usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine: ";
   		ls /usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine
   		echo "ld_dir_all('/usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine', '*.gz', 'https://w3id.org/arco/data/quarantine');" > /load_arco_data.sql
		echo "rdf_loader_run();" >> /load_arco_data.sql
		echo "exec('checkpoint');" >> /load_arco_data.sql
		echo "WAIT_FOR_CHILDREN; " >> /load_arco_data.sql
		echo "$(cat /load_arco_data.sql)"
		virtuoso-t +wait && isql-v -U dba -P "$pwd" < /load_arco_data.sql
		kill $(ps aux | grep '[v]irtuoso-t' | awk '{print $2}')
		echo "`date +%Y-%m-%dT%H:%M:%S%:z`" > /usr/local/virtuoso-opensource/share/virtuoso/vad/quarantine/.arco_data_loaded
	fi
fi
	


crudini --set virtuoso.ini HTTPServer ServerPort ${VIRT_HTTPServer_ServerPort:-$original_port}

exec virtuoso-t +wait +foreground
