# content/ffc/sr/speech_recognition/transcribe_audio.py
import os
import time

# import assemblyai as aai
import requests
from dotenv import load_dotenv

env_path = '/var/www/html/apps/Training/conda/.env'
load_dotenv(env_path)

uploadUrl = 'https://api.assemblyai.com/v2/upload'
transcriptUrl = 'https://api.assemblyai.com/v2/transcript'
filename = "/var/www/html/apps/Training/conda/content/ffc/sr/assets/audio/vincent.wav"

headers = {
    "authorization": os.environ.get("API_KEY_ASSEMBLYAI"),
    "content-type": "application/json"
    }

CHUNK_SIZE = 5_242_880  # 5MB
TIMEOUT = 5

def upload(filename):
    def readfile(filename):
        with open(filename, "rb") as f:
            while True:
                data = f.read(CHUNK_SIZE)
                if not data:
                    break
                yield data
    uploadResponse = requests.post(
        uploadUrl,
        headers=headers,
        data=readfile(filename),
        timeout=TIMEOUT
    )
    print("Step 1: Upload file")
    return uploadResponse.json()["upload_url"]

audioUrl = upload(filename)

def transcribe(audio_url):
    
    transcriptRequest = {"audio_url": audio_url}
    
    transcriptResponse = requests.post(
        transcriptUrl,
        json=transcriptRequest,
        headers=headers,
        timeout=TIMEOUT
    )
    print("Step 2: Transcribe")
    return transcriptResponse.json()["id"]

def poll(transcript_id):
    pollingUrl = transcriptUrl + "/" + transcript_id
    pollingResponse = requests.get(
        pollingUrl,
        headers=headers,
        timeout=TIMEOUT
        )
    return pollingResponse.json()

def getTranscriptionResultUrl(url):
    transcriptId = transcribe(url)
    print("Step 3: Wait for result")
    while True:
        data = poll(transcriptId)
        if data["status"] == "completed":
            return data, None
        elif data["status"] == "error":
            return data, data["error"]
        
        print(f"waiting for {TIMEOUT} seconds")
        time.sleep(TIMEOUT)

def saveTranscript(url, title):
    data, error = getTranscriptionResultUrl(url)

    if data:
        filename = title + ".txt"
        with open(filename, "w") as f:
            f.write(data["text"])
        print("Transcript saved")
    elif error:
        print("Error!!!", error)

saveTranscript(audioUrl, "/var/www/html/apps/Training/conda/content/ffc/sr/speech_recognition/fetch_result_sample_short")