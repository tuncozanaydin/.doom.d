;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(load! "+keybinds")

(after! lsp-python-ms
  (setq lsp-python-ms-executable (executable-find "Microsoft.Python.LanguageServer"))
  (set-lsp-priority! 'mspyls 1))

(after! tramp (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(after! lsp-mode
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "Microsoft.Python.LanguageServer")
                      :major-modes '(python-mode)
                      :remote? t
                      :server-id 'pyls-remote)))

;; (defun lsp-python-ms-dummy-params-remote (&optional workspace)
;;   "Return form describing parameters for language server.

;; Old lsp will pass in a WORKSPACE, new lsp has a global
;; lsp-workspace-root function that finds the current buffer's
;; workspace root.  If nothing works, default to the current file's
;; directory"
;;       `(:interpreter
;;         (:properties (
;;                   :InterpreterPath "/usr/bin/python3."
;;                   :UseDefaultDatabase t
;;                   :Version "3.6"))
;;         ;; preferredFormat "markdown" or "plaintext"
;;         ;; experiment to find what works best -- over here mostly plaintext
;;         :displayOptions (:preferredFormat "markdown"
;;                          :trimDocumentationLines :json-false
;;                          :maxDocumentationLineLength 0
;;                          :trimDocumentationText :json-false
;;                          :maxDocumentationTextLength 0)
;;         :searchPaths ,(vconcat '(
;;                                  "/usr/bin"
;;                    ))
;;         :analysisUpdates t
;;         :asyncStartup t
;;         :logLevel "Debug"
;;         :typeStubSearchPaths ,(vconcat '("/root/.emacs.d/.local/etc/lsp/mspyls/Typeshed"))))
;; (after! lsp-mode
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-tramp-connection "Microsoft.Python.LanguageServer")
;;                     :major-modes '(python-mode)
;;                     :remote? t
;;                     :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;                                                    ("telemetry/event" 'ignore)
;;                                                    ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
;;                                                    ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
;;                                                    ("python/endProgress" 'lsp-python-ms--end-progress-callback))
;;                     ;; :initialization-options 'lsp-python-ms--extra-init-params
;;                     :initialization-options 'lsp-python-ms-dummy-params-remote
;;                     :initialized-fn (lambda (workspace)
;;                                       (with-lsp-workspace workspace
;;                                                           (lsp--set-configuration (lsp-configuration-section "python"))))
;;                     :server-id 'mspyls-remote)))

;; (defun lsp-python-ms-dummy-params-remote (&optional workspace)
;;   "Return form describing parameters for language server.

;; Old lsp will pass in a WORKSPACE, new lsp has a global
;; lsp-workspace-root function that finds the current buffer's
;; workspace root.  If nothing works, default to the current file's
;; directory"
;;       `(:interpreter
;;         (:properties (
;;                   :InterpreterPath "/home/mjlbach/.virtualenvs/physics3.7/bin/python3"
;;                   :UseDefaultDatabase t
;;                   :Version "3.7"))
;;         ;; preferredFormat "markdown" or "plaintext"
;;         ;; experiment to find what works best -- over here mostly plaintext
;;         :displayOptions (:preferredFormat "markdown"
;;                          :trimDocumentationLines :json-false
;;                          :maxDocumentationLineLength 0
;;                          :trimDocumentationText :json-false
;;                          :maxDocumentationTextLength 0)
;;         :searchPaths ,(vconcat '(
;;                         "/home/mjlbach/Repositories/lab/box-physics"
;;                         "/home/mjlbach/.virtualenvs/physics3.7/lib64/python3.7/site-packages/_pdbpp_path_hack"
;;                         "/usr/lib64/python37.zip"
;;                         "/usr/lib64/python3.7"
;;                         "/usr/lib64/python3.7/lib-dynload"
;;                         "/home/mjlbach/.virtualenvs/physics3.7/lib64/python3.7/site-packages"
;;                         "/home/mjlbach/Repositories/lab/physics"
;;                         "/home/mjlbach/Repositories/lab/tdw-agents"
;;                         "/home/mjlbach/Repositories/lab/TDWBase/Python"
;;                         "/home/mjlbach/.virtualenvs/physics3.7/lib/python3.7/site-packages"
;;                         "/home/mjlbach/.virtualenvs/physics3.7/lib/python3.7/site-packages/_pdbpp_path_hack"
;;                    ))
;;         :analysisUpdates t
;;         :asyncStartup t
;;         :logLevel "Debug"
;;         :typeStubSearchPaths ,(vconcat '("/home/michael/.emacs.d/.local/etc/lsp/mspyls/Typeshed"))))

;; (after! lsp-mode
;;   (lsp-register-client
;;     (make-lsp-client :new-connection (lsp-tramp-connection "Microsoft.Python.LanguageServer")
;;                       :major-modes '(python-mode)
;;                       :remote? t
;;                       :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;                                                     ("telemetry/event" 'ignore)
;;                                                     ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
;;                                                     ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
;;                                                     ("python/endProgress" 'lsp-python-ms--end-progress-callback))
;;                       :initialization-options 'lsp-python-ms--extra-init-params
;;                       :initialized-fn (lambda (workspace)
;;                                         (with-lsp-workspace workspace
;;                                           (lsp--set-configuration (lsp-configuration-section "python"))))
;;                       :server-id 'pyls-remote)))
;; (after! lsp-mode
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-tramp-connection "Microsoft.Python.LanguageServer")
;;                     :major-modes '(python-mode)
;;                     :remote? t
;;                     :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;                                                    ("telemetry/event" 'ignore)
;;                                                    ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
;;                                                    ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
;;                                                    ("python/endProgress" 'lsp-python-ms--end-progress-callback))
;;                     :initialization-options 'lsp-python-ms--extra-init-params
;;                     :initialized-fn (lambda (workspace)
;;                                       (with-lsp-workspace workspace
;;                                                           (lsp--set-configuration (lsp-configuration-section "python"))))
;;                     :server-id 'mspyls-remote)))
;;
;;
;;
;;
;; (after! lsp-python-ms
;;   (setq lsp-python-ms-executable (executable-find "Microsoft.Python.LanguageServer"))
;;   (set-lsp-priority! 'mspyls 99))

;; (after! lsp-mode
;;   (lsp-register-client
;;    (make-lsp-client :new-connection (lsp-tramp-connection "Microsoft.Python.LanguageServer")
;;                     :major-modes '(python-mode)
;;                     :remote? t
;;                     :notification-handlers (lsp-ht ("python/languageServerStarted" 'lsp-python-ms--language-server-started-callback)
;;                                                    ("telemetry/event" 'ignore)
;;                                                    ("python/reportProgress" 'lsp-python-ms--report-progress-callback)
;;                                                    ("python/beginProgress" 'lsp-python-ms--begin-progress-callback)
;;                                                    ("python/endProgress" 'lsp-python-ms--end-progress-callback))
;;                     :initialization-options 'lsp-python-ms--extra-init-params
;;                     :initialized-fn (lambda (workspace)
;;                                       (with-lsp-workspace workspace
;;                                                           (lsp--set-configuration (lsp-configuration-section "python"))))
;;                     :server-id 'mspyls-remote)))
;; (after! lsp-mode
;;   (setq lsp-log-io t)
;;   ;; (setq lsp-pyright-use-library-code-for-types t)
;;   ;; (setq lsp-pyright-diagnostic-mode "workspace")
;;   (lsp-register-client
;;    (make-lsp-client
;;        :new-connection (lsp-tramp-connection (lambda ()
;;                                        (cons "pyright-langserver"
;;                                              lsp-pyright-langserver-command-args)))
;;        :major-modes '(python-mode)
;;        :remote? t
;;        :server-id 'pyright-remote
;;        :multi-root t
;;        :priority 3
;;        :initialization-options (lambda () (ht-merge (lsp-configuration-section "pyright")
;;                                                     (lsp-configuration-section "python")))
;;        :initialized-fn (lambda (workspace)
;;                          (with-lsp-workspace workspace
;;                            (lsp--set-configuration
;;                            (ht-merge (lsp-configuration-section "pyright")
;;                                      (lsp-configuration-section "python")))))
;;        :download-server-fn (lambda (_client callback error-callback _update?)
;;                              (lsp-package-ensure 'pyright callback error-callback))
;;        :notification-handlers (lsp-ht ("pyright/beginProgress" 'lsp-pyright--begin-progress-callback)
;;                                      ("pyright/reportProgress" 'lsp-pyright--report-progress-callback)
;;                                      ("pyright/endProgress" 'lsp-pyright--end-progress-callback)))))
