#!/usr/bin/env pwsh

# Diatonic AI Prompts - Production Build
Write-Host "🏭 Building Diatonic AI Prompts for Production" -ForegroundColor Magenta
Write-Host "=============================================" -ForegroundColor Magenta
Write-Host ""

# Check if Docker is running
try {
    docker version | Out-Null
} catch {
    Write-Host "❌ Docker is not running or not installed!" -ForegroundColor Red
    Write-Host "Please start Docker Desktop and try again." -ForegroundColor Yellow
    exit 1
}

# Stop any existing containers
Write-Host "🧹 Stopping development containers..." -ForegroundColor Yellow
docker-compose down 2>$null

# Build for production
Write-Host "🏗️  Building production site..." -ForegroundColor Cyan
Write-Host ""

try {
    docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
    
    Write-Host ""
    Write-Host "✅ Production build completed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 Your production site is running at:" -ForegroundColor Cyan
    Write-Host "   http://localhost/diatonic-ai-prompts/" -ForegroundColor White
    Write-Host ""
    Write-Host "🔧 To stop the production server, run:" -ForegroundColor Yellow
    Write-Host "   docker-compose -f docker-compose.yml -f docker-compose.prod.yml down" -ForegroundColor White
    
} catch {
    Write-Host "❌ Failed to build production site!" -ForegroundColor Red
    Write-Host "Check the error messages above for details." -ForegroundColor Yellow
    exit 1
}
