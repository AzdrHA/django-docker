# Set the base image to Python 3.9
FROM python:3-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory to /srv/app
WORKDIR /srv/app

# Set the UID and GID to 1000
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN addgroup -g ${GROUP_ID} django && \
    adduser -u ${USER_ID} -G django -s /bin/sh -D django

# Change ownership of the working directory to the django user
RUN chown django:django /srv/app

# Copy the requirements file
ADD requirements.txt /srv/app/requirements.txt

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add --no-cache mariadb-dev

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install mysqlclient

RUN apk del build-deps

COPY . /srv/app

USER django
EXPOSE ${APP_PORT}
