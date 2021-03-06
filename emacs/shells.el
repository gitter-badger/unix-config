(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(let ((path (if (eq window-system 'ns)
				(shell-command-to-string "source ~/.profile; source ~/mybash_profile; echo $PATH")
			  (shell-command-to-string "source ~/.bashrc; echo $PATH"))))
  (setenv "PATH" path)
  (setq exec-path
		(append (split-string-and-unquote path ":") exec-path))) 

(setq shell-command-switch "-ic")

(add-hook 'eshell-mode-hook
		  (lambda ()
            (evil-mode)
			(evil-emacs-state)))

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map
                [remap eshell-pcomplete]
                'helm-esh-pcomplete)))


(provide 'shells)