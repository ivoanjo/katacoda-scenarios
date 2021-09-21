# Recognize performance issue

So far so good, everything seems to be going well in `movies-api-java`-land.

---

_TODO: Sleep is a placeholder; we need to define an issue to use as well as how users will initially observe it_

* Slow endpoint: <https://[[HOST_SUBDOMAIN]]-8081-[[KATACODA_HOST]].environments.katacoda.com/sleep>
* Curl to slow endpoint: `time curl http://localhost:8081/sleep`{{execute T1}}

---

To be able to investigate this issue further, let's add Datadog APM and Continuous Profiling to `movies-api-lava`.
