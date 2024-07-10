import speech_recognition as sr

r = sr.Recognizer()
while True:
    print("Python is listening...")
    inp = ""
    with sr.Microphone() as source:
        print("Start speaking...")
        r.pause_threshold = 1
        try:
            audio = r.listen(source, 0, 3)
            inp = r.recognize_google(audio, language="en")
        except sr.Request(Error):
            pass
        except sr.WaitTimeoutError:
            pass
    print(f'You just said {inp}')
    if inp == "stop listening":
        print("Goodbye!")
        break
