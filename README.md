# naio-docker

## Installation

You need to install nvidia-docker on your computer: https://github.com/NVIDIA/nvidia-docker

## Build

`docker build -t **image_name:tag** **dockerfile_folder**`

## Run

`xhost +local:root`

```
nvidia-docker run -it \
    --privileged \
    --env="DISPLAY" \
    --name simuloz \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/tmp/.XIM-unix:/tmp/.XIM-unix:rw" \
    -p 5900:5900 -p 5554:5554 -p 2213:2213 -p 5558:5558 -p 5559:5559 \
    **image_name:tag**
```
## Stop

`docker stop simuloz`

**(A utiliser avec precaution : )**

`docker rm $(docker ps -a -q)`
