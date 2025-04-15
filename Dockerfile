# Use Coqui’s official CPU image as base
FROM ghcr.io/coqui-ai/tts-cpu:latest

# Set working directory
WORKDIR /app

# Install wget and curl (beides, falls eines fehlt)
RUN apt-get update && \
    apt-get install -y wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Copy in script
COPY ./download_xtts_v2.sh .
COPY ./script.sh .

RUN chmod +x download_xtts_v2.sh
RUN chmod +x script.sh
EXPOSE 5002

# Set default entrypoint so custom commands can be passed at runtime
ENTRYPOINT ["bash", "-c"]
