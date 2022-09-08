FROM python:3-alpine

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt /requirements.txt
RUN pip install -r requirements.txt


FROM python:3-alpine

COPY --from=0 /opt/venv /opt/venv
COPY . /app
WORKDIR /app
ENV PATH="/opt/venv/bin:$PATH"
ENTRYPOINT python3 main.py
