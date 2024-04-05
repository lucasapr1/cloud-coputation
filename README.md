### Install LocalStack with docker
```
https://docs.localstack.cloud/getting-started/installation/
```

### Install Terraform
```
https://developer.hashicorp.com/terraform/install
```

### Install AWS cli
```
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
```
### Passo a passo

### 1
```
docker-build .
```

### 2
```
docker-compose up -d
```

### 3
```
terraform init
```

### 4
```
terraform plan
```

### 5
```
terraform apply -lock=false -auto-approve
```

