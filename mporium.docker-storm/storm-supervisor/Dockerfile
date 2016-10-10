FROM mporium/storm

MAINTAINER mporium

ARG SEQ_URL
ARG SEQ_API_KEY

RUN /usr/bin/add-storm-process.sh supervisor
RUN /usr/bin/add-storm-process.sh logviewer

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000
