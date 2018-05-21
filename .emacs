;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(package-initialize)

;; Make emacs good -- EVIL customization
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Change cursor in EVIL insert mode
(setq-default evil-insert-state-cursor 'bar)

;; Theme stuff
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")

;; Set theme to solarized light
(load-theme 'solarized t)

;; Customize functionality of Emacs
;; Make emacs respect (and sync) copy x11 clipboard
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; Set line numbers
(global-linum-mode t)

;; Set line mode
(global-hl-line-mode 1)
;; Just not in the terminal
(add-hook 'term-mode-hook (lambda ()
			    (setq-local global-hl-line-mode
					nil)))



;; Tabs are now 4 spaces. Yay standards...
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq vc-follow-symlinks t)

;; Set default shell for ansi-term
(setq explicit-shell-file-name "/usr/bin/zsh")

;; Goodbye and good riddance menu bar and schoolbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (volatile-highlights evil-goggles))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
