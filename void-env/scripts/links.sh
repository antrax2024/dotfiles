#!/usr/bin/bash
#
PKGS=$(cat <<-END
    This is line one.
    This is line two.
    This is line three.
END
)


echo $PKGS
