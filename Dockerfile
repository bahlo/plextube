FROM python:3

RUN wget https://github.com/wez/atomicparsley/releases/download/20210715.151551.e7ad03a/AtomicParsleyLinux.zip && \
	unzip AtomicParsleyLinux.zip && \
	mv AtomicParsley /usr/local/bin && \
	rm AtomicParsleyLinux.zip && \
	apt-get update && apt-get install -y ffmpeg

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY plextube /usr/local/bin/plextube

WORKDIR /opt/plextube/videos
CMD [ "/usr/local/bin/plextube" ]
