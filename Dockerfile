FROM benjaminvincentlab/rserver:3.6.1.4
# OS: Debian GNU/Linux 9 (stretch)

# for doing mtb elastic net
RUN apt-get update && apt-get -y install tcl8.6-dev tk8.6-dev
RUN R -e "BiocManager::install('survcomp')"
RUN R -e "BiocManager::install('sm')"
RUN R -e "install.packages('Epi')"

# For converting genes
RUN R -e "BiocManager::install('annotate')"
RUN R -e "BiocManager::install('org.Hs.eg.db')"
RUN R -e "BiocManager::install('DESeq2')"

# For diversity metrics
RUN R -e "devtools::install_github('vegandevs/vegan', ref = 'v2.5-3')" 

# Add tabulizer for getting tables out of pdf's. Melero_GBM_2019 dataset
RUN R -e "devtools::install_github('ropensci/tabulizer', ref = 'v0.2.2')"

# add glmnet to allow use of corrected 
RUN R -e "devtools::install_github('cran/glmnet', ref = '2.0-18')"

# For making quality png rasters for ComplexHeatmaps
RUN apt-get update && apt-get install -y libmagick++-dev

# Lab packages last because we update them often
RUN R -e "devtools::install_github('benjamin-vincent-lab/housekeeping', ref = '0.2-01')"
RUN R -e "devtools::install_github('benjamin-vincent-lab/binfotron', ref = '0.3-17')"

# needs to go after binfotron
RUN R -e "devtools::install_github('benjamin-vincent-lab/StarSalmon', ref = '0.2-02')"
