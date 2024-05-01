# ARG: HASH of commit to checkout (or latest)
# ARG: ORG of repository
# ARG: REPO repository to clone
# ARG: DIR desired path name for cloned repository (if any)
# IMPACTS: new folder
# IMPACTS: PWD
dfx_clone_and_checkout() {
   echo $1 $2 $3 $4
   HASH=$1
   ORG=$2
   REPO=$3
   DIR=$4

   DEFAULT_URL=github.com

   if [ "$ORG" = "NA" ]; then
     return
   fi

   if test -z "$DIR" ; then
      DIR=$REPO
   fi

   if [ "$ORG" = "local" ]; then
      cd $DIR
      return
   fi

   git clone https://github.com/$ORG/$REPO.git $DIR
   cd $DIR

   git fetch --all
   
   if [ "$HASH" = "latest" ]; then
      HASH=`git rev-parse --short HEAD`
   else
      git checkout $HASH
   fi
}

# ARG: path for directory to be made
# IMPACTS: PWD
dfx_make_dir_and_cd() {
   mkdir $1
   cd $1
}

# ARG: string to search within
# ARG: string to find
# RETURN: 1 if in string
dfx_string_contains() {
   echo $1
   echo $2
   if printf '%s\n' "$1" | grep -Fqe "$2"; then
      return 1
   fi
   return 
}

# IMPACTS: /.singularity.d/*
add_helper() {
   mkdir -p $APPTAINER_ROOTFS/.singularity.d/env
   cp definitions/include/helper.sh $APPTAINER_ROOTFS/.singularity.d/env/90-helper.sh
   chmod u+x $APPTAINER_ROOTFS/.singularity.d/env/90-helper.sh
   . $APPTAINER_ROOTFS/.singularity.d/env/90-helper.sh
}

# IMPACTS: /.singularity.d/*
# IMPACTS: bashrc
add_bashrc() {
   mkdir -p $APPTAINER_ROOTFS/.singularity.d/env
   cp definitions/include/bashrc $APPTAINER_ROOTFS/.singularity.d/env/90-bashrc.sh
   chmod u+x $APPTAINER_ROOTFS/.singularity.d/env/90-bashrc.sh
}

# IMPACTS: /env.sh
add_environment() {
   mkdir -p $APPTAINER_ROOTFS/.singularity.d/env
   echo "$(printenv)" > $APPTAINER_ROOTFS/env.sh
}

# IMPACTS: /.singularity.d/*
# IMPACTS: $SSH_AUTH_SOCK
add_sshauthsock() {
   mkdir -p $APPTAINER_ROOTFS/.singularity.d/env
   echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > $APPTAINER_ROOTFS/.singularity.d/env/90-sshauthsock.sh
   chmod u+x $APPTAINER_ROOTFS/.singularity.d/env/90-sshauthsock.sh
}

addto_bashrc() {
   echo $@ >> /.singularity.d/env/90-bashrc.sh
}