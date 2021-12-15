FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install libpq-dev dh-python libpython3-dev python3-distutils python3-dev
RUN pip install --upgrade pip

RUN pip install -r requirements.txt
RUN pip install mysqlclient
COPY . /app/
