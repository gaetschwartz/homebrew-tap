# homebrew-tap

Homebrew tap for [Purr](https://github.com/gaetschwartz/purr). Everything under `Formula/` and
`Casks/` is generated and pushed by Purr's release workflow; do not edit it by hand.

```bash
brew tap gaetschwartz/tap
```

| Install | What you get | Platforms | Channel |
| --- | --- | --- | --- |
| `brew install gaetschwartz/tap/purr` | `purr` command-line tool | macOS Apple Silicon, Linux x86-64 | latest release |
| `brew install --cask gaetschwartz/tap/purr-app` | Purr desktop app, plus the command-line tool | macOS Apple Silicon | latest release |
| `brew install gaetschwartz/tap/purr-canary` | `purr` command-line tool | macOS Apple Silicon, Linux x86-64 | latest canary |
| `brew install --cask gaetschwartz/tap/purr-app-canary` | Purr desktop app, plus the command-line tool | macOS Apple Silicon | latest canary |

The stable and canary packages conflict with each other, so install one channel at a time. Canaries
move forward with `brew upgrade`.

- **macOS:** the desktop app is not notarized; the cask removes the quarantine flag on install.
- **Linux:** the formula installs the `all` build (CUDA, Vulkan and CPU in one binary, about 500 MB
  because it bundles the CUDA libraries). It uses an NVIDIA GPU when the NVIDIA driver is installed,
  otherwise Vulkan, otherwise the CPU. It needs an x86-64 CPU with AVX2 and a recent glibc.

## Publishing

Purr's release workflow pushes to this repository over SSH with a write deploy key that exists only on
this repository (stored as the `PURR_TAP_DEPLOY_KEY` secret in the Purr repository). The key cannot
touch any other repository, and revoking it (Settings, Deploy keys) stops publishing immediately.
