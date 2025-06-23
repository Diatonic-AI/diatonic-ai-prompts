#!/bin/bash

echo "Starting Jekyll development server with Docker..."
echo "Site will be available at: http://localhost:4000/diatonic-ai-prompts"
echo "Press Ctrl+C to stop the server"
echo ""

# Stop any existing container
docker stop jekyll-dev 2>/dev/null
docker rm jekyll-dev 2>/dev/null

# Start Jekyll with Docker using the official Jekyll image
docker run --name jekyll-dev \
  --rm \
  -p 4000:4000 \
  -v $(pwd):/srv/jekyll:Z \
  -it jekyll/jekyll:4.2.2 \
  jekyll serve --host 0.0.0.0 --livereload --incremental --force_polling
