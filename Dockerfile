# Use Coqui’s official CPU image as base
FROM ghcr.io/coqui-ai/tts-cpu:latest

# Set working directory
WORKDIR /app

#Copy in script
COPY ./script.py .

# Set default entrypoint so custom commands can be passed at runtime
ENTRYPOINT ["bash", "-c"]
