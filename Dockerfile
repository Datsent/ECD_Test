FROM python:3.7-slim AS compile-image
RUN apt-get update

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY main.py .


FROM python:3.7-slim AS build-image
COPY --from=compile-image /root/.local /root/.local


CMD ["python3", "main.py"]