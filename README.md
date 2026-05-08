# clone-sedence

A dependency-free static browser app that can be run locally from this repository.

## Quick start: view it live in your local browser

1. Open a terminal in the repository root.
2. Confirm the web app files are present:

   ```bash
   ls README.md index.html start-local.sh check-local.sh
   ```

3. Start the local server:

   ```bash
   ./start-local.sh
   ```

4. Keep that terminal running and open this URL in your **browser address bar**:

   ```text
   http://127.0.0.1:4173
   ```

   Do not type the URL into the terminal. A URL only works in a browser address bar.

5. To stop the local server, go back to the terminal and press <kbd>Ctrl</kbd> + <kbd>C</kbd>.

If you do not want to use the helper script, run Python directly instead:

```bash
python3 -m http.server 4173 --bind 127.0.0.1
```

Then open `http://127.0.0.1:4173` in your browser.

If port `4173` is already in use, choose another port:

```bash
PORT=5173 ./start-local.sh
```

Then open `http://127.0.0.1:5173`.

### Running in GitHub Codespaces or a remote VS Code environment

If your terminal is inside Codespaces, bind the server to all interfaces so the forwarded port can reach it:

```bash
HOST=0.0.0.0 ./start-local.sh
```

Then open the **Ports** tab in VS Code, find port `4173`, and click the forwarded address/globe icon to open it in your local browser.

You can also open `index.html` directly, but using the local server matches how browsers load static sites in development.

## Functionality available locally

The included static page verifies the app can load in a browser and includes:

- a responsive landing page for `clone-sedence`;
- a theme toggle that persists with `localStorage`;
- a live local-time display;
- a button that copies the local run command.

## Local verification

Run the local check script:

```bash
./check-local.sh
```

The script validates shell syntax, parses `index.html`, starts a temporary local server, and verifies the page responds. It intentionally uses only `bash`, `python3`, and `curl`; no `npx`, Playwright, Chromium, or browser download is required.

To verify manually, start the server in one terminal:

```bash
./start-local.sh
```

Then verify the running page from another terminal:

```bash
curl -I http://127.0.0.1:4173/
```


## Troubleshooting

### `./start-local.sh: No such file or directory`

This means the helper script is not in your current folder. In the terminal, run:

```bash
pwd
ls
```

You should see `index.html`, `start-local.sh`, and `check-local.sh`. If you only see `README.md`, you are missing the latest project files; pull/apply the latest changes first. As a fallback, if `index.html` exists, you can run the app without the script:

```bash
python3 -m http.server 4173 --bind 127.0.0.1
```

Then open `http://127.0.0.1:4173` in your browser address bar.

### `bash: http://127.0.0.1:4173: No such file or directory`

This happens when the URL is typed into the terminal. Start the server in the terminal, but open the URL in a browser address bar instead.

### Playwright or Chromium download errors

This project does not require Playwright or Chromium to run or verify locally. If you see errors such as `Chromium was unavailable` or `HTTP 403 Domain forbidden` while running `npx playwright ...`, skip those commands and use the built-in local check instead:

```bash
./check-local.sh
```

For a visual check, run `./start-local.sh` and open `http://127.0.0.1:4173` in your own browser.
