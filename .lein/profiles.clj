{:user
 {:repl-options {:init (do (set! *print-length* 100)
                           (require '[com.brunobonacci.repl-driven-dev-tools]))
                 :nrepl-middleware [portal.nrepl/wrap-portal]}
  :jvm-opts ["-server" "-Dfile.encoding=UTF-8" "-XX:-OmitStackTraceInFastThrow"]
  :dependencies [[com.brunobonacci/repl-driven-dev-tools "LATEST"]
                 [com.github.flow-storm/flow-storm-dbg "3.17.0"
                  :exclusions [[org.slf4j/slf4j-nop]]]
                 [djblue/portal "0.56.0"]
                 [io.github.tonsky/clj-reload "0.7.0"]]

  :plugins
  [[lein-auto "0.1.3"]
   [lein-git-deps "0.0.1-SNAPSHOT"]
   #_[polylith/lein-polylith "LATEST"]]

  :aliases
  {"clean-clojure"
   ["with-profile" "tools" "cljfmt" "fix"]}}

  ;; git down setup
  ;; [reifyhealth/lein-git-down "0.4.0"]

  ;; :middleware [lein-git-down.plugin/inject-properties]

  ;;:repositories [["public-github" {:url "git://github.com"}]
  ;;               ["private-github" {:url "git://github.com" :protocol :ssh}]]

  ;;:git-down {org.clojure/tools.deps.alpha
  ;;           {:coordinates clojure/tools.deps.alpha
  ;;            :src-root "src/main/clojure"
  ;;            :resource-root "src/main/resources"
  ;;            }}



 :dev
 {:plugins
  [[lein-jmh "0.3.0"]
   [lein-midje "3.2.2"]
   [lein-virgil "0.1.9"]]

  :dependencies
  [#_[alembic "0.3.2"]
   #_[clj-commons/pomegranate "1.2.0"]
   [criterium "0.4.6"]
   [com.clojure-goes-fast/clj-async-profiler "1.0.4"]
   [com.clojure-goes-fast/clj-java-decompiler "0.3.4"]
   [com.clojure-goes-fast/clj-memory-meter "0.3.0"]
   [jmh-clojure "0.4.1"]
   ]

  }


 :quality
 {:plugins
  [[jonase/eastwood "1.2.3"] ;; code smells / linting
   [lein-kibit      "0.1.8"] ;; check idiomatic clojure
   [lein-ancient    "0.7.0"] ;; check/update dependencies
   [lein-cloverage  "1.2.3"] ;; code coverage
   [lein-nvd        "2.0.0"] ;; security scan
   [venantius/yagni "0.1.7"] ;; dead code elimination
   [lein-bikeshed   "0.5.2"] ;; check code smells
   [lein-checkall   "0.1.1"] ;; like lein check, kibit, eastwood bikeshed
   ]}

 :tools
 {:plugins
  [[lein-ancient "1.0.0-RC3"]           ;; check/update dependencies
   [lein-shell   "0.5.0"]               ;; run shell commands
   [lein-cljfmt  "0.8.0"]               ;; source code formatting
   [lein-ns-dep-graph "0.4.0-SNAPSHOT"] ;; namespace dependency graph
   [org.clj-commons/lein-vizdeps "1.0"] ;; dependency graph
   #_[samsara/lein-template "0.1.0-SNAPSHOT"]
   ]

  :cljfmt {:remove-consecutive-blank-lines? false
           :remove-surrounding-whitespace?  false
           :indents ^:replace {#".*"   [[:inner 0]]}}
  }
 :tools2
 {:plugins
  [[com.livingsocial/lein-dependency-check "1.3.0"] ;; security scan
   [lein-instant-cheatsheet "2.2.2"] ;; create checksheets for your projects
   [org.timmc/nephila "0.3.0"]       ;; namespace dep graph
   ]
  }

 }


;; lein-extend-cp - local lib dir
