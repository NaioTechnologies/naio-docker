
FROM ubuntu:16.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN apt-get update; apt-get install -y lsb-release \
      vim \
      htop \
      python-pip \
      sudo \
      net-tools \
      socat \
      kmod \
      wget

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
      apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN apt-get update && \
      apt-get install ros-kinetic-desktop-full -y && \
      rosdep init && \
      rosdep update

RUN apt-get install -y python-rosinstall

RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

RUN apt-get update

RUN apt-get install gazebo7 -y

RUN apt-get install libgazebo7-dev

RUN apt-get install -y ros-kinetic-rviz \
        ros-kinetic-rosbash \
        ros-kinetic-rqt-tf-tree \
        ros-kinetic-effort-controllers \
        ros-kinetic-joint-state-controller \
        ros-kinetic-rqt \
        ros-kinetic-xacro \
        ros-kinetic-robot-state-publisher

RUN apt install -y ros-kinetic-gazebo-ros-control \
        ros-kinetic-hector-gazebo

RUN apt-get install -y libsdl2-dev \
        libsdl2-image-dev \
        libsdl2-ttf-dev \
        libsdl2-gfx-dev

RUN apt-get install -y libpugixml-dev \
        libjpeg-dev \
        libtiff5-dev \
        libglm-dev \
        libglfw3-dev \
        libglew-dev \
        uuid-dev \
        libblkid-dev \
        libusb-1.0-0-dev \
        libbluetooth-dev \
        libopencv-dev \
        libjsoncpp-dev \
        libignition-math2-dev

ENV GAZEBO_MODEL_PATH=/catkin_ws/src/simulatoz/oz440_description/models

ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
