###########################################################
# Dockerfile that builds a Valheim Gameserver
###########################################################
FROM steamcmd/steamcmd:latest

LABEL maintainer="mutila@gmail.com"

ENV STEAMAPPID 896660
ENV STEAMAPP Valheim
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV WORLDPASS teste
ENV WORLDNAME "Mutila's Server"

USER ${USER}

VOLUME ${STEAMAPPDIR}

COPY entrypoint.sh ./entrypoint.sh

# Expose ports
EXPOSE 2456/tcp \
	2457/tcp \
	2458/tcp

ENTRYPOINT [ "bash", "entrypoint.sh" ]