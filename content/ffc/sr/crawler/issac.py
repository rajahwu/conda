import os

import pyttsx3
from art import text2art
from colorama import Back, Fore, Style

engine = pyttsx3.init()


def clear_screen():
   if os.name == 'nt':
        os.system('cls')
   else:
        os.system('clear')


print("The color red")
engine.say("The color red")
engine.runAndWait()
clear_screen()

Art = text2art("r", font="block", chr_ignore=True)
print(Fore.RED + Back.BLACK + Art)
print(Style.RESET_ALL)
engine.say(text="R,")
engine.runAndWait()
clear_screen()

Art = text2art("re", font="block", chr_ignore=True)
print(Fore.RED + Back.WHITE + Art)
print(Style.RESET_ALL)
engine.say(text="E,")
engine.runAndWait()
clear_screen()

Art = text2art("red", font="block", chr_ignore=True)
print(Fore.RED + Back.BLACK + Art)
print(Style.RESET_ALL)
engine.say(text="D")
engine.runAndWait()
