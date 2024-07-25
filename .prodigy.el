;; create prodigy configurtion

(require 'prodigy)

;; reset status
(setq prodigy-services '())


(prodigy-define-service
  :name "Jaeger - http://localhost:16686/"
  :cwd "/Users/bruno/work/projects/redefine/mono"
  :command "docker-compose"
  :args '("-f" "docker-compose-jaeger.yaml" "up")
  :tags '(dev)
  :kill-process-buffer-on-stop nil)


(prodigy-define-service
  :name "Jaeger - STOP"
  :cwd "/Users/bruno/work/projects/redefine/mono"
  :command "docker-compose"
  :args '("-f" "docker-compose-jaeger.yaml" "down")
  :tags '()
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)



(prodigy-define-service
  :name "Blog Jekyll - serve http://localhost:4000/"
  :cwd "/Users/bruno/work/oss/bits-and-pieces"
  :command "docker"
  :args '("run" "--rm" "-it"
          "-v" ".:/srv/jekyll"
          "-v" "/tmp/vendor/bundle:/usr/local/bundle"
          "-p" "4000:4000"
          "jekyll/jekyll:3.8"
          "jekyll" "serve" "--watch")
  :tags '()
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)


(prodigy-define-service
  :name "Blog Jekyll - build site"
  :cwd "/Users/bruno/work/oss/bits-and-pieces"
  :command "docker"
  :args '("run" "--rm" "-it"
          "-v" ".:/srv/jekyll"
          "-v" "/tmp/vendor/bundle:/usr/local/bundle"
          "jekyll/jekyll:3.8"
          "jekyll" "build")
  :tags '()
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)


(prodigy-define-service
  :name "Blog redefine site - http://localhost:3000/   "
  :cwd "/Users/bruno/work/projects/redefine/hierachical/website/redefine-io.github.io"
  :command "docker"
  :args '("run" "--rm" "-it"
          "-p" "3000:3000"
          "-v" ".:/app"
          "-v/app/node_modules"
          "-v/app/dist"
          "website")
  :tags '()
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t)

;;; .prodigy.el ends here
