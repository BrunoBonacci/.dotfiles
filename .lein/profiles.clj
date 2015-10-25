{:user
 {:repl-options {:init (set! *print-length* 100)}
  :plugins
  [
   [refactor-nrepl "2.0.0-SNAPSHOT"]
   [cider/cider-nrepl "0.10.0-SNAPSHOT"]
   [lein-midje "3.1.3"]
   [lein-try "0.4.1"]
   [lein-marginalia "0.7.1"]
   [lein-bin "0.3.5"]
   [lein-ancient "0.5.4"]
   [jonase/eastwood "0.0.2"]
   [lein-auto "0.1.1"]
   ]
  :dependencies
  [[alembic "0.3.2"]
   [criterium "0.4.3"]
   [org.clojure/tools.nrepl "0.2.11"]
   ]}}
