#!/usr/bin/env bash
# Generates gource video (h.264) out of multiple repositories.
# Pass the repositories in command line arguments.
# based on https://gist.github.com/derEremit/1347949
# Example:
# <this.sh> logfile

# allow stdin
INFILE=$1

# todo: allow this to be a parameter
OUTFILE="${INFILE%.*}.m4v"

# todo: allow args to gource and to ffmpeg
gource-log2gource.sh \
    --hide date,dirnames,mouse,progress,filenames,usernames \
    $@ -o - | \
    ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 $OUTFILE