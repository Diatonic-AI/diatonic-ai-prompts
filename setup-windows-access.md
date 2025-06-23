# Windows Access Setup for Jekyll Development Server

## Quick Fix Options:

### Option 1: Try the WSL2 IP directly
Open your Windows browser and go to:
```
http://172.22.178.90:4000/diatonic-ai-prompts/
```

### Option 2: Set up Windows port forwarding
Run this in Windows PowerShell as Administrator:
```powershell
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=4000 connectaddress=172.22.178.90 connectport=4000
```

Then access via: http://localhost:4000/diatonic-ai-prompts/

### Option 3: Use the improved Docker script
```bash
./docker-dev-windows.sh
```

## To remove port forwarding later:
```powershell
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=4000
```

## Alternative: VS Code Remote Development
1. Install "Remote - WSL" extension in VS Code
2. Open WSL2 folder in VS Code
3. Use the integrated terminal and browser preview
