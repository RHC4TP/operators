# Golang Operator SDK Installation For Mac Hosts


## About

This guide covers installing the Operator SDK and prerequisite software including:

* [Golang](#install-golang)
* [Dep](#install-dep)
* [Operator SDK](#install-the-operator-sdk)
* [Docker](#install-docker-desktop)
* [Ansible](#install-ansible)

Once your are done with the installations on this list, you will then be able to successfully build your first operator.

**Note:** This guide assumes that you are using `/bin/bash` as your default shell. Thus, all manual profile configurations will be in relation to the `.bash_profile` file. If you are using another shell such as `/bin/zsh`, then all manual edits to the profile must occur in the `.zshrc` file. To check which shell you are currently using, run this command: `echo $SHELL`.

Also note that after making edits to your profile, you must either reload your shell with the new configurations or re-log into your computer. This is especially important after installing Golang on your machine. You can reload your shell with:

`$ source ~/.bash_profile`

## Install Golang

### Download Golang

```bash
[workstation] ~ $ cd /tmp
[workstation] /tmp $ curl -O https://dl.google.com/go/go1.12.darwin-amd64.tar.gz
[workstation] /tmp $ tar -xzvf go1.12.darwin-amd64.tar.gz
...
[workstation] /tmp $ sudo mv go /usr/local/
[workstation] /tmp $ cd ~
```

By unpacking this archive into the `/usr/local/` directory we now have a `/usr/local/go` directory that will hold of the Go's internal parts.

### Adding Go Binaries to the `$PATH`

Before we can actually use the Go tools we'll need to adjust our `$PATH` to include the binaries distributed as part of Go. We need to at the `/usr/local/go/bin` directory to our path by modifying our `~/.barshrc` file:

_~/.bash_profile_
```bash
# previous lines omitted
export PATH=$PATH:/usr/local/go/bin
```

Now we're able to run the `go` tool after reloading our `.bash_profile` file:

```bash
[workstation] ~ $ exec $SHELL
[workstation] ~ $ go version
go version go1.12 darwin/amd64
```

### Setting Up the `$GOPATH`

Go uses a very specific folder structure and environment variables to know where to find Go code. For the code that we'll be writing, we need to put them into a path that we store as the `$GOPATH` environment variable. We'll set this directory structure up at `$HOME/go` and set the `$GOPATH` within our `.bash_profile`.

Let's create the directory structure first:

```bash
[workstation] $ mkdir -p $HOME/go/{bin,src,pkg}
```

Each of these directories stores something specific to Go:

* `$GOPATH/src` - contains Go source files
* `$GOPATH/bin` - contains executables
* `$GOPATH/pkg` - contains our packages pulled in by Dep

Next, let's set the environment variable in our `.bash_profile`:

_~/.bash_profile_
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
[workstation] $ ./hello
hello, world
```

If you see the "hello, world" message then your Go installation is working.

You can run go install to install the binary into your workspace's bin directory or go clean -i to remove it.

## Install Dep

Pre-compiled binaries are available on the [releases](https://github.com/golang/dep/releases) page. You can use the `install.sh` script to automatically install one for your local platform:

```bash
[workstation] $ curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
```

### Test Your Installation

```bash
[workstation] $ dep version

dep:
 version     : v0.5.0
 build date  : 2018-08-16
 git hash    : 224a564
 go version  : go1.10.3
 go compiler : gc
 platform    : darwin/amd64
 features    : ImportDuringSolve=false
```

## Install the Operator SDK

```bash
[workstation] $ mkdir -p $GOPATH/src/github.com/operator-framework
[workstation] $ cd $GOPATH/src/github.com/operator-framework
[workstation] $ git clone https://github.com/operator-framework/operator-sdk
[workstation] $ cd operator-sdk
[workstation] $ git checkout master
[workstation] $ make dep
[workstation] $ make install
```

### Test Your Installation

```bash
[workstation] $ operator-sdk --version

operator-sdk version v0.5.0+git
```

## Install Docker Desktop

Installation instructions can be found here: https://docs.docker.com/docker-for-mac/install/

### Test Your Installation

```bash
[workstation] $ docker version

Client: Docker Engine - Community
 Version:           18.09.2
 API version:       1.39
 Go version:        go1.10.8
 Git commit:        6247962
 Built:             Sun Feb 10 04:12:39 2019
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.2
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.6
  Git commit:       6247962
  Built:            Sun Feb 10 04:13:06 2019
  OS/Arch:          linux/amd64
  Experimental:     false
```

## Install Ansible

With Homebrew (Easiest Way)

```bash
[workstation] $ brew install ansible
```

### Test Your Installation

```bash
[workstation] $ ansible --version

ansible 2.7.7
  config file = None
  configured module search path = [u'/Users/<user>/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /Library/Python/2.7/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 2.7.10 (default, Aug 17 2018, 19:45:58) [GCC 4.2.1 Compatible Apple LLVM 10.0.0 (clang-1000.0.42)]
```
