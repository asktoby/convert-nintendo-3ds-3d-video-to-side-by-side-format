#!/bin/sh

for i in `ls *.AVI`
do
    echo "Converting $i ..."
    ffmpeg -i $i -map 0:0 -vcodec copy -map 0:1 -acodec copy temp1.avi
    ffmpeg -i $i -map 0:2? -vcodec copy -map 0:1 -acodec copy temp2.avi
    ffmpeg -i ./temp1.avi -i ./temp2.avi -filter_complex "[0:v]setpts=PTS-STARTPTS, pad=iw*2:ih[bg]; [1:v]setpts=PTS-STARTPTS[fg]; [bg][fg]overlay=w" $i.MP4
    rm temp1.avi
    rm temp2.avi
done
