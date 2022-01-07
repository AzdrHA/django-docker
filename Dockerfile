FROM python:3-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /srv/app
COPY requirements.txt ./

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install mysqlclient

RUN apk del build-deps

COPY . /app/
EXPOSE ${APP_PORT}