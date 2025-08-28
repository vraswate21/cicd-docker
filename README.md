# 🚀 CI/CD Pipeline with GitHub Actions & Docker Hub

This project demonstrates a simple **CI/CD pipeline** that automatically builds a Docker image for a Python Flask application and pushes it to **Docker Hub** using **GitHub Actions**.

---

## 📂 Project Structure
cicd-docker/
│── app.py # Simple Flask application
│── requirements.txt # Python dependencies
│── Dockerfile # Docker image instructions
│── .github/
│ └── workflows/
│ └── ci-cd.yml # GitHub Actions pipeline

yaml
Copy code

---

## ⚡ Workflow

1. Push code changes to the `main` branch.  
2. GitHub Actions workflow is triggered.  
3. The workflow:  
   - Checks out the repository  
   - Logs in to Docker Hub using secrets  
   - Builds the Docker image  
   - Pushes the image to Docker Hub  

---

## 🐳 Dockerfile

```dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
⚙️ GitHub Actions Workflow (ci-cd.yml)
yaml
Copy code
name: CI/CD Pipeline

on:
  push:
    branches: [ "main" ]

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Log in to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build Docker image
        run: docker build -t ${{ secrets.DOCKER_USERNAME }}/cicd-docker:latest .

      - name: Push Docker image
        run: docker push ${{ secrets.DOCKER_USERNAME }}/cicd-docker:latest
🔑 Setup Instructions
Fork/Clone this repository.

Create a Docker Hub account.

In GitHub → Repository → Settings → Secrets and variables → Actions:

Add DOCKER_USERNAME → your Docker Hub username

Add DOCKER_PASSWORD → your Docker Hub access token

Push code to main branch → GitHub Actions will build and push your image.

🚀 Running Locally
Build and run the app locally:

bash
Copy code
docker build -t flask-cicd-app .
docker run -p 5000:5000 flask-cicd-app
Visit 👉 http://localhost:5000

✅ Features
Automated CI/CD pipeline with GitHub Actions

Dockerized Flask application

Auto push to Docker Hub

📌 Future Improvements
Add testing stage before build

Deploy to Kubernetes or AWS EC2 after Docker push

Add version tags instead of only latest

