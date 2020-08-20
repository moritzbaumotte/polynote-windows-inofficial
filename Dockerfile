FROM alpine:3.10.3

WORKDIR /usr/src/app

# curl is needed to download polynote script, bash is needed to run it
RUN apk add --no-cache bash curl

# update make
RUN apk add --update make

# Install OpenJDK
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
RUN apk add --no-cache openjdk8

# Install pre-requisites needed for python dependencies
RUN set -e; \
  apk add --no-cache --virtual \ 
    .build-deps \
    gcc \
    g++ \
    libc-dev \
    linux-headers \
    mariadb-dev \
    python3-dev \
    postgresql-dev \
    freetype-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    zlib-dev \
    jpeg-dev \
	grep \
	curl \
  ;

# Install Python and dependencies
ENV PYTHONUNBUFFERED=1
COPY requirements.txt ./requirements.txt
RUN apk add python3-dev \
  && pip3 install --upgrade pip \
  && pip3 install --upgrade cython \
  && pip3 install -r requirements.txt
  
# Download and extract polynote
RUN curl -L --insecure https://github.com/polynote/polynote/releases/download/`curl --insecure "https://github.com/polynote/polynote/releases/latest" | grep -Po [0-9]+\.[0-9]+\.[0-9]+`/polynote-dist.tar.gz \
  | tar -xzvpf -

COPY config.yml ./polynote/config.yml

EXPOSE 8192

CMD python3 polynote/polynote.py
