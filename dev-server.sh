#!/bin/bash

# Development server script for Jekyll in WSL2 Debian
export BUNDLE_GEMFILE=/tmp/empty_gemfile
echo '# Empty gemfile' > /tmp/empty_gemfile

echo "Starting Jekyll development server..."
echo "Site will be available at: http://localhost:4000/diatonic-ai-prompts"
echo "Press Ctrl+C to stop the server"
echo ""

# Use the original config but with minimal plugins
/usr/bin/jekyll serve \
  --host 0.0.0.0 \
  --port 4000 \
  --baseurl "/diatonic-ai-prompts" \
  --livereload \
  --incremental
