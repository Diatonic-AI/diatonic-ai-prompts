#!/bin/bash

echo "=== Jekyll Development Server for Windows Access ==="
echo ""

# Clean up any existing containers
docker stop jekyll-dev 2>/dev/null || true
docker rm jekyll-dev 2>/dev/null || true

# Get network info
WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
GATEWAY=$(ip route show default | awk '/default/ {print $3}')

echo "WSL2 IP: $WSL_IP"
echo "Gateway: $GATEWAY"
echo ""

# Start Jekyll container with proper networking
echo "Starting Jekyll server..."
echo "This will be accessible from Windows at:"
echo "  - http://localhost:4000/diatonic-ai-prompts/"
echo "  - http://$WSL_IP:4000/diatonic-ai-prompts/"
echo ""

# Run Jekyll with explicit host binding
docker run \
  --name jekyll-dev \
  --rm \
  -p 4000:4000 \
  -v "$(pwd):/srv/jekyll" \
  -w /srv/jekyll \
  jekyll/jekyll:4.2.2 \
  sh -c '
    echo "Installing gems..."
    bundle install --quiet
    echo ""
    echo "🚀 Starting Jekyll server..."
    echo "   Server will be available at: http://0.0.0.0:4000/diatonic-ai-prompts/"
    echo ""
    echo "   From Windows, try:"
    echo "   - http://localhost:4000/diatonic-ai-prompts/"
    echo "   - http://127.0.0.1:4000/diatonic-ai-prompts/"
    echo ""
    echo "   If those don'\''t work, run this in Windows PowerShell as Admin:"
    echo "   netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=4000 connectaddress='$WSL_IP' connectport=4000"
    echo ""
    
    bundle exec jekyll serve \
      --host 0.0.0.0 \
      --port 4000 \
      --livereload \
      --incremental \
      --force_polling
  '
