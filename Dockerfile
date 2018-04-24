FROM frolvlad/alpine-glibc:alpine-3.7_glibc-2.26

ENV JAVA_VERSION=10 \
    JAVA_UPDATE=0.1 \
    JAVA_BUILD=10 \
    JAVA_PATH=fb4372174a714e6b8c52526dc134031e \
    JAVA_HOME="/usr/lib/jvm/default-jvm"

RUN apk add --no-cache --virtual=build-dependencies wget curl ca-certificates unzip binutils xz && \
    cd "/tmp" && \
    curl -Ls https://www.archlinux.org/packages/core/x86_64/gcc-libs/download > /tmp/gcc-libs.tar.xz && \
    mkdir /tmp/gcc && \
    tar -xf /tmp/gcc-libs.tar.xz -C /tmp/gcc && \
    mv /tmp/gcc/usr/lib/libgcc* /tmp/gcc/usr/lib/libstdc++* /usr/glibc-compat/lib && \
    strip /usr/glibc-compat/lib/libgcc_s.so.* /usr/glibc-compat/lib/libstdc++.so* && \
    curl -Ls https://www.archlinux.org/packages/core/x86_64/zlib/download > /tmp/zlib.tar.xz && \
    mkdir /tmp/zlib && \
    tar -xf /tmp/zlib.tar.xz -C /tmp/zlib && \
    mv /tmp/zlib/usr/lib/libz* /usr/glibc-compat/lib && \
    strip /usr/glibc-compat/lib/libz.so.* && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}.${JAVA_UPDATE}+${JAVA_BUILD}/${JAVA_PATH}/serverjre-${JAVA_VERSION}.${JAVA_UPDATE}_linux-x64_bin.tar.gz" && \
    tar -xzf "serverjre-${JAVA_VERSION}.${JAVA_UPDATE}_linux-x64_bin.tar.gz" && \
    mkdir -p "/usr/lib/jvm/java-${JAVA_VERSION}-oracle" && \
    mv "/tmp/jdk-${JAVA_VERSION}.${JAVA_UPDATE}" "/usr/lib/jvm/java-${JAVA_VERSION}-oracle/jre" && \
    ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
    ln -s "$JAVA_HOME/jre/bin/"* "/usr/bin/" && \
    rm -rf "$JAVA_HOME/"*src.zip && \
    rm -rf "$JAVA_HOME/lib/missioncontrol" \
       "$JAVA_HOME/lib/visualvm" \
       "$JAVA_HOME/lib/"*javafx* \
       "$JAVA_HOME/jre/lib/plugin.jar" \
       "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
       "$JAVA_HOME/jre/bin/javaws" \
       "$JAVA_HOME/jre/lib/javaws.jar" \
       "$JAVA_HOME/jre/lib/desktop" \
       "$JAVA_HOME/jre/plugin" \
       "$JAVA_HOME/jre/lib/"deploy* \
       "$JAVA_HOME/jre/lib/"*javafx* \
       "$JAVA_HOME/jre/lib/"*jfx* \
       "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
       "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
       "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
       "$JAVA_HOME/jre/lib/amd64/libglass.so" \
       "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
       "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
       "$JAVA_HOME/jre/lib/amd64/"libjfx*.so && \
       apk del build-dependencies wget curl unzip binutils xz && \
       rm -rf "/tmp/"*
