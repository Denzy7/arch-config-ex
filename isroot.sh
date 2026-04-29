if ! [ $(id -u) -eq 0 ]
then
	echo "This script must run as root"
	exit 1
fi
