docker buildx build --platform linux/amd64,linux/arm64 \
  -t xcashtech/xcash-dpops:latest \
  --push .
