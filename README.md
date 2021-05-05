### Welcome!
Forked from https://github.com/ianpan870102/yay-evil-emacs

My personal emacs config, used for VHDL development


### Requirements

 * ghdl https://github.com/ghdl/ghdl & rust_hdl https://github.com/VHDL-LS/rust_hdl for lsp-mode
 * cmake & libtool-bin for vterm


### Instructions
Notes for setup on centos/rhel

#### GCC
Grap an non acient version of GCC from https://ftp.gnu.org/gnu/gcc/ \
build & install gcc with jit for emacs native compilation feature


````
yum install -y libmpc-devel gmp-devel
wget https://ftp.gnu.org/gnu/gcc/gcc-10.3.0/gcc-10.3.0.tar.gz
tar xvf gcc-10.3.0.tar.gz
cd gcc-10.3.0
mkdir build
cd build
../configure --enable-host-shared --enable-languages=jit \
      --disable-bootstrap --enable-checking=release --prefix=$HOME/gcc --disable-multilib
make -j4
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
libcanberra-gtk3 PackageKit-gtk3-module \

git clone https://github.com/emacs-mirror/emacs.git --depth 1
cd emacs
./autogen.sh
./configure --with-json --with-modules --with-threads --with-included-regex \
--with-x-toolkit=gtk3 --with-zlib --without-sound --with-jpeg --with-png 
\--with-imagemagick --without-dbus --with-mailutils --with-cairo --with-native-compilation
make -j4 NATIVE_FULL_AOT=1
make install
````
