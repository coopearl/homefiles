(define-module (config home-config)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu home services desktop)
  #:use-module (gnu services)
  #:use-module (dwl-guile home-service)
  #:use-module (dwl-guile patches)  
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1))

(use-package-modules wm
		     version-control
		     admin
		     emacs
		     emacs-xyz
		     certs
		     aspell
		     terminals
		     xdisorg
		     web-browsers)

(use-service-modules cups
		     desktop
		     networking
		     guix
     		     xorg)
(home-environment

 (packages (cons* git
		  fastfetch
		  emacs-guix
		  aspell
		  aspell-dict-en
		  alacritty
		  emacs
		  emacs-vertico
		  emacs-marginalia
		  emacs-avy
		  emacs-vterm
		  nyxt
		  nss-certs
		  %base-packages))
 
 (services (list (service home-bash-service-type
			  (home-bash-configuration
			   (environment-variables '(("PS1" . "\\[\\e[1;32m\\]\\u \\[\\e[1;34m\\]\\w \\[\\e[0m\\]λ ")))
			   (aliases '(("ff" . "Fastfetch")
				      ("kb" . "bash ~/scripts/keyboardfix.sh")))))
		 (service home-dotfiles-service-type
			  (home-dotfiles-configuration
			   (directories '("../files"))))
		 (service home-dwl-guile-service-type
			  (home-dwl-guile-configuration
			   (auto-start? #t)
			   (reload-config-on-change? #t))))))

