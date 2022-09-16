FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get install -qy \
    gnuplot \
    python3-pygments \
    texlive-full \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]
ENTRYPOINT [ "pdflatex" ]