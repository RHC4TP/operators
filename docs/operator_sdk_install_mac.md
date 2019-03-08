# Golang Operator SDK Installation For Mac Hosts


## About

This guide covers installing the Operator SDK and prerequisite software including:

* Golang
* Dep
* Operator SDK
* Docker
* Ansible

## Installing Golang

### Download Go

```bash
[workstation] ~ $ cd /tmp
[workstation] /tmp $ curl -O https://dl.google.com/go/go1.12.darwin-amd64.tar.gz
[workstation] /tmp $ tar -xzvf go1.12.darwin-amd64.tar.gz
...
[workstation] /tmp $ sudo mv go /usr/local/
[workstation] /tmp $ cd ~
```

By unpacking this archive into the `/usr/local/` directory we now have a `/usr/local/go` directory that will hold of the Go's internal parts.

### Adding Go Binaries to The `$PATH`

Before we can actually use the Go tools we'll need to adjust our `$PATH` to include the binaries distributed as part of Go. We need to at the `/usr/local/go/bin` directory to our path by modifying our `~/.barshrc` file:

_~/.bashrc_
```bash
# previous lines omitted
export PATH=$PATH:/usr/local/go/bin
```

Now we're able to run the `go` tool after reloading our `.bashrc` file:

```bash
[workstation] ~ $ exec $SHELL
[workstation] ~ $ go version
go version go1.12 darwin/amd64
```

### Setting Up the `$GOPATH`

Go uses a very specific folder structure and environment variables to know where to find Go code. For the code that we'll be writing, we need to put them into a path that we store as the `$GOPATH` environment variable. We'll set this directory structure up at `$HOME/go` and set the `$GOPATH` within our `.bashrc`.

Let's create the directory structure first:

```bash
[workstation] ~ $ mkdir -p $HOME/go/{bin,src,pkg}
```

Each of these directories stores something specific to Go:

* `$GOPATH/src` - contains Go source files
* `$GOPATH/bin` - contains executables
* `$GOPATH/pkg` - containers our packages pulled in by Dep

Next, let's set the environment variable in our `.bashrc`:

_~/.bashrc_
```bash
# previous lines omitted
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

### Test Your Installation

Check that Go is installed correctly by setting up a workspace and building a simple program, as follows.

Make the directory `src/hello` inside your `$GOPATH`, and in that directory create a file named `hello.go` that looks like:

```go
package main

import "fmt"

func main() {
	fmt.Printf("hello, world\n")
}
```

Then build it with the go tool:

```bash
[workstation] $ cd $HOME/go/src/hello
[workstation] $ go build
```

The command above will build an executable named hello in the directory alongside your source code. Execute it to see the greeting:

```bash
$ ./hello
hello, world
```

If you see the "hello, world" message then your Go installation is working.

You can run go install to install the binary into your workspace's bin directory or go clean -i to remove it.


## Installing Dep

Pre-compiled binaries are available on the [releases](https://github.com/golang/dep/releases) page. You can use the install.sh script to automatically install one for your local platform:

```bash
[workstation] $ curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
```

## Installing the Operator SDK

```bash
[workstation] $ mkdir -p $GOPATH/src/github.com/operator-framework
[workstation] $ cd $GOPATH/src/github.com/operator-framework
[workstation] $ git clone https://github.com/operator-framework/operator-sdk
[workstation] $ cd operator-sdk
[workstation] $ git checkout master
[workstation] $ make dep
[workstation] $ make install
```

## Install Docker Desktop

Installation instructions can be found here: https://docs.docker.com/docker-for-mac/install/
