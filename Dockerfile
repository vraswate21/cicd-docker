# Use Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt .

RUN pip install -r requirements.txt

# Copy app
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

