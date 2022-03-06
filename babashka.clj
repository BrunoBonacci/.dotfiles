(require
  '[where.core :refer [where]]
  '[cheshire.core :as json]
  '[clojure.string :as str]
  '[clojure.java.io :as io]
  '[babashka.curl :as curl])


(defn printerr
  [& args]
  (binding [*out* *err*]
    (apply println args)))



(defn sys-env
  []
  (into {} (System/getenv)))



(defn sh
  [cmd & {:keys [dir env]}]
  (shell/sh "bash" "-c" cmd :dir dir :env (merge (sys-env) env)))



(defn sh!
  [cmd & {:keys [dir env hide?]}]
  (when-not hide?
    (println cmd))
  (let [{:keys [out err exit] :as p} (sh cmd :dir dir :env env)]
    (when (not (empty? out))
      (println out))
    (when (not (empty? err))
      (printerr err))
    (when (> exit 0)
      (throw (ex-info (str "Command error: " (when-not hide? cmd)) p)))
    out))



(defn shf!
  "Execute a command-template as in `format` rendered with the arguments"
  {:arglists '([cmd-template & args] [{:keys [dir env hide?]} cmd-template & args])}
  [cmd1 & [cmd2 & args2 :as args]]
  (if (map? cmd1)
    (sh! (apply format cmd2 args2) :dir (:dir cmd1) :env (:env cmd1) :hide? (:hide? cmd1))
    (sh! (apply format cmd1 args))))



(defn from-json
  [s]
  (json/parse-string s true))


(defn to-json
  [s]
  (json/generate-string s))


(defn now
  []
  (System/currentTimeMillis))


(defn uuid
  []
  (str (java.util.UUID/randomUUID)))
