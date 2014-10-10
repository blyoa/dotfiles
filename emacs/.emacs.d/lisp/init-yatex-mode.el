;; YaTeX
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))

;; コマンドの設定
(setq tex-command "platex") 
(setq bibtex-command "pbibtex")

;; tableをM-x alignで整列させる
;; マクロ定義
(defmacro append-to-list (to lst)
  `(setq ,to (append ,lst ,to)))
(require 'align)
(add-to-list 'align-rules-list
             '(yatex-table
               (regexp . "\\(\\s-*\\)&")
               (modes  . '(yatex-mode))
	       (repeat . t)
	       )
	     '(yatex-table2
               (regexp . "\\(\\s-+\\)\\\\\\\\")
               (modes  . '(yatex-mode))))

;; RefTexの設定
(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))


;;; TeX-master に関しては safe にする
(put 'TeX-master 'safe-local-variable
     (lambda (x)
       (or (stringp x)
	   (member x (quote (t nil shared dwim))))))

;; aspell
;;; ispell -> aspellの置き換え
(setq-default ispell-program-name "aspell")
;;; 日本語ファイル中のスペルチェックを有効に
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))


;; flyspell-mode
;;; yatex-modeで自動的にflyspell-modeにする
(mapc
   (lambda (hook)
    (add-hook hook
     '(lambda () (flyspell-mode 1))))
   '(
	   yatex-mode-hook  
    ))

(provide 'init-yatex-mode)
