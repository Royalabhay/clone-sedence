# clone-sedence

A dependency-free static browser app that can be run locally from this repository.

## Quick start: view it live in your local browser

1. Open a terminal in the repository root.
2. Start the local server:

   ```bash
   ./start-local.sh
   ```

3. Keep that terminal running and open this URL in your browser:

   ```text
   http://127.0.0.1:4173
   ```

4. To stop the local server, go back to the terminal and press <kbd>Ctrl</kbd> + <kbd>C</kbd>.

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

You can also open `index.html` directly, but using the local server matches how browsers load static sites in development.

## Functionality available locally

The included static page verifies the app can load in a browser and includes:

- a responsive landing page for `clone-sedence`;
- a theme toggle that persists with `localStorage`;
- a live local-time display;
- a button that copies the local run command.

## Local verification

```bash
git status --short
./start-local.sh
curl -I http://127.0.0.1:4173/
```
