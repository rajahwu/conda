import wave

obj = wave.open("vincent.wav", "rb")

print("Number of channels ", obj.getnchannels())
print("sample width ", obj.getsampwidth())
print("frame rate ", obj.getframerate())
print("Number of frames ", obj.getnframes())
print("parameters ", obj.getparams())

t_audio = obj.getnframes() / obj.getframerate()
print(t_audio)

frames = obj.readframes(-1)
print(type(frames), type(frames[0]))
print(len(frames) / 2)

obj.close()

obj_new = wave.open("vincent_new.wav", "wb")

obj_new.setnchannels(1)
obj_new.setsampwidth(2)
obj_new.setframerate(44100.0)

obj_new.writeframes(frames)

obj_new.close()