# ARG: hash, tag, or branch to checkout
# IMPACTS: Checked out commit of local repository
dfx_checkout_hash() {
   hash=$1

   if [ "$hash" = "latest" ]; then
      hash=`git rev-parse --short HEAD`
   else
      git checkout $hash
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

addto_bashrc() {
   echo "${ARGS}" >> /.singularity.d/env/90-bashrc.sh
}
