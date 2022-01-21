# Introduction

Docker image for running the stencil command without requiring it to be installed. We have experienced a number of annoying issues installing the cli from time-to-time, as well as it have a huge number of deprecated node modules included. This method of use does not require you to run the npm install process or have any of the prerequisites installed (although it does require you to have Docker installed).

The image is available on Docker Hub as [aligent/stencil](https://hub.docker.com/r/aligent/stencil).

This code simply wraps [bigcommerce/stencil-cli](https://github.com/bigcommerce/stencil-cli) in docker for convenience.

## Installation

Ensure you have a .npm directory for caching dependancies (`mkdir -p ~/.npm`)

Add the following line to your `~/.bash_aliases` (or `.bash_profile`, `.bashrc`, etc) file to be able to run it easily...

```bash
alias stencil='docker run --rm -p 3000:3000 -p 3002:3002 -it --volume ~/.npm:/home/node/.npm --volume $PWD:/app aligent/stencil stencil'
```

You will then need to reload your bashrc file, either by running `. ~/.bashrc` or starting a new terminal session.

If you want to specify a **specific version** of stencil, you can use the version number in the alias (Docker tags should match
the version number of the cli), eg 

```bash
alias stencil='docker run --rm -p 3000:3000 -p 3002:3002 -it --volume ~/.npm:/home/node/.npm --volume $PWD:/app aligent/stencil:3.8.5 stencil'
```

## Usage

You can now run stencil normally.

To start using it with the cornerstone theme:

1. Clone the theme `git clone https://github.com/bigcommerce/cornerstone.git && cd cornerstone`
2. Install deps `node-run npm install`
3. Init stencil `stencil init`

## Development / Updates

We gladdly accept contributions, and if you have issues please log them to Github issues.

To test the building of the docker container locally, a simple script [test-stencil.sh](./test-stencil.sh) can be used. It will build the container
and then output the stencil cli version. To update the stencil version, simply edit [Dockerfile](./Dockerfile) on the line where it installs stencil.

After a new tag is pushed to this repo it is automatically built in Docker Hub. Version tags should match the Stencil CLI version.


