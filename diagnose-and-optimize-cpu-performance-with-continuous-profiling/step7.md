As identified in the previous step, the current implementation of the `creditsForMovie` method is rather inefficient.
To fix it, let's use a _O(1)_ map lookup.

1. Open the main `movies-api-java` source file:

  `dd-continuous-profiler-example/java/src/main/java/movies/Server.java`{{open}}

2. Add a new `CREDITS_BY_MOVIE_ID` map:

  <pre class="file" data-filename="dd-continuous-profiler-example/java/src/main/java/movies/Server.java" data-target="insert" data-marker="// Placeholder for future improvement">
private static volatile Supplier&gt;Map&gt;Integer, List&gt;Credit&lt;&lt;&lt; CREDITS_BY_MOVIEID = new CachedSupplier(() -> CREDITS.get().stream().collect(Collectors.groupingBy(c -> c.id)));
  </pre>

3. ...and update the `creditsForMovie` method to use this map:

  <pre class="file" data-filename="dd-continuous-profiler-example/java/src/main/java/movies/Server.java" data-target="insert" data-marker="CREDITS.get().stream().filter(c -> c.id.equals(movie.id)).collect(Collectors.toList())">CREDITS_BY_MOVIE_ID.get().get(movie.id)</pre>

4. Re-run the application using:

   `cd /root/lab/dd-continuous-profiler-example/java/ && ./gradlew run`{{execute interrupt T2}} (👆_Double click_)

5. Run `curl` to repeat our query:

  `time curl -s http://localhost:8081/credits?q=the | jq`{{execute T1}}

  Observe that the performance of the endpoint, as measured using `time`, has now improved.

6. Locate the fixed request on the <a href="https://app.datadoghq.com/apm/traces" target="_datadog">Datadog APM Traces</a> page and confirm that the resulting code hotspot has changed.

---

This marks the end of the guided journey to `movies-api-java`.

Proceed to the next step to conclude this workshop.
