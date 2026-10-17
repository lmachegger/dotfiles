# Linux dotfiles

This repository stores personal configuration files and uses [GNU Stow](https://www.gnu.org/software/stow/) to link them into your home directory.

Currently it contains only configuration of Omarchy.

## How Stow works

Each directory directly inside the repository is a package. Paths inside a package mirror their destination under your home directory. For example:

```text
omarchy/.config/hypr/bindings.lua
```

becomes `~/.config/hypr/bindings.lua` when you run:

```sh
cd ~/dotfiles
stow -t "$HOME" omarchy
```

Here, `-t "$HOME"` sets your home directory as Stow's target, and `omarchy` is the package directory to link.

Stow creates symlinks, so editing a linked config edits the file in this repository too.

## Add or change a config

1. Put the file in the package using its path relative to your home directory. For example, add `~/.config/foot/foot.ini` as `omarchy/.config/foot/foot.ini`.
2. If the target file already exists, back it up and move it out of the way before stowing. Preview for conflicts first:

   ```sh
   stow --no -v -t "$HOME" omarchy
   ```

   `--no` previews the operation without changing anything; `-v` prints what Stow would do. `-t "$HOME"` sets the target, and `omarchy` names the package.
3. Apply or refresh the links:

   ```sh
   stow -R -v -t "$HOME" omarchy
   ```

   `-R` restows the package, updating its links to match the package contents; `-v`, `-t`, and `omarchy` have the meanings above.
4. Save the change in Git:

   ```sh
   git add -p
   git commit -m "Update dotfiles"
   git push
   ```

To stop managing the package’s links, run `stow -D -t "$HOME" omarchy`. `-D` deletes the package's Stow-created links from the target; it does not delete the files in the repository. `-t "$HOME"` selects the target, and `omarchy` selects the package.

Only add reviewed configuration files. Keep secrets, credentials, caches, and generated application state out of Git. For Omarchy, prefer user configuration under `~/.config`; avoid editing package-managed files under `/usr/share/omarchy`.

