#!/bin/bash

echo "=== Docker Networking Test ==="
echo ""

# Test basic Docker connectivity
echo "1. Testing Docker daemon:"
docker version --format '{{.Server.Version}}' && echo "✅ Docker daemon accessible" || echo "❌ Docker daemon issue"
echo ""

# Test simple container with port binding
echo "2. Testing simple web server with port binding:"
docker run --rm -d --name test-web -p 8080:80 nginx:alpine
sleep 2

if docker ps | grep test-web; then
    echo "✅ Container started with port binding"
    
    # Test local access
    if curl -s http://localhost:8080 >/dev/null; then
        echo "✅ localhost:8080 accessible from WSL2"
    else
        echo "❌ localhost:8080 not accessible from WSL2"
    fi
    
    # Get WSL IP for Windows testing
    WSL_IP=$(ip addr show eth0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
    echo ""
    echo "Test from Windows browser:"
    echo "  - http://localhost:8080 (should work if Docker Desktop integration is enabled)"
    echo "  - http://$WSL_IP:8080 (WSL2 direct IP)"
    echo ""
    echo "If neither works, we need to configure WSL2 networking differently."
    
    # Clean up
    docker stop test-web
else
    echo "❌ Container failed to start"
fi

echo ""
echo "3. WSL2 Network Configuration:"
ip route show | head -3
echo ""
echo "4. Active port listeners:"
ss -tlnp | grep -E ':(4000|8080)' || echo "No active listeners on ports 4000 or 8080"
