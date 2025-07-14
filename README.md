# whisper-transcriber
Dockerized version of whisper
Here’s the complete **single-file `README.md`** in Markdown format:

```markdown
# 🐳 Whisper Transcriber (Docker)

Transcribe audio files using OpenAI’s [Whisper](https://github.com/openai/whisper) model inside a Docker container.  
This version uses the **`large` model** by default for best transcription accuracy and supports single-file input.

---

## 🚀 Features

- ✅ CPU-only setup (no GPU required)
- ✅ Uses Whisper's `large` model (~1.5GB, highest accuracy)
- ✅ Transcribes `.m4a`, `.mp3`, `.wav`, etc.
- ✅ Outputs `.txt`, `.srt`, and `.vtt` subtitle files
- ✅ CLI input support for custom audio file paths
- ✅ Compatible with macOS, Linux, and WSL

---

## 📁 Folder Structure

```

.
├── Dockerfile
├── transcribe.sh
├── README.md
└── audio/
└── audio-file.m4a

````

---

## 🛠️ Prerequisites

- Docker installed
- Audio file (e.g. `.m4a`, `.mp3`, `.wav`) placed under `audio/` or elsewhere on disk

---

## 🧱 Build the Docker Image

```bash
docker build -t whisper-transcriber .
````

---

## ▶️ Transcribe a File

Mount the folder containing your audio file and run:

```bash
docker run --rm \
  -v "$HOME/Downloads/test-audio:/app/audio" \
  whisper-transcriber /app/audio/"audio-file.m4a"
```

* Replace the path as needed.
* All output will be saved next to the audio file:

  * `audio-file.txt` (plain transcript)
  * `audio-file.srt` (subtitle)
  * `audio-file.vtt` (web caption)

---

## 💾 Optional: Cache the Whisper Model

The `large` model (\~1.5GB) is downloaded into the container. You can persist it using a named volume:

```bash
docker run --rm \
  -v whisper-cache:/root/.cache/whisper \
  -v "$HOME/Downloads/test-audio:/app/audio" \
  whisper-transcriber /app/audio/"audio-file.m4a"
```

---

## ⚙️ Script Notes

The script supports:

* **Single-file input** via positional argument
* Model size is hardcoded to `large` (edit `transcribe.sh` to change)

---

## 🧪 Want Batch Mode?

This setup supports one file at a time. To process all `.m4a` files in a folder, let us know — we can provide a batch-processing version.

---

## 📃 License

MIT License – do whatever you want, just don’t blame us if it transcribes your dog’s barks wrong.

---

```

Let me know if you want me to embed this in your actual project structure or export it as a downloadable file.
```
