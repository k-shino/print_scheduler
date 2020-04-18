FROM python:3.5

RUN pip install plotly
RUN pip install numpy
RUN pip install psutil
RUN pip install requests
RUN wget https://repo.anaconda.com/miniconda/Miniconda-3.5.5-Linux-x86_64.sh
RUN chmod +x Miniconda-3.5.5-Linux-x86_64.sh
RUN apt update && \
    apt upgrade -y && \
    apt install -y bash \
                libgtk-3-0 \
                libnss3-dev \
                libx11-6 libx11-xcb1 libxcb1 libasound2 \
                xvfb
RUN sed -e 's;/bin/ash$;/bin/bash;g' -i /etc/passwd
RUN /Miniconda-3.5.5-Linux-x86_64.sh -b
ENV PATH $PATH:/root/miniconda/bin
RUN /root/miniconda/bin/conda update --yes conda
RUN /root/miniconda/bin/conda install --yes -c plotly plotly-orca
RUN wget -O /usr/bin/yq https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64
RUN chmod +x /usr/bin/yq
COPY entrypoint.sh /print/entrypoint.sh
COPY print_schedule.py /print/print_schedule.py
ENTRYPOINT bash -x /print/entrypoint.sh