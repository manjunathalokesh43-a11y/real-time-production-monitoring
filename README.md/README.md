# Real-Time Production Monitoring Platform

Built a production-grade monitoring and alerting platform on AWS using Terraform, Docker, Prometheus, Grafana, Alertmanager, Node Exporter, and Slack.

![Project Flow](images/project-flow.png)

---

## Architecture Overview

- AWS EC2 instance provisioned with Terraform
- Security Group configured for SSH and monitoring ports
- Docker Compose used to deploy all monitoring services
- Prometheus collects system metrics from Node Exporter
- Grafana visualizes infrastructure metrics
- Alertmanager routes alerts to Slack
- Slack receives real-time incident notifications

---

## Tech Stack

- AWS EC2
- Terraform
- Docker & Docker Compose
- Prometheus
- Grafana
- Alertmanager
- Node Exporter
- Slack Webhooks

---

## Features

- Infrastructure as Code using Terraform
- Containerized monitoring stack
- Real-time CPU, Memory, Disk, and Network monitoring
- Custom Prometheus alert rules
- Slack alert notifications
- Automated resolved alerts
- Production incident simulation

---

## Real-Time Incident Simulation

1. Generated CPU spikes using:
   ```bash
   yes > /dev/null &
   ```

2. Prometheus detected CPU > 80%
3. Alertmanager sent Slack notification
4. Investigated Grafana dashboards
5. Identified and stopped the process:
   ```bash
   pkill yes
   ```
6. Verified resolved notification in Slack

---

## Ports Used

| Service | Port |
|------|------:|
| SSH | 22 |
| Grafana | 3000 |
| Prometheus | 9090 |
| Alertmanager | 9093 |
| Node Exporter | 9100 |

---

## Deployment Steps

### 1. Provision Infrastructure

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

### 2. Connect to EC2

```bash
ssh -i monitor_test.pem ubuntu@<PUBLIC_IP>
```

### 3. Deploy Monitoring Stack

```bash
cd monitoring
docker-compose up -d
```

### 4. Access Applications

- Grafana: `http://<PUBLIC_IP>:3000`
- Prometheus: `http://<PUBLIC_IP>:9090`
- Alertmanager: `http://<PUBLIC_IP>:9093`

---

## Grafana Credentials

- Username: `admin`
- Password: `admin`

---

## Sample Alert Rule

```yaml
- alert: HighCPUUsage
  expr: 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100) > 80
  for: 1m
  labels:
    severity: critical
  annotations:
    summary: "High CPU Usage"
```

---

## Outcomes

- Implemented an end-to-end observability platform
- Automated alerting and recovery notifications
- Practiced real-world incident response
- Improved Terraform, Docker, Prometheus, and Grafana skills

---

## Author

Manjunatha Lokesh