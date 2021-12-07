FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

#FROM python:alpine
#ENV PYTHONDONTWRITEBYTECODE=1
#ENV PYTHONUNBUFFERED=1
#
#WORKDIR /app
#COPY requirements.txt /app/
#RUN pip install -r requirements.txt
#COPY . /app/
#
#EXPOSE 8000
#
#RUN python -m venv /py && \
#    /py/bin/pip install --upgrade pip