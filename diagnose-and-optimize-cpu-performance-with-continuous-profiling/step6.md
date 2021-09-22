* Fix issue

* Change code: FIXME
* Restart service: `/root/lab/dd-continuous-profiler-example/java/gradlew run`{{execute interrupt T2}}

* Run problematic request again `time curl http://localhost:8081/sleep`{{execute T1}}
* Validate change in APM / Profiler
