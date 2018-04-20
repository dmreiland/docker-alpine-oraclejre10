[![Docker Stars](https://img.shields.io/docker/stars/dmreiland/alpine-oraclejre10.svg?style=flat-square)](https://hub.docker.com/r/dmreiland/alpine-oraclejre10/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dmreiland/alpine-oraclejre10.svg?style=flat-square)](https://hub.docker.com/r/dmreiland/alpine-oraclejre10/)


OracleJRE 10 Docker image
========================

Thanks to [frovlad](https://github.com/frol/docker-alpine-oraclejdk8) and his excellent Java8 builds for providing a solid foundation

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[OracleJRE 10](http://www.oracle.com/technetwork/java/javase/overview/index.html).

You must accept the
[Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html)
to use this image.

The JRE bundle contains lots of unnecessary for a Docker image, so it was cleaned up. There are 3
tags: `full` (only src tarballs get removed), `cleaned` (desktop parts get cleaned), `slim`
(everything but jvm is removed). `master` branch refers to `slim` tag, but `latest`
tag points to `cleaned`.

`slim` (`master` branch) download image size is:

[![](https://images.microbadger.com/badges/image/dmreiland/alpine-oraclejre10:slim.svg)](http://microbadger.com/images/dmreiland/alpine-oraclejre10:slim "Get your own image badge on microbadger.com")

`cleaned` (`latest` tag) download image size is:

[![](https://images.microbadger.com/badges/image/dmreiland/alpine-oraclejre10:cleaned.svg)](http://microbadger.com/images/dmreiland/alpine-oraclejre10:cleaned "Get your own image badge on microbadger.com")

`full` download image size is:

[![](https://images.microbadger.com/badges/image/dmreiland/alpine-oraclejre10:full.svg)](http://microbadger.com/images/dmreiland/alpine-oraclejre10:full "Get your own image badge on microbadger.com")


In case you need to compile Java code with Oracle JDK, consider using
[`dmreiland/alpine-oraclejdk10`](https://github.com/dmreiland/docker-alpine-oraclejdk10)
image.


Usage Example
-------------

NOTE: You will need to have a compiled Java application (`Main.class`) to run this.

```bash
$ docker run --rm -v "$(pwd)":/mnt --workdir /mnt dmreiland/alpine-oraclejre10:slim java Main
```

Once you have run this command you will get printed 'Hello World' from Java!
