#!/bin/bash -ex

pushd "$(dirname $0)"
SWD=$(pwd)
BWD=$(dirname "$SWD")
popd

. $SWD/setenv.sh

for layer in centos-7; do
	docker build ${DOCKER_BUILD_ARGS[*]} ${LAST_LAYER_ARGS[*]} --rm -t "$REPO/$NAME-$layer:$VERSION" $layer

	dockerImages=$(docker images "$REPO/$NAME-$layer" -f "before=$REPO/$NAME-$layer:$VERSION" -q)
	[ -n "$dockerImages" ] && docker rmi -f $dockerImages || true
	LAST_LAYER_ARGS=( --build-arg LAST_LAYER=$layer )
done
