# clone-sedence

This repository now includes a minimal live HTTP server so it can be run locally without additional dependencies.

## Run

```bash
python3 app.py --host 0.0.0.0 --port 8000
```

Then open `http://127.0.0.1:8000`.

## Quick check

```bash
python3 app.py --port 8000 &
PID=$!
sleep 1
curl -fsS http://127.0.0.1:8000 | head -n 5
kill $PID
```
