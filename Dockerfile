# FROM python:3.10

# WORKDIR /app

# COPY requirements.txt .  
# RUN pip install -r requirements.txt  

# COPY . .  

# CMD ["python", "app/app.py"]

#===========================================----------------------------===========================

FROM python:3.8

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Copy alembic.ini separately to avoid issues
COPY alembic.ini /app/alembic.ini

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose API port
EXPOSE 8000

# Run Alembic migrations and start FastAPI
CMD ["sh", "-c", "alembic upgrade head && python main.py"]
