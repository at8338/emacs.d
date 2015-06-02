;;; .emacs --- dot emacs file

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This file is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this file; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
;; MA 02111-1307, USA.

;;; Code:


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ site-lisp                                                     ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(let ( (default-directory
         (file-name-as-directory (concat user-emacs-directory "site-lisp")))
       )
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path)
  )


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ language - coding system                                      ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; デフォルトの文字コード
(set-default-coding-systems 'utf-8-unix)

;; テキストファイル／新規バッファの文字コード
(prefer-coding-system 'utf-8-unix)

;; ファイル名の文字コード
(set-file-name-coding-system 'utf-8-unix)

;; キーボード入力の文字コード
(set-keyboard-coding-system 'utf-8-unix)

;; サブプロセスのデフォルト文字コード
(setq default-process-coding-system '(undecided-dos . utf-8-unix))

;; 環境依存文字 文字化け対応
(set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                      'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ key binding - keyboard                                        ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; Altキーを使用せずにMetaキーを使用
(setq w32-alt-is-meta t)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ language - input method                                       ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; ;; モードラインの表示文字列
;; (setq-default w32-ime-mode-line-state-indicator "[Aa] ")
;; (setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

;; IME初期化
(w32-ime-initialize)

;; デフォルトIME
(setq default-input-method "W32-IME")

;; IME変更
(global-set-key (kbd "C-\\") 'toggle-input-method)

;; 漢字/変換キー入力時のエラーメッセージ抑止
(global-set-key (kbd "<M-kanji>") 'ignore)
(global-set-key (kbd "<kanji>") 'ignore)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ language - fontset                                            ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; デフォルト フォント
;; (set-face-attribute 'default nil :family "Migu 1M" :height 110)
(set-face-font 'default "Migu 1M-14:antialias=standard")

;; プロポーショナル フォント
;; (set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 110)
(set-face-font 'variable-pitch "Migu 1M-14:antialias=standard")

;; 等幅フォント
;; (set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height 110)
(set-face-font 'fixed-pitch "Migu 1M-14:antialias=standard")

;; ツールチップ表示フォント
;; (set-face-attribute 'tooltip nil :family "Migu 1M" :height 90)
(set-face-font 'tooltip "Migu 1M-9:antialias=standard")

;;; fontset

;; フォントサイズ調整
(global-set-key (kbd "C-<wheel-up>")   '(lambda() (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-=")            '(lambda() (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-<wheel-down>") '(lambda() (interactive) (text-scale-decrease 1)))
(global-set-key (kbd "C--")            '(lambda() (interactive) (text-scale-decrease 1)))

;; フォントサイズ リセット
(global-set-key (kbd "M-0") '(lambda() (interactive) (text-scale-set 0)))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - frame                                                ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(setq default-frame-alist
      (append '((width                . 85)  ; フレーム幅
                (height               . 38 ) ; フレーム高
             ;; (left                 . 70 ) ; 配置左位置
             ;; (top                  . 28 ) ; 配置上位置
                (line-spacing         . 0  ) ; 文字間隔
                (left-fringe          . 10 ) ; 左フリンジ幅
                (right-fringe         . 0 ) ; 右フリンジ幅
                (menu-bar-lines       . 1  ) ; メニューバー
                (tool-bar-lines       . 1  ) ; ツールバー
                (vertical-scroll-bars . 1  ) ; スクロールバー
                (scroll-bar-width     . 17 ) ; スクロールバー幅
                (cursor-type          . box) ; カーソル種別
                (alpha                . 95) ; 透明度
                ) default-frame-alist) )
(setq initial-frame-alist default-frame-alist)

;; フレーム タイトル
(setq frame-title-format
      '("emacs " emacs-version (buffer-file-name " - %f")))

;; 初期画面の非表示
(setq inhibit-startup-message nil)
(setq inhibit-startup-screen nil)

;; フルスクリーン化
(global-set-key (kbd "<M-return>") 'toggle-frame-fullscreen)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - mode line                                            ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; 行番号の表示
(line-number-mode t)

;; 列番号の表示
(column-number-mode t)

;; モードライン カスタマイズ
(setq-default
 mode-line-format
 `(
   ""
   w32-ime-mode-line-state-indicator
   " "
   mode-line-mule-info
   mode-line-modified
   mode-line-frame-identification
   mode-line-buffer-identification
   " "
   global-mode-string
   " %[("
   mode-name
   mode-line-process
   "%n"
   ")%] "
   (which-func-mode ("" which-func-format " "))
   (line-number-mode
    (:eval
     (format "L%%l/L%d " (count-lines (point-max) 1) )))
   (column-number-mode " C%c ")
   (-3 . "%p")
   )
 )
(setq mode-line-frame-identification " ")

;; cp932エンコードの表記変更
(coding-system-put 'cp932 :mnemonic ?P)
(coding-system-put 'cp932-dos :mnemonic ?P)
(coding-system-put 'cp932-unix :mnemonic ?P)
(coding-system-put 'cp932-mac :mnemonic ?P)

;; UTF-8エンコードの表記変更
(coding-system-put 'utf-8 :mnemonic ?U)
(coding-system-put 'utf-8-with-signature :mnemonic ?u)

;; 改行コードの表記追加
(setq eol-mnemonic-dos       ":Dos ")
(setq eol-mnemonic-mac       ":Mac ")
(setq eol-mnemonic-unix      ":Unx ")
(setq eol-mnemonic-undecided ":??? ") 


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - buffer                                               ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; バッファ画面外文字の切り詰め表示
(setq truncate-lines nil)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
(setq truncate-partial-width-windows t)

;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - cursor                                               ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; 現在のカーソル行ハイライト
(hl-line-mode t)

;; カーソルの点滅
(blink-cursor-mode 0)

;; 非アクティブウィンドウのカーソル表示
(setq-default cursor-in-non-selected-windows t)

;; IME無効／有効時のカーソルカラー定義
(unless (facep 'cursor-ime-off)
  (make-face 'cursor-ime-off)
  (set-face-attribute 'cursor-ime-off nil
                      :background "DarkRed" :foreground "White")
  )
(unless (facep 'cursor-ime-on)
  (make-face 'cursor-ime-on)
  (set-face-attribute 'cursor-ime-on nil
                      :background "DarkGreen" :foreground "White")
  )

;; IME無効／有効時のカーソルカラー設定
(add-hook
 'input-method-inactivate-hook
 '(lambda()
    (if (facep 'cursor-ime-off)
        (let ( (fg (face-attribute 'cursor-ime-off :foreground))
               (bg (face-attribute 'cursor-ime-off :background)) )
          (set-face-attribute 'cursor nil :foreground fg :background bg)
          )
      )
    )
 )
(add-hook
 'input-method-activate-hook
 '(lambda()
    (if (facep 'cursor-ime-on)
        (let ( (fg (face-attribute 'cursor-ime-on :foreground))
               (bg (face-attribute 'cursor-ime-on :background)) )
          (set-face-attribute 'cursor nil :foreground fg :background bg)
          )
      )
    )
 )

;; バッファ切り替え時の状態引継ぎ設定
(setq w32-ime-buffer-switch-p nil)


;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; ;;; @ screen - linum                                                ;;;
;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; 
;; (require 'linum)
;; 
;; ;; 行移動を契機に描画
;; (defvar linum-line-number 0)
;; (declare-function linum-update-current "linum" ())
;; (defadvice linum-update-current
;;     (around linum-update-current-around activate compile)
;;   (unless (= linum-line-number (line-number-at-pos))
;;     (setq linum-line-number (line-number-at-pos))
;;     ad-do-it
;;     ))
;; 
;; ;; バッファ中の行番号表示の遅延設定
;; (defvar linum-delay nil)
;; (setq linum-delay t)
;; (defadvice linum-schedule (around linum-schedule-around () activate)
;;   (run-with-idle-timer 1.0 nil #'linum-update-current))
;; 
;; ;; 行番号の書式
;; (defvar linum-format nil)
;; (setq linum-format "%5d")
;; 
;; ;; バッファ中の行番号表示
;; (global-linum-mode t)
;; 
;; ;; 文字サイズ
;; (set-face-attribute 'linum nil :height 0.75)
;; 

;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; ;;; @ screen - tabbar                                               ;;;
;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; 
;; (require 'tabbar)
;; 
;; ;; tabbar有効化
;; (call-interactively 'tabbar-mode t)
;; 
;; ;; ボタン非表示
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil) (cons "" nil)))
;;   )
;; 
;; ;; タブ切替にマウスホイールを使用（0：有効，-1：無効）
;; (call-interactively 'tabbar-mwheel-mode -1)
;; (remove-hook 'tabbar-mode-hook      'tabbar-mwheel-follow)
;; (remove-hook 'mouse-wheel-mode-hook 'tabbar-mwheel-follow)
;; 
;; ;; タブグループを使用（t：有効，nil：無効）
;; (defvar tabbar-buffer-groups-function nil)
;; (setq tabbar-buffer-groups-function nil)
;; 
;; ;; タブの表示間隔
;; (defvar tabbar-separator nil)
;; (setq tabbar-separator '(1.0))
;; 
;; ;; タブ切り替え
;; (global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
;; (global-set-key (kbd "C-q")     'tabbar-backward-tab)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ search - isearch                                              ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; 大文字・小文字を区別しないでサーチ
(setq-default case-fold-search nil)

;; インクリメント検索時に縦スクロールを有効化
(setq isearch-allow-scroll nil)

;; C-dで検索文字列を一文字削除
(define-key isearch-mode-map (kbd "C-d") 'isearch-delete-char)

;; C-yで検索文字列にヤンク貼り付け
(define-key isearch-mode-map (kbd "C-y") 'isearch-yank-kill)

;; C-eで検索文字列を編集
(define-key isearch-mode-map (kbd "C-e") 'isearch-edit-string)

;; Tabで検索文字列を補完
(define-key isearch-mode-map (kbd "TAB") 'isearch-yank-word)

;; C-gで検索を終了
(define-key isearch-mode-map (kbd "C-g")
  '(lambda() (interactive) (isearch-done)))

;; 日本語の検索文字列をミニバッファに表示
(define-key isearch-mode-map (kbd "<compend>")
  '(lambda() (interactive) (isearch-update)))
(define-key isearch-mode-map (kbd "<kanji>")
  'isearch-toggle-input-method)
(add-hook
 'isearch-mode-hook
 '(lambda() (setq w32-ime-composition-window (minibuffer-window)))
 )
(add-hook
 'isearch-mode-end-hook
 '(lambda() (setq w32-ime-composition-window nil))
 )


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - hiwin                                                ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'hiwin)

;; hiwin-modeを有効化
(hiwin-activate)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ search - migemo                                               ;;;
;;;   https://github.com/emacs-jp/migemo                            ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'migemo)

(defvar migemo-command nil)
(setq migemo-command "cmigemo")

(defvar migemo-options nil)
(setq migemo-options '("-q" "--emacs"))

(defvar migemo-dictionary nil)
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

(defvar migemo-user-dictionary nil)

(defvar migemo-regex-dictionary nil)

(defvar migemo-coding-system nil)
(setq migemo-coding-system 'utf-8-unix)

(load-library "migemo")


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ file - backup                                                 ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; ファイルオープン時のバックアップ（~）
(setq make-backup-files   t)  ;; 自動バックアップの実行有無
(setq version-control     t)  ;; バックアップファイルへの番号付与
(setq kept-new-versions   3)  ;; 最新バックアップファイルの保持数
(setq kept-old-versions   0)  ;; 最古バックアップファイルの保持数
(setq delete-old-versions t)  ;; バックアップファイル削除の実行有無

;; ファイルオープン時のバックアップ（~）の格納ディレクトリ
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "/tmp/emacsbk"))
            backup-directory-alist))

;; 編集中ファイルの自動バックアップ
(setq backup-inhibited nil)

;; 終了時に自動バックアップファイルを削除
(setq delete-auto-save-files nil)

;; 編集中ファイルのバックアップ
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; 編集中ファイルのバックアップ間隔（秒）
(setq auto-save-timeout 3)

;; 編集中ファイルのバックアップ間隔（打鍵）
(setq auto-save-interval 100)

;; 編集中ファイル（##）の格納ディレクトリ
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "/tmp/emacsbk") t)))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ file - lockfile                                               ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; ロックファイルの生成を抑止
(setq create-lockfiles nil)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ scroll                                                        ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; スクロール時のカーソル位置を維持
(setq scroll-preserve-screen-position t)

;; スクロール開始の残り行数
(setq scroll-margin 0)

;; スクロール時の行数
(setq scroll-conservatively 10000)

;; スクロール時の行数（scroll-marginに影響せず）
(setq scroll-step 0)

;; 画面スクロール時の重複表示する行数
(setq next-screen-context-lines 1)

;; キー入力中の画面更新を抑止
(setq redisplay-dont-pause t)

;; recenter-top-bottomのポジション
(setq recenter-positions '(top bottom))

;; 横スクロール開始の残り列数
(setq hscroll-margin 1)

;; 横スクロール時の列数
(setq hscroll-step 1)

;; スクロールダウン
;(global-set-key (kbd "C-z") 'scroll-down)

;; バッファの最後までスクロールダウン
(defadvice scroll-down (around scroll-down activate compile)
  (interactive)
  (let (
        (bgn-num (+ 1 (count-lines (point-min) (point))))
        )
    (if (< bgn-num (window-height))
        (goto-char (point-min))
      ad-do-it) ))

;; バッファの先頭までスクロールアップ
(defadvice scroll-up (around scroll-up activate compile)
  (interactive)
  (let (
        (bgn-num (+ 1 (count-lines (point-min) (point))))
        (end-num nil)
        )
    (save-excursion
      (goto-char (point-max))
      (setq end-num (+ 1 (count-lines (point-min) (point))))
      )
    (if (< (- (- end-num bgn-num) (window-height)) 0)
        (goto-char (point-max))
      ad-do-it) ))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ shell                                                         ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'shell)
(setq explicit-shell-file-name "bash.exe")
(setq shell-command-switch "-c")
(setq shell-file-name "bash.exe")

;; (M-! and M-| and compile.el)
(setq shell-file-name "bash.exe")
(modify-coding-system-alist 'process ".*sh\\.exe" 'utf-8)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ package manager                                               ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ theme                                                         ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; テーマ格納ディレクトリのパス追加
(add-to-list 'custom-theme-load-path
             (file-name-as-directory (concat user-emacs-directory "theme"))
             )

;; テーマ選択
;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
(load-theme 'gnupack-dark t)


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ server                                                        ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; emacs-server起動
(require 'server)
(defun server-ensure-safe-dir (dir) "Noop" t)
(setq server-socket-dir "~/.emacs.d")
(unless (server-running-p)
  (server-start)
)





;; ------------------------------------------------------------------------------
;; ------------------------------------------------------------------------------
;;::http://blog.bokuweb.me/entry/emcas-nyumon

; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

;;; load-pathの追加関数
;(defun add-to-load-path (&rest paths)
;  (let (path)
;    (dolist (path paths paths)
;      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
;        (add-to-list 'load-path default-directory)
;        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;            (normal-top-level-add-subdirs-to-load-path))))))
;
;;; load-pathに追加するフォルダ
;;; 2つ以上フォルダを指定する場合の引数 => (add-to-load-path "elisp" "xxx" "xxx")
;(add-to-load-path "elisp")

;; ------------------------------------------------------------------------
;; @ general

;; common lisp
(require 'cl)

;; 文字コード
(set-language-environment "Japanese")
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (prefer-coding-system 'utf-8-unix)
         (set-default-coding-systems 'utf-8-unix)
         (setq file-name-coding-system 'sjis)
         (setq locale-coding-system 'utf-8))
        ((eq ws 'ns)
         (require 'ucs-normalize)
         (prefer-coding-system 'utf-8-hfs)
         (setq file-name-coding-system 'utf-8-hfs)
         (setq locale-coding-system 'utf-8-hfs))))


;; ; Windowsで英数と日本語にMeiryoを指定
;; ; Macで英数と日本語にRictyを指定
;; (let ((ws window-system))
;;   (cond ((eq ws 'w32)
;;          (set-face-attribute 'default nil
;;                              :family "MeiryoKe_Gothic"  ;; 英数
;;                              :height 100)
;;         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Gothic")))  ;; 日本語
;;         ((eq ws 'ns)
;;         (set-face-attribute 'default nil
;;                              :family "Ricty"  ;; 英数
;;                              :height 140)
;;         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))  ;; 日本語
;; 
;; ;; スタートアップ非表示
;; (setq inhibit-startup-screen t)
;; 
;; ;; scratchの初期メッセージ消去
;; (setq initial-scratch-message "")

;; ツールバー非表示
(tool-bar-mode -1)

;; ;; メニューバーを非表示
;; (menu-bar-mode -1)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; ;; タイトルバーにファイルのフルパス表示
;; (setq frame-title-format
;;       (format "%%f - Emacs@%s" (system-name)))
;; 
;; ;; 行番号表示
;; (global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#bf616a"
;;                     :height 0.9)
;; 
;; ;; 行番号フォーマット
;; (setq linum-format "%4d")

;;;;;;;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#1ABC9C")

;; 選択領域の色
(set-face-background 'region "#555")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; ;; タブをスペースで扱う
;; (setq-default indent-tabs-mode nil)

;; タブ幅
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("11dd7fb48f2c0360f79e80a694c9e919a86dce32e5605018e9862e1e6287e3cb" default)))
 '(tab-width 4))

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 最近使ったファイルの表示数
(setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
(setq recentf-max-saved-items 3000)

;; ミニバッファの履歴を保存する
(savehist-mode 1)

;; ミニバッファの履歴の保存数を増やす
(setq history-length 3000)

;; バックアップを残さない
(setq make-backup-files nil)

;; 行間
(setq-default line-spacing 0)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 10
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

; ;; フレームの透明度
; (set-frame-parameter (selected-frame) 'alpha '(0.90))


;; ;; ------------------------------------------------------------------------
;; ;; カスタムテーマのロード
;; 
;; (setq custom-theme-directory "~/.emacs.d/themes/")
;; (load-theme 'FlatUI t)
;; 
;; 
;; ;; 背景色
;; (defvar fui-bg "#2b303b")
;; 
;; ;; コード色
;;  `(font-lock-builtin-face ((t (:foreground ,"#ab7967"))))
;;  `(font-lock-comment-face ((t (:slant italic :foreground ,"#65737e"))))
;;  `(font-lock-constant-face ((t (:slant italic :foreground ,"#d08770"))))
;;  `(font-lock-function-name-face ((t (:foreground ,"#8fa1b3"))))
;;  `(font-lock-keyword-face ((t (:foreground ,"#c0c5ce"))))
;;  `(font-lock-string-face ((t (:foreground ,"#a3be8c"))))
;;  `(font-lock-type-face ((t (:foreground ,"#ebcb8b"))))
;;  `(font-lock-variable-name-face ((t (:foreground ,"#bf616a"))))



;; ;; -------------------------------------------------------------------------
;; ;; @ whitespace
;; 
;; (global-whitespace-mode 1)
;; (setq whitespace-space-regexp "\\(\u3000\\)")
;; (setq whitespace-style '(face tabs tab-mark spaces space-mark))
;; (setq whitespace-display-mappings ())
;; (set-face-foreground 'whitespace-tab "#F1C40F")
;; (set-face-background 'whitespace-space "#E74C3C")
;; 
;; 
;; 
;; 
;; ;; -------------------------------------------------------------------------
;; ;;; package.el
;; (require 'package)
;; 
;; ;; MELPAを追加
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; 
;; ;; Marmaladeを追加
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 
;; ;; 初期化
;; (package-initialize)



;; ------------------------------------------------------------------------
;; @ autocomplete.el
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "C-m") 'ac-complete)


;; ;; ------------------------------------------------------------------------
;; ;; @ auto-complete-c-headers
;; ;; http://futurismo.biz/archives/3071
;; (require 'auto-complete-c-headers)
;; (add-hook 'c++-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
;; (add-hook 'c-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))


;; ------------------------------------------------------------------------
;; @ auto-install.el

;; パッケージのインストールを自動化
;; http://www.emacswiki.org/emacs/auto-install.el
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ------------------------------------------------------------------------
;; @ redo+.el

;; redoできるようにする
;; http://www.emacswiki.org/emacs/redo+.el
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-_") 'redo))


;; -------------------------------------------------------------------------
;;
;; tabbar
;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
;;

(require 'tabbar)
;; tabbar有効化
;(tabbar-mode 1)
(call-interactively 'tabbar-mode t)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; ;; グループ化しない
;(setq tabbar-buffer-groups-function nil)
;; タブグループを使用（t：有効，nil：無効）
(defvar tabbar-buffer-groups-function nil)
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
;(setq tabbar-separator '(1.1))
;; タブの表示間隔
(defvar tabbar-separator nil)
(setq tabbar-separator '(1.1))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "MeiryoKe_Gothic"
 :background "#34495E"
 :foreground "#EEEEEE"
 :height 0.95
 )
(set-face-attribute
 'tabbar-unselected nil
 :background "#34495E"
 :foreground "#EEEEEE"
 :box nil
)
(set-face-attribute
 'tabbar-modified nil
 :background "#E67E22"
 :foreground "#EEEEEE"
 :box nil
)
(set-face-attribute
 'tabbar-selected nil
 :background "#E74C3C"
 :foreground "#EEEEEE"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 0.95)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)


;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)



;; -------------------------------------------------------------------------
;; @ google-c-style

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;Cの場合自動改行とかインデントとか。
;; 自動改行+インデント
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;; センテンスの終了である ';' を入力したら、自動改行+インデント
             (c-toggle-auto-hungry-state 1)
             ;; RET キーで自動改行+インデント
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
             ))


;; -------------------------------------------------------------------------
;; @ minimap
(require 'minimap)



;; ------------------------------------------------------------------------
;; @anzu

(require 'anzu)
(global-anzu-mode +1)
(setq anzu-use-migemo t)
(setq anzu-search-threshold 1000)
(setq anzu-minimum-input-length 3)

(global-set-key (kbd "C-c r") 'anzu-query-replace)
(global-set-key (kbd "C-c R") 'anzu-query-replace-regexp)


;; -------------------------------------------------------------------------
;; helm
(require 'helm-config)
(helm-mode 1)


;; -------------------------------------------------------------------------
;; @expand region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; transient-mark-modeが nilでは動作しませんので注意
(transient-mark-mode t)

 
;; -------------------------------------------------------------------------
;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))




;; ;; -------------------------------------------------------------------------
;; ;;  @helm-swoop
;; 
;; ;;; この前にmigemoの設定が必要
;; (require 'helm-migemo)
;; ;;; この修正が必要
;; (eval-after-load "helm-migemo"
;;   '(defun helm-compile-source--candidates-in-buffer (source)
;;      (helm-aif (assoc 'candidates-in-buffer source)
;;          (append source
;;                  `((candidates
;;                     . ,(or (cdr it)
;;                            (lambda ()
;;                              ;; Do not use `source' because other plugins
;;                              ;; (such as helm-migemo) may change it
;;                              (helm-candidates-in-buffer (helm-get-current-source)))))
;;                    (volatile) (match identity)))
;;        source)))
;; 
;; 
;; (require 'helm-swoop)
;; ;;; isearchからの連携を考えるとC-r/C-sにも割り当て推奨
;; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;; 
;; ;;; 検索結果をcycleしない、お好みで
;; (setq helm-swoop-move-to-line-cycle nil)
;; 
;; (cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
;;   "シンボル検索用Migemo無効版helm-swoop"
;;   (interactive)
;;   (let ((helm-swoop-pre-input-function
;;          (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol)))))
;;     (helm-swoop :$source (delete '(migemo) (copy-sequence (helm-c-source-swoop)))
;;                 :$query $query :$multiline $multiline)))
;; ;;; C-M-:に割り当て
;; (global-set-key (kbd "C-M-:") 'helm-swoop-nomigemo)
;; 
;; ;;; [2014-11-25 Tue]
;; (when (featurep 'helm-anything)
;;   (defadvice helm-resume (around helm-swoop-resume activate)
;;     "helm-anything-resumeで復元できないのでその場合に限定して無効化"
;;     ad-do-it))
;; 
;; ;;; ace-isearch
;; (global-ace-isearch-mode 1)



;; -------------------------------------------------------------------------
;; highlight-symbol
(require 'highlight-symbol)
(setq highlight-symbol-colors
	  '(
;		"red1"
		"OrangeRed1"
;		"DarkOrange1"
;		"orange1"
		"gold1"
		"chartreuse1"
		"SpringGreen1"
		"cyan1"
		"blue1"
		"magenta1"
;		"brown1"
		)) ;; 使いたい色を設定、repeatしてくれる。

;; 適宜keybindの設定
(global-set-key (kbd "C-S-h") 'highlight-symbol-at-point)
(global-set-key (kbd "C-S-M-h") 'highlight-symbol-remove-all)


;; -------------------------------------------------------------------------
;; auto-highlight-symbol
(global-auto-highlight-symbol-mode t)



;; -------------------------------------------------------------------------
;; @multiple-cursors.el
;;
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; expand-regionで単語選択をして、バッファ内のその単語をmultiple-cursorsで置換する
(require 'smartrep)
(global-set-key (kbd "<C-M-return>") 'mc/edit-lines)
(smartrep-define-key
 global-map "C-." '(("C-n" . 'mc/mark-next-like-this)
                    ("C-p" . 'mc/mark-previous-like-this)
                    ("*"   . 'mc/mark-all-like-this)))


;; -------------------------------------------------------------------------
;; @yasnippet
;;自分用のスニペットフォルダと，拾ってきたスニペットフォルダの2つを作っておきます．
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet/mySnippets"
        "~/.emacs.d/elpa/yasnippet/snippets"
        ))

;; yas起動
(yas-global-mode 1)

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; helm interface
(eval-after-load "helm-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
              (selected (helm-other-buffer
                         `(((name . ,(format "%s" prompt))
                            (candidates . names)
                            (action . (("Insert snippet" . (lambda (arg) arg))))))
                         "*helm yas/prompt*")))
         (if selected
             (let ((n (position selected names :test 'equal)))
               (nth n choices))
           (signal 'quit "user quit!"))))
           (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))))



;; ;; ------------------------------------------------------------------------
;; ;; @ flymake.el
;; (require 'flymake)
;; 
;; ;; 色設定
;; (set-face-background 'flymake-errline "#E74C3C")
;; (set-face-foreground 'flymake-errline "white")
;; 
;; ;; チェック後にエラーしても終了しないようにする
;; (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;   (setq flymake-check-was-interrupted t))
;; (ad-activate 'flymake-post-syntax-check)
;; 
;; ;; C言語用
;; (defun flymake-c-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
;; 
;; (push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)
;; 
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;           (flymake-mode t)))

;; -----------------------------------------------------------------------------
;; http://tam5917.hatenablog.com/entry/20120917/1347844597
(require 'flymake nil t)

(defun flymake-get-make-cmdline (source base-dir)
  "redefinition to remove 'check-syntax' target"
  (list "make"
        (list "-s" "-C"
              base-dir
              (concat "CHK_SOURCES=" source)
              "SYNTAX_CHECK_MODE=1"
              )))

(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  "force to check syntax of C/C++ without Makefile"
  (if (file-exists-p "Makefile")
      (flymake-simple-make-init) ;; flymake built-in
    (flymake-simple-generic-init cmd opts)))

(defun flymake-simple-generic-init (cmd &optional opts)
  "Makefileがないときのコードチェック用関数"
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))

;; syntax checkが異常終了しても無視する
(defadvice flymake-post-syntax-check
  (before flymake-force-check-was-interrupted activate)
  (setq flymake-check-was-interrupted t))

;; C
(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only" "$CPPFLAGS")))

;; C++
(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only" "$CPPFLAGS")))

(push '("\\.[cCh]\\'" flymake-c-init) flymake-allowed-file-name-masks)
(push '("\\.\\(?:cc\|cpp\|CC\|CPP\\)\\'" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (flymake-mode t)))
;エラー表示
(defun my-flymake-display-err-menu-for-current-line ()
  "Displays the error/warning for the current line via popup-tip"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (menu-data (flymake-make-err-menu-data line-no line-err-info-list)))
    (if menu-data
        (popup-tip (mapconcat #'(lambda (err)
                                  (nth 0 err))
                              (nth 1 menu-data) "\n")))))


;; ;; ------------------------------------------------------------------------
;; ;; flycheck
;; ;; http://futurismo.biz/archives/3071
;; ;; ------------------------------------------------------------------------
;; (add-hook 'c-mode-common-hook 'flycheck-mode)
;; 
;; (defmacro flycheck-define-clike-checker (name command modes)
;;   `(flycheck-define-checker ,(intern (format "%s" name))
;;      ,(format "A %s checker using %s" name (car command))
;;      :command (,@command source-inplace)
;;      :error-patterns
;;      ((warning line-start (file-name) ":" line ":" column ": 警告:" (message) line-end)
;;       (error line-start (file-name) ":" line ":" column ": エラー:" (message) line-end))
;;      :modes ',modes))
;; (flycheck-define-clike-checker c-gcc-ja
;;              ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
;;              c-mode)
;; (add-to-list 'flycheck-checkers 'c-gcc-ja)
;; (flycheck-define-clike-checker c++-g++-ja
;;              ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11")
;;              c++-mode)
;; (add-to-list 'flycheck-checkers 'c++-g++-ja)



;; ;; ------------------------------------------------------------------------
;; ;; semantic-refactoring
;; ;; http://futurismo.biz/archives/3071
;; ;; ------------------------------------------------------------------------
;; (require 'srefactor)
;; (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
;; (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)


;; ;; ------------------------------------------------------------------------
;; ;; clang-complete-async
;; ;; http://futurismo.biz/archives/3071
;; ;; ------------------------------------------------------------------------
;; (require 'auto-complete-clang-async)
;;  
;; (defun ac-cc-mode-setup ()
;;   (setq ac-clang-complete-executable "~/.emacs.d/el-get/repo/clang-complete-async/clang-complete")
;;   (setq ac-sources (append ac-sources '(ac-source-clang-async)))
;;   (ac-clang-launch-completion-process))
;;  
;; (defun my-ac-config ()
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;;   (my-ac-config)


;; ;; ------------------------------------------------------------------------
;; ;; function-args
;; ;; http://futurismo.biz/archives/3071
;; ;; ------------------------------------------------------------------------
;; (require 'function-args)
;; (fa-config-default)
;;  
;; (define-key function-args-mode-map (kbd "M-o") nil)
;; (define-key c-mode-map (kbd "C-M-:") 'moo-complete)
;; (define-key c++-mode-map (kbd "C-M-:") 'moo-complete)
;;    
;; (custom-set-faces
;;  '(fa-face-hint ((t (:background "#3f3f3f" :foreground "#ffffff"))))
;;  '(fa-face-hint-bold ((t (:background "#3f3f3f" :weight bold))))
;;  '(fa-face-semi ((t (:background "#3f3f3f" :foreground "#ffffff" :weight bold))))
;;  '(fa-face-type ((t (:inherit (quote font-lock-type-face) :background "#3f3f3f"))))
;;  '(fa-face-type-bold ((t (:inherit (quote font-lock-type-face) :background "#999999" :bold t)))))


;; ;; ------------------------------------------------------------------------
;; ;; @ menu-tree.el
;; ;; メニューバー日本語化
;; ;; http://www11.atwiki.jp/s-irie/pages/13.html
;; (if (and (= emacs-major-version 22)
;;          (eq window-system 'x))
;;     (setq menu-tree-coding-system 'utf-8))
;; (require 'menu-tree nil t)



;; ------------------------------------------------------------------------
;; @ c-eldoc.el
;;カーソル付近にあるC言語の関数や変数のヘルプをエコーエリアに表示
(when (require 'c-eldoc nil t)
  (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'eldoc-idle-delay) 0.2)
              (set (make-local-variable 'eldoc-minor-mode-string) "")
              (c-turn-on-eldoc-mode))))




;; ------------------------------------------------------------------------------
;; rainbow-delimiters を使うための設定
;; http://qiita.com/megane42/items/ee71f1ff8652dbf94cf7
;; ------------------------------------------------------------------------------
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調する設定
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)


;; ------------------------------------------------------------------------------
;; ------------------------------------------------------------------------------
;;:: http://futurismo.biz/archives/2853
;; ------------------------------------------------------------------------
;; helm-all-mark-rings
(global-set-key (kbd "M-SPC") 'helm-all-mark-rings)


;; ------------------------------------------------------------------------
;; hl-anything
;; 永続的に, ハイライトを保持することが可能になる.
;; https://github.com/boyw165/hl-anything
;; M-x hl-save-highlights
;; M-x hl-restore-highlights
;; 以下の記事の解説が詳しい.
;; http://rubikitch.com/2014/12/28/hl-anything/
(require 'hl-anything)
(hl-highlight-mode 1)

(global-set-key (kbd "<f2>") 'hl-highlight-thingatpt-local)
(global-set-key (kbd "M-<f2>") 'hl-unhighlight-all-local)


;; ------------------------------------------------------------------------------
;; undo-tree
;; http://keisanbutsuriya.hateblo.jp/entry/2015/02/09/181012
;; ------------------------------------------------------------------------------
(require 'undo-tree)
(global-undo-tree-mode)


;; ------------------------------------------------------------------------------
;; powerline
;; http://blog.shibayu36.org/entry/2014/02/11/160945
;; ------------------------------------------------------------------------------
(require 'powerline)
(powerline-default-theme)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
;                    :background "#FF0066"
                    :background "dark green"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fff"
;                    :background "#FF6699"
                    :background "sea green"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#000"
;                    :background "#ffaeb9"
                    :background "light green"
                    :inherit 'mode-line)


;; ------------------------------------------------------------------------------
;; コメント部分の特定キーワードの表示を変える
;; http://ynomura.dip.jp/archives/2011/01/emacs_font_lock.html
;; ------------------------------------------------------------------------------
(font-lock-add-keywords nil '(
 (";"
  ("face\\|frame"
   nil  ;PRE-FORM
   (goto-char (match-end 0))  ;POST-FORM: pointを";"の直後に戻す
   (0 font-lock-type-face t))
  ("default"
   nil  ;PRE-FORM
   nil  ;POST-FORM
   (0 font-lock-builtin-face t))
  )))

;; if文が==じゃないときの警告
(add-hook 'c-mode-common-hook
  '(lambda ()
    (font-lock-add-keywords major-mode '(
      ("\\<if\\>"
       ("[^<>=]\\(=\\)[^=]" nil nil (1 font-lock-warning-face))
       )))
))


;; ------------------------------------------------------------------------------
;; インクリメント デクリメント
;; http://d.hatena.ne.jp/syohex/20130822/1377182089
;; ------------------------------------------------------------------------------
(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)


;; ------------------------------------------------------------------------------
;; smartrep.el
;; http://sheephead.homelinux.org/2011/12/19/6930/
;; ------------------------------------------------------------------------------



;; ------------------------------------------------------------------------------
;; hideshow
;; http://d.hatena.ne.jp/uhiaha888/20100720/1279618275
;; ------------------------------------------------------------------------------

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
					'c-mode-hook))
  (add-hook hook 'hideshowvis-enable))


;; ------------------------------------------------------------------------------
;; font-lock
;; http://homepage1.nifty.com/blankspace/emacs/color.html
;; ------------------------------------------------------------------------------
(defface my-face-gray '((t (:background "gray"))) nil)
(defface my-face-gray26 '((t (:background "gray26"))) nil)
(defface my-face-SteelBlue '((t (:foreground "SteelBlue" :underline t))) nil)
(defface my-face-yellow '((t (:foreground "yellow" :underline t))) nil)
(defface my-face-greenyellow '((t (:foreground "green yellow"))) nil)
(defvar my-face-gray 'my-face-gray)
(defvar my-face-gray26 'my-face-gray26)
(defvar my-face-SteelBlue 'my-face-SteelBlue)
(defvar my-face-yellow 'my-face-yellow)
(defvar my-face-greenyellow 'my-face-greenyellow)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   'c-mode
   '(
;	 ("\t" 0 my-face-gray26 append)
;     ("　" 0 my-face-gray append)
     ("TRUE" 0 my-face-greenyellow append)
     ("FALSE" 0 my-face-greenyellow append)
     ("0x[0-9a-fA-F]+" 0 my-face-SteelBlue append)
     ("[0-9]+" 0 my-face-SteelBlue append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)



;; ------------------------------------------------------------------------------
;; ggtags
;; http://futurismo.biz/archives/3071
;; ------------------------------------------------------------------------------
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))
 
;; use helm
(setq ggtags-completing-read-function nil)
 
;; use eldoc
(setq-local eldoc-documentation-function #'ggtags-eldoc-function)
 
;; imenu
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
 
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
 
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


;; ;; ------------------------------------------------------------------------------
;; ;; orglink
;; ;; http://rubikitch.com/2015/03/09/orglink/
;; ;; ------------------------------------------------------------------------------
;; ;;; orglink-modeを有効にするメジャーモード
;; (setq orglink-activate-in-modes
;;       '(emacs-lisp-mode ruby-mode))
;; (with-eval-after-load "orglink"
;;   ;; C-c C-oでもリンクを辿れるようにする
;;   (define-key orglink-mouse-map (kbd "C-c C-o") 'org-open-at-point-global)
;;   ;; M-TABで前のリンクに行けるようにする
;;   (define-key orglink-mouse-map (kbd "M-TAB") 'org-previous-link))
;; (global-orglink-mode 1)


;; ------------------------------------------------------------------------------
;; wiki-nav
;; http://rubikitch.com/2015/02/25/wiki-nav/
;; ------------------------------------------------------------------------------
;;; [[KeyBinding]]
;;; [[EnableOnDemand]]
;;; [[Examples]]
;;; [[日本語]]
;;; [[<KeyBinding]]
;;; wiki link間をM-p/M-nで辿れるように
(setq wiki-nav-find-any-link-keys '("M-n"))
(setq wiki-nav-find-any-previous-link-keys '("M-p"))
(setq wiki-nav-skip-to-next-keys '("<tab>" "M-n"))
(setq wiki-nav-skip-to-previous-keys '("S-TAB" "S-<tab>" "<backtab>" "S-<iso-lefttab>" "M-p"))
;;; wiki-nav内ではM-mとC-c C-o(org-mode風)でも辿れるように
(setq wiki-nav-activate-keys '("RET" "M-m" "C-c C-o"))
;;; なんでvisit:というスキームなの？file:くらいサポートすべきよね？？
(setq wiki-nav-visit-link-pattern "\\`\\(?:file\\|visit\\):\\([^:\n]+?\\)\\(?:\\|:\\([^\n]*\\)\\)\\'")
;;; [[<EnableOnDemand]]
;;; wiki-nav記法があるときのみ有効にする
(defun wiki-nav-enable-maybe ()
  (unless (bound-and-true-p wiki-nav-mode)
    (save-excursion
      (goto-char (point-min))
      (when (search-forward "[[<" nil t)
        (wiki-nav-mode 1)
        (run-at-time 0.5 nil 'message "Enable wiki-nav-mode.")))))
;;; ファイルを開くときにwiki-nav記法をチェック
(add-hook 'find-file-hook 'wiki-nav-enable-maybe)
;;; 3秒間のアイドル時にwiki-nav記法をチェック
(run-with-idle-timer 3 t 'wiki-nav-enable-maybe)
;;; [[<Examples]]
;;; [[http://rubikitch.com/]]
;;; [[visit:~/.emacs.d/init.el]] ファイルへのリンク
;;; [[visit:~/.emacs.d/init.el:line:3]] init.elの3行目へ
;;; [[file:~/.emacs.d/init.el]]  これも使えるように設定
;;; [[func:wiki-nav-enable-maybe]] ファイル内の関数へのリンク
;;; [[function:wiki-nav-enable-maybe]] 同様
;;; [[line:2]] 2行目へのリンク
;;; [[<日本語]] 日本語もＯＫ


;; ------------------------------------------------------------------------------
;; bm
;; http://rubikitch.com/2014/12/17/bm-repository-open/
;; ------------------------------------------------------------------------------
(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
(global-set-key (kbd "M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

(defun bm-find-files-in-repository ()
  (interactive)
  (cl-loop for (key . _) in bm-repository
           when (file-exists-p key)
           do (find-file-noselect key)))
(defun bm-repository-load-and-open ()
  (interactive)
  (bm-repository-load)
  (bm-find-files-in-repository))

(setq bm-repository-file "~/.emacs.d/bm-repository")
(setq-default bm-buffer-persistence t)
(setq bm-restore-repository-on-load t)
(add-hook 'after-init-hook 'bm-repository-load-and-open)
(defun bm-buffer-restore-safe ()
  (ignore-errors (bm-buffer-restore)))
(add-hook 'find-file-hooks 'bm-buffer-restore-safe)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(defun bm-save-to-repository ()
  (interactive)
  (unless noninteractive
    (bm-buffer-save-all)
    (bm-repository-save)))
(add-hook 'kill-emacs-hook 'bm-save-to-repository)
(run-with-idle-timer 600 t 'bm-save-to-repository)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'before-save-hook 'bm-buffer-save)

(require 'helm-bm)
;; migemoくらいつけようね
(push '(migemo) helm-source-bm)
;; annotationはあまり使わないので仕切り線で表示件数減るの嫌
(setq helm-source-bm (delete '(multiline) helm-source-bm))

;; ------------------------------------------------------------------------------
;; ------------------------------------------------------------------------------

;; ------------------------------------------------------------------------------
;; ------------------------------------------------------------------------------

;; ------------------------------------------------------------------------------
;; ------------------------------------------------------------------------------











;;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;;=====================================
;;;カレント行を２重化する。同じような行をたくさん書く人へ。 
;;=====================================
(defun multi-line (&optional ARG) 
"Multiply current line." 
(interactive"*p") 
(let ((cnt 0) 
(pt (point))) 
(save-excursion 
(end-of-line) 
;;;;;以下4行俺のオリジナル
;;;;;二重化した行をkill-ringに入れない。
(setq kill-new (buffer-substring-no-properties (point) (progn 
(beginning-of-line) 
(point)))) 
(insert kill-new)
;;;;;以下3行は元のソース
;; (copy-region-as-kill (point) (progn 
;; (beginning-of-line) 
;; (point)))
(if (null ARG) 
(setq ARG 1)) 
(while (< cnt ARG) 
;;(yank) ;;;;;kill-ringの中身を貼り付けないようにするため。
(newline) 
(setq cnt (1+ cnt)))) 
(goto-char pt))) 
;; キーバインド
;; (global-set-key [?\M-=] 'multi-line) 
(global-set-key [S-f10] 'multi-line) 


;;=====================================
;; 15.5.1 文字の折り返し無効
;;-------------------------------------
;; default- を追加しないとできなかった。
;;=====================================
(setq-default default-truncate-lines t)
(setq-default default-truncate-partial-width-windows t)

;;=====================================
;;; 30.3 2 分割した画面を入れ替える
;;-------------------------------------
;;;上下あるいは左右のバッファを入れ替えることができます．

;;;詳しい使い方は?
;;;上記の設定をしていれば，f2で入れ替えることができます．あるいは，M-x swap-screen でも入れ替えることができます． 
;;=====================================
;;;汎用機の SPF (mule みたいなやつ) には
;;;画面を 2 分割したときの 上下を入れ替える swap screen
;;;というのが PF 何番かにわりあてられていました。
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

;;=====================================
;;; 30.4 横分割と縦分割を切り替える 
;;-------------------------------------
;;;C-x 2で上下 2 つに分けた状態とC-x 3で左右 2 つに分けた状態をM-x window-toggle-divisionで切り替えることができます．
;;=====================================
(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)

    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally)
      )

    (switch-to-buffer-other-window other-buf)
    (other-window -1)))

;; #キー割付
(global-set-key [C-f2] 'window-toggle-division)






;; (global-set-key [C-S-f3] 'gtags-find-tag)    ;関数の定義元へ
;; (global-set-key [C-S-f4] 'gtags-find-rtag)   ;関数の参照先へ
;; (global-set-key [C-S-f5] 'gtags-find-symbol) ;変数の定義元/参照先へ
;; (global-set-key [C-S-f6] 'gtags-find-file)
;; (global-set-key [C-S-f7] 'gtags-find-pattern)
;; (global-set-key [C-S-f8] 'gtags-find-tag-from-here)
;; (global-set-key [C-S-f10] 'gtags-pop-stack)
;; (global-set-key [kp-numlock] 'gtags-pop-stack)    ;前のバッファに戻る
;; 
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (gtags-mode 1)
;;              (gtags-make-complete-list)
;;              ))
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (gtags-mode 1)
;;              (gtags-make-complete-list)
;;              ))

;; helm-gtagsに移行
(require 'helm-config)
(require 'helm-gtags)

(add-hook 'c-mode-hook 'helm-gtags-mode)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))



;; ====================================
;; 46.2.1 繰り返し処理の自動繰り返し ― dmacro  
;; ------------------------------------
(defconst *dmacro-key* "\C-t" "\C-@")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)


;; ====================================
;;  49.2.1 isearch で C-w のように文字を 1 文字ずつ追加
;; ------------------------------------
;; -s C-wとすると， isearch でカーソル付近の単語が追加されます．しかし，日本語では非常に長い部分が追加されてしまい，不便です． 
;; こで，以下のような設定を追加します．すると，C-s C-dとすると，カーソル付近の文字を 1 文字ずつ追加してくれます． 
;; ====================================
(defun isearch-yank-char ()
  "Pull next character from buffer into search string."
  (interactive)
  (isearch-yank-string
   (save-excursion
     (and (not isearch-forward) isearch-other-end
          (goto-char isearch-other-end))
     (buffer-substring (point) (1+ (point))))))
(define-key isearch-mode-map "\C-f" 'isearch-yank-char)


;; ====================================
;;  49.2.2 isearch の検索語を 1 文字ずつ消す
;; ------------------------------------
;; Sのように単語全体ではなく，一文字ずつ消していくことができます．
;; 
;; 詳しい使い方は?
;; 単語をC-wで追加した後，C-oとすると一文字ずつ消していくことができます． 
;; ====================================
(defun isearch-real-delete-char ()
  (interactive)
  (setq isearch-string
        (if (= (length isearch-string) 1)
            isearch-string
          (substring isearch-string 0 (- (length isearch-string) 1)))
        isearch-message isearch-string
        isearch-yank-flag t)
  (isearch-search-and-update))

(define-key isearch-mode-map "\C-b" 'isearch-real-delete-char)



;;=====================================
;;; 42.9.4 対応する括弧へ飛ぶ
;;-------------------------------------
;;以下のように .emacs に記入しておくと C-x %で対応する括弧に簡単に飛べるようになります.
;;=====================================
(progn
  (defvar com-point nil
    "Remember com point as a marker. \(buffer specific\)")
  (set-default 'com-point (make-marker))
  (defun getcom (arg)
    "Get com part of prefix-argument ARG."
    (cond ((null arg) nil)
          ((consp arg) (cdr arg))
          (t nil)))
  (defun paren-match (arg)
    "Go to the matching parenthesis."
    (interactive "P")
    (let ((com (getcom arg)))
      (if (numberp arg)
          (if (or (> arg 99) (< arg 1))
              (error "Prefix must be between 1 and 99.")
            (goto-char
             (if (> (point-max) 80000)
                 (* (/ (point-max) 100) arg)
               (/ (* (point-max) arg) 100)))
            (back-to-indentation))
        (cond ((looking-at "[\(\[{]")
               (if com (move-marker com-point (point)))
               (forward-sexp 1)
               (if com
                   (paren-match nil com)
                 (backward-char)))
;;               ((looking-at "[])]"})
              ((looking-at "[\]\)}]")   ;ソースがおかしいので修正 2006/4/18
               (forward-char)
               (if com (move-marker com-point (point)))
               (backward-sexp 1)
               (if com (paren-match nil com)))
              (t (error ""))))))
  (define-key ctl-x-map "%" 'paren-match))


;;=====================================
;; hide-ifdef-mode
;;=====================================
;; C モードで `#ifdef' マクロをプリプロセッサで処理したように表示させる方法は? 
;; M-x hide-ifdef-mode (マイナーモードです。標準付属)。 
;;
;; C-c @ u    hide-ifdef-undef   : シンボルの登録, undef
;; C-c @ d    hide-ifdef-define  : シンボルの登録, define
;;    	    	    	    	    	
;; C-c @ U    hide-ifdef-use-define-alist
;;              指定した名前のシンボル登録リストをこのバッファで使用する。
;; C-c @ D    hide-ifdef-set-define-alist
;;    	    	現在のシンボル登録のうち、define状態にあるものだけを
;;    	    	シンボル登録リストに抜きだし、そのリストに名前を付ける
;;              （別のファイルで使用する(C-c @ U)ため）
;;    	    	    	    	    	
;; C-c @ s    show-ifdefs        : 全てのifdefブロックを見せる
;; C-c @ h    hide-ifdefs        : 定義したシンボル以外のifdefブロックを隠すh
;;
;; C-c @ C-q  hide-ifdef-toggle-read-only      
;;  	    	隠されたテキストがある場合に、Read Onlyにする／しない、をトグルする 
;;    	    	
;; C-c @ C-s  show-ifdef-block  : カーソル位置のifdefブロックを見せる
;; C-c @ C-d  hide-ifdef-block	: カーソル位置のifdefブロックを隠す

;; 変数:
;; hide-ifdef-env
;;     バッファ・ローカル変数。
;;     C-c hでは、この変数を参照してどのifdefブロックを隠すかを決定する。
;;     ((シンボル . 定義状態) (シンボル . 定義状態)   ……)
;;     の形式のリスト。シンボルは、文字列ではなく、Lispのシンボル。
;;     定義状態は、define状態ならt, undef状態ならnil。
;;     この変数をグローバルに設定(setq-default)して、
;;     デフォルトとして使用することができる。
;; 
;; hide-ifdef-define-alist
;;     C-c Dによって設定される、シンボル登録リストの連想リスト。
;;     C-c Dによって、hide-ifdef-envからシンボルを抜きだしリストとし、
;;     名前をつけてこの連想リストに登録する。
;;     C-c Uによって、この連想リストからシンボル登録リストを取り出し、
;;     hide-ifdef-envに設定できる。
;; 
;; hide-ifdef-lines
;;     nil以外に設定すると、C-c h等でテキストを隠す際に、
;;     #if..., #else, #endifの書かれた行自体も隠す。
;; 
;; hide-ifdef-initially
;;     nil以外の場合、hideifモードに入ると同時に、テキストが隠される。
;; 
;; hide-ifdef-read-only
;;     nil以外の場合、テキストを隠している間はRead Onlyになる。
;;     C-c C-qコマンドで、トグルする。


(add-hook 'c-mode-common-hook
          '(lambda()
             (hide-ifdef-mode 1) ;Cのソースを開いたら自動的にmodeをon
             ))

;; 有効な define を設定（シンボル登録リストを設定）
(setq-default hide-ifdef-define-alist
      ;; 登録リスト名　    define1　       define2 .....  
      '((list-name-linux __TARGET__LINUX__ USE_USB USE_NETWORK DEBUG_TEST SAMPLE)
;;      '((PIONEER_NB037 LET_PRO_DEBUG)
	 	(list-name-ma
;;::
			USE_SIMULATOR
            DRV_SYS_DEBUG_OSM
            DRV_SYS_DEBUG_FLASH
            HTP_CPPUNIT_DEBUG
;            WDT_SH7262
            __CSW_DEST_EU__
;;sub cpu
            START_SEQ
            FAIL_SAFE_EFFECT
								)
	))


;; ;; (setq hide-ifdef-define-alist ( append (list-name-ma '(DIAG_LET_MODE LET_PRO_DEBUG))))

;; デフォルトの シンボル登録リストの設定
(add-hook 'hide-ifdef-mode-hook
          '(lambda () (hide-ifdef-use-define-alist 'list-name-ma)))

;; 変数:
;; hide-ifdef-env
;;     バッファ・ローカル変数。
;;     C-c hでは、この変数を参照してどのifdefブロックを隠すかを決定する。
;;     ((シンボル . 定義状態) (シンボル . 定義状態)   ……)
;;     の形式のリスト。シンボルは、文字列ではなく、Lispのシンボル。
;;     定義状態は、define状態ならt, undef状態ならnil。
;;     この変数をグローバルに設定(setq-default)して、
;;     デフォルトとして使用することができる。

(setq hide-ifdef-initially t)		; nil以外の場合、hideifモードに入ると同時に、テキストが隠される。
(setq hide-ifdef-lines nil)			; nil以外に設定すると、C-c h等でテキストを隠す際に、#if..., #else, #endifの書かれた行自体も隠す。
(setq hide-ifdef-read-only nil)		; nil以外の場合、テキストを隠している間はRead Onlyになる。C-c C-qコマンドで、トグルする。










(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-safe-themes
   (quote
    ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "33e6cfb654f07e565038fbb7ae00592dde82d72f75d6cb76bbe7052cd45fcce4" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#839496")
 '(tabbar-mode t nil (tabbar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; coding: utf-8
;; mode: emacs-lisp
;; End:

;;; ends here
