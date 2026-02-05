#!/bin/bash

# Build script for LRCGET Docker image
set -e

echo "Building LRCGET Docker image..."
echo "================================"

# Build the image
docker build -t lrcget:latest .

echo ""
echo "Build complete!"
echo ""
echo "To run the container:"
echo "  docker-compose up -d"
echo ""
echo "Or use docker run:"
echo "  docker run -d \\"
echo "    --name=lrcget \\"
echo "    -p 5800:5800 \\"
echo "    -e USER_ID=\$(id -u) \\"
echo "    -e GROUP_ID=\$(id -g) \\"
echo "    -v \$(pwd)/docker/config:/config:rw \\"
echo "    -v /path/to/music:/music:rw \\"
echo "    --device /dev/snd:/dev/snd \\"
echo "    --shm-size 2g \\"
echo "    lrcget:latest"
echo ""
echo "Access the application at: http://localhost:5800"
