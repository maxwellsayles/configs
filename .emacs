;;(tool-bar-mode -1)
(setq-default truncate-lines t)
(xterm-mouse-mode t)
(global-linum-mode)
(set-face-attribute 'default nil :height 120)
(setq backup-inhibited t)
;;(tabbar-mode)
(menu-bar-mode -1)
(setq column-number-mode t)

(require 'mwheel)
(mouse-wheel-mode)

;; Haskell mode.
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode/")
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Load .plt in fundamental-mode
(setq auto-mode-alist (cons '("\\.plt$" . fundamental-mode) auto-mode-alist))

;; google-c-style
;;(add-to-list 'load-path "~/.emacs.d/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; clojure hook
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(require 'clojure-mode)

;; scala hook
(add-to-list 'load-path "~/.emacs.d/scala-mode2")
(require 'scala-mode2)

;; F-Sharp Hook
(add-to-list 'load-path "~/.emacs.d/fsharp")
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

;; C-Sharp Hook
;;(add-to-list 'load-path "~/.emacs.d/csharp-mode.el")
(setq auto-mode-alist (cons '("\\.cs$" . csharp-mode) auto-mode-alist))
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

;; Python Hook
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent 4)))

;; pari/gp mode
(add-to-list 'load-path "~/.emacs.d/pariemacs")
(autoload 'gp-mode "pari" nil t)
(autoload 'gp-script-mode "pari" nil t)
(autoload 'gp "pari" nil t)
(autoload 'gpman "pari" nil t)
(setq auto-mode-alist (cons '("\\.gp$" . gp-script-mode) auto-mode-alist))

;; ocaml mode
(add-to-list 'load-path "~/.emacs.d/tuareg")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

;; php mode
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
