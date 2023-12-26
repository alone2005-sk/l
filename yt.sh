ffmpeg -loglevel info -y -re \
  -f image2 -loop 1 -i /home/container/oip.jpg \
  -f concat -safe 0 -i <((for f in ./mp3/*.mp3; do path="/home/container/sk.mp3"; echo "file ${path@Q}"; done) | shuf) \
  -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k \
  -framerate 25 -video_size 1280x720 -vf "format=yuv420p" -g 50 -shortest -strict experimental \
  -c:a aac -b:a 128k -ar 44100 \
  -f flv rtmp://a.rtmp.youtube.com/live2/m93k-a1fe-up9z-6w9u-awfc


