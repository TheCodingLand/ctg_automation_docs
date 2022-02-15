
# Arcadia Example

## Using an exchange server as a source:

### Goal: *Using an exchange server as a source, we will filter emails and start a workflow based on the results*

!!! info
    This is a small example involving interacting with an **Exchange Server**. 
    There are a lot of different modules and libraries in arcadia that are yet to be documented, including Database interaction, machine learning and interacting with API requests and the **Ebling** backend.




### Setup an Email filter

```python

email_filter: EmailFilter = EmailFilter(sender="no-reply@external-monitoring.com",
                            attachment_file_extension='.csv',
                            subject_contains="reporting",
                            email_account= "tech-ctg-account@ctg.lu")
```

Integrate it for example, as a sensor within Airflow or Dagster:

```python
check_for_monitoring_event = EmailSensor(task_id="check_for_monitoring_event", email_filter=email_filter)
```

Create some tasks to use the data within airflow for example:

```python

# full code example:


@dag(schedule_interval=timedelta(days=1), start_date=datetime(2021, 1, 20), catchup=False)
def monitoring_system_report_automation():
    
    # this sensor allows to only run this workflow if an email that responds to the email_filter specified is found
    check_for_note_de_frais = EmailSensor(task_id="get_monitoring_reports_email", email_filter=email_filter)
    
    @task(task_id='get_monitoring_reports_email')
    def get_emails() -> List[Message]:
        emails = email_filter.get_emails()
        return emails

    @task(task_id="save_csv_in_database")
    def save_csv_in_database(emails: List[Message]):
        for email in emails:
            for attachment in email.attachments:
                save_reports(attachment)

    
    emails = get_emails() # get task objects from decorated function
    emails_to_backend = save_csv_in_database(emails) # get task objects from decorated function
    
    check_for_monitoring_event >> emails >> emails_to_backend # specify order of execution 

save_monitoring_reports = monitoring_system_report_automation()
```
