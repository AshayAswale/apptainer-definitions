# Apptainer Definitions

## How to Use
The repository may be used in a variety of ways, usually with building the containers into the `./containers` directory. Then adding folders to your path variable, likely done in your `~/.bashrc` file. The example bash commands assume this repo is setup on your home directory. You can test which executable is being used with the `which` command.

### Prepend Path
 Every program can be added with overriding your locally installed programs by prepending `./bin` directory to the system path.  This will allow using the apps with scripts as if they were installed on the host system. Note that all commands found in the `./bin` folder will override system commands regardless of whether the containers are built.
 ```bash
 PATH=~/apptainer-definitions/bin:$PATH
 ```

### Postpend Path
Every program can be added but still using a locally installed version as preferred by postpending `./bin` directory to the system path. This too will allow using the apps with scripts as if they were installed on the host system. Note that the commands found in the `./bin` folder will not be used if there is a locally installed version on your path.
 ```bash
 PATH=$PATH:~/apptainer-definitions/bin
 ```

## Directory Structure
The directory structure with built containers is shown below.
```
.
|-- README.md
|-- bin
|   |-- argos3 -> ../launchers/argos_full.sh
|   |-- bzzc -> ../launchers/argos_full.sh
|   |-- git -> ../launchers/linux_common_tools.sh
|   |-- nano -> ../launchers/linux_common_tools.sh
|   |-- pip -> ../launchers/python_3.x.sh
|   |-- pip3 -> ../launchers/python_3.x.sh
|   |-- python -> ../launchers/python_3.x.sh
|   |-- python3 -> ../launchers/python_3.x.sh
|   |-- tldr -> ../launchers/linux_common_tools.sh
|   |-- tree -> ../launchers/linux_common_tools.sh
|   `-- vim -> ../launchers/linux_common_tools.sh
|-- containers
|   |-- argos_full.sif
|   |-- linux_common_tools.sif
|   `-- python_3.x.sif
|-- definitions
|   |-- argos
|   |   `-- full.def
|   |-- linux_common
|   |   `-- tools.def
|   `-- python
|       |-- 3.10.def
|       `-- 3.x.def
|-- launchers
|   |-- argos_full.sh
|   |-- linux_common_tools.sh
|   `-- python_3.x.sh
```

## Definition Files

Definition files exist in the `definitions` subdirectory. Each file has a `.def` on the end.

### ARGoS
The argos subdirectory contains definition files for ARGoS simulation software.

#### full
The `argos/full.def` sets up ARGoS with the KheperaIV and Buzz

##### User Configurable Variables

The first `%post` section contain the following configurable variables at the top.
```
  # REPO SOURCE ORGS

  # use "ilpincy" or other
  ARGOS_REPO="ilpincy"
  ARGOS_EXAMPLES_REPO="ilpincy"
  KHEPERAIV_REPO="ilpincy"
  # use "NESTLab" or "buzz-lang" or other
  BUZZ_REPO="buzz-lang"

  # GIT HASHES

  # use "latest" for most recent commit
  ARGOS_HASH="latest"
  ARGOS_EXAMPLES_HASH="latest"
  BUZZ_HASH="latest"
  KHEPERAIV_HASH="latest"

  # BUILD TYPE
  
  # use "Debug" or "Release"
  BUILD_TYPE="Release"
  # use "OFF" or "ON" when BUILD_TYPE is set to "Release"
  BUILD_NATIVE="OFF"
```

The first set of variables are for the github user/org the repository (i.e. `buzz-lang`/`NESTLab`) to pull from is under (assuming public read access). The following set of variables are valid git hashes (i.e. `32c42b0`) that can be checked out or set to `latest`. The third set of variables is for the type of build and these should be set to either `Debug`/`Release` and `ON`/`OFF`.

### Linux Common
The linux common subdirectory contains definition files for common or useful linux packages.

#### Tools
The `linux_common/tools.def` sets up common apt packages such as git, tree, and etc.

### Python
The python subdirectory contains definition files for Python versions.

#### 3.x
The `python/3.x.def` sets up a python environment with the latest download on 22.04 apt repositories. Pip is also configured within.

#### 3.10
The `python/3.10.def` sets up a specific python version by adding a ppa to apt. Pip is also configured within.