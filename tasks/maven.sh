. $LUNARVIM_CONFIG_DIR/bin/task-init.sh
MVNW=$ROOT/mvnw
MVN=mvn
if [[ -f $MVNW ]];then
  MVN=$MVNW
fi

$MVN compile
