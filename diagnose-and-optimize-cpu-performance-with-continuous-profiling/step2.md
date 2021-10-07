Up until now, everything seems to be going well in `movies-api-java`-land.

Let's try a different endpoint: getting movie credits, for all movies with _Jurassic_ in their name.

1. Run `curl` again to query for this information:

  `time curl -s http://localhost:8081/credits?q=jurassic | jq`{{execute T1}}

  (You can also use your browser or local terminal to query <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/credits?q=jurassic>)

2. Observe that this endpoint seems to be quite slow:

  ```
  real    0m7.186s
  user    0m0.039s
  sys     0m0.014s
  ```

  `movies-api-java` is taking a lot of time to respond to these queries, which makes for a poor user experience.

To be able to investigate this issue further, let's add Datadog APM and Continuous Profiling to `movies-api-java`.
