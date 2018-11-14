export T_VIV_VER=2013.4
export T_SIMULATOR=questasim
export T_SIMULATOR_VER=10.4c_3
export T_ALT_VER=16.0.2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export MAKE_RUN=$DIR/../../acd_scripts/Makefile_run
source /opt/eda_setup/eda_setup.sh
export PATH=$QUESTA_INSTALL_DIR/$T_SIMULATOR_VER/$T_SIMULATOR/linux_x86_64:$PATH
export QUESTA_HOME=$QUESTA_INSTALL_DIR/$T_SIMULATOR_VER/$T_SIMULATOR
