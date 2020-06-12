# Introduction

Docker image for running the stencil command without requiring it to be installed.

## Installation

Add the following to your `~/.bashrc` file to be able to run it easily...

```
alias stencil='docker run --rm -p 3000:3000 -p 3002:3002 --interactive --tty --volume $PWD:/app aligent/stencil stencil'
```

You will then need to reload your bashrc file, either by running `. ~/.bashrc` or starting a new terminal session.

## Usage

You can now run stencil normally.

To start using it with the cornerstone theme:

1. Clone the theme `git clone https://github.com/bigcommerce/cornerstone.git`
2. Install deps `cd cornerstone && npm install`
3. Init stencil `stencil init`


