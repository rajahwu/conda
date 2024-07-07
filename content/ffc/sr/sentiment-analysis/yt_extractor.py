import yt_dlp as youtube_dl

ydl = youtube_dl.YoutubeDL()

def get_video_info(url):
    with ydl:
        result = ydl.extract_info(
            url,
            download=False
        )
        if "entries" in result:
            return result["entries"][0]
        return result

def get_audio_url(video_info):
    audio_formats = [f for f in video_info['formats'] if f['ext'] == 'm4a']
    if audio_formats:
        return audio_formats[0]['url']
    return None

if __name__ == "__main__":
    url = "https://www.youtube.com/shorts/PIFpM6B4g3w"  # Example URL
    video_info = get_video_info(url)
    audio_url = get_audio_url(video_info)
    print(audio_url)

