#!/usr/bin/env bash

j8() {
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    echo "$JAVA_HOME"
    echo "Setting java to version 1.8"
}

j12() {
    export JAVA_HOME=`/usr/libexec/java_home -v 12`
    echo "$JAVA_HOME"
    echo "Setting java to version 12"
}

j13() {
    export JAVA_HOME=`/usr/libexec/java_home -v 13`
    echo "$JAVA_HOME"
    echo "Setting java to version 13"
}
