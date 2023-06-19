# dotfiles
Personal dotfiles repository

## Prerequisites

Before checking this repository out, you will need `git`.
Install `brew` and `git` as follows.

```sh
# Install XCode tools (including clang, gcc and git)
xcode-select --install
```

Next clone this repository into your home directory at `.dotfiles`.

```sh
git clone git@github.com:jemrobinson/dotfiles.git ~/.dotfiles
```

You may want to transfer your old home directory over SSH with rsync.
To do this, run the following

```sh
rsync -vaE ~ <username>@<new-ip-address>:/path/to/target
```
