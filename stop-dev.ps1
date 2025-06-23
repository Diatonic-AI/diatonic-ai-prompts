#!/usr/bin/env pwsh

# Diatonic AI Prompts - Stop Development Server
Write-Host "🛑 Stopping Diatonic AI Prompts Development Server" -ForegroundColor Red
Write-Host "==================================================" -ForegroundColor Red
Write-Host ""

# Stop and remove containers
Write-Host "🧹 Stopping containers..." -ForegroundColor Yellow
docker-compose down

# Optional: Remove volumes (uncomment if you want to clear everything)
# Write-Host "🗑️  Removing volumes..." -ForegroundColor Yellow
# docker-compose down -v

# Show status
Write-Host ""
Write-Host "📊 Current Docker status:" -ForegroundColor Cyan
docker ps -a --filter "name=diatonic-ai-prompts" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host ""
Write-Host "✅ Development server stopped successfully!" -ForegroundColor Green
