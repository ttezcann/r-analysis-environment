FROM rocker/r-ver:4.0
RUN apt-get update && apt-get install -y r-base gdebi-core
RUN wget https://download2.rstudio.org/server/debian9/amd64/rstudio-server-2023.12.0-369-amd64.deb
RUN gdebi -n rstudio-server-2023.12.0-369-amd64.deb
RUN R -e "install.packages(c(\"haven\", \"sjmisc\"), repos=\"https://cloud.r-project.org/\")"
RUN R -e "source(\"/install.R\")"
EXPOSE 8787
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--www-port", "8787"]
