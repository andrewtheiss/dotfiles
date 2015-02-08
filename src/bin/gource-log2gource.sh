#!/usr/bin/env bash
# Generates gource video (h.264) out of multiple repositories.
# Pass the repositories in command line arguments.
# based on https://gist.github.com/derEremit/1347949
# Example:
# <this.sh> logfile

INFILE=$1

# todo: use $(system_profiler SPDisplaysDataType |grep Resolution)
RESOLUTION="1440x900"

echo "======================"
echo "Committers:"
cat $INFILE | awk -F\| {'print  $2'} | sort | uniq
echo "======================"

# todo: flag to make ffmpeg optional
# todo: make it easier to customize all of these options without changing the script
time gource $INFILE \
    -$RESOLUTION \
    --hide bloom,filenames,root \
    --colour-images \
    --file-idle-time 0 \
    --user-image-dir $HOME/.gource \
    --max-files 0 \
    --seconds-per-day 0.1 \
    --dir-name-depth 2 \
    -r 30 $@

#     --elasticity 1 \