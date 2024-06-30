# content/ffc/sr/tmp/environment.py

import os

from dotenv import load_dotenv

# Specify the path to the .env file
env_path = '/var/www/html/apps/Training/conda/.env'

# Load the .env file
load_dotenv(env_path)

# Retrieve the value of the environment variable
api_key_assemblyai = os.environ.get("API_KEY_ASSEMBLYAI")

# Optionally print the value to verify (you can remove this in production)
print(f"API_KEY_ASSEMBLYAI: {api_key_assemblyai}")
