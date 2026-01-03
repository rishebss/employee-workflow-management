# Use the same base image as in Leapcel logs
FROM python:3.11-slim-bookworm

# Set working directory
WORKDIR /app

# Set environment variable to prevent Python output buffering
ENV PYTHONUNBUFFERED 1

# Copy project files to container
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Collect static files
RUN python manage.py collectstatic --noinput

# Declare the port the app listens on (Leapcel uses 8080)
EXPOSE 8080

# Startup command (matches your logs)
CMD ["gunicorn", "--bind", ":8080", "lpcrm.wsgi"]