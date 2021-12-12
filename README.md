# Singularity Definitions

## Pre-built Containers
Some of the containers in this repository may be pre-build and found here: https://cloud.sylabs.io/library/dcat52

### Fingerprint
The available containers should be signed with the following Fingerprint if from me:
```
0EDFFAA27F7120F242C6FC6EAD8FA31C9EEEF446
```

## How to Use
The repository may be used in a variety of ways, usually with building the containers into the `./containers` directory. Then adding files/folders to your path variable, likely done in your `~/.bashrc` file. The example bash commands assume this repo is setup on your home directory.

### Prepend Path
 Every program can be added with overriding your locally installed programs by prepending `./bin` directory to the system path.  This will allow using the apps with scripts as if they were installed on the host system. Note that all commands found in the `./bin` folder will override system commands regardless of whether the containers are built.
 ```bash
 PATH=~/singularity-definitions/bin:$PATH
 ```
 
 To only override single commands, prepend only those endpoints to your path.
 ```bash
 PATH=~/singularity-definitions/bin/argos3:$PATH
 ```

### Postpend Path
Every program can be added but still using a locally installed version as preferred by postpending `./bin` directory to the system path. This too will allow using the apps with scripts as if they were installed on the host system. Note that the commands found in the `./bin` folder will not be used if there is a locally installed version on your path.
 ```bash
 PATH=$PATH:~/singularity-definitions/bin
 ```

## Directory Structure
The directory structure with built containers is shown below.
```
.
├── bin
│   ├── argos3
│   ├── bzzc
├── containers
│   ├── argos_base.sif
│   ├── argos_buzz.sif
├── definitions
│   ├── argos
│   │   ├── argos_base.def
│   │   └── argos_buzz.def
├── README.md

```

## Definitions
### ARGoS
The argos subdirectory contains definition files for ARGoS simulation software.

#### Definition File
The ARGoS definition files contain the following configurable variables at the top.
```
  ARGOS_HASH="latest"
  ARGOS_EXAMPLES_HASH="latest"
  ARGOS_KHEPERAIV_HASH="latest"
  BUZZ_HASH="latest"
  BUZZ_REPO="buzz-lang"
  BUILD_TYPE="Debug"
```

The first four variables should be valid git hashes (i.e. `32c42b0`) that can be checked out or set to `latest`. The fifth variable should be a valid GitHub org that has a Buzz repository (i.e. `buzz-lang` or `NESTLab`). The sixth variable should be set to either `Debug` or `Release`. The former enables more debuggable code at the expense of speed.