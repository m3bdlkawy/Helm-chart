{{- define "kafka-cluster.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kafka-cluster.kafka.bootstrapServers" -}}
{{- printf "%s-kafka-bootstrap:9092" (include "kafka-cluster.fullname" .) -}}
{{- end -}}

{{- define "kafka-cluster.kafkaConnect.name" -}}
{{- printf "%s-kafka-connect" (include "kafka-cluster.fullname" .) -}}
{{- end -}}

{{- define "kafka-cluster.storage.class" -}}
{{- if .Values.storage.class -}}
{{- .Values.storage.class -}}
{{- else -}}
{{- "longhorn-kafka" -}} {{- # Default to Longhorn StorageClass -}}
{{- end -}}
{{- end -}}