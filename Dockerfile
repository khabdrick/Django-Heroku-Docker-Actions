
# Dockerfile
FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /proj
WORKDIR /proj

COPY . .

#collect static files
RUN python manage.py collectstatic --noinput


# add and run as non-root user
RUN adduser -D myuser
USER myuser

# run gunicorn
CMD gunicorn proj.wsgi:application --bind 0.0.0.0:$PORT
