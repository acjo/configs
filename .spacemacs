;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(yaml
     ess
     (julia :variables julia-backend 'lsp julia-mode-enable-ess t)
     html
     lsp
     dap
     typescript
     python
     haskell
     racket
     cmake
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     (c-c++
      :variables
      ;;c-c++-enable-clang-support t
      c-c++-backend 'lsp-ccls
      )
     syntax-checking
     javascript
     typescript
     rust
     (latex :variables latex-enable-auto-fill nil)
   )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '( ag ack helm-ag helm-ack racket-mode scribble-mode rust-mode cargo flycheck-rust helm-ls-git ccls ripgrep deadgrep helm-rg jsonrpc json-rpc websocket )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (if (file-exists-p "/usr/local/bin/ccls" )
    (setq ccls-executable "/usr/local/bin/ccls")
    nil)
  (if (file-exists-p "/usr/bin/ccls" )
    (setq ccls-executable "/usr/bin/ccls")
    nil)
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
   			 spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq evil-respect-visual-line-mode t)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives )
  ;(push '("melpa" . "http://melpa.org/packages/") package-archives )
  ;(push '("melpa-stable" . "http://stable.melpa.org/packages/") package-archives )

  (spacemacs/toggle-highlight-current-line-globally-off)

  (setq mouse-yank-at-point t)
  (setq vc-follow-symlinks t)
  (setq undo-tree-auto-save-history t)
  (setq compilation-scroll-output 'first-error)
  (add-to-list 'spacemacs-indent-sensitive-modes 'c++-mode) ; avoids weird buffer corruption issue with yank/put with spacemacs' autoindent

  (defun cf/running-inside-docker ()
    "Returns true if running inside of docker"
    (if (= (call-process "bash" nil t nil "-c" "cat /proc/1/cgroup | grep docker -q") 0) t nil)
    )

  (defun cf/buildconf-has-set (key value)
    "Returns true if there is a line that is key = value in the .buildconf"
    (if (= 0
           (call-process "grep" nil nil nil
                         "-e"
                         (format "%s\s*=\s*%s" key value)
                         (format "%s.buildconf" (projectile-project-root))
                         "-q"))
        t nil)
    )

  ;; Select the right ccls-executable if running outside the dde
  ;; You may need to run ./build ccls-dde to create /usr/local/bin/dccls
  (defun cf/choose-ccls-exec ()
    (if (and (cf/buildconf-has-set 'build_in_dde 'yes) (not (cf/running-inside-docker)))
        (setq ccls-executable "/usr/local/bin/dccls")
      nil))
  (add-hook 'c-mode-common-hook 'cf/choose-ccls-exec)

  (defun cf/build-tool ()
    )

  ;; Choose the right options for building from the .buildconfig
  (defun compile-path (path procs)
    (let* ((condition (cf/buildconf-has-set 'use_ninja 'yes))
           (build-tool (if condition "ninja" "make"))
           (kopt (if condition "0" ""))
           (compile-subcmd (concat "cd " path "; " build-tool " -j " procs " -k " kopt))
           (compile-cmd (if (and (cf/buildconf-has-set 'build_in_dde 'yes) (not (cf/running-inside-docker)))
                            (format "docker exec %s-dev bash -c\"%s\"" (getenv "USER") compile-subcmd)
                          compile-subcmd)))

      (message compile-cmd)
      (compile compile-cmd)))

  (defun kbt-build-codes-debug ( &optional procs ) ""
         (interactive)
         (let ((procs (or procs "32")))
           (message "%s" (projectile-project-root))
           (let ((dd default-directory))
             (compile-path (concat (projectile-project-root) "../b_codes_debug") procs)
	         (cd dd))))

  (defun kbt-build-codes-release ( &optional procs ) ""
         (interactive)
         (let ((procs (or procs "32")))
           (message "%s" (projectile-project-root))
           (let ((dd default-directory))
             (compile-path (concat (projectile-project-root) "../b_codes") procs)
	     (cd dd))))

  (defun kbt-build-codes-release-with-debug ( &optional procs ) ""
         (interactive)
         (let ((procs (or procs "32")))
           (message "%s" (projectile-project-root))
           (let ((dd default-directory))
             (compile-path (concat (projectile-project-root) "../b_codes_with_debug") procs)
	     (cd dd))))

  (defun kbt-build-current-target ( &optional procs ) ""
	 (interactive)
	 (let* ((procs (or procs "4"))
	       (buf-name (buffer-file-name))
	       (prefix-less (string-remove-prefix (projectile-project-root) buf-name )))
	   (message "%s" prefix-less)
	   (let* ((dd default-directory)
	         (file-path (let ((part
		 		(replace-regexp-in-string "hpp\\'" "cpp"
		 		(replace-regexp-in-string "h\\'" "cpp"
		 		(replace-regexp-in-string "\\`\\w+/" "" prefix-less)))))
				 (replace-regexp-in-string "\\(/\\|\\`\\)include\/" "\\1src/" part)))
	         (library (string-match "\\`\\(\\w+\/\\)" prefix-less))
		 (cmd (concat "cd " (concat (projectile-project-root) "../b_codes_with_debug/" (match-string 0 prefix-less ) )
					     "; " "make" " -j " procs " -k " file-path ".o" )))
	      (message "%s" cmd)
	      (compile cmd)
	     (cd dd))))

  (defun kbt-build-codes1 () ""
	 (interactive)
	 (kbt-build-codes "1"))


  ;;;;; RUST

  (add-hook 'rust-mode-hook 'cargo-minor-mode)

  (add-hook 'rust-mode-hook
	    (lambda ()
	      (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

  (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
  (setq racer-rust-src-path "/Users/tewk/srcs/petsc/rust/src") ;; Rust source code PATH

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)

  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

  (require 'helm-ls-git)
  ;;(cmake-ide-setup)

  (defun igx-find-file () 
  (interactive)
  (if (not (helm-ls-git-root-dir))
  (helm-multi-files)
  (helm-ls-git-ls)))

  (setq helm-ls-git-default-sources '(
                                     ;helm-source-ls-buffers
                                     helm-source-ls-git-buffers
				     helm-source-ls-git-status
				     helm-source-ls-git))

  (setq cf/last-test-filename "")
  (setq cf/last-test-desc "")
  (setq cf/last-test-executed "")
  (defvar helm-cf-test-history nil)
  (defun cf/run-test-cmd (form testfile args)
    (let ((filename (file-name-nondirectory testfile)))
      (let ((desc (format "* TestOut %s *" filename))
	    (cmdline (format form testfile args)))
	(setq cf/last-test-executed (list testfile args))
	(start-process-shell-command desc desc cmdline)
	(with-current-buffer desc
	  (display-buffer (current-buffer))
	  (require 'shell)
	  (shell-mode)
	  (set-process-filter (get-buffer-process desc) 'comint-output-filter)))))
  (defun cf/run-test (testfile args) (cf/run-test-cmd "%s %s" testfile args))
  (defun cf/lldb-test (testfile args) (cf/run-test-cmd "lldb -o run %s -- %s"  testfile args))
  (defun cf/choose-subtest ( testfile )
    (interactive)
    (setq cf/last-test-filename testfile)
    (let ((filename (file-name-nondirectory testfile)))
      (helm :sources
	    (helm-build-in-buffer-source (format "%s Tests" testfile)
	      :init
	      (lambda ()
		(helm-init-candidates-in-buffer
		    'global
		  (with-temp-buffer
		    (call-process-shell-command (format "%s --help-tests |tail -n +3" testfile) nil (current-buffer))
		    (buffer-string))))
	      :fuzzy-match t
	      :action '(("run-test" . (lambda ( arg ) (cf/run-test testfile arg)))
			( "lldb" . (lambda ( arg ) (cf/lldb-test testfile arg)))))
	    :buffer (format "*helm tests %s" filename))))

  (defun cf/tests ()
    (interactive)
    (let ((prj-dir (concat (projectile-project-root) "../b_codes_with_debug")))
      (helm :sources
	    (helm-build-in-buffer-source "CF Tests"
	      :init
	      (lambda ()
		(helm-init-candidates-in-buffer
		    'global
		  (with-temp-buffer
		    (call-process-shell-command (format "(cd %s/bin; find \"$(pwd)\" -perm +111 -type f |grep Test_)" prj-dir) nil (current-buffer))
		    (buffer-string))))
	      :fuzzy-match t
	      :action '(("Choose subtest" . cf/choose-subtest)))
	    :history 'helm-cf-test-history
	    :buffer "*helm CF Tests*")))

  (defun cf/last-test ()
    (interactive)
    (cf/run-test (car cf/last-test-executed) (cadr cf/last-test-executed)))
  (defun cf/last-lldb-test ()
    (interactive)
    (cf/lldb-test (car cf/last-test-executed) (cadr cf/last-test-executed)))

  (require 'ansi-color)

  (defun ansi-colorize-current-buffer ()
    "Colorize ansi escape sequences in the current buffer."
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max)))

  (defun show-compilation ()
    (interactive)
    (set-window-buffer (split-window-vertically -25 ) "*compilation*" ))

  (setq multi-term-program "/bin/zsh")

  (evil-global-set-key 'normal ";b" 'helm-for-files)
  (evil-global-set-key 'normal ";m" 'kbt-build-codes-debug)
  (evil-global-set-key 'normal ";Bd" 'kbt-build-codes-debug)
  (evil-global-set-key 'normal ";Br" 'kbt-build-codes-release)
  (evil-global-set-key 'normal ";Bb" 'kbt-build-codes-release-with-debug)
  (evil-global-set-key 'normal ";M" 'kbt-build-current-target)
  (evil-global-set-key 'normal ";1" 'delete-other-windows)
  (evil-global-set-key 'normal ";p" 'previous-error)
  (evil-global-set-key 'normal ";n" 'next-error)
  (evil-global-set-key 'normal ";t" 'cf/tests)
  (evil-global-set-key 'normal ";l" 'cf/last-test)
  (evil-global-set-key 'normal ";L" 'cf/last-lldb-test)
  (evil-global-set-key 'normal ";a" 'ansi-colorize-current-buffer)
  (evil-global-set-key 'normal ";oo" 'helm-projectile-find-other-file)
  (global-set-key (kbd "C-x c-B") 'igx-find-file)
  (global-set-key (kbd "C-x b") 'helm-multi-files)
  (global-set-key (kbd "C-x C-b") 'helm-multi-files)
  (evil-global-set-key 'normal ";gs" 'magit-status)
  (evil-global-set-key 'normal ";gg" 'helm-ls-git-ls)
  (evil-global-set-key 'normal ";ga" 'ag)
  (evil-global-set-key 'normal ";rg" 'helm-rg)
  ;(evil-global-set-key 'normal "\C-t" 'rtags-location-stack-back)
  (evil-global-set-key 'normal "\C-t" 'xref-pop-marker-stack)
  ;(evil-global-set-key 'normal ";." 'rtags-find-symbol-at-point)
  (evil-global-set-key 'normal ";." 'spacemacs/jump-to-definition)
  (evil-global-set-key 'normal "\C-e" 'end-of-line)
  (evil-global-set-key 'insert "\C-e" 'end-of-line)
  (global-unset-key (kbd "M-v") )
  (global-unset-key (kbd "M-c") )
  (global-set-key (kbd "M-v") 'yank )
  (global-set-key (kbd "M-c") 'yank )
  (evil-global-set-key 'normal ";c" 'show-compilation ) 

  (setq c-default-style "linux" c-basic-offset 8)
  (setq evil-shift-width 8)
  (setq-default c-basic-offset 8
                cperl-indent-level 8
                tab-width 8
                indent-tabs-mode t)

  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (c-set-offset 'access-label 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'inlambda 0)
  (c-set-offset 'case-label '+)

  (setq evil-move-cursor-back nil)
  (setq evil-move-beyond-eol t)

  (defadvice c-lineup-arglist (around my activate)
    "Improve indentation of continued C++11 lambda function opened as argument."
    (setq ad-return-value
          (if (and (equal major-mode 'c++-mode)
                   (ignore-errors
                     (save-excursion
                       (goto-char (c-langelem-pos langelem))
                       ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                       ;;   and with unclosed brace.
                       (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
              0                           ; no additional indent
            ad-do-it)))                   ; default behavior

  (defvar my-cpp-other-file-alist
    '(("\\.cpp\\'" (".h" ".hpp" ".ipp"))
      ("\\.ipp\\'" (".hpp" ".cpp"))
      ("\\.hpp\\'" (".ipp" ".cpp"))
      ("\\.cxx\\'" (".hxx" ".ixx"))
      ("\\.ixx\\'" (".cxx" ".hxx"))
      ("\\.hxx\\'" (".ixx" ".cxx"))
      ("\\.c\\'" (".h"))
      ("\\.h\\'" (".cpp" ".c"))
      ))

  (setq-default cc-other-file-alist 'my-cpp-other-file-alist)
  (setq-default ff-other-file-alist 'my-cpp-other-file-alist)
  ;; For python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For ruby
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For Javascript
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;;(add-hook 'elisp-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	        (modify-syntax-entry ?_ "w")
		(superword-mode 1)
                ;(ggtags-mode 1)
		)))


  (eval-after-load 'evil-ex '(evil-ex-define-cmd "q" (lambda () (+ 1 1))))
  (eval-after-load 'evil-ex '(evil-ex-define-cmd "wq" 'evil-write))
  (eval-after-load 'evil-ex '(evil-ex-define-cmd "wqa" 'evil-write))

  (defun set-frame-pixel-size (frame width height)
    "Sets size of FRAME to WIDTH by HEIGHT, measured in pixels."
    (let ((pixels-per-char-width (/ (frame-pixel-width) (frame-width)))
	  (pixels-per-char-height (/ (frame-pixel-height) (frame-height))))
      (set-frame-size frame
		      (floor (/ width pixels-per-char-width))
		      (floor (/ height pixels-per-char-height)))))

  (defun use-left-half-screen ()
    (interactive)
    (let* ((excess-width 32)
	   (excess-height 48)
	   (half-screen-width (- (/ (x-display-pixel-width) 2) excess-width))
	   (screen-height (- (x-display-pixel-height) excess-height)))
      (set-frame-pixel-size (selected-frame) half-screen-width screen-height)))

  (if window-system
      (use-left-half-screen))
  ;;----------------------------------------------------------------------------
;; MA Scott configuration ;;----------------------------------------------------------------------------
  (turn-off-auto-fill)
  (remove-hook 'text-mode-hook 'turn-on-auto-fill)
  (when (equal "mscott" (user-login-name))
    (global-visual-fill-column-mode t))
  (global-visual-line-mode t)
  (setq confirm-kill-emacs 'y-or-n-p)
  (setq-default TeX-master nil)
  (global-set-key (kbd "M-`") 'other-frame)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch)
  (global-set-key (kbd "C-c g") 'magit-file-dispatch)
  ;;--------------------------------------------------------------------------------
  ;; AucTex configuration
  ;;--------------------------------------------------------------------------------
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq-default TeX-master nil)
  (setq TeX-command-extra-options "-shell-escape")
  (setq TeX-parse-all-errors t)
  (setq TeX-error-overview-open-after-TeX-run t)
  (setq TeX-debug-bad-boxes t)
  (setq TeX-debug-warnings t)
  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
  ;; Use Skim on macOS to utilize synctex.
  ;; Confer https://mssun.me/blog/spacemacs-and-latex.html
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  ;; AucTex recognizes some standard viewers, but the default view command
  ;; does not appear to sync.
  (setq TeX-view-program-list
        '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
          ("Skim" "displayline -b -g %n out/%o %b")
          ("Zathura"
           ("zathura %o"
            (mode-io-correlate
             " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\"")))))
  (cond
   ((spacemacs/system-is-mac) (setq TeX-view-program-selection '((output-pdf "Skim"))))
   ;; For linux, use Okular or perhaps Zathura.
   ((spacemacs/system-is-linux) (setq TeX-view-program-selection '((output-pdf "Okular")))))
  (setq-default
   dotspacemacs-configuration-layers
   '(
     (latex :variables
	    latex-build-command "pdflatex"
	    latex-refresh-preview t
	    latex-enable-folding t
	    latex-enable-magic t
	    latex-backend 'lsp)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(custom-safe-themes
   (quote
    ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (ripgrep helm-rg deadgrep lsp-mode markdown-mode ht ccls multi-term pyenv-mode company-anaconda anaconda-mode yapfify pyvenv pytest py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode pythonic orgit org-plus-contrib helm-rtags winum unfill fuzzy company-cabal cmm-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode helm-ls-git toml-mode racer flycheck-rust seq cargo rust-mode faceup flymake-racket racket-mode smeargle mwim magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip pos-tip evil-magit magit magit-popup git-commit with-editor disaster company-tern dash-functional tern company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet ac-ispell auto-complete rtags cmake-ide levenshtein web-beautify tide typescript-mode flycheck livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc helm-ack coffee-mode ag ack ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(paradox-github-token t)
 '(scroll-down-aggressively 1.0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(custom-safe-themes
   '("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-make-build-dir "../b_codes_with_debug")
 '(helm-make-nproc 20)
 '(package-selected-packages
   '(yaml-mode ripgrep helm-rg deadgrep lsp-mode markdown-mode ht ccls multi-term pyenv-mode company-anaconda anaconda-mode yapfify pyvenv pytest py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode pythonic orgit org-plus-contrib helm-rtags winum unfill fuzzy company-cabal cmm-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode helm-ls-git toml-mode racer flycheck-rust seq cargo rust-mode faceup flymake-racket racket-mode smeargle mwim magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flycheck-pos-tip pos-tip evil-magit magit magit-popup git-commit with-editor disaster company-tern dash-functional tern company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet ac-ispell auto-complete rtags cmake-ide levenshtein web-beautify tide typescript-mode flycheck livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc helm-ack coffee-mode ag ack ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))
 '(paradox-github-token t)
 '(scroll-down-aggressively 1.0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
)
