#!/bin/bash

# Build iReport 5.6.0 Docker image
echo "Building iReport 5.6.0 Docker image..."
docker build -t ireport:5.6.0 .

echo "Build completed successfully!"
echo ""
echo "To run iReport 5.6.0, use:"
echo "./run.sh"
echo ""
echo "Or manually:"
echo "docker run --rm --env DISPLAY=host.docker.internal:0 --hostname ireport --volume \${PWD}/reports:/root/reports ireport:5.6.0"
