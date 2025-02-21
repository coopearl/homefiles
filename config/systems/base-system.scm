(define-module (config systems base-system)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages bash)  
  #:export (base-system))

(use-service-modules cups desktop networking)

(define base-system
  (operating-system
   (locale "en_US.utf8")
   (timezone "America/Los_Angeles")
   (keyboard-layout (keyboard-layout "us"))
   (host-name "guix")

   (users (cons* (user-account
                  (name "josh")
                  (comment "Josh Cooperman-Earl")
                  (group "users")
                  (home-directory "/home/josh")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   (packages (append (list bash)
                     %base-packages))

   (services (remove (lambda (service)
		       (eq? (service-kind service) gdm-service-type))
		     %desktop-services))


   (bootloader (bootloader-configuration
		(bootloader grub-bootloader)
		(targets (list "/dev/nvme0n1"))
                (keyboard-layout keyboard-layout)))
   (mapped-devices (list (mapped-device
                          (source (uuid
                                   "98a5ad4e-a909-409a-b9c3-5558978a10b7"))
                          (target "cryptroot")
                          (type luks-device-mapping))
                        (mapped-device
                          (source (uuid
                                   "e4df7f21-0e39-418d-9279-c52d848d2aca"))
                          (target "crypthome")
                          (type luks-device-mapping))))


  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "BF55-979E"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices))
                       (file-system
                         (mount-point "/home")
                         (device "/dev/mapper/crypthome")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems))))


