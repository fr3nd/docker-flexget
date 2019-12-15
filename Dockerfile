FROM python:3.7-alpine

ARG DOCKER_UID=1000
ENV FLEXGET_VERSION=3.0.16

# Create a user to run the application
RUN adduser -D -u ${DOCKER_UID} flexget
WORKDIR /home/flexget

# Data and config volumes
VOLUME /home/flexget/.flexget
VOLUME /home/flexget/torrents

# Install FlexGet
RUN pip install FlexGet==${FLEXGET_VERSION}

# Add start script
COPY start.sh /home/flexget/
RUN chmod +x ./start.sh

USER flexget
CMD ["./start.sh"]
