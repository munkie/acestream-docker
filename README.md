Build:

    $ docker build -t ace https://github.com/munkie/acestream-docker.git

Run:

    $ docker run -v $HOME/Documents:/home/ace/Documents:rw -v /dev/snd:/dev/snd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --name ace ace
