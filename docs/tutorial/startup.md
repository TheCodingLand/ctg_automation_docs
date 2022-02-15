

# Startup


!!! Info Single sign on and HTTPS
    Treafik reverse proxy is setup with automated certificate generation for HTTPS
    A Keycloak instance is setup for single sign on accross all services.


<div class="termy">

```console
// start up all services
$ docker-compose up -d
// wait for all services to be running

[+] Running 16/16
 - Container ctg_automation-document_classifier-1  Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-ebling-1               Running                                                                                                                                                                                                          0.0s
 - Container traefik                               Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-postgres_ebling-1      Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-trillian-1             Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-s3-1                   Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-keycloak-1             Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-redis-1                Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-postgres_mlflow-1      Running                                                                                                                                                                                                          0.0s
 - Container ctg_automation-postgres-1             Running                                                                                                                                                                                                          0.0s 
 - Container ctg_automation-mlflow-1               Running                                                                                                                                                                                                          0.0s 
 - Container ctg_automation-airflow-worker-1       Running                                                                                                                                                                                                          0.0s 
 - Container ctg_automation-airflow-init-1         Started                                                                                                                                                                                                          1.5s 
 - Container ctg_automation-airflow-1              Running                                                                                                                                                                                                          0.0s 
 - Container ctg_automation-airflow-scheduler-1    Running                                                                                                                                                                                                          0.0s 
 - Container ctg_automation-flower-1               Running 
```

</div>

