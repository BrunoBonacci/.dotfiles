{:user
 {:repl-options {:init (do (set! *print-length* 100)
                           (require '[com.brunobonacci.repl-driven-dev-tools]))}
  :jvm-opts ["-server" "-Dfile.encoding=UTF-8"]
  :dependencies [[com.brunobonacci/repl-driven-dev-tools "LATEST"]
                 [com.github.jpmonettas/flow-storm-dbg "2.2.114"]
                 [com.github.jpmonettas/flow-storm-inst "2.2.114"]]


  :plugins
  [[lein-auto "0.1.3"]]


  :aliases
  {"clean-clojure"
   ["with-profile" "tools" "cljfmt" "fix"]}}


 :dev
 {:plugins
  [[lein-jmh "0.2.8"]
   [lein-midje "3.2.2"]
   ]

  :dependencies
  [#_[alembic "0.3.2"]
   #_[clj-commons/pomegranate "1.2.0"]
   [criterium "0.4.6"]
   [com.clojure-goes-fast/clj-async-profiler "0.4.1"]
   [jmh-clojure "0.3.1"]
   ]

  }


 :quality
 {:plugins
  [[jonase/eastwood "0.3.10"] ;; code smells / linting
   [lein-kibit      "0.1.6"]  ;; check idiomatic clojure
   [lein-ancient    "0.6.15"] ;; check/update dependencies
   [lein-cloverage  "1.2.2"]  ;; code coverage
   [lein-nvd        "1.4.1"]  ;; security scan
   [venantius/yagni "0.1.4"]  ;; dead code elimination
   [lein-bikeshed   "0.5.1"]  ;; check code smells
   [lein-checkall   "0.1.1"] ;; like lein check, kibit, eastwood bikeshed
   ]}

 :tools
 {:plugins
  [[lein-binplus "0.6.4"]  ;; build executable jars
   [lein-ancient "0.6.15"] ;; check/update dependencies
   [lein-shell   "0.5.0"]  ;; run shell commands
   [lein-cljfmt  "0.6.8"]  ;; source code formatting
   #_[samsara/lein-template "0.1.0-SNAPSHOT"]
   ]

  :cljfmt {:remove-consecutive-blank-lines? false
           :remove-surrounding-whitespace?  false
           :indents ^:replace {#".*"   [[:inner 0]]}}
  }
 :tools2
 {:plugins
  [[com.livingsocial/lein-dependency-check "1.0.2"] ;; security scan
   [lein-instant-cheatsheet "2.2.2"] ;; create checksheets for your projects
   [org.timmc/nephila "0.3.0"]       ;; namespace dep graph
   ]
  }

 }


;; lein-extend-cp - local lib dir
