{:user
 {:repl-options {:init (set! *print-length* 100)}
  :jvm-opts ["-server" "-Dfile.encoding=UTF-8"]
  :plugins
  [[lein-auto "0.1.3"]]}
 :repl
 {:plugins
  []
  :dependencies
  [[alembic "0.3.2"]
   [criterium "0.4.4"]]}
 :tools
 {:plugins
  [[lein-try "0.4.3"]
   [lein-binplus "0.6.2"]
   [lein-ancient "0.6.10"]
   [lein-shell "0.5.0"]
   [lein-cloverage "1.0.7-SNAPSHOT"]
   [lein-cljfmt "0.5.6"]
   [venantius/yagni "0.1.4"]
   [lein-bikeshed "0.4.1"]
   [jonase/eastwood "0.2.4"]
   [lein-kibit "0.1.5"]
   [lein-checkall "0.1.1"]
   #_[samsara/lein-template "0.1.0-SNAPSHOT"]
   ]
  }
 :tools2
 {:plugins
  [[com.livingsocial/lein-dependency-check "0.2.2"] ;; security scan
   [lein-instant-cheatsheet "2.2.1"]
   [org.timmc/nephila "0.3.0"] ;; namespace dep graph
   ]
  }}


;; lein-extend-cp - local lib dir
