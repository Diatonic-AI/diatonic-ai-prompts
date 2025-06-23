#!/bin/bash

echo "=== Jekyll Development Server for Windows Access ==="
echo "Setting up Jekyll server accessible from Windows..."
echo ""

# Stop any existing container
docker stop jekyll-dev 2>/dev/null
docker rm jekyll-dev 2>/dev/null

# Get WSL2 IP for reference
WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
echo "WSL2 IP: $WSL_IP"
echo "Windows can access via:"
echo "  - http://localhost:4000/diatonic-ai-prompts/"
echo "  - http://127.0.0.1:4000/diatonic-ai-prompts/"
echo "  - http://$WSL_IP:4000/diatonic-ai-prompts/"
echo ""
echo "Starting server..."

# Start Jekyll with explicit port binding for Windows access
docker run --name jekyll-dev \
  --rm \
  -p 0.0.0.0:4000:4000 \
  -v $(pwd):/srv/jekyll:Z \
  -it jekyll/jekyll:4.2.2 \
  bash -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload --incremental --force_polling"
