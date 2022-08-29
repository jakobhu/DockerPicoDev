Motivation:

To enable development for the raspberry pi Pico on a non-linux machine.
Using the host machine editors/IDEs for programming.

Requirements:

. Docker: https://www.docker.com/products/
. GCC arm toolchain: https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

Setup:

. Run Docker on your host machine
. Create the docker image using Dockerfile (first time)
  host> docker build . -t arm_build

. Run the docker image - mapping a host directory to /home/dev 
  host> docker run -v "$HOME/Docker/arm_build/dev/:/home/dev" --network host -i -t arm_build /bin/sh

. From the running image shell - run the setup_and_build_pico.sh script
  img> sh setup_and_build_pico.sh

. move the desired .uf2 binary to the pico using your host machine (drag and drop to the pico USB drive)


