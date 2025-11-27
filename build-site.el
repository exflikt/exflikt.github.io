(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(package-install 'ox-reveal)
(load-library "ox-reveal")

(require 'ox-publish)

(setq org-confirm-babel-evaluate nil
      org-html-validation-link nil
      org-html-scripts nil)

(setq org-publish-project-alist
      (list
       (list "assets"
             :base-directory "./content/assets/"
             :base-extension "jpg\\|png"
             :publishing-directory "./public/assets/"
             :publishing-function 'org-publish-attachment)
       (list "blog"
             :recursive t
             :base-directory "./content/"
             :exclude "./content/slide/.*"
             :publishing-directory "./public/"
             :publishing-function 'org-html-publish-to-html
             :language "en"          ;; LANGUAGE:
             :section-numbers nil    ;; OPTIONS: num:
             :time-stamp-file nil    ;; OPTIONS: timestamp:
             :with-author nil        ;; OPTIONS: author:
             :with-date nil          ;; OPTIONS: date:
             :with-toc nil           ;; OPTIONS: toc:
             :with-tags nil          ;; OPTIONS: tags:
             :with-tasks nil         ;; OPTIONS: tasks:
             :with-timestamps nil    ;; OPTIONS: <:
             :with-title nil         ;; OPTIONS: title:
             :with-todo-keywords nil ;; OPTIONS: todo:nil
             )
       (list "slide"
             :base-directory "./content/slide/"
             :publishing-directory "./public/slide/"
             :publishing-function 'org-reveal-publish-to-reveal)
       (list "blog.wayoverd.one"
             :components (list "assets" "blog" "slide"))))

(org-publish "blog.wayoverd.one" t)
