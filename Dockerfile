FROM python:3.8-slim-buster
COPY . /app
WORKDIR /app
RUN apt-get update && \
    apt-get install -y gcc 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gunicorn

ENV FLASK_APP /app/server.py

CMD gunicorn --bind 0.0.0.0:5000 wsgi:app

EXPOSE 5000

