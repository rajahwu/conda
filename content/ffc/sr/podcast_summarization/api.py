import os
import sys
import time

# import assemblyai as aai
import requests
from dotenv import load_dotenv

env_path = '/var/www/html/apps/Training/conda/.env'
load_dotenv(env_path)

projectUrl = "/var/www/html/apps/Training/conda/"
ffcsrAssetsUrl = "content/ffc/sr/assets/"

transcriptUrl = 'https://api.assemblyai.com/v2/transcript'

filename = sys.argv[1] if len(sys.argv) > 1 else "vincent.wav"
filenameURLPrefix = projectUrl +  ffcsrAssetsUrl + "audio/" + filename

headers = {
    "authorization": os.environ.get("API_KEY_ASSEMBLYAI"),
    "content-type": "application/json"
    }

TIMEOUT = 5

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
 
# saveTranscript(audioUrl, projectUrl + "content/ffc/sr/speech_recognition/fetch_result_sample_short")