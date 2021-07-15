# dot-emacs

My emacs configuration for all things related to text.

With it i'm able to:
- Work with source files (via **lsp-mode** or language specific configurations **>_**)
- Handle my agenda (via **org-mode** :unicorn:)
- Review my assets balance (via **ledger-mode** :moneybag:)
- Read messages from IRC (via **erc-mode** :computer:)
- Read and compose email (via **notmuch** :mailbox:)
- Read and archive news (via **elfeed** :newspaper:)

All wrapped in evil mode bindings

All of this in about 1.5 seconds of startup

## Higlight of important packages
- benchmark-init
- eshell
- eyebrowse
- magit
- ggtags
- flycheck
- diminish
- org-mode
- undo-tree
- evil-mode
- company-mode
- all-the-icons
- doom-modeline
- ace-window
- aggressive-indent
- highlight-indent
- notmuch
- elfeed
- yasnippet
- helm
- projectile
- lsp
- haskell
- erc
- ledger
- dashboard
- doom-themes
- beacon

## Emacsen-ism level
I heavily rely non-Emacsen packages to better integrate Emacs in my system. Only daemons are external, everything that needs active involvement is handled in-Emacs.

Examples:
- Using **erc** as a client, but leaving all communication responsibilities to **znc**.
- Using **ledger-mode** to edit ledger files, but using **ledger-cli** to compile those files.
- Handling emails via Emacs as a **notmuch** client, but processing them via a combination of **isync**, **msmtp**, **notmuch**, **gnupg**
- Reading news via **elfeed**, but fetching those news through local and remote rss services (e.g. **rss-bridge**)
