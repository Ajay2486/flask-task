# Flask Web App Task

## How to Run

### 1. Infrastructure
- `cd infra`
- `terraform init`
- `terraform apply`

### 2. Deploy App
- SSH into VM
- Run `deploy.sh`

### 3. Access the Application
- http://<EC2_PUBLIC_IP>:8080          # Hello World!
- http://<EC2_PUBLIC_IP>:8080/health   # OK

### 4. Monitor App
- Run `monitor.sh` to log alerts

App runs on port 8080.