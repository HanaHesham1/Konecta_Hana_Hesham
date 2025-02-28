# 1. Use official Python image as the base
FROM python:3.9-slim

# 2. Set environment variables
ENV PYTHONUNBUFFERED=1
ENV DATABASE_URL=postgresql://user:password@db:5432/mydb

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Copy the application code into the container
COPY . /app

# 5. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 6. Expose port 5000 so the application can be accessed
EXPOSE 5000

# 7. Define the command to run the application
CMD ["python", "app.py"]
