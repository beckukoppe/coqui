#!/bin/sh
#Folder should mount to /root/.local/share/tts/tts_models--multilingual--multi-dataset--xtts_v2

mkdir -p /root/.local/share/tts/tts_models--multilingual--multi-dataset--xtts_v2
cd /root/.local/share/tts/tts_models--multilingual--multi-dataset--xtts_v2

download() {
    if [ -f "$1" ]; then
        echo "✔️ $1 already exists. Skipping download."
        return
    fi

    echo "Downloading $1..."
    if [ -x "$(command -v wget2)" ]; then
        wget2 --no-config --progress bar -O $1 $2
    elif [ -x "$(command -v wget)" ]; then
        wget --no-config --quiet --show-progress -O $1 $2
    elif [ -x "$(command -v curl)" ]; then
        curl -L --output $1 $2
    else
        printf "❌ Either wget or curl is required to download models.\n"
        exit 1
    fi
}

download "config.json" "https://huggingface.co/coqui/XTTS-v2/resolve/main/config.json"
download "hash.md5" "https://huggingface.co/coqui/XTTS-v2/resolve/main/hash.md5"
download "model.pth" "https://huggingface.co/coqui/XTTS-v2/resolve/main/model.pth"
download "speakers_xtts.pth" "https://huggingface.co/coqui/XTTS-v2/resolve/main/speakers_xtts.pth"
download "vocab.json" "https://huggingface.co/coqui/XTTS-v2/resolve/main/vocab.json"
if [ ! -f "tos_agreed.txt" ]; then
    echo "📄 Creating tos_agreed.txt..."
    echo "I have read, understood and agreed to the Terms and Conditions." > tos_agreed.txt
else
    echo "✔️ tos_agreed.txt already exists."
fi

cd ..

echo "✅ XTTS_V2 Download finished!"
