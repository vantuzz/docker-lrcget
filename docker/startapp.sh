#!/usr/bin/env sh
set -e

# Set home directory to /config for persistent configuration
export HOME=/config
export XDG_CONFIG_HOME=/config/.config
export XDG_DATA_HOME=/config/.local/share
export XDG_CACHE_HOME=/config/.cache

# Create necessary directories
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_CACHE_HOME"

# Set up PulseAudio for audio support
if [ ! -f /tmp/.X11-unix/X0 ]; then
    echo "Waiting for X11 to start..."
    sleep 2
fi

# Start PulseAudio in daemon mode if not already running
if ! pulseaudio --check 2>/dev/null; then
    echo "Starting PulseAudio..."
    pulseaudio --start --exit-idle-time=-1 2>/dev/null || true
fi

# Set AppImage extract and run mode
export APPIMAGE_EXTRACT_AND_RUN=1

# Launch LRCGET
echo "Starting LRCGET..."

# Run the application
exec /usr/local/bin/lrcget "$@"
