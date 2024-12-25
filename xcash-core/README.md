
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes


docker buildx create --name multiarch-builder --use
docker buildx inspect --bootstrap


# Final solution
https://stackoverflow.com/questions/75521775/buildx-docker-image-claims-to-be-a-manifest-list

-------------------------------


docker buildx build --platform linux/amd64 -t xcashtech/xcash-core:amd64 --load .


docker buildx build --platform linux/arm64 --provenance false -t xcashtech/xcash-core:arm64  .

???
#docker push xcashtech/xcash-core:arm64
#docker push xcashtech/xcash-core:amd64


docker manifest create xcashtech/xcash-core:latest \
  xcashtech/xcash-core:arm64 \
  xcashtech/xcash-core:amd64


docker manifest push xcashtech/xcash-core:latest








