FROM python:3

WORKDIR /code



COPY ./app /code/app

CMD ["python", "app.py","$1","$2","$3"]