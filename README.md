# Introduction

Docker image for running the stencil command without requiring it to be installed.

## Usage

Add the following to your `~/.bashrc` file to be able to run it easily...

```
alias stencil='docker run --rm -p 3000:3000 -p 3002:3002 --interactive --tty --volume $PWD:/app aligent/stencil stencil'
```
