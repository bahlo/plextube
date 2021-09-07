FROM python:3-alpine

ENV ATOMIC_PARSLEY_RELEASE=20210715.151551.e7ad03a

COPY requirements.txt ./
RUN wget https://github.com/wez/atomicparsley/releases/download/$ATOMIC_PARSLEY_RELEASE/AtomicParsleyAlpine.zip && \
	unzip AtomicParsleyAlpine.zip && \
	mv AtomicParsley /usr/local/bin && \
	rm AtomicParsleyAlpine.zip && \
	apk add --no-cache gcc libc-dev ffmpeg bash && \
	python3 -m pip install --no-cache-dir -r requirements.txt && \
	mkdir -p /opt/plextube && \
	touch /opt/plextube/archive

WORKDIR /opt/plextube/videos
COPY plextube /usr/local/bin/plextube

CMD [ "/usr/local/bin/plextube" ]
