from moviepy.editor import *

class mat:
    def __init__(self, url):
        self.url = url

material = mat("C:\\Users\\zyz\\Pictures\\image.png")
clip_duration = 3
clip = (
    ImageClip(material.url)
    .set_duration(clip_duration)
    .set_position("center")
)
# 使用resize方法来添加缩放效果。这里使用了lambda函数来使得缩放效果随时间变化。
# 假设我们想要从原始大小逐渐放大到120%的大小。
# t代表当前时间，clip.duration为视频总时长，这里是3秒。
# 注意：1 表示100%的大小，所以1.2表示120%的大小
zoom_clip = clip.resize(
    lambda t: 1 + (clip_duration * 0.03) * (t / clip.duration)
)

# 如果需要，可以创建一个包含缩放剪辑的复合视频剪辑
# （这在您想要在视频中添加其他元素时非常有用）
final_clip = CompositeVideoClip([zoom_clip])

# 输出视频
video_file = f"{material.url}.mp4"
final_clip.write_videofile(video_file, fps=30, logger=None)
final_clip.close()
del final_clip
material.url = video_file
print(material.url)
