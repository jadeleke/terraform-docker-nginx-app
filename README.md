# 🚀 Terraform Docker NGINX App

This project uses **Terraform** and the **Docker provider** to deploy an NGINX container, serve custom static content, and manage networking, restart policy, and health checks.

---

## 📆 What’s Inside?

- ✅ NGINX container managed via Terraform  
- ✅ Custom static HTML site (bind-mounted)  
- ✅ Health check with `curl`  
- ✅ Docker network integration  
- ✅ Auto-restart policy (`unless-stopped`)  

---

## 🛠️ Requirements

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v0.12+  
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)  
- Windows with Docker running via Windows named pipe  

---

## 📁 Project Structure

terraform-docker-nginx-app/ ├── main.tf # Terraform configuration
└── site-content/ # Static content served by NGINX
    └── index.html

yaml



---

## 🚀 Quick Start

1. **Clone this repository**:
   ```
   git clone https://github.com/YOUR_USERNAME/terraform-docker-nginx-app.git
   cd terraform-docker-nginx-app
   ```

Create a Docker network:




```
docker network create tutorial-net
```

Initialize Terraform:



```
terraform init
```

Apply the configuration:




```
terraform apply
```

Access the app:
Visit http://localhost:8000

💮 Cleanup
To remove all infrastructure created:




```
terraform destroy
docker network rm tutorial-net
```

📘 Notes
You can expand this setup with more containers using the shared tutorial-net Docker network.

Modify site-content/ and reapply for live content updates.

📄 License
MIT — feel free to use and adapt.

vbnet



Let me know if you want me to generate a `site-content/index.html` for demo purposes too.