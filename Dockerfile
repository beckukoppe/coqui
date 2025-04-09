# Use Coqui’s official CPU image as base
FROM ghcr.io/coqui-ai/tts-cpu:latest

# Set working directory
WORKDIR /app

# Optional: Copy in your scripts or config
# COPY ./my_script.py .

# Set default entrypoint so custom commands can be passed at runtime
ENTRYPOINT ["bash", "-c"]
