#!/bin/bash
# Build Version : 1.0.0
# Created By AwanKumay
# Date : 21 November 2024

# Script Find

find_path() {

    # Meminta input path
    echo "Masukkan path (tekan Tab untuk autocomplete):"
    read -e path

    # Meminta input nama direktori
    echo "Masukkan nama direktori yang ingin dicari:"
    read directory_name

    # Menjalankan perintah find
    echo "Mencari direktori '$directory_name' di '$path'..."
    # find "$path" -name "$directory_name" -type d 2>/dev/null
    find "$path" -name "$directory_name" -type d

}

# Script Tail Logs Wildfly

wildfly_log() {
    tail -f /opt/wildfly/standalone/log/server.log | awk '
    /INFO/ {print "\033[32m" $0 "\033[39m"}
    /WARN/ {print "\033[33m" $0 "\033[39m"}
    /ERROR/ {print "\033[1;31mm" $0 "\033[39m"}
    /DEBUG/ {print "\033[34m" $0 "\033[39m"}'
    #/*/ {print "\033[35m" $0 "\033[39m"; next}'
}

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -lw,    --logwidlfy         Tools monitoring logs wildfly"
    echo "  -f,     --find              Tools find path"
    echo "  -h,     --help              Show this help message"
    echo "  -v,     --version           Show version script bash"
}

if [ $# -eq 0 ]; then

    echo "Null Pointer"

fi

while [ $# -gt 0 ]; do
    case $1 in
    -lw | --logwidlfy)
        wildfly_log
        ;;
    -f | --find)
        find_path
        ;;
    --test)
        show_testing
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    -v | --version)
        show_version
        exit 0
        ;;
    *)
        echo "Invalid argument: $1 use -h or --help for usage"
        exit 1
        ;;
    esac
    shift
done

exit 0
