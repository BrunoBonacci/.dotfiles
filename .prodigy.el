;; create prodigy configurtion

(require 'prodigy)

;;
;; SAMSARA
;; Ingestion API
(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / Ingestion-APIs"
        :cwd "/workspace/samsara/ingestion-api"
        :command "lein"
        :args '("run" "--" "-c" "./config/config.edn")
        :tags '(samsara test)
        :port 9000
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))

(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / Ingestion-APIs / local kafka"
        :cwd "/workspace/samsara/ingestion-api"
        :command "lein"
        :args '("run" "--" "-c" "./config/config-kafka.edn")
        :tags '(samsara test)
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
        :tags '(zookeeper kafka)
        :port 2181
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))

(setq prodigy-services
      (prodigy-define-service
        :name "Kafka localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-server-start.sh" "config/server.properties")
        :tags '(kafka)
        :port 9092
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"events\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "events")
        :tags '(kafka)
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"analyzed\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "analyzed")
        :tags '(kafka)
        :stop-signal 'kill
        :kill-process-buffer-on-stop t))
