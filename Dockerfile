FROM python:3.10-slim-buster

# TODO: ENV to remove
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=xyz

WORKDIR ./src

COPY ./analytics .

RUN python -m pip install -U pip && pip install -r requirements.txt

ENTRYPOINT ["python", "app.py"]
