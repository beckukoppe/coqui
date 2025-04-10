import subprocess

def start_coqui_server(model_name="tts_models/en/vctk/vits"):
    subprocess.run([
        "python3",
        "-m", "TTS.server.server",
        "--model_name", model_name
    ], check=True)

if __name__ == "__main__":
    start_coqui_server()
