# Campfire-Red Tap

[Campfire](https://campfire.red) for Homebrew: the desktop app as a cask, the
connector for hosting your own as a formula.

## How do I install these?

```sh
brew install --cask campfire-red/tap/campfire   # the app, Apple Silicon, macOS 15+
brew install campfire-red/tap/campfire-server   # the connector
```

Or `brew tap campfire-red/tap` and then `brew install --cask campfire` or
`brew install campfire-server`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "campfire-red/tap"
cask "campfire"
brew "campfire-server"
```

`brew services start campfire-server` runs the connector on port 3210 with no
config; [DEPLOY.md](https://github.com/Campfire-Red/Campfire/blob/main/DEPLOY.md)
covers the rest.

## Status

Campfire's repository is still private. The cask installs for nobody yet,
since Homebrew cannot download a private repository's release assets; the
formula only for someone whose git can clone the repository. Until it is
public, `autobump.yml` waits for the repository variable `CAMPFIRE_PUBLIC=true`
and a release is bumped here by hand.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
