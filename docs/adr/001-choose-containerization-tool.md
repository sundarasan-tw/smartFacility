# ADR 001:Choose Containerisation Tool

## Status
Proposed

## Context
In our project, we needed to determine the best approach for containerization to ensure scalability and portability in managing our applications.

## Decision
we decided to use Docker as our containerization platform.

## Consequences
#### Positives:
- Widespread adoption, and strong community support

#### Negatives:
- Increased Learning Curve
- Complexity in Debugging and Monitoring

## Alternatives Considered
#### Option 1: containerd
- Lower-level tool designed primarily for container orchestration
- Does not provide the same ecosystem and user-friendly features as Docker
- Does not provide tools like Docker Compose and Docker Hub, provides a more complete solution for our use case.

#### Option 2: Vagrant
- Relies on VMs
- More resource-intensive and slower to start compared to containers
- Does not provide the lightweight, portable, and scalable nature of containers, which are necessary for our current needs