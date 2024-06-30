import speech_recognition as sr

speech = sr.Recognizer()
print("Python is listening...")
with sr.Microphone() as source:
    speech.adjust_for_ambient_noise(source)
    audio = speech.listen(source)
    inp = speech.listen(source)
print("You just said: {}".format(inp))
