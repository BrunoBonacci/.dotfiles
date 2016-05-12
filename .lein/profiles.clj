{:user
 {:repl-options {:init (set! *print-length* 100)}
  :plugins
  [[lein-midje "3.2"]
   [lein-try "0.4.1"]
   [lein-marginalia "0.7.1"]
   [lein-binplus "0.4.1"]
   [lein-ancient "0.5.4"]
   [jonase/eastwood "0.2.1"]
   [lein-auto "0.1.1"]
   [lein-shell "0.5.0"]
   [lein-gorilla "0.3.6" :exclusions [[cider/cider-nrepl]]]
   ]
  :dependencies
  [[alembic "0.3.2"]
   [criterium "0.4.3"]
   [org.clojure/tools.nrepl "0.2.12"]
   ]}
 :repl {:plugins
        [
         [refactor-nrepl "2.2.0-SNAPSHOT"]
         ]}}
