docker buildx build --platform linux/amd64 -t xcashtech/xcash-core:amd64 --load --no-cache . && \
docker buildx build --platform linux/arm64 --provenance false -t xcashtech/xcash-core:arm64 --no-cache . && \
\
docker manifest create xcashtech/xcash-core:latest \
  xcashtech/xcash-core:arm64 \
  xcashtech/xcash-core:amd64 &&
\
docker manifest push xcashtech/xcash-core:latest \
docker push xcashtech/xcash-core:latest
