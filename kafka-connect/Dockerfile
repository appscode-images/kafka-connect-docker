FROM obaydullahmhs/kafka-base:latest

USER root

RUN apt-get update \
 && apt install -y vim 

COPY mongo-kafka-connect-1.11.0-all.jar ${HOME}/libs
COPY connect-standalone-mg.properties ${HOME}/config
COPY MongoSourceConnector.properties ${HOME}/config
COPY connect-entrypoint.sh ${HOME}

EXPOSE 8083

RUN chmod +x connect-entrypoint.sh
ENTRYPOINT [ "./connect-entrypoint.sh" ]

USER kafka