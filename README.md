# dot-emacs

*Light mode*                                                                                                | *Dark Mode*
:----------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------:
![](https://user-images.githubusercontent.com/37450282/125799534-1d0e9d6d-8b98-4fab-8fda-ed690fb0bd4c.png)  |  ![](https://user-images.githubusercontent.com/37450282/125799630-24752e22-4f55-40f4-9af7-2838977d9c00.png)


My Emacs configuration for all things related to text.

With it I'm able to:
- **>_** Work with source files (via **lsp-mode** or language specific configurations)
- :unicorn: Handle my agenda (via **org-mode**)
- :moneybag: Review my assets balance (via **ledger-mode**)
- :computer: Read messages from IRC (via **erc-mode**)
- :mailbox: Read and compose email (via **notmuch**)
- :newspaper: Read and archive news, watch videos, listen to podcasts (via **elfeed**)

All wrapped in **evil mode** bindings.

All of this in about **0.8 seconds** of startup in daemon mode and **1.2 seconds** in normal mode.

All **emacs daemon** and **terminal emacs** (*emacs-nox*) **compatible**.

## Installation
Just clone the package wherever you want, and move the ``.emacs.d`` directory to your ``$HOME``

```
$ git clone https://github.com/Dr-Dd/dot-emacs /tmp/dot-emacs
$ cd /tmp/dot-emacs
$ mv .emacs.d $HOME
```

## Higlight of important packages
*Warning, this list may or may not be updated in the future:*
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
- lsp-mode
- haskell-mode
- erc
- ledger-mode
- dashboard
- doom-themes
- beacon

## Emacsen-ism level
I heavily rely non-Emacsen packages to better integrate Emacs in my system. Only daemons are external, everything that needs active involvement is handled in-Emacs.

Examples:
- Using **erc** as a client, but leaving all communication responsibilities to **znc**.
- Using **ledger-mode** to edit ledger files, but using **ledger-cli** to compile those files.
- Handling emails via Emacs as a **notmuch** client, but processing them via a combination of **isync**, **msmtp**, **notmuch**, **gnupg**.
- Reading news via **elfeed**, but fetching those news through local and remote rss services (e.g. **rss-bridge**). Watch videos and listen podcasts via **mpv** and **youtube-dl**, but launching as an Emacs' child process.
