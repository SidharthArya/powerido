;; powerido.el -- A powerful IDO based completion framework
(require 'ido)
(defun powerido-init()
  "Initialize this package into emacs"
  
(setq ido-decorations '("\n > " "" " \n " " | ..." "\n >>" "" " \n[No Match] " " \n[Matched]" " \n[Not readable]" " [Too big]" " \n[Confirm]"))
)
(setq ido-auto-merge-timer nil)
(setq ido-auto-merge-delay-time 2000)

(powerido-init)
(defun powerido-M-x()
  "Interactively do M-x"
  (interactive)
  (funcall-interactively (intern (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp)))))


(defun powerido-mark-ring()
  "Interactively do M-x"
  (interactive)
  (goto-char (string-to-number (nth 2 (split-string (ido-completing-read
          "Marker: "
          (mapcar (lambda(a) (format "%s" a)) mark-ring)))))))

(defun powerido-kill-ring()
  "Interactively do M-x"
  (interactive)
  (insert 
  (ido-completing-read
   "Kill Ring:" kill-ring)))

(provide 'powerido)
