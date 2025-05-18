FROM python:3.11

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install required Python packages
RUN pip install --upgrade pip
RUN pip install django==3.2

# Apply Django database migrations
RUN python manage.py migrate

# Expose port 8000 (Django default)
EXPOSE 8000

# Start Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
