FROM primetoninc/jdk:1.8


#Copy Hybris zip in container inside /src directory
COPY DockerHybris/hybris.zip /src/hybris.zip

# Navigate to /src directory
WORKDIR /src

# Unzip hybris.zip
RUN unzip hybris.zip

# navigate to the platform directory
WORKDIR /src/hybris/bin/platform/

# Add exec permission to .sh files
RUN find ./ -type f -iname "*.sh" -exec chmod +x {} \;

COPY DockerHybris/mysql-connector-java-5.1.46.jar lib/dbdriver/mysql-connector-java-5.1.46.jar

# Expose http port
EXPOSE 9001

# Expose https port
EXPOSE 9002

# Expose solr port
EXPOSE 8983
EXPOSE 2198

# Expose Debug port
EXPOSE 8000

# Run ant  (also ant initialize if it's needed)
RUN . ./setantenv.sh && \
    sleep 5 && \
    echo develop | ant

	
# navigate to the directory
WORKDIR /src/hybris

#CACHE_DATE timestamp to take code change
ARG CACHE_DATE=2016-01-01
RUN echo "$CACHE_DATE"



# build-clean / build
ENV buildType build

# debug
ENV debug n

#initialize
ENV initialize n


#Add the custom code from host to container inside bin/custom
ADD hybris/bin/custom bin/custom

#Copy the local, localextensions , schema.xml and solrconfig.xml in container

COPY /hybris/config/local.properties config/local.properties
COPY /hybris/config/localextensions.xml config/localextensions.xml
COPY /hybris/config/solr/instances/default/configsets/default/conf/env/dev/schema.xml  bin/ext-commerce/solrserver/resources/solr/server/solr/configsets/default/conf/schema.xml
COPY /hybris/config/solr/instances/default/configsets/default/conf/env/dev/solrconfig.xml bin/ext-commerce/solrserver/resources/solr/server/solr/configsets/default/conf/solrconfig.xml



# copy the wrapper script from host to container
COPY DockerHybris/wrapperScript.sh /src/wrapperScript.sh
WORKDIR /src/

# Run wrapper script
CMD ["sh", "-c", "./wrapperScript.sh ${buildType} ${debug} ${initialize}"]
