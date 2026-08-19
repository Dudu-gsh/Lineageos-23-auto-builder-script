#!/usr/bin/env bash
set -euo pipefail
#  MIT License
#
#  Copyright (c) 2026 Dudu-gsh
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
HERE="$(pwd)/"

path() {
  echo "What is written above \"Extract Proparytery blobls\""
read -rp "Please,write here:" PASTA
}

ask_zip() {
  echo "Please,Download the .zip installer"
echo "Where the file is?"
echo "Ex:/home/myuser/Lineage_something23.zip"
read -rp "Write here:" ZIP 
}

ASK(){
echo "On the compilation steps,there is one command called breakfast YourDevice,what is there"
echo "Like rosymary,nx_tab"
read -rp "What was written there?: " CODENOME
clear
echo "This will take a while,so take a nap,take a coffe or something"
sleep 3
}

CORES=$(( $(nproc) - 2 ))
(( CORES < 1 )) && CORES=1

# Installs packges
sudo apt update
sudo apt install -y bc bison build-essential \
ccache curl flex g++-multilib gcc-multilib git \
git-lfs gnupg gperf imagemagick protobuf-compiler \
python3-protobuf lib32readline-dev \
lib32z1-dev libdw-dev libelf-dev libgnutls-dev \
lz4 libsdl1.2-dev libssl-dev libxml2 \
libxml2-utils lzop pngcrush rsync schedtool \
squashfs-tools xsltproc xxd zip zlib1g-dev \
python-is-python3
# create paths and downlaod repo
mkdir -p ~/bin
PATH="$HOME/bin:$PATH"
mkdir -p ~/android/lineage

curl -fLo ~/bin/repo https://storage.googleapis.com/git-repo-downloads/repo
chmod a+x ~/bin/repo
clear
# Use ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache 
# Asks Email and name
read -rp "What is ur email of the github,is for cloning?" EMAIL 
read -rp "And ur name,it can be anything?" NAME 
clear
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git lfs install
git config --global trailer.changeid.key "Change-Id"

ccache -M 30G
ccache -o compression=true
# Downlaod files
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs --no-clone-bundle
repo sync -c -j"$CORES"
clear
# Downaload more things
ASK
source build/envsetup.sh
while ! breakfast "$CODENOME"; do
    echo "Error: $CODENOME dont exist or is unsupported"
    ASK
done
ask_zip

while [[ ! -f "$ZIP" ]]; do 
echo "File not found"
ask_zip
done

path
while [[ ! -d "$PASTA" ]]; do
echo "Wrong path!!"
path
done
# Extarct files
cd "$PASTA"
if [[ -f "./extract-files.sh" ]]; then
    ./extract-files.sh "$ZIP"
elif [[ -f ./extract-files.py ]]; then
   ./extract-files.py "$ZIP"
  else
  echo "Impprtant file not found!!"
  exit 1
  fi
# Builds
croot
clear
   if [[ "$USE_KERNELSU" == true ]]; then
cd "$HERE"
git clone https://github.com/Dudu-gsh/KernelSU_moddifyd.git
cd KernelSU_moddifyd
chmod +x kernel/setup.sh
cd ~/android/lineage/
cd "$(find kernel -type d -name "$CODENOME").."
"$HERE"KernelSU_moddifyd/kernel/setup.sh
croot
   fi
read -rp "Want to compile a Signed Build (Y/N)" SIGNED
   if [[ $SIGNED =~ ^[Yy]$ ]]; then 
cd "$HERE"
chmod +x sign_please
./sign_please.sh

   else
brunch "$CODENOME"