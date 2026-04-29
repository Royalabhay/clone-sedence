# clone-sedence

This repository includes a minimal live HTTP server so it can be run locally without additional dependencies.

## Run

```bash
make run
```

(Equivalent command: `python3 app.py --host 0.0.0.0 --port 8000`.)

Then open `http://127.0.0.1:8000`.

## Verify

```bash
make check
```

## If you still get `can't open file ... app.py`

You are usually on the wrong checkout/branch. Run:

```bash
pwd
ls -la
git branch --show-current
git log --oneline -n 5
```

You should see `app.py`, `index.html`, and a commit containing:

`Add runnable live HTTP server and startup docs`
