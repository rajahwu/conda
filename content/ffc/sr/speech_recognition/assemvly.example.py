# `pip3 install assemblyai` (macOS)
# `pip install assemblyai` (Windows)

import os

import assemblyai as aai

KEY = os.environ.get("ASSEMBLY_API_KEY")

aai.settings.api_key = KEY
transcriber = aai.Transcriber()

transcript = transcriber.transcribe("https://storage.googleapis.com/aai-web-samples/news.mp4")
# transcript = transcriber.transcribe("./my-local-audio-file.wav")

print(transcript.text)