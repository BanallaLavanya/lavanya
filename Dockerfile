FROM python:3.12.5-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt
COPY . /app/
RUN python /app/app/manage.py migrate
EXPOSE 8000

CMD ["python", "app/manage.py","runserver", "0.0.0.0:8000"]
