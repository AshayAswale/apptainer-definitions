# Apptainer Definitions

## How to Use
The repository may be used in a variety of ways, usually with building the containers into a `~./containers` directory.

## Directory Structure
The directory structure is shown below.
```
.
|-- README.md
|-- definitions
|   |-- argos
|   |   `-- full.def
|   |-- linux_common
|   |   `-- tools.def
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
