(define-module (config home-config)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (srfi srfi-1))

(use-package-module wm
		    lisp
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
     		     xorg
		     shells
		     dotfiles)
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
		  sway
		  bemenu
		  nss-certs
		  %base-packages))
 
 (services (remove (lambda (service)
		     (eq? (service-kind service) gdm-service-type))
		   %desktop-services)
  (list (service home-bash-service-type
			  (home-bash-configuration
			   (environment-variables '(("PS1" . "\\[\\e[1;32m\\]\\u \\[\\e[1;34m\\]\\w \\[\\e[0m\\]λ ")))
			   (aliases '(("ff" . "fastfetch")
				      ("kb" . "bash ~/scripts/keyboardfix.sh")))))
		 (service home-dotfiles-service-type
			  (home-dotfiles-configuration
			   (directories '("../files")))))))

