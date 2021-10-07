Let's try a heavier task: getting movie credits, for all movies with the word _The_ in their title.

1. Run `curl` to query for this information:

  `time curl -s http://localhost:8081/credits?q=the | jq`{{execute T1}}

2. Observe that this endpoint seems to be very slow, even including the improvement from the previous step:

  ```
  FIXME example time output
  ```

3. *Presented Live*: Let's analyze this slow request using the Continuous Profiler.

---

Proceed to the next step to fix this performance issue on `movies-api-java`.
