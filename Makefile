GITTAG=$(shell git describe --abbrev=0 --tags)
B=$(shell git rev-parse --abbrev-ref HEAD)
ref=$(subst /,-,$(B))

release_master:
	- docker buildx build --push --progress=plain --platform linux/amd64,linux/arm/v7,linux/arm64 -t ghcr.io/umputun/nginx-le:${ref} -t umputun/nginx-le:${ref} .

release_latest:
	- docker buildx build --push  --progress=plain --platform linux/amd64,linux/arm/v7,linux/arm64 \
 		-t ghcr.io/umputun/nginx-le:${GITTAG} -t ghcr.io/umputun/nginx-le:latest \
 		-t umputun/nginx-le:${GITTAG} -t umputun/nginx-le:latest .

.PHONY: release
