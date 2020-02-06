# Couchbase Antora Preview [![TravisCI](https://travis-ci.org/spjmurray/couchbase-antora-preview.png)](https://travis-ci.org/spjmurray/couchbase-antora-preview)

Simple container which automates the installation of Antora, compilation of Couchbase documentation for a single repository and display via a web server.

## Quick Start

Checkout your source code and then change into the top-level directory.

A typical execution of the container will look like the following, the container image is in docker hub so will just work without having to build the container manually:

```shell
$ docker run --rm -ti \
  --publish 8080:80 \
  --mount type=bind,source=${PWD},target=/src,readonly \
  spjmurray/couchbase-antora-preview:1.2.0 \
  --repo url=/src,branches=$(git rev-parse HEAD),start_path=docs/user
```

## Arguments

### Docker Arguments

#### `--rm`

Removes the container once execution has terminated.

#### `-ti`

Allocate a pseudo terminal and allow input.
This field is required to provide an interactive session.

#### `--publish 8080:80`

Bind unprivileged port 8080 on the host system to port 80 on the container.
By default the static content will be generated with this port.
If you wish to use a different host port please specify the [`--port`](#--port-8080) argument to the container entry point.
This argument is required to expose the HTTP service.

#### `--mount type=bind,source=${PWD},target=/src,readonly`

Mounts your AsciiDoc repository in the container.
This must be a Git repository containing at least one Antora module.
Mount targets can be placed where you like and will be refered to by the [`--repo`](#--repo-urlsrcbranchesgit-rev-parse-headstart_pathdocsuser) argument of the container.

#### `spjmurray/couchbase-antora-preview:1.2.0`

This is the name of the container image to use.
Pre-built images are avaialble on [Docker Hub](https://hub.docker.com/r/spjmurray/couchbase-antora-preview/).

### Container Arguments

#### `--port 8080`

The host port mapping to the container web server.
This arument must be the same as that defined in the [`--publish`](#--publish-808080) argument.
This argument is optional and defaults to 8080.

#### `--repo url=/src,branches=$(git rev-parse HEAD),start_path=docs/user`

This argument is passed to the container entry point.
This specifies a repository to be added to the Antora playbook.

The `url` parameter is required and specifies the path to a mounted git repository or a reference to github.
This must match the mount target specified in the [`--mount`](#--mount-typebindsourcepwdtargetsrcreadonly) argument.

The `branches` parameter is optional and specifies which branches, tags or hash references to use for document generation.

The `start_path` parameter is used to select the path within the repository to find the `antora.yml` module configuration. 
For further details please consult the [Antora documentation](https://docs.antora.org/antora/1.1/playbook/configure-content-sources/).

## Contributing

Pull requests are welcomed, as are issues via github.

### Build Pre-requisites

Ensure the following commands are installed and in your path:

* make
* docker

### Creating the container image

Simply (for Richard Smedley), run the following:

```shell
$ make
```
