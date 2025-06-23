#!/bin/bash

echo "=== Jekyll Development Server ==="
echo "Trying to start Jekyll with working configuration..."
echo ""

# Stop any existing Jekyll processes
pkill -f jekyll

# Set up proper environment
export BUNDLE_GEMFILE=/tmp/empty_gemfile
echo '# Empty gemfile for development' > /tmp/empty_gemfile

# Use the original config with kramdown but try to work around plugin issues
echo "Building site first to check for errors..."
/usr/bin/jekyll build --config "_config.yml" --destination "_test_site" --trace

if [ $? -eq 0 ]; then
    echo ""
    echo "Build successful! Starting server..."
    echo "Site will be available at: http://localhost:4000/diatonic-ai-prompts"
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    /usr/bin/jekyll serve \
        --host 0.0.0.0 \
        --port 4000 \
        --config "_config.yml" \
        --skip-initial-build \
        --livereload
else
    echo ""
    echo "Build failed. Let's try with a minimal configuration..."
    
    # Create minimal working config
    cat > _config_minimal.yml << 'CONF_EOF'
title: "Diatonic AI Prompts"
description: "AI Prompts Collection"
baseurl: "/diatonic-ai-prompts"
url: "http://localhost:4000"

markdown: kramdown
highlighter: rouge
plugins: []

collections:
  prompts:
    output: true

defaults:
  - scope:
      path: ""
      type: "prompts"
    values:
      layout: "prompt"

exclude:
  - Gemfile*
  - "*.sh"
  - README.md
  - "_test_site"
CONF_EOF

    echo "Trying with minimal configuration..."
    /usr/bin/jekyll serve \
        --host 0.0.0.0 \
        --port 4000 \
        --config "_config_minimal.yml" \
        --livereload
fi
