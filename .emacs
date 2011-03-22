
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Add Extra Packages Path ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Load External Packages ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(load "ipython")
;(load "viper")

(setq viper-mode)
(require 'viper)
(require 'vimpulse)
(require 'ipython)

(setq py-python-command-args '("-pylab" "-colors" "LightBG"))

(setq ansi-color-for-comint-mode t)

;; Init message
(message "* --[ Loading my Emacs init file ]--")

;; uptimes
(setq emacs-load-start-time (current-time))

;;;;;;;,FIXME:;;;;
;;(load "gnuserv")
;;(gnuserv-start)
;;;;;;;;;;;;;;;;;;

;;; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;; Set default tab-width
(setq-default tab-width 4)

;; no window mode
;; TODO:


;; ===== Set the highlight current line minor mode =====

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

(global-hl-line-mode 0)

;; ========== Line by line scrolling ==========

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; ========== Support Wheel Mouse Scrolling ==========

(mouse-wheel-mode t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.

(setq auto-fill-mode 1)


;; type y or n for yes or no

(fset 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;;;;;;;
;; UTF-8
;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(setq default-buffer-file-coding-system 'utf-8)

; Yank the text and go down a line ;;;
(defun yank-and-down ()
  "Yank the text and go down a line."
  (interactive)
  (yank)
  (exchange-point-and-mark)
  (next-line))
  (move-beginning-of-line 0)

(global-set-key [(control shift y)] 'yank-and-down)


;; undo some previous changes
(global-set-key (kbd "<f11>") 'undo)

;; redo the most recent undo
;;(when (try-require 'redo)
(global-set-key (kbd "<S-f11>") 'redo)
;;)

;;;;;;;;;;;;;;;;;;;
;; Duplicate Line;;
;;;;;;;;;;;;;;;;;;;
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
)
(global-set-key (kbd "C-d") 'duplicate-line)


