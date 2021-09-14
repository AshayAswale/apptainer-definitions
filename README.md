# Singularity Definitions

## Pre-built Containers
Some of the containers in this repository may be pre-build and found here: https://cloud.sylabs.io/library/dcat52

### Fingerprint
The available containers should be signed with the following Fingerprint if from me:
```
0EDFFAA27F7120F242C6FC6EAD8FA31C9EEEF446
```

## Directory Structure
The directory structure is shown below.
```
.
├── argos
│   ├── argos_base.def
│   └── argos_buzz.def
└── README.md

1 directory, 3 files
```

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