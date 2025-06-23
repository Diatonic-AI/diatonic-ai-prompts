# 🐳 Docker Development Setup for Diatonic AI Prompts

This repository includes a complete Docker Compose setup for developing the Jekyll-based Diatonic AI Prompts website on Windows.

## 🚀 Quick Start

### Prerequisites
- [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
- PowerShell 7+ (recommended)

### Start Development Server
```powershell
# Option 1: Use PowerShell script (recommended)
.\start-dev.ps1

# Option 2: Use Docker Compose directly
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up
```

Your site will be available at:
- **Local**: http://localhost:4000/diatonic-ai-prompts/
- **LiveReload**: Automatically enabled on port 35729

### Stop Development Server
```powershell
# Option 1: Use PowerShell script
.\stop-dev.ps1

# Option 2: Use Docker Compose directly
docker-compose down
```

## 📁 Docker Files Overview

| File | Purpose |
|------|---------|
| `docker-compose.yml` | Base configuration for Jekyll development |
| `docker-compose.dev.yml` | Development-specific overrides (debug, verbose logging) |
| `docker-compose.prod.yml` | Production build configuration |
| `start-dev.ps1` | PowerShell script to start development server |
| `stop-dev.ps1` | PowerShell script to stop development server |
| `build-prod.ps1` | PowerShell script to build for production |

## 🔧 Development Features

- **Live Reload**: Automatic page refresh when files change
- **Incremental Builds**: Faster rebuilds by only processing changed files
- **Force Polling**: Windows-compatible file watching
- **Volume Caching**: Faster container startup with cached dependencies
- **Debug Logging**: Verbose output for troubleshooting

## 🏭 Production Build

```powershell
# Build and serve production site
.\build-prod.ps1

# Access at http://localhost/diatonic-ai-prompts/
```

## 🛠️ Troubleshooting

### Common Issues

**1. Port Already in Use**
```powershell
# Check what's using port 4000
netstat -ano | findstr :4000

# Stop existing containers
docker-compose down
```

**2. Permission Issues**
```powershell
# Reset Docker volumes
docker-compose down -v
docker volume prune
```

**3. Slow Performance**
- Ensure Docker Desktop is allocated sufficient resources (CPU: 4+, Memory: 4GB+)
- Check that file sharing is enabled for your drive in Docker Desktop settings

### Docker Commands

```powershell
# View logs
docker-compose logs -f jekyll

# Access container shell
docker-compose exec jekyll bash

# Rebuild without cache
docker-compose build --no-cache

# Remove all containers and volumes
docker-compose down -v
docker system prune -f
```

## 📊 Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `JEKYLL_ENV` | `development` | Jekyll environment (development/production) |
| `BUNDLE_PATH` | `/usr/local/bundle` | Ruby gem installation path |
| `JEKYLL_LOG_LEVEL` | `debug` | Logging level for development |

## 🔍 Debugging Categories Issue

The current setup includes debug logging to help troubleshoot the categories sidebar issue:

1. Check Jekyll configuration: `docker-compose logs jekyll | grep -i category`
2. View generated site structure: `docker-compose exec jekyll ls -la /srv/jekyll/_site/`
3. Test Jekyll build: `docker-compose exec jekyll bundle exec jekyll doctor`

## 📝 Development Workflow

1. **Start Development**: Run `.\start-dev.ps1`
2. **Edit Files**: Make changes to `.md`, `.html`, or `.yml` files
3. **View Changes**: Browser automatically refreshes (LiveReload)
4. **Debug Issues**: Check Docker logs for error messages
5. **Stop Server**: Run `.\stop-dev.ps1` or Ctrl+C

## 🌐 Network Configuration

The Docker setup automatically configures networking for Windows access:
- Binds to all interfaces (`0.0.0.0`)
- Maps ports 4000 (Jekyll) and 35729 (LiveReload)
- Uses bridge networking for container communication

## 💡 Tips

- Use the PowerShell scripts for the best experience
- Keep Docker Desktop running while developing
- The `jekyll_bundle` volume persists Ruby gems between container restarts
- Changes to `_config.yml` require a container restart
- Draft posts are enabled in development mode

---

**Need help?** Check the Docker Desktop logs or container logs for detailed error messages.
