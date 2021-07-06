;;; package --- Summary
;;; Commentary:
;;; Initialization for my erc config via local ZNC bouncer
;;; Code:


(defun my/get-authinfo-passwd (HOST USER PORT)
  "Safely get an `auth-sources' USER password.
The search matches a line in the following format:

machine HOST login USER password *** port PORT"
  (funcall (plist-get (nth 0 (auth-source-search :host HOST :user USER :port PORT)) :secret)))

(defvar my/znc-networks-list '(("drd" . ("libera" "oftc")))
  "The list of network to which `my/connect-to-znc-networks' connects to.
It MUST BE SYNCHRONIZED to the ZNC user network list (same aliases).

An alist of the form:

((\"<znc-user-1>\" . (\"<znc-network-name-1>\"
                    \"<znc-network-name-2>\"
                  ...))
 (\"<znc-user-2>\" . (\"<znc-network-name-3>\"
                    \"<znc-network-name-4>\"
                  ...))
 ...)")

(defun my/connect-to-znc-networks (ZNC-HOST ZNC-PORT ZNC-USER)
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
SASL (enable the ZNC module to use it), so be sure to properly
setup a SASL secret for each of your networks"
  (dolist (network (cdr (assoc ZNC-USER my/znc-networks-list)))
    (erc :server ZNC-HOST :port ZNC-PORT :nick ZNC-USER
         :password (concat ZNC-USER "/" network ":"
                           (my/get-authinfo-passwd ZNC-HOST ZNC-USER ZNC-PORT)))))


(provide 'init-erc)
;;; init-erc.el ends here
