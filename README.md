# zsh-autosuggestions-abbreviations-strategy

Have [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) suggest your [zsh-abbr](https://github.com/olets/zsh-abbr) abbreviations.

## Installation

### Package

#### Homebrew

zsh-autosuggestions-abbreviations-strategy is available on Homebrew. Run

```shell:no-line-numbers
brew install olets/tap/zsh-autosuggestions-abbreviations-strategy
```

and follow the post-install instructions logged to the terminal.

#### Linux package repositories

If you know of a community member-create Linux package, please make a pull request to update this page!

### Plugin

You can install zsh-autosuggestions-abbreviations-strategy with a zsh plugin manager. Each has their own way of doing things. Read your package manager's documentation or the [zsh plugin manager plugin installation procedures gist](https://gist.github.com/olets/06009589d7887617e061481e22cf5a4a); Fig users can install zsh-autosuggestions-abbreviations-strategy from [its page in the Fig plugin directory](https://fig.io/plugins/other/zsh-autosuggestions-abbreviations-strategy_olets)

After adding the plugin to the manager, it will be available in all new terminals. To use it in an already-open terminal, restart zsh in that terminal:

```shell:no-line-numbers
exec zsh
```

### Manual

- Either download the archive of the release of your choice from <https://github.com/olets/zsh-autosuggestions-abbreviations-strategy/releases> and expand it (ensures you have the latest official release)
- or clone a single branch:
    ```shell:no-line-numbers
    git clone https://github.com/olets/zsh-autosuggestions-abbreviations-strategy --single-branch --branch main --depth 1
    ```

Then add `source path/to/zsh-autosuggestions-abbreviations-strategy.zsh` to your `.zshrc` (replace `path/to/` with the real path), and restart zsh:

```shell:no-line-numbers
exec zsh
```

## Usage

1. Install `zsh-autosuggestions`
1. Install `zsh-autosuggestions-abbreviations-strategy`
1. Configure `zsh-autosuggestions`'s `ZSH_AUTOSUGGEST_STRATEGY`. Do one of:
    - **Recommended**. To suggest abbrevations _before_ `zsh-autosuggestions`'s default suggestions, append `abbreviations`:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviations-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )
        ```
    - **Recommended**. To suggest abbreviations along with other things, in the order of your choosing. _I recommed putting `abbreviations` first_. For example:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviations-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations strategy1 strategy2 )
        ```
        where the `strategy*` strategies are the strategies shipped with `zsh-autosuggestions` or provided by some other plugin you use.
    - To suggest abbreviations _after_ `zsh-autosuggestions`'s default suggestions, append `abbreviations`:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviations-strategy
        ZSH_AUTOSUGGEST_STRATEGY+=( abbreviations )
        ```
    - To only suggest abbreviations:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviations-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations )
        ```

## Limitations

Matches in command position; global abbreviations are only matched in command position.

## Exported values

`ZSH_AUTOSUGGESTIONS_ABBREVIATIONS_STRATEGY_VERSION` is the `zsh-autosuggestions-abbreviations-strategy` version number.

## License

zsh-autosuggestions-abbreviations-strategy is licensed under MIT license. For the full text of the license, see the LICENSE file.

<a href="https://github.com/olets/zsh-autosuggestions-abbreviations-strategy">zsh-autosuggestions-abbreviations-strategy</a> by <a href="https://github.com/olets">Henry Bley-Vroman</a> is released under the [MIT license](LICENSE).

## Acknowledgments

zsh-autosuggestions-abbreviations-strategy builds off [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
