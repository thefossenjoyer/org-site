(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

(require 'ox-publish)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil ;; skloni podrazumevani JS :(
      org-html-head-include-default-style nil ;; skloni podrazumevani css
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />"
      )

(setq org-publish-project-alist
      (list
       
       (list "test"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-toc nil
	     :with-author nil
	     :with-creator nil
	     :section-numbers nil
	     :time-stamp-file nil)
       ))

(org-publish-all t)

(message "Izvozenje sajta je gotovo.")
