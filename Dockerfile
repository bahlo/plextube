FROM python:3

COPY requirements.txt ./
RUN wget https://github.com/wez/atomicparsley/releases/download/20210715.151551.e7ad03a/AtomicParsleyLinux.zip && \
	unzip AtomicParsleyLinux.zip && \
	mv AtomicParsley /usr/local/bin && \
	rm AtomicParsleyLinux.zip && \
	apt-get update && apt-get install -y ffmpeg && \
	rm -rf /var/cache/apt/archives && \
	pip install --no-cache-dir -r requirements.txt && \
	mkdir -p /opt/plextube && \
	touch /opt/plextube/archive

WORKDIR /opt/plextube/videos
COPY plextube /usr/local/bin/plextube

CMD [ "/usr/local/bin/plextube" ]
