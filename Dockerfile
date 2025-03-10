FROM rocker/rstudio:4.0
COPY install.R /install.R
RUN R -e "source(\"/install.R\")"
EXPOSE 8787
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--www-port", "8787"]
