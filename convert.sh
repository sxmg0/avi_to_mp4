#!/bin/bash

date

for video in `ls src_videos`
do
	avidemux3_cli --load src_videos/$video --video-codec copy --audio-codec copy --save src_videos/${video%.AVI}.mp4
	ffmpeg -i src_videos/${video%.AVI}.mp4 -c:a aac converted_videos/${video%.AVI}.mp4
	exiftool -tagsFromFile src_videos/$video -XMP:All= -ThumbnailImage= -m converted_videos/${video%.MTS}.mp4
	rm converted_videos/*_original
	rm src_videos/*.mp4
done

date

echo done
