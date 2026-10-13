
#DISCLAIMER: I wrote this script with the assistance of a large language model (aka. LLM/AI) because I was lazy, works as intended when I tested it.

#go home
cd ~
#get cool deps
sudo apt update
sudo apt install build-essential git make pkg-config cmake ninja-build \
libasound2-dev libpulse-dev libaudio-dev libfribidi-dev libjack-dev \
libsndio-dev libx11-dev libxext-dev libxrandr-dev libxcursor-dev \
libxfixes-dev libxi-dev libxss-dev libxtst-dev libxkbcommon-dev \
libdrm-dev libgbm-dev libgl1-mesa-dev libgles2-mesa-dev \
libegl1-mesa-dev libdbus-1-dev libudev-dev
#clone cause pro
git clone https://github.com/libsdl-org/SDL.git SDL3
cd SDL3
#building haha
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --parallel
#install frr
sudo cmake --install .
#update
sudo ldconfig
