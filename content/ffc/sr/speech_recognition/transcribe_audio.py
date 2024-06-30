# content/ffc/sr/speech_recognition/transcribe_audio.py
import os

import assemblyai as aai
from dotenv import load_dotenv

env_path = '/var/www/html/apps/Training/conda/.env'

load_dotenv(env_path)
aai.settings.api_key = os.environ.get("API_KEY_ASSEMBLYAI")

transcriber = aai.Transcriber()

audio_url = "/var/www/html/apps/Training/conda/content/ffc/sr/assets/audio/vincent.wav"
transcript = transcriber.transcribe(audio_url)

if transcript.error:
    print(transcript.error)
    
print(transcript.text)