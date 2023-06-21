. $LUNARVIM_CONFIG_DIR/bin/task-init.sh
export ROOT=$(find_root $VIM_FILEDIR)
if [[ -n "$ROOT" ]];then
  echo "ROOT:$ROOT"
  cd $ROOT
fi


export EXEC_LIST=()
exec_dir(){
  find_exec $1
  EXEC_NUM=${#EXEC_LIST[@]}
  if [[ $EXEC_NUM -eq 0 ]];then
    echo "NOT FOUND EXECUTABLE FILE"
  elif [[ $EXEC_NUM -eq 1 ]];then
    echo "BIN:$EXEC_LIST"
    echo "------------------------------------------------"
    $EXEC_LIST
  else
    for idx in `seq 0 $(( EXEC_NUM -1 ))`;do
      echo "index:$idx  "${EXEC_LIST[$idx]}
    done
    echo "input index:"
    read INDEX
    EXEC=${EXEC_LIST[$INDEX]}
    echo "BIN:$EXEC"
    echo "------------------------------------------------"
    $EXEC
  fi
}


if [[ -f $ROOT/CMakeLists.txt ]];then
  exec_dir $ROOT/build
elif [[ -f $ROOT/Makefile ]] || [[ -f $ROOT/makefile ]];then
  make
  BUILD_DIR=$ROOT/build
  if [[ -d $BUILD_DIR ]];then
    exec_dir $BUILD_DIR
  else
    exec_dir $ROOT
  fi
else
  EXT=${VIM_FILEPATH##*.}
  if [[ "$EXT" == "cpp" ]] || [[ "$EXP" == "cc" ]];then
    bash cpp.sh $VIM_FILEPATH
  elif [[ "$EXT" == "c" ]];then
    bash c.sh $VIM_FILEPATH
  elif [[ "$EXT" == "rs" ]];then
    bash rust.sh $VIM_FILEPATH
  elif [[ "$EXT" == "go" ]];then
    bash go.sh $VIM_FILEPATH
  fi
fi
