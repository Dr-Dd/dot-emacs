;;; package --- Summary
;;; Commentary:
;;; Initialization for my erc config via local ZNC bouncer
;;; Code:

(require 'secrets)

(use-package erc
  :defer t
  :init
  (with-eval-after-load 'evil
    (evil-set-initial-state 'erc-mode 'emacs))
  :config
  (global-set-key (kbd "C-c i") 'erc-switch-to-buffer))

(use-package erc-hl-nicks :ensure t
  :defer t
  :after (erc))

(defvar my/znc-user "drd-admin"
  "User that can access to the ZNC server")

(defvar my/znc-networks-list '("oftc" "libera")
  "The list of network to which `my/connect-to-znc-networks' connects to.
It MUST BE SYNCHRONIZED TO the ZNC USER NETWORK LIST (same aliases).")

(defun my/connect-to-znc-networks (ZNC-HOST ZNC-PORT)
  "Connect to the ZNC bouncer, which then connects to irc networks specified.
The list of specified networks is `my/znc-networks-list'.

The network has to be specified in the `:password' prop when erc gets called:

(erc :server ZNC-HOST :port ZNC-PORT :nick ZNC-USER
     :password \"ZNC-USER/<znc-network-name>:<znc-user-pwd>\")

The password is safely retrieved via `auth-sources', which consequently should
contain the following line:

machine ZNC-HOST login ZNC-USER password <znc-usr-pwd> port ZNC-PORT

Note: an important aspect to grasp is that ZNC has to
authenticate the user on the specified network in some way,
either using perform or nickserv. The best way being through
SASL (enable the ZNC module to use it, for each user network), so be sure to
properly setup a SASL secret for each of your networks from the webconfig"
  (dolist (servname my/znc-networks-list)
    (erc :server ZNC-HOST :port ZNC-PORT :nick my/znc-user
         :password (concat my/znc-user "/" servname ":"
                           (secrets-get-secret "gen-1" "Local ZNC Admin")))))

(defun my/erc-start-default ()
  "Start default connection with erc."
  (interactive)
  (my/connect-to-znc-networks "127.0.0.1" 1717))

(provide 'init-erc)
;;; init-erc.el ends here
