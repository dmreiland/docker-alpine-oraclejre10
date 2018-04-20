FROM frolvlad/alpine-glibc:alpine-3.7

ENV JAVA_VERSION=10 \
    JAVA_UPDATE=0.1 \
    JAVA_BUILD=10 \
    JAVA_PATH=fb4372174a714e6b8c52526dc134031e \
    JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip && \
    cd "/tmp" && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}.${JAVA_UPDATE}+${JAVA_BUILD}/${JAVA_PATH}/serverjre-${JAVA_VERSION}.${JAVA_UPDATE}_linux-x64_bin.tar.gz" && \
    tar -xzf "serverjre-${JAVA_VERSION}.${JAVA_UPDATE}_linux-x64_bin.tar.gz" && \
    mkdir -p "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    mv "/tmp/jdk-${JAVA_VERSION}.${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle/jre" && \
    ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/jre/bin/"* "/usr/bin/" && \
    rm -rf "$JAVA_HOME/"*src.zip && \
    apk del build-dependencies && \
    rm "/tmp/"*
