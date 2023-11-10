FROM python:3.7.3-alpine as base

FROM base as builder

RUN apk add --no-cache python3 python3-dev py-pip build-base

RUN mkdir /install/
WORKDIR /install

COPY requirements.txt requirements.txt

RUN pip install --install-option="--prefix=/install" -r requirements.txt

FROM base

WORKDIR /app/

COPY --from=builder /install /usr/local

COPY numpyTest.py /app/numpyTest.py

CMD ["python", "/app/numpyTest.py"]
