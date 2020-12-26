;; leaf.elのインストール
;; https://github.com/conao3/leaf.el
;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>


;; leaf.elインストールしたら自動生成された
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   '(("org" . "https://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(company rainbow-delimiters highlight-indent-guides blackout el-get hydra leaf-keywords leaf)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; カラーテーマの設定
(load-theme 'tango-dark t)


;; バックアップファイル作らない
(setq make-backup-files nil)
(setq auto-save-default nil)


;; インデントの位置を強調表示
;; https://mako-note.com/python-emacs-ide/
(leaf highlight-indent-guides
  :ensure t
  :blackout t
  :hook (((prog-mode-hook yaml-mode-hook) . highlight-indent-guides-mode))
  :custom (
     (highlight-indent-guides-method . 'character) 
     (highlight-indent-guides-auto-enabled . t)
     (highlight-indent-guides-responsive . t)
     (highlight-indent-guides-character . ?\|)))


;; 括弧の強調表示
;; https://mako-note.com/python-emacs-ide/
(leaf rainbow-delimiters
  :ensure t
  :hook
  ((prog-mode-hook . rainbow-delimiters-mode)))


;; 入力補完
;; https://mako-note.com/python-emacs-ide/
(leaf company
  :ensure t
  :leaf-defer nil
  :blackout company-mode
  :bind ((company-active-map
	  ("M-n" . nil)
	  ("M-p" . nil)
	  ("C-n" . company-select-next)
	  ("C-p" . company-select-previous))
	 (company-search-map
	  ("C-n" . company-select-next)
	  ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
	   (company-minimum-prefix-length . 1)
	   (global-company-mode . t)))
	  
