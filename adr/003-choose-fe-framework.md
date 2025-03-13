# ADR 001:Choose FrontEnd Framework

## Status
Proposed

## Context
In our project, we needed to pick the right SPA framework to give a better UX.

## Decision
- NextJS

## Consequences
#### Positives:
- Fast performance with SSR
- Easier to scale with built-in features (routing, API routes, etc.)
- Seamless integration with React

#### Negatives:
- Slightly steeper learning curve compared to a basic React setup
- May require additional configuration for complex real-time features.

## Alternatives Considered
#### Option 1: React
- Rejected due to lack of built-in SSR
- Requires more configuration and additional tools (e.g., React Router, manual SSR setup)

### Option 2: Vue.js
- Rejected due to limited enterprise adoption compared to React and Next.js.
- SSR with Vue requires additional tools like Nuxt.js, which adds complexity.

### Option 3: Angular
- Rejected due to its heavyweight nature and steep learning curve.
- Does not align with our requirement for fast, lightweight frameworks for a real-time dashboard.