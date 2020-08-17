(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Set up use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Require use-package and install packages if they are not installed
(require 'use-package)
(setq use-package-always-ensure t)

;; Make emacs good -- EVIL customization
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (evil-mode 1))

;; Make EVIL feel more like home
(use-package evil-numbers)
(use-package color-theme-sanityinc-tomorrow)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/tomorrow-theme")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai-emacs")

(dolist (theme custom-enabled-themes)
  (disable-theme theme))

;; Change cursor in EVIL insert mode
(setq-default evil-insert-state-cursor 'bar)

;; Theme stuff
(set-face-attribute 'default nil :height 140)

(use-package powerline)
(powerline-center-evil-theme)

;; Add org mode
(require 'org)
(setq org-return-follows-links t)

;; Add syntax highlighting to code segments
(setq org-src-fontify-natively t)

;; Add agenda keybindings to org
(global-set-key "\C-ca" 'org-agenda)

;; Add more arguments for todo org mode
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "DONE")))

;; Set closed time to done when in org mode
(setq org-log-done 'time)

(defun org-summary-todo (n-done n-not-done)
  (let (org-log-done org-log-states)   ;; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; Emacs without Org mode?? ? oke
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Use org journal
(use-package org-journal)
(setq org-journal-dir "~/Dropbox/journal")
;; Wrap at 80 for journals (IN-PROGRESS) Doesn't seem to work right now
(add-hook 'org-journal-hook (lambda ()
                            (turn-on-auto-fill)))
(add-hook 'org-journal-hook (lambda ()
                            (set-fill-column 80)))

;; Customize functionality of Emacs
;; Make emacs respect (and sync) copy x11 clipboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Set line mode
(global-hl-line-mode 1)
;; Just not in the terminal
(add-hook 'term-mode-hook (lambda ()
                            (setq-local global-hl-line-mode
                                        nil)))
(setq column-number-mode t)

;; Syntax highlighting for various other languages
(use-package dockerfile-mode)
(use-package dart-mode)
(use-package kotlin-mode)

(use-package markdown-mode)
(use-package helm)

;; Sane helm defaults
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") #'helm-select-action)

;; Ummm what the fuck Kotlin? The default is 8 ???
;; I swear they do this to make you configure emacs more
(setq kotlin-tab-width 4)

;; Better find file :sunglasses:
(define-key global-map [remap find-file] 'helm-find-files)

(use-package flycheck)
(use-package flycheck-gradle
  :ensure t
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x 'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))

(global-flycheck-mode)

(use-package gradle-mode
  :init
  (gradle-mode 1))

(use-package groovy-mode)

;; Auto close parens
(use-package autopair)
(autopair-global-mode)

;; Tabs are now 4 spaces. Yay standards.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-directory-alist `(("." . "/tmp")))

(setq vc-follow-symlinks t)

;; Set default shell for ansi-term
(setq explicit-shell-file-name "/usr/bin/zsh")

;; Some latex stuff
(setq TeX-PDF-mode t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; Goodbye and good riddance menu bar and schoolbar
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Remove Emacs god awful splash screen
(setq inhibit-splash-screen t)

;; Set initial buffer nothing
(setq initial-scratch-message nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" default)))
 '(org-agenda-files (quote ("~/Documents/org/todo.org")))
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow groovy-mode gradle-mode evil-numbers flycheck-Gradle flycheck-kotlin flycheck-gradle lsp-mode lsp company company-mode helm markdown-mode kotlin-mode autopair dockerfile-mode dart-mode org-journal org-bullets use-package use-package-el-get evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
