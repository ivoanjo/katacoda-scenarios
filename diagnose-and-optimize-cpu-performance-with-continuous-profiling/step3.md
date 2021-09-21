* Onboarding
* Let's follow the instructions on <https://app.datadoghq.com/apm/docs?architecture=container-based&collection=Same%20host&environment=docker&language=java>

* Step 1: Choose your Environment and Application Language

docker > same host > java

* Step 2: Run the Agent

(Here we're picking up the API key from an env var)

```bash
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v /proc/:/host/proc/:ro \
  -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  -p 127.0.0.1:8126:8126/tcp \
  -e DD_API_KEY=$DD_API_KEY \
  datadog/agent:latest
```
{{execute}}

TODO: Check agent is healthy

* Step 3: Install the Java client

`wget -O dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'`{{execute}}

* Step 4: Instrument your application

1. (Enable all the extras)
2. (Re-run app)

`java -javaagent:/path/to/dd-java-agent.jar -Ddd.profiling.enabled=true -XX:FlightRecorderOptions=stackdepth=256 -Ddd.logs.injection=true -Ddd.trace.sample.rate=1 -Ddd.service=movies-api-java -Ddd.env=staging -jar path/to/your/app.jar`


