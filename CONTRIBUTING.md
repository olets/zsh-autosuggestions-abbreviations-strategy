# Contributing

Thanks for your interest. Contributions are welcome!

> Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

Check the [Issues](https://github.com/olets/zsh-autosuggestions-abbreviations-strategy/issues) to see if your topic has been discussed before or if it is being worked on. You may also want to check the roadmap (see above). Discussing in an Issue before opening a Pull Request means future contributors only have to search in one place.

## Maintainers

### Release workflow

1. Checkout the branch `main`
1. Update all instances of the version number in `zsh-autosuggestions-abbreviations-strategy.zsh`
1. Update all instances of the release date in `zsh-autosuggestions-abbreviations-strategy.zsh`
1. Update the year in the copyright line in `zsh-autosuggestions-abbreviations-strategy.zsh` if applicable.
1. Run `bin/changelog`
1. Update the first line of `CHANGELOG.md`: add the new version number twice:
    ```
    # [<HERE>](…vPrevious...v<AND HERE>) (…)
    ```
1. Commit `CHANGELOG.md` and `zsh-autosuggestions-abbreviations-strategy.zsh`
    ```shell
    git commit -i CHANGELOG.md zsh-autosuggestions-abbreviations-strategy.zsh -m "feat(release): bump to %ABBR_CURSOR%, update changelog"
    ```
1. Create a signed commit with the version number, prefixed with `v`.
    ```shell
    git tag -s %ABBR_CURSOR% -m %ABBR_CURSOR%
    ```
1. Push the branch and the tag
    ```shell
    git push && git push --tags
    ```
