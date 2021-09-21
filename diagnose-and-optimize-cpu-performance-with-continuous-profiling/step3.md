# Enable Datadog APM and Continuous Profiling

As part of the training environment, a Datadog test account was created for you to use.
This account will be used for our experiments.

1. In a new window/tab, log in to the
<a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created
for you by the lab. If you need to recall your credentials, type `creds`{{execute T1}} in the terminal.

2. Navigate to the
<a href="https://app.datadoghq.com/apm/docs?architecture=container-based&collection=Same%20host&environment=docker&language=java" target="_datadog">APM onboarding page</a>

3. Follow the instructions:

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
```{{execute T1}}

TODO: Check agent is healthy

* Step 3: Install the Java client

`wget -O dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'`{{execute T1}}

* Step 4: Instrument your application

1. Modify `dd-continuous-profiler-example/java/build.gradle`{{open}}

2. Add the provided arguments:

<pre class="file" data-filename="dd-continuous-profiler-example/java/build.gradle" data-target="insert" data-marker="    applicationDefaultJvmArgs = []">
    applicationDefaultJvmArgs = [
        '-javaagent:dd-java-agent.jar', '-Ddd.profiling.enabled=true', '-XX:FlightRecorderOptions=stackdepth=256',
        '-Ddd.logs.injection=true', '-Ddd.trace.sample.rate=1', '-Ddd.service=movies-api-java', '-Ddd.env=staging'
    ]
</pre>

3. Re-run the application: `./gradlew run`{{execute interrupt T2}}
