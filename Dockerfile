FROM python:3.12.4-alpine3.20

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password service-user

COPY service /service
WORKDIR /service
EXPOSE 8000

USER service-user
