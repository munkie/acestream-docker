## Pull

    $ docker pull munkie/acestreamplayer

## Build

    $ docker build -t acestreamplayer https://github.com/munkie/acestream-docker.git

## Run

    $ docker run -v $HOME/Documents:/home/ace/Documents:rw -v /dev/snd:/dev/snd --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) -e DISPLAY=unix$DISPLAY --rm munkie/acestreamplayer

## Open acestream:// links in browser

    $ sudo cp ace.sh /usr/local/bin/ace
    $ sudo chmod +x /usr/local/bin/ace
    $ sudo cp acestream.desktop /usr/share/applications/
    $ sudo update-desktop-database
