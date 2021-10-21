
TARGET=target
VERSION=$1
NAME=$2

if [ X = X$1 ]
then
    echo "NO VERSION !"
    exit 2
fi

if [ ! -d $TARGET ]
then
    echo "Creation de '$TARGET'"
    mkdir $TARGET
fi

if [ ! -d $TARGET/$VERSION ]
then
    echo "Creation de '$TARGET/$VERSION'"
    mkdir $TARGET/$VERSION
fi
