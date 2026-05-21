# docker-lolcow

Tiny teaching repo: run a Docker image that prints a colorful, funny cow quote when the container starts.

## Repository structure

- `Dockerfile` - minimal runtime image based on Ubuntu 24.04 with `fortune`, `cowsay`, and `lolcat`.
- `.github/workflows/docker-publish.yml` - CI workflow that:
  - builds on pull requests (build only)
  - builds and publishes to GHCR on `main`
- `.pre-commit-config.yaml` - basic formatting/safety hooks for contributions.

## Run from GHCR (recommended)

Published image path:

```text
ghcr.io/fbnrst/docker-lolcow
```

Run:

```bash
docker run --rm ghcr.io/fbnrst/docker-lolcow:latest
```

Docker will pull the image automatically if it is not present locally.
You should see a random fortune rendered by `cowsay` with colors from `lolcat`.

If GHCR access fails with a permission error:

1. Ensure package visibility is **Public** in GitHub Packages (`fbnrst/docker-lolcow` package settings).
2. If the package is private, authenticate Docker with a token that has `read:packages`:

```bash
echo <YOUR_GITHUB_TOKEN_WITH_read:packages> | docker login ghcr.io -u <github-username> --password-stdin
docker pull ghcr.io/fbnrst/docker-lolcow:latest
docker run --rm ghcr.io/fbnrst/docker-lolcow:latest
```

## GitHub Actions + GHCR publishing

The workflow does this:

1. Builds image for pull requests (build-only, no push)
2. On pushes to `main`, logs in to `ghcr.io`
3. Pushes image tags to `ghcr.io/<owner>/<repo>`

## Local build (optional)

```bash
docker build -t docker-lolcow .
docker run --rm docker-lolcow
```
