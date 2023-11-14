. $LUNARVIM_CONFIG_DIR/bin/task-init.sh
SCRIPT=$1

: ${CC:=$(which gcc)}
for line in $(cat $SCRIPT|grep -E "//\s*@ENV"|awk -F: '{print $2}');do 
  KEY=$(echo $line|awk -F= '{print $1}')
  VALUE=$(echo $line|awk '{print substr($0, index($0, "=") + 1)}')
  eval "export $KEY=$VALUE"
done


if [[ -z $ROOT ]];then
  cd $VIM_FILEDIR
fi

if [[ -z $BUILD_RIR ]];then
  TMP_OUTPUT=$(get_temp_file_path)
  DELETE=1
else
  BUILD_DIR=$VIM_FILEDIR/$BUILD_DIR
  mkdir -p $BUILD_RIR
  NAME=$(basename $SCRIPT)
  NAME=${NAME%.*}
  TMP_OUTPUT=$BUILD_RIR/$NAME
  DELETE=0
fi
CMD="$CC -g $CFLAGS -o $TMP_OUTPUT $@ $SOURCES ${LDFLAGS} $LIBS"
echo $CMD
echo "--------------------------------------------------------"
$CMD
ulimit -c unlimited

$TMP_OUTPUT
if [[ $DELETE -eq 1 ]];then
  rm -f $TMP_OUTPUT
fi 
