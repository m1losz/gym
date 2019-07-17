FROM nvidia/cuda:10.1-base-centos7
# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8
LABEL com.nvidia.volumes.needed="nvidia_driver"

#install system deps

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PYTHON_VERSION=3.7

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
    /opt/conda/bin/conda install conda-build

ENV PATH=$PATH:/opt/conda/bin/
ENV USER fastai
# Create Enviroment
WORKDIR /gym
COPY . .
CMD ./.bin/createEnv.sh

# Clone course-v3
RUN git clone https://github.com/fastai/course-v3.git

# Activate Source and run lab at port 80
CMD ["./.bin/run.sh"]
