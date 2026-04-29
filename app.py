#!/usr/bin/env python3
"""Minimal live HTTP server for clone-sedence."""
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import argparse


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the clone-sedence live server")
    parser.add_argument("--host", default="127.0.0.1", help="Host to bind (default: 127.0.0.1)")
    parser.add_argument("--port", type=int, default=8000, help="Port to bind (default: 8000)")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    server = ThreadingHTTPServer((args.host, args.port), SimpleHTTPRequestHandler)
    print(f"Serving clone-sedence on http://{args.host}:{args.port}")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()
        print("Server stopped.")


if __name__ == "__main__":
    main()
