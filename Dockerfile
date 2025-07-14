FROM python:3.10-slim

RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install openai-whisper

WORKDIR /app
COPY transcribe.sh /app/transcribe.sh
RUN chmod +x transcribe.sh

ENTRYPOINT ["/app/transcribe.sh"]
