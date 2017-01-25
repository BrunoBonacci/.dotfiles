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
   [lein-binplus "0.4.2"]
   [lein-ancient "0.6.10"]
   [jonase/eastwood "0.2.3"]
   [lein-kibit "0.1.3"]
   [lein-shell "0.5.0"]
   [lein-cloverage "1.0.7-SNAPSHOT"]
   #_[samsara/lein-template "0.1.0-SNAPSHOT"]
   ]
  }}
