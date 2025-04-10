# Frequently Asked Questions

- [Troubleshooting SonarQube Installation](#troubleshooting-sonarqube-installation)

## Troubleshooting SonarQube Installation

If your SonarQube server exits immediately due to a lack of virtual memory space, try running following script:

```sh
./scripts/set-vm-memory.sh
```

Then try running SonarQube again.