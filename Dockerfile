FROM python:3

WORKDIR /code



COPY ./ /code/

CMD ["python", "app.py"]