As a running example, we'll use the `movies-api-java` service from
<https://github.com/ivoanjo/dd-continuous-profiler-example>.

The `movies-api-service` service:

* Provides an API to list and search for movies
* Is built using Java 11, the [Spark Web Framework](https://sparkjava.com/) and the
[Jetty web server](https://www.eclipse.org/jetty/).

We've already cloned the repository above to the learning environment, so we can jump right in!

1. Let's run the `movies-api-java` service in the **Terminal for movies-api-java** tab:

`cd /root/lab/dd-continuous-profiler-example/java && ./gradlew run`{{execute T2}} (👆 double click)

2. After the service boots up, it can be accessed by going to:

<https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/>

3. You can also use `curl` to interact with the service:

`curl -s http://localhost:8081/ | jq`{{execute T1}}
