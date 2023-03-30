Its seems that in general this is a good way to generate gifs:

- record the video in simulator
- convert to 720p resolution
- use ffmpeg: `ffmpeg -i intro_4.mov -pix_fmt rgb24 -r 10  intro_4.gif`
