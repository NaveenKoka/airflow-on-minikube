from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="example_local_dag",
    schedule_interval="@daily",
    start_date=datetime(2024, 1, 1),
    catchup=False,
) as dag:

    task1 = BashOperator(
        task_id="print_date",
        bash_command="date",
    )

    task2 = BashOperator(
        task_id="say_hello",
        bash_command="echo 'Hello from Airflow in Minikube!'",
    )

    task1 >> task2
