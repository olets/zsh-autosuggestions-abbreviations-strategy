# zsh-autosuggestions-abbreviation-strategy

Have [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) suggest your [zsh-abbr](https://github.com/olets/zsh-abbr) abbreviations.

## Usage

1. Install `zsh-autosuggestions`
1. Install `zsh-autosuggestions-abbreviation-strategy`
1. Configure `zsh-autosuggestions`'s `ZSH_AUTOSUGGEST_STRATEGY`. Do one of:
    - To suggest abbreviations _after_ `zsh-autosuggestions`'s default suggestions, append `abbreviations`:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviation-strategy
        ZSH_AUTOSUGGEST_STRATEGY+=( abbreviations )
        ```
    - To suggest abbrevations _before_ `zsh-autosuggestions`'s default suggestions, append `abbreviations`:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviation-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations $ZSH_AUTOSUGGEST_STRATEGY )
        ```
    - To only suggest abbreviations:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviation-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( abbreviations )
        ```
    - To suggest abbreviations along with other things, in the order of your choosing, do something like:
        ```shell
        # .zshrc
        
        # load zsh-abbr
        # load zsh-autosuggestions
        # load zsh-autosuggestions-abbreviation-strategy
        ZSH_AUTOSUGGEST_STRATEGY=( strategy1 strategy2 abbreviations strategy3 )
        ```
        where the `strategy*` strategies are the strategies shipped with `zsh-autosuggestions` or provided by some other plugin you use.

## Exported values

`ZSH_AUTOSUGGESTIONS_ABBREVIATIONS_STRATEGY_VERSION` is the `zsh-autosuggestions-abbreviation-strategy` version number.

## License

zsh-autosuggestions-abbreviation-strategy is licensed under MIT license. For the full text of the license, see the LICENSE file.

<a href="https://github.com/olets/zsh-autosuggestions-abbreviation-strategy">zsh-autosuggestions-abbreviation-strategy</a> by <a href="https://github.com/olets">Henry Bley-Vroman</a> is released under the [MIT license](LICENSE).

## Acknowledgments

zsh-autosuggestions-abbreviation-strategy builds off [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
