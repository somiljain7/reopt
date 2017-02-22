#!/bin/bash
#
# Use --with-arm to also clone disarm for ARM support

set -e

clone ()
{
    local path=$1
    local url=$2
    if [ -d deps/$1 ]; then
        pushd deps > /dev/null
        git pull > /dev/null
        popd > /dev/null
    else
        pushd deps > /dev/null
        git clone $url
        popd > /dev/null
    fi
}

mkdir -p deps

clone dwarf               git@github.com:GaloisInc/dwarf.git
clone elf-edit            git@github.com:GaloisInc/elf-edit.git
clone flexdis86           git@github.com:GaloisInc/flexdis86.git
clone linux-ptrace        git@github.com:GaloisInc/linux-ptrace.git
clone llvm-pretty         git@github.com:GaloisInc/llvm-pretty.git
clone mss                 git@github.com:GaloisInc/mss.git
clone parameterized-utils git@github.com:GaloisInc/parameterized-utils.git
clone posix-waitpid       git@github.com:GaloisInc/posix-waitpid.git

clone macaw               git@gitlab-ext.galois.com:macaw/macaw.git
clone reopt-crucible      git@gitlab-int.galois.com:radss/reopt-crucible.git

if [[ $* == *--with-arm* ]]; then
    clone disarm              git@gitlab-ext.galois.com:ABCD/disarm.git
fi
