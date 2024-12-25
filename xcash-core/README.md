docker buildx create --name multiarch-builder --use
docker buildx inspect --bootstrap

docker buildx build --platform linux/amd64,linux/arm64 \
  -t xcashtech/xcash-core:latest \
  --push .
