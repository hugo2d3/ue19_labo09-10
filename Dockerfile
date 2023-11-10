FROM python:3.7.3-alpine as base

FROM base as builder

RUN apk add --no-cache python3 python3-dev py-pip build-base

RUN mkdir /install/
WORKDIR /install

copy requirements.txt requirements.txt


RUN pip install --install-option="--prefix=/install" -r requirements.txt

copy --from=builder /install /usr/local
RUN mkdir /app/

COPY app.py /app/app.py

CMD ["python", "/app/app.py"]