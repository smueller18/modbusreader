#!/usr/bin/env bash

VERSION=$(python3 -c "from modbusreader import __version__; print(__version__)")

if [ -f MANIFEST ]; then
    echo "removing manifest file"
    rm MANIFEST
fi

echo "uploading package."
python3 setup.py sdist
twine upload dist/*-$VERSION.tar.gz

echo "creating tag $VERSION"
git tag $VERSION

echo "pushing tag"
git push ${REMOTE:-origin} $VERSION