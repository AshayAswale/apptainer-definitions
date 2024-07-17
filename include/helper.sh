dfx_checkout_hash() {
   hash=$1
   
   if [ "$hash" = "latest" ]; then
      hash=`git rev-parse --short HEAD`
   else
      git checkout $hash
   fi
}


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

   echo "DEPRECATED! Use dfx_git_clone_adv"


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

# example usage:
# dfx_git_clone_adv org=dcat52 repo=apptainer-definitions dir=definitions hash=latest
dfx_git_clone_adv() {
   echo "Params: $@"

   for arg in "$@" ; do
      eval $arg
   done

   if test -z "$url" ; then
      address="https://github.com/$org/$repo.git"
   else
      address="$url/$org/$repo.git"
   fi

   if test -z "$dir" ; then
      dir=$repo
   fi

   if [ "$org" = "NA" ]; then
      return
   elif [ "$org" = "local" ]; then
      cd $dir
   else
      git clone $address $dir
      cd $dir
   fi

   git fetch --all

   if test -z "$hash" ; then
      hash="latest"
   fi
   
   if [ "$hash" = "latest" ]; then
      hash=`git rev-parse --short HEAD`
   else
      git checkout $hash
   fi

   url=https://github.com

}

dfx_make_build() {
   echo Params: "$@"

   for arg in "$@" ; do
      eval $arg
   done

   if [ "$org" = "NA" ]; then
      return
   fi

   mkdir $dir
   cd $dir
   cmake $cmake_args $src
   make -j $(( $(nproc) - 2 ))
   make install
   ldconfig

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
   echo "checking $1 =? $2"
   # if printf '%s\n' "$1" | grep -Fqe "$2"; then
   if [[ $1 == *"$2"* ]]; then
      return 1
   fi
   return 0
}

# ARG: string to search within
# ARG: string to find
# RETURN: 1 if not in string
dfx_string_not_contains() {
   echo "checking $1 =? $2"
   # if printf '%s\n' "$1" | grep -Fqe "$2"; then
   if [[ $1 != *"$2"* ]]; then
      return 0
   fi
   return 1
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