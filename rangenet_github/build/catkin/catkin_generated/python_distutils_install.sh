#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/s123/SLAM_run/catkin_rangenet/src/catkin"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/s123/SLAM_run/catkin_rangenet/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/s123/SLAM_run/catkin_rangenet/install/lib/python3/dist-packages:/home/s123/SLAM_run/catkin_rangenet/build/catkin/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/s123/SLAM_run/catkin_rangenet/build/catkin" \
    "/usr/bin/python3" \
    "/home/s123/SLAM_run/catkin_rangenet/src/catkin/setup.py" \
    egg_info --egg-base /home/s123/SLAM_run/catkin_rangenet/build/catkin \
    build --build-base "/home/s123/SLAM_run/catkin_rangenet/build/catkin" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/s123/SLAM_run/catkin_rangenet/install" --install-scripts="/home/s123/SLAM_run/catkin_rangenet/install/bin"
