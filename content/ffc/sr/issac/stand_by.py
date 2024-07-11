import pyttsx3
import speech_recognition as sr


def speak(text):
    engine = pyttsx3.init()
    engine.say(text)
    engine.runAndWait()


def listen():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening...")
        r.pause_threshold = 2
        # listening duration 8 seconds
        audio = r.listen(source, 0, 8)
    try:
        print("Recognizing...")
        query = r.recognize_google(audio, language="en")
        print(f"You said: {query}")
        return query.lower()
    except sr.UnknownValueError:
        print("Google Speech Recognition could not understand audio")
        speak("I did not understand what you said. Please try again.")
        return None
    except sr.RequestError as e:
        print(
            f"Could not request results from Google Speech Recognition service: {e}")
        speak("I am unable to connect to the speech recognition service. Please try again later.")
        return None


def process_query(query):
    if query:
        if "isaac" in query:
            speak("Hello I'm Isaac, how can I help you?")
        elif "color" in query:
            colors = ["red", "blue", "green", "yellow",
                      "purple", "orange", "black", "white"]
            for color in colors:
                if color in query:
                    speak(f"The color you mentioned is {color}")
                    print(f"The color mentioned: {color}")
                    return
            speak("I didn't recognize a specific color in your statement.")
        else:
            speak(f"You said: {query}")


if __name__ == "__main__":
    while True:
        print("Say something:")
        query = listen()
        process_query(query)
