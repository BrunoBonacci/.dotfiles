;; create prodigy configurtion

(require 'prodigy)

;; reset status
(setq prodigy-services '())

;;
;; SAMSARA
;; Ingestion API
(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / Ingestion-APIs / console"
        :cwd "/workspace/samsara/ingestion-api"
        :command "lein"
        :args '("run" "--" "-c" "./config/config.edn")
        :tags '(samsara)
        :port 9000
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))

(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / Ingestion-APIs / kafka"
        :cwd "/workspace/samsara/ingestion-api"
        :command "lein"
        :args '("run" "--" "-c" "./config/config-kafka.edn")
        :tags '(samsara sam-local)
        :port 9000
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))
;;
;; Kafka
;;
(setq prodigy-services
      (prodigy-define-service
        :name "Zookeeper localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/zookeeper-server-start.sh" "config/zookeeper.properties")
        :tags '(zookeeper kafka sam-local)
        :port 2181
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))

(setq prodigy-services
      (prodigy-define-service
        :name "Kafka localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-server-start.sh" "config/server.properties")
        :tags '(kafka sam-local)
        :port 9092
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"events\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "events")
        :tags '(kafka sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"ingestion\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "ingestion")
        :tags '(kafka sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))

;;
;; SAMSARA CORE
;;
(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / CORE / kafka"
        :cwd "/workspace/samsara/core"
        :command "lein"
        :args '("run" "--" "-c" "./config/config.edn")
        :tags '(samsara sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))
