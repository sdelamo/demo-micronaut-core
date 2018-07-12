if [[ -n $TRAVIS_TAG ]]; then
    version="$TRAVIS_TAG"
    version=${version:1}

    git clone https://${GH_TOKEN}@github.com/sdelamo/demo-static-website.git -b master static-website-master --single-branch > /dev/null
    cd static-website-master
    ./release $version

    git commit -a -m "Updating static website for Travis build: https://travis-ci.org/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID" && {
      git push origin HEAD || true
    }

    cd ..

    rm static-website-master
fi
