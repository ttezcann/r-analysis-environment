FROM rocker/r-ver:4.0
RUN apt-get update && apt-get install -y r-base
COPY install.R /install.R
RUN R -e "install.packages(c(\"haven\", \"sjmisc\"), repos=\"https://cloud.r-project.org/\")"
RUN R -e "source(\"/install.R\")"
RUN apt-get install -y rstudio-server
EXPOSE 8787
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--www-port", "8787"]
