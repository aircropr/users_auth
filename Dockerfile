FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install pipenv
COPY Pipfile /app/
RUN pipenv install --skip-lock --system --dev

COPY . /app/

# Server
EXPOSE 8080
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8080"]