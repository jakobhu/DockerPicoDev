# Docker image intended for cross-compiling for embedded arm
# To build docker image:
# > docker build . -t arm_build
#
# run it with a mapped 'dev' directory
# > docker run -v "$HOME/Docker/arm_build/dev/:/home/dev" --network host -i -t arm_build /bin/sh
#
# cleanup exited containers
# > docker rm $(docker ps --filter status=exited -q)

FROM alpine:3.15

ADD gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 /opt/gcc
RUN rm -rf /opt/gcc/gcc-arm-none-eabi-10.3-2021.10/share/doc
ENV PATH="/opt/gcc/gcc-arm-none-eabi-10.3-2021.10/bin/:${PATH}"

RUN apk add --no-cache --update \
	make \
	vim \
	file \
	musl-obstack \
	gcompat \
	cmake \
	python3 \
	git \
	build-base

WORKDIR /home/dev
