FROM ubuntu:bionic
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
        apt-get install --no-install-recommends -yq postgresql postgresql-client bash \
        gcc zip musl-dev libboost-python-dev libboost-system-dev libboost-thread-dev \
        build-essential  python python3 python3-venv python3-dev build-essential \
        sudo wget curl lsb-release \
        libboost-dev libboost-system-dev libboost-python-dev git && \        
        rm -rf /var/lib/apt/lists/*



WORKDIR /

RUN git clone https://github.com/area1/stpyv8
WORKDIR /stpyv8



RUN python2 setup.py v8 && \
        python3 setup.py stpyv8 && \
        python3 setup.py install && \
        rm -rf v8 build depot_tools 

#RUN mkdir /code
#WORKDIR /code
#COPY requirements.pip /code/
#RUN pip install -U pip
#RUN pip install -r requirements.pip