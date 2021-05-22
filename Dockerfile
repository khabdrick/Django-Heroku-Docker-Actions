
# Dockerfile
FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /proj
WORKDIR /proj

COPY ./proj /proj

# Create user that can run our image on docker
RUN adduser -D user

USER user