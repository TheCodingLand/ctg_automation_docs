
## Components of the solution:

### There are 3 main components:  

- **Trillian**: A dashboard for viewing and monitoring automated workflows, reporting and billing information.
- **Arcadia**: A collection of plugins and libraries to be used in automation solutions like airflow and perfect
- **Ebling**: The backend for storage of all required data, integrated with Arcadia, Trillian, Airflow and easy to integrate with other automation systems.

### There are also other optional infrastructural components:

- **Airflow** & **dagster**: Example integrated automation systems
- **ML Flow** to track machine learning experiments that can be called by the **Arcadia** framework during a workflow
- **Minio S3** : to store machine learning artifacts, using Amazon S3 protocol.


### Central Single Sign on system / Double Authentication

A Keycloak instance is setup for single sign on accross all services.

It is the source of truth for all incoming connections and all services are integrated with the <a href="https://openid.net/connect/" class="external-link" target="_blank">Oauth2/OIDC</a> protocol, providing a high level of security accross all services.

### Machine Learning:

One machine learning experiment have been setup as a demonstation, it is a document classifier based on a scanned document or a picture (Like from Office lense app)
