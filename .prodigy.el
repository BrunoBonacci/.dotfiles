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
        :stop-signal 'term
        :kill-process-buffer-on-stop nil))

(setq prodigy-services
      (prodigy-define-service
        :name "Samsara / Ingestion-APIs / kafka"
        :cwd "/workspace/samsara/ingestion-api"
        :command "lein"
        :args '("run" "--" "-c" "./config/config-kafka.edn")
        :tags '(samsara sam-local)
        :port 9000
        :stop-signal 'term
        :kill-process-buffer-on-stop nil))
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
        :stop-signal 'term
        :kill-process-buffer-on-stop nil))

(setq prodigy-services
      (prodigy-define-service
        :name "Kafka localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-server-start.sh" "config/server.properties")
        :tags '(kafka sam-local)
        :port 9092
        :stop-signal 'kill ;; should be term
        :kill-process-buffer-on-stop nil))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"events\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "events")
        :tags '(kafka sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"ingestion\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "ingestion")
        :tags '(kafka sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))


(setq prodigy-services
      (prodigy-define-service
        :name "Kafka Consumer \"ingestion-kv\" localhost"
        :cwd "/workspace/exp/kafka"
        :command "/bin/bash"
        :args '("bin/kafka-console-consumer.sh" "--zookeeper" "localhost:2181" "--topic" "ingestion-kv")
        :tags '(kafka sam-local)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))
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
        :stop-signal 'term
        :kill-process-buffer-on-stop nil))


;;
;; SPARK
;;
;; add conf/spark-env.sh
;;   export SPARK_LOCAL_IP=192.168.59.3
;;   export SPARK_PUBLIC_DNS=192.168.59.3
;;   export STANDALONE_SPARK_MASTER_HOST=192.168.59.3:7077
;;   export SPARK_MASTER_IP=192.168.59.3
;;
(setq prodigy-services
      (prodigy-define-service
        :name "Spark MASTER"
        :cwd "/workspace/exp/spark"
        :command "/bin/bash"
        :args '("-c" ". conf/spark-env.sh && ./bin/spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_IP --port 7077 --webui-port 8080")
        :tags '(spark)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))

(setq prodigy-services
      (prodigy-define-service
        :name "Spark Worker"
        :cwd "/workspace/exp/spark"
        :command "/bin/bash"
        :args '("-c" ". conf/spark-env.sh && ./bin/spark-class org.apache.spark.deploy.worker.Worker --work-dir /tmp/ --host $SPARK_LOCAL_IP --port 7078 --webui-port 8081 spark://$STANDALONE_SPARK_MASTER_HOST")
        :tags '(spark)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))


(setq prodigy-services
      (prodigy-define-service
        :name "Spark (1.3.1) MASTER"
        :cwd "/workspace/exp/spark-1.3.1-bin-hadoop2.6"
        :command "/bin/bash"
        :args '("-c" ". conf/spark-env.sh && ./bin/spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_IP --port 7077 --webui-port 8080")
        :tags '(spark3)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))

(setq prodigy-services
      (prodigy-define-service
        :name "Spark (1.3.1) Worker"
        :cwd "/workspace/exp/spark-1.3.1-bin-hadoop2.6"
        :command "/bin/bash"
        :args '("-c" ". conf/spark-env.sh && ./bin/spark-class org.apache.spark.deploy.worker.Worker --work-dir /tmp/ --host $SPARK_LOCAL_IP --port 7078 --webui-port 8081 spark://$STANDALONE_SPARK_MASTER_HOST")
        :tags '(spark3)
        :stop-signal 'kill
        :kill-process-buffer-on-stop nil))
