# docker-lolcow

Tiny teaching repo: build a Docker image that prints a colorful, funny cow quote when the container starts.

## What this repo contains

- `Dockerfile` - simple image based on Ubuntu
- `entrypoint.sh` - runs `fortune | cowsay | lolcat`
- `.github/workflows/docker-publish.yml` - GitHub Actions workflow that builds the image and pushes it to GHCR on `main`

## Run locally

```bash
docker build -t docker-lolcow .
docker run --rm docker-lolcow
```

You should see a random fortune rendered by `cowsay` with colors from `lolcat`.

## GitHub Actions + GHCR

The workflow does this:

1. Builds image for pull requests (build-only, no push)
2. On pushes to `main`, logs in to `ghcr.io`
3. Pushes image tags to `ghcr.io/<owner>/<repo>`

Example image path for this repo:

```text
ghcr.io/fbnrst/docker-lolcow
```

## Pull image from GHCR

```bash
docker pull ghcr.io/fbnrst/docker-lolcow:latest
docker run --rm ghcr.io/fbnrst/docker-lolcow:latest
```
