# Krause Hausordner

Docker based SMB share with bargate as a webfrontend intended to be runnable on
a Raspberry Pi.


## Requirements

Docker and docker-compose have to be installed. For Raspberry Pi follow the
official docs at https://docs.docker.com/install/linux/docker-ce/debian/

## Testing

For testing run `sudo docker-compose up --remove-orphans --build` in the root
directory of this project. This will build and start all the required services.

The bargate interface and the SMB share are available under http://localhost/
and smb://localhost/

The default password "pass" is used for both the "admin" and the "krause" user.

## Installation

To install the Hausordner as a systemd service on the Raspberry Pi use
`sudo make install`. Afterwards a `docker-hausordner.service` is available and
may be started with `sudo systemctl start docker-hausordner.service`. To start
the service on startup use `sudo systemctl enable docker-hausordner.service`.

The default password may be overwritten by an environment file located at
`/etc/docker-hausordner.env`.

