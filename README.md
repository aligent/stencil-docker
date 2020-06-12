# Introduction

Docker image for running the stencil command without requiring it to be installed.

## Installation

Ensure you have a .npm directory for caching dependancies (`mkdir -p ~/.npm`)

Add the following lines to your `~/.bashrc` file to be able to run it easily...

```
alias node-run='docker run --rm -p 3000:3000 -p 3002:3002 -it --volume ~/.npm:/home/node/.npm --volume $PWD:/app aligent/stencil'
alias stencil=`node-run stencil`
```

You will then need to reload your bashrc file, either by running `. ~/.bashrc` or starting a new terminal session.

## Usage

You can now run stencil normally.

To start using it with the cornerstone theme:

1. Clone the theme `git clone https://github.com/bigcommerce/cornerstone.git && cd cornerstone`
2. Install deps `node-run npm install`
3. Init stencil `stencil init`


