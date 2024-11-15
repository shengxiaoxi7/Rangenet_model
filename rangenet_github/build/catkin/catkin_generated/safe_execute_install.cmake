execute_process(COMMAND "/home/s123/SLAM_run/catkin_rangenet/build/catkin/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/s123/SLAM_run/catkin_rangenet/build/catkin/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
