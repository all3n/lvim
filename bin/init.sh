. $LUNARVIM_CONFIG_DIR/bin/functions.sh
# local config
MY_CONFIG=$LUNARVIM_CONFIG_DIR/bin/config.local.sh
if [[ -f $MY_CONFIG ]];then
    . $MY_CONFIG
fi

export TASKS_HOME=$LUNARVIM_CONFIG_DIR/tasks
export PATH=$TASKS_HOME:$PATH

#if [[ ! -d $MVIM_DATA_DIR/venv ]];then
#    python3 -m venv $MVIM_DATA_DIR/venv
#    . $MVIM_DATA_DIR/venv/bin/activate
#    pip install --upgrade pip
#    pip install neovim
#else
#    . $MVIM_DATA_DIR/venv/bin/activate
#fi
