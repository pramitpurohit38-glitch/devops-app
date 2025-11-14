# Step 1: Use an official lightweight Python image
FROM python:3.9-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy all files from your local machine to the container
COPY . .

# Step 4: Install dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose port 5000 (Flask runs here)
EXPOSE 5000

# Step 6: Define the command to run your Flask app
CMD ["python", "app.py"]
