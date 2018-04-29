<p align="center">
  <a href="https://hub.docker.com/r/gtramontina/live-server/tags/"><img height="20" alt="Docker Tags" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20tags&colorB=066da5&query=$.count&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Flive-server%2Ftags"></a>
  <a href="https://hub.docker.com/r/gtramontina/live-server/tags/"><img height="20" alt="Docker Latest Tag" src="https://img.shields.io/badge/dynamic/json.svg?style=for-the-badge&label=%F0%9F%90%B3%20latest%20tag&colorB=066da5&query=$.results[0].name&uri=https%3A%2F%2Fhub.docker.com%2Fv2%2Frepositories%2Fgtramontina%2Flive-server%2Ftags"></a>
  <a href="https://travis-ci.org/gtramontina/docker-live-server"><img height="20" alt="Travis" src="https://img.shields.io/travis/gtramontina/docker-live-server.svg?style=for-the-badge"></a>
</p>

<p align="center">
  Docker image for <a href="https://github.com/ta/live-server"><code>live-server</code></a>
</p>

---

#### _Running:_

```sh
$ docker run --rm gtramontina/live-server:<version>
```

You'll get a `/app` work directory, so all you need to do is mount your project in the that directory with the `-v, --volume` docker parameter:

```sh
--volume $(pwd):/app:ro
```

---

#### _Developing:_

```sh
$ make build    # Builds a new image
$ make test     # Runs/tests the image
$ make push     # Pushes the image up
$ make clean    # Removes any generated artifacts
$ make clobber  # Removes artifacts and generated images
```

---

<p align="right">🐳</p>
