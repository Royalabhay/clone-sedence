.PHONY: run check

run:
	python3 app.py --host 0.0.0.0 --port 8000

check:
	python3 app.py --port 8000 > /tmp/clone-sedence-server.log 2>&1 & \
	PID=$$!; \
	sleep 1; \
	curl -fsS http://127.0.0.1:8000 > /tmp/clone-sedence-curl.out; \
	STATUS=$$?; \
	kill $$PID; \
	wait $$PID 2>/dev/null || true; \
	echo "curl_status=$$STATUS"; \
	head -n 5 /tmp/clone-sedence-curl.out
