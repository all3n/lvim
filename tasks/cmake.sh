. $LUNARVIM_CONFIG_DIR/bin/task-init.sh
BUILD=$ROOT/build
mkdir -p $BUILD
cd $BUILD
cmake ..
make -j$(get_nproc)
