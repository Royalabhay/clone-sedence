# clone-sedence

A dependency-free static browser app that can be run locally from this repository.

## Run in a browser

From the repository root, start a local static server:

```bash
python3 -m http.server 4173
```

Then open this URL in your browser:

```text
http://localhost:4173
```

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
python3 -m http.server 4173
curl -I http://127.0.0.1:4173/
```
