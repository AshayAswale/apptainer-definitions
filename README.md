# Singularity Definitions

## Structure
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
The ARGoS definition files contais the following configurable variables at the top.
```
  ARGOS_HASH="latest"
  ARGOS_EXAMPLES_HASH="latest"
  ARGOS_KHEPERAIV_HASH="latest"
  BUZZ_HASH="latest"
  BUZZ_REPO="buzz-lang"
  BUILD_TYPE="Debug"
```

The first four variables should be valid git hashes (i.e. `32c42b0`) that can be checked out or set to `latest`. The fifth variable should be a valid GitHub org that has a Buzz repository (i.e. `buzz-lang` or `NESTLab`). The sixth variable should be set either `Debug` or `Release`. The former enables more debuggable code at the expense of speed.