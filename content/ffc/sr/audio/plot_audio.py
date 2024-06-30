import wave

import matplotlib.pyplot as plt
import numpy as np

# Open the wave file
obj = wave.open("vincent.wav", "rb")

# Extract audio properties
sample_freq = obj.getframerate()
n_samples = obj.getnframes()
n_channels = obj.getnchannels()
signal_wave = obj.readframes(-1)

obj.close()

# Calculate the duration of the audio
t_audio = n_samples / sample_freq
print(t_audio)

# Convert the audio data to a numpy array
signal_array = np.frombuffer(signal_wave, dtype=np.int16)

# Check if the audio is stereo or mono
if n_channels == 2:
    # Stereo: separate the channels
    signal_array = signal_array.reshape(-1, 2)
    left_channel = signal_array[:, 0]
    right_channel = signal_array[:, 1]
    times = np.linspace(0, t_audio, num=n_samples)
    
    # Plot both channels
    plt.figure(figsize=(15, 5))
    plt.plot(times, left_channel, label="Left Channel")
    plt.plot(times, right_channel, label="Right Channel")
    plt.legend()
else:
    # Mono: directly plot the signal
    times = np.linspace(0, t_audio, num=n_samples)
    
    plt.figure(figsize=(15, 5))
    plt.plot(times, signal_array)

# Plot settings
plt.title("Audio Signal")
plt.ylabel("Signal wave")
plt.xlabel("Time (s)")
plt.xlim(0, t_audio)
plt.show()
