# These steps are adapted from https://github.com/johnwalicki/RaspPi-Pico-Examples-Fedora

git clone https://github.com/raspberrypi/pico-sdk.git
git clone https://github.com/raspberrypi/pico-examples.git
cd ./pico-sdk/src/rp2_common/tinyusb
git submodule update --init
cd -

mkdir build
cd build
cmake -DPICO_SDK_PATH=../pico-sdk -DCMAKE_TOOLCHAIN_FILE=/home/dev/toolchain.cmake ../pico-examples
make -j2
