#!/bin/bash

echo "=== Jekyll Server with Windows Access ==="
echo "Configuring Docker container for Windows browser access..."

# Stop any existing containers
docker stop jekyll-dev 2>/dev/null || true
docker rm jekyll-dev 2>/dev/null || true

# Get the WSL2 IP that Windows can reach
WSL_IP=$(ip route show default | awk '/default/ {print $3}')
LOCAL_IP=$(hostname -I | awk '{print $1}')

echo "WSL2 Local IP: $LOCAL_IP"
echo "Gateway IP: $WSL_IP"
echo ""

# Start with explicit host binding for Windows access
echo "Starting Jekyll container..."
echo "Container will bind to all interfaces (0.0.0.0:4000)"
echo ""

docker run \
  --name jekyll-dev \
  --rm \
  -p 0.0.0.0:4000:4000 \
  -p 0.0.0.0:35729:35729 \
  -v "$(pwd):/srv/jekyll" \
  -e JEKYLL_ENV=development \
  jekyll/jekyll:4.2.2 \
  bash -c "
    echo 'Installing dependencies...'
    bundle install
    echo ''
    echo 'Starting Jekyll server...'
    echo 'Windows access URLs:'
    echo '  - http://localhost:4000/diatonic-ai-prompts/'
    echo '  - http://127.0.0.1:4000/diatonic-ai-prompts/'
    echo '  - http://$LOCAL_IP:4000/diatonic-ai-prompts/'
    echo ''
    bundle exec jekyll serve \
      --host 0.0.0.0 \
      --port 4000 \
      --livereload \
      --livereload-port 35729 \
      --incremental \
      --force_polling \
      --verbose
  "
