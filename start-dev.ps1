#!/usr/bin/env pwsh

# Diatonic AI Prompts - Development Server Starter
Write-Host "🚀 Starting Diatonic AI Prompts Development Server" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
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
Write-Host "🧹 Cleaning up existing containers..." -ForegroundColor Yellow
docker-compose down 2>$null

# Start the development server
Write-Host "🔧 Starting development environment..." -ForegroundColor Cyan
Write-Host ""

try {
    docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build
} catch {
    Write-Host "❌ Failed to start development server!" -ForegroundColor Red
    Write-Host "Check the error messages above for details." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "✅ Development server stopped." -ForegroundColor Green
