### Welcome!
Forked from https://github.com/ianpan870102/yay-evil-emacs

My personal emacs config, used for VHDL development


### Requirements

 * ghdl https://github.com/ghdl/ghdl & rust_hdl https://github.com/VHDL-LS/rust_hdl for lsp-mode
 * cmake & libtool-bin for vterm


### Instructions
Notes for setup on centos/rhel


#### GCC
Grap an non acient version of GCC from https://ftp.gnu.org/gnu/gcc/
build & install gcc with jit for emacs native compilation feature


````
yum install -y libmpc-devel gmp-devel wget gcc-c++ gcc-gnat make
wget https://ftp.gnu.org/gnu/gcc/gcc-10.3.0/gcc-10.3.0.tar.gz
tar xvf gcc-10.3.0.tar.gz
cd gcc-10.3.0
mkdir build-jit
cd build-jit
../configure --enable-host-shared --enable-languages=jit \
--disable-bootstrap --enable-checking=release --prefix=$HOME/gcc --disable-multilib
make -j4

cd ..
mkdir build-ada
cd build-ada
../configure --enable-languages=c,ada --disable-bootstrap --prefix=$HOME/gcc --disable-multilib
make -j4
cd ../build-jit/
make install
cd ../build-ada/
make install

export PATH=$HOME/gcc/bin/:$PATH
export LD_LIBRARY_PATH=$HOME/gcc/lib
export LIBRARY_PATH=$HOME/gcc/lib

````

#### Emacs
Make sure you have the following packages installed
````
yum install -y autoconf make texinfo gtk3-devel libXpm-devel libjpeg-devel \
giflib-devel libtiff-devel gnutls-devel ncurses-devel jansson-devel ImageMagick-devel \
libcanberra-gtk3 PackageKit-gtk3-module

git clone https://github.com/emacs-mirror/emacs.git --depth 1 emacs_src
cd emacs_src
./autogen.sh
./configure --with-json --with-modules --with-threads --with-included-regex \
--with-x-toolkit=gtk3 --with-zlib --without-sound --with-jpeg --with-png \
--with-imagemagick --without-dbus --with-mailutils --with-cairo --with-native-compilation \
--prefix=$HOME/emacs
make -j4 NATIVE_FULL_AOT=1
make install
````

#### GHDL
````
yum install -y git zlib-devel python3
git clone https://github.com/ghdl/ghdl.git --depth 1
cd ghdl
mkdir build
cd build
make -j4
make install
export PATH=$HOME/ghdl/bin:$PATH
cd ..
pip3 install .
````

#### rust_hdl
Note: emacs config uses rust_hdl as an add-on LSP.\
In order to not get duplicate matches, disable some features.

In vhdl_ls/src/vhdl_server.rs change:
````
declaration_provider: Some(true),
definition_provider: Some(true),
````
to:
````
declaration_provider: Some(false),
definition_provider: Some(false),
````

````
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/VHDL-LS/rust_hdl.git --depth 1
cd rust_hdl
cargo build --release
````
