# ADR: Choosing Trivy for Security Scanning

## Status
Accepted

## Date
2025-04-15

## Context

Security scanning is a critical aspect of our CI/CD pipeline. We need to ensure our application and its dependencies are scanned for known vulnerabilities at different stages of development and deployment.

Our stack includes:

- Python-based microservices
- Dockerized deployments
- GitHub for source control
- GitHub Actions for  CI/CD

We were looking for a security scanning tool that can:

- Detect vulnerabilities in application dependencies and Docker images
- Integrate smoothly with GitHub Actions
- Produce readable reports (e.g., HTML or plain text)
- Be open-source or free
- Well-maintained and backed by a strong community
- Require minimal setup and maintenance

## Decision

We decided to use **Trivy** by Aqua Security for security vulnerability scanning.

Trivy will be integrated into our CI pipeline to scan:

- **Application dependencies** (via file system scanning)
- **Docker images** (post-build)
- Output reports as both terminal-friendly summaries and HTML artifacts

**Pros:**

- Supports both **dependency** and **image** scanning in a single tool
- Simple to install and use (binary, Docker, or GitHub Action)
- Customizable output formats (HTML, table, JSON, SARIF, etc.)
- Maintained actively by Aqua Security and trusted by the open-source community

**Cons:**

- HTML report templates require manual setup or template customization
- Scan results can be noisy without `.trivyignore` properly configured
- Not as visually rich or interactive as tools like Snyk or GitHub security dashboards

## Alternatives Considered

### 1. **GitHub Dependabot**

**Pros:**
- Native integration with GitHub
- Automatically raises PRs for vulnerable dependencies
- No setup needed beyond a YAML config

**Cons:**
- Only handles application dependencies (not Docker images or OS packages)
- No rich report generation (just PRs and GitHub alerts)
- Limited visibility on transitive dependency issues
- No local development setup possible

### 2. **Snyk**

**Pros:**
- Excellent UI with detailed reports and suggestions
- Scans both code and Docker images
- GitHub integration with PR scanning
- Good developer-focused documentation

**Cons:**
- Free tier has strict usage limits
- Advanced features require a paid subscription
- CLI integration with GitHub Actions can be verbose and noisy
- Data is stored in Snyk’s cloud unless self-hosted

## Consequences

- We will use Trivy for both local and CI-based security scans.
- Security reports (HTML + CLI output) will be included in CI artifacts.
- Developers may use the same tool locally using Docker to ensure consistency.

## Related Links

- Trivy Docs: https://aquasecurity.github.io/trivy/
- Snyk: https://snyk.io/
- GitHub Dependabot: https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically
