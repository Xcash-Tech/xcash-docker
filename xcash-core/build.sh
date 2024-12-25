docker buildx build --platform linux/amd64 -t xcashtech/xcash-core:amd64 --load .
docker buildx build --platform linux/arm64 --provenance false -t xcashtech/xcash-core:arm64  .

docker manifest create xcashtech/xcash-core:latest \
  xcashtech/xcash-core:arm64 \
  xcashtech/xcash-core:amd64

docker manifest push xcashtech/xcash-core:latest
