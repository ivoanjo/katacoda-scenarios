As part of the training environment, a Datadog test account was created for you to use.
This account will be used for our experiments.

1. In a new window/tab, log in to the
<a href="https://app.datadoghq.com/account/login" target="_datadog">Datadog account/organization</a> that was created
for you by the lab. If you need to recall your credentials, type `creds`{{execute T1}} in the terminal.

2. Navigate to the
<a href="https://app.datadoghq.com/apm/docs?architecture=container-based&collection=Same%20host&environment=docker&language=java" target="_datadog">APM Getting started page</a>.

3. Let's follow along the getting started instructions:
  * Step 1: Choose your Environment and Application Language. We pick **Docker** ➡ **Same host** → **Java**

  * Step 2: Run the Agent.
    We can run the agent using the following snippet (which already includes the API key listed in the using `creds`{{execute T1}}):
    ```
    docker run -d \
      -v /var/run/docker.sock:/var/run/docker.sock:ro \
      -v /proc/:/host/proc/:ro \
      -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
      -p 127.0.0.1:8126:8126/tcp \
      -e DD_API_KEY=$DD_API_KEY \
      datadog/agent:latest
    ```{{execute T1}}
    💡 Tip: We can check if the agent is healthy using:

    ``docker exec -it `docker ps --filter "expose=8126" -q` agent status``{{execute T1}}

  * Step 3: Install the Java client.

    `wget -O dd-java-agent.jar 'https://dtdg.co/latest-java-tracer'`{{execute T1}}

  * Step 4: Instrument your application.
    Set the Service name to `movies-api-java`, the Environment name to `staging`, and enable all three of
    ✅_Automatically Inject Trace and Span IDs into Logs_, ✅_Tracing Without Limits_ and ✅_Continuous Profiling_.
    We're now ready to apply the resulting configuration snippet to `movies-api-java`.

  * Step 4.1: Open the Gradle build file:

    `dd-continuous-profiler-example/java/build.gradle`{{open}}

  * Step 4.2: Add the provided arguments as `applicationDefaultJvmArgs`:

  <pre class="file" data-filename="dd-continuous-profiler-example/java/build.gradle" data-target="insert" data-marker="    applicationDefaultJvmArgs = []">
       applicationDefaultJvmArgs = [
           '-javaagent:dd-java-agent.jar',
           '-Ddd.profiling.enabled=true',
           '-XX:FlightRecorderOptions=stackdepth=256',
           '-Ddd.logs.injection=true',
           '-Ddd.trace.sample.rate=1',
           '-Ddd.service=movies-api-java',
           '-Ddd.env=staging'
       ]</pre>
4. Re-run the application using:

   `cd /root/lab/dd-continuous-profiler-example/java/ && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

5. We're done! You should see a `DATADOG TRACER CONFIGURATION` log message that confirms that the application is now collecting data.
