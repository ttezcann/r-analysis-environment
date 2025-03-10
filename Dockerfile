FROM rocker/rstudio:4.0
COPY install.R /home/jovyan/install.R
USER root
RUN chown jovyan:jovyan /home/jovyan/install.R
USER jovyan
RUN R -e "install.packages(c(\"haven\", \"sjmisc\", \"sjPlot\"), repos=\"https://cloud.r-project.org/\", dependencies=TRUE)"
EXPOSE 8787
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize", "0", "--www-port", "8787", "--auth-none", "1"]

