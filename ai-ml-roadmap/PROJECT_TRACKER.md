# 📊 Project Tracker & Production Guardrails

> **Hiring Manager Insight:** Recruiters skip generic projects (like basic Titanic or MNIST). They want to see *judgment*—the ability to assess trade-offs, optimize latency, secure codebases, and deploy to production. **Projects > Certificates.**

---

## 📋 Global Project Evaluation Checklist
*Before marking ANY project as "Complete" and pushing it to your portfolio, verify it passes these production guardrails:*

### 🏗️ Architecture & Code Quality
- [ ] **Type Hinting:** Are all functions strictly type-hinted and passing `mypy`?
- [ ] **Testing:** Is there >80% test coverage via `pytest` (unit + integration)?
- [ ] **CI/CD:** Is there a passing GitHub Actions workflow for linting, testing, and building?
- [ ] **Secrets Management:** Are all API keys and credentials strictly in `.env` (zero hardcoded secrets)?

### ⚡ Performance & Scalability
- [ ] **Latency:** Is inference/API response time documented and optimized (e.g., P95 < 200ms)?
- [ ] **Throughput:** Can the endpoint handle concurrent requests (stress-tested via `locust` or `pytest`)?
- [ ] **Memory Footprint:** Is the memory profile optimized (no leaks, quantized models where applicable)?
- [ ] **Scalability:** Is the architecture decoupled and horizontally scalable (e.g., Docker + Celery + Redis)?

### 🔭 Observability & Security
- [ ] **Logging:** Are structured logs capturing errors, metrics, and system state?
- [ ] **Tracing/Metrics:** Are traces captured (LangSmith/Phoenix) or metrics exposed (`/metrics` for Prometheus)?
- [ ] **Security:** Is user input validated/sanitized (e.g., Pydantic, NeMo Guardrails) to prevent injection attacks?
- [ ] **Documentation:** Does the repo have a professional README with an Architecture Diagram and Live Demo link?

---

## 🚀 Master Project Registry

*Use this table to track your progress across the Ultimate Hybrid Roadmap. Create a dedicated GitHub repository for each major project.*

| Project Name | Phase | Core Tech Stack | GitHub Repo | Live Demo | Target Production Metrics | Status |
| :--- | :---: | :--- | :---: | :---: | :--- | :---: |
| **0.3: Production Data API** | 00 | FastAPI, Redis, Docker | `[Link]` | `[Link]` | P99 < 50ms, 95% cache hit rate | ⬜ Not Started |
| **1.1: End-to-End ML Pipeline** | 01 | Scikit-Learn, MLflow, FastAPI | `[Link]` | `[Link]` | Inference < 15ms, CI/CD passing | ⬜ Not Started |
| **1.4: ML Monitoring System** | 01 | Evidently AI, Prometheus, Grafana | `[Link]` | `[Link]` | Drift detection latency < 1s | ⬜ Not Started |
| **2.2: Vision Transformer (ViT)** | 02 | PyTorch, ONNX, Gradio | `[Link]` | `[Link]` | INT8 quantized (75% smaller), <40ms | ⬜ Not Started |
| **3.5.1: HA Microservice Inference** | 3.5 | FastAPI, Nginx, Celery, Redis | `[Link]` | `[Link]` | 500 RPS, P99 < 10ms | ⬜ Not Started |
| **4.4: Real-Time Kafka Pipeline** | 04 | Kafka, Python, PostgreSQL | `[Link]` | `[Link]` | Zero message lag, exactly-once | ⬜ Not Started |
| **5.1: Enterprise RAG System** | 05 | LangChain, Qdrant, RAGAS | `[Link]` | `[Link]` | Context Relevance > 0.85, $0.002/q | ⬜ Not Started |
| **5.2: LangGraph Multi-Agent** | 05 | LangGraph, Tavily, LangSmith | `[Link]` | `[Link]` | Max 15 loop depth, 100% trace | ⬜ Not Started |
| **5.3: Custom MCP Server** | 05 | MCP SDK, FastAPI, PostgreSQL | `[Link]` | `[Link]` | Tool invocation < 100ms, RBAC | ⬜ Not Started |
| **6.1: Enterprise Security Framework**| 06 | NeMo Guardrails, Vault, ELK | `[Link]` | `[Link]` | 0 injection bypasses, audit logs | ⬜ Not Started |
| **7.1: AI BI Capstone** | 07 | Full Stack (K8s, Airflow, LLM) | `[Link]` | `[Link]` | 99.9% uptime, 1.5s E2E latency | ⬜ Not Started |
| **7.3: Real-World AI Product** | 07 | Production Stack | `[Link]` | `[Link]` | 10+ real users, feedback loop | ⬜ Not Started |

**Status Legend:**
⬜ Not Started | 🟡 In Progress | ✅ Complete | 🚀 Deployed & Documented

---

## 📊 Production Metrics Template
*Copy and paste this block into the `README.md` of every project you build to satisfy the "Hard Engineering Metrics" requirement.*

```markdown
## 📊 Performance & Optimization Matrix
* **Inference Latency:** P95 < `[X]`ms | P50 < `[Y]`ms
* **Throughput Capacity:** `[Z]` requests/sec under concurrent peak load simulation
* **Token Cost Efficiency:** `[A]`% cost reduction achieved via semantic Redis caching
* **Test Coverage:** `[B]`% code coverage verified via `pytest` executions
* **Model Footprint:** `[C]`MB (Post-training INT8 quantization applied)
```

---

## 🤝 Open Source Contribution Tracker
*Contributing to open-source demonstrates engineering communication and system judgment.*

| Target Repository | Issue / PR Link | Type of Contribution | Status |
| :--- | :--- | :--- | :---: |
| `langchain-ai/langgraph` | `[Link]` | Added unit tests for state graph routing | ⬜ Not Started |
| `modelcontextprotocol/python-sdk` | `[Link]` | Fixed typing edge cases in tool adapters | ⬜ Not Started |
| `huggingface/peft` | `[Link]` | Updated deprecated dependencies in docs | ⬜ Not Started |
| `[Your Target Repo]` | `[Link]` | `[Description]` | ⬜ Not Started |

---

## 📅 Weekly Execution Review
*Fill this out every Sunday evening to maintain the "Consistency Over Hoarding" rule.*

- **Week of:** `[YYYY-MM-DD]`
- **Phase Focus:** `[e.g., Phase 3.5: Production Systems]`
- **Core Project Worked On:** `[e.g., Project 3.5.1]`
- **Biggest Bug Solved:** `[e.g., Debugged Celery worker memory leak in Docker]`
- **Deployed This Week?** `[Yes / No]`
- **Next Week's Target:** `[e.g., Finish Project 4.1 and set up GitHub Actions]`
---
### 💡 How to use this file:
1. **Update the Status Column:** As you build, change `⬜ Not Started` to `🟡 In Progress`, then `🚀 Deployed & Documented` once it passes the Global Evaluation Checklist.
2. **Fill in the Links:** Once a project is live, replace `[Link]` with your actual GitHub and Live Demo URLs.
3. **Use the Template:** Whenever you finish a project, copy the **Production Metrics Template** section and paste it directly into that specific project's `README.md`. This is exactly what Senior Engineers look for during code reviews.
