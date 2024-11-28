#!/bin/bash

PLUGIN_NAME="dod-hooks"

cd scripting
spcomp $PLUGIN_NAME.sp  -o ../plugins/$PLUGIN_NAME.smx
