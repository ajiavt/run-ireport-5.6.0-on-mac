# iReport Designer 5.6.0

iReport 5.6.0 running on Java 7 in Docker with optimized display settings for macOS XQuartz.

## Supported versions

* 5.6.0 (current implementation)

## System Requirements

- **Base System**: Ubuntu 14.04 (for OpenJDK 7 compatibility)
- **Java Version**: OpenJDK 7 (required for iReport 5.6.0)
- **macOS**: Docker Desktop + XQuartz

## Getting Started

Follow these steps to set up and run iReport 5.6.0:

### Step 1: Install and Configure XQuartz
1. Install XQuartz from https://www.xquartz.org/
2. Open XQuartz and go to **Preferences** → **Security**
3. Enable: "Allow connections from network clients"
4. **Optional but recommended:** Go to **Preferences** → **Output**
   - Uncheck "Enable Retina display support" if available
   - Set "Colors" to 256 or Thousands (instead of Millions)
5. Restart XQuartz after making changes

### Step 2: Build Docker Image
```bash
chmod +x build.sh
./build.sh
```

### Step 3: Run iReport
```bash
chmod +x run.sh
./run.sh
```

That's it! iReport 5.6.0 will open and you can start working with your reports. For best results:
- **Open files from:** Navigate to `/root/reports` directory when opening .jrxml files
- **Compile reports to:** Use `/root/reports` as your compilation target directory

Your reports and compiled files (.jasper) will be accessible in the `reports/` folder in your project directory.

## Manual Run
If you prefer to run manually:

```bash
# Allow X11 forwarding
xhost + 127.0.0.1

# Run the container
docker run \
    --rm \
    --env DISPLAY=host.docker.internal:0 \
    --env QT_X11_NO_MITSHM=1 \
    --env NO_AT_BRIDGE=1 \
    --env LIBGL_ALWAYS_INDIRECT=1 \
    --env JAVA_TOOL_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true" \
    --hostname ireport \
    --volume "${PWD}/reports:/root/reports" \
    ireport:5.6.0

# Clean up
xhost - 127.0.0.1
```

## Features

- **Java 7 Support**: Built with OpenJDK 7 for optimal compatibility with iReport 5.6.0
- **X11 Display Optimization**: Configured for smooth operation with XQuartz on macOS
- **Font Rendering**: Anti-aliasing enabled for better text display
- **Volume Mapping**: Your reports directory is automatically mapped to the container
- **Easy Setup**: Simple build and run scripts included

## Troubleshooting

### Display Issues
- Ensure XQuartz is running and configured properly
- Try disabling Retina display support in XQuartz preferences
- Restart XQuartz after configuration changes

### Permission Issues
- Make sure build.sh and run.sh are executable: `chmod +x build.sh run.sh`
- Check Docker permissions and ensure Docker Desktop is running

### Java Issues
- The container uses OpenJDK 7 which is required for iReport 5.6.0 compatibility
- Display-related Java options are pre-configured for optimal performance

## Requirements

- macOS with Docker Desktop
- XQuartz X11 server
- At least 2GB free disk space for the Docker image

## License

MIT License - see LICENSE file for details.
