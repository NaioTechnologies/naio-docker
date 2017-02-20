#!/bin/bash

source /opt/ros/kinetic/setup.bash

mkdir /catkin_ws && cd /catkin_ws && mkdir src && cd src && catkin_init_workspace && cd .. && catkin_make

source /catkin_ws/devel/setup.bash

cd src
git clone https://github.com/NaioTechnologies/simulatoz.git
cd simulatoz
git checkout LAAS_release

cd /catkin_ws && catkin_make

/bin/bash
