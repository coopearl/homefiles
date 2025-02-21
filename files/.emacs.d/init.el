;;packages
(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
	("MELPA"        . "https://melpa.org/packages/")
	("ORG"          . "https://orgmode.org/elpa/")
	("MELPA Stable" . "https://stable.melpa.org/packages/")
      package-archive-prioritites
      '(("GNU ELPA"     . 20)
	("MELPA"        . 15)
	("ORG"          . 10)
	("MELPA Stable" . 5))))
(package-initialize)

;; vertico and marginalia
(vertico-mode +1)
(marginalia-mode +1)

;;avy
(global-set-key (kbd "M-j") 'avy-goto-char-timer)

;;cookies in EWW
(setq url-cookie-untrusted-urls '(".*"))

;;custom variables
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)


;;ui
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (tooltip-mode -1)
  (blink-cursor-mode 0)
(setq use-file-dialog nil use-dialog-box nil)

;;theme
(when (display-graphic-p)
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload))

;;scrollin
(setq scroll-conservatively 100000)

;;start from scratch
(setq initial-scratch-message ""
      initial-buffer-choice t)

;;abbrev
(add-hook 'text-mode-hook 'abbrev-mode)
(add-hook 'prog-mode-hook 'abbrev-mode)

;;line highlighting
(add-hook 'occur-mode-hook 'hl-line-mode)
(add-hook 'dired-mode-hook 'hl-line-mode)
(add-hook 'package-menu-mode-hook 'hl-line-mode)

;;spell check
(add-hook 'text-mode-hook 'flyspell-mode)

;;dired
(setq dired-dwim-target t)
(add-hook 'dired-load-hook (lambda () (require 'dired-x)))

;;auto revert
(setq view-read-only t)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(add-hook 'pdf-view-mode-hook 'auto-revert-mod)

;;save place
(save-place-mode +1)

;;minibuffer history
(setq history-length 25)
(savehist-mode 1)

;;org
(require 'org)
(setq initial-major-mode 'org-mode)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(setq org-agenda-files '("~/Documents/org"))
(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "|" "DONE(d!)" "WONT-DO(w@/!)" )
        ))

(define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (define-key org-mode-map "\C-cf" 'org-metaright)
  (define-key org-mode-map "\C-cb" 'org-metaleft)
  (define-key org-mode-map "\C-cn" 'org-metadown)
  (define-key org-mode-map "\C-cp" 'org-metaup)

;;org-babel
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((gnuplot . t)))

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((scheme . t)))

  
;;org-tempo
(require 'org-tempo)

  (setq org-structure-template-alist
         '(("s" . "src")
           ("scm" . "src scheme")
           ("sg" . "src gnuplot :eval yes :file graph.png")
           ("e" . "src emacs-lisp")
           ("x" . "example")
           ("X" . "export")
           ("q" . "quote")))


