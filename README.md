# [Roadmap](https://1drv.ms/w/c/685b12f7987da0d2/IQAfREwlbJdqRJFvxAkEIIT5AWZGrDpDco4nVuEpb3AxjUw?e=ELSgsD)

## 🟢 Phase 0: Foundations & Data Wrangling 
**Goal:** Become dangerous with Python, data manipulation, and mathematical intuition. Stop relying on pre-cleaned datasets.

- **📚 What to do:** 
  - Course: [Kaggle Learn: Python & Pandas](https://www.kaggle.com/learn/python)
  - Video: 3Blue1Brown *[Essence of Linear Algebra](https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab)* + StatQuest *[Statistics Fundamentals](https://www.youtube.com/playlist?list=PLblh5JKOoLUK0FLuzwntyYI10UQFUhsY9)*
  - Book: *Python for Data Analysis* by Wes McKinney
- **💡 Why to do it:** Real-world data is messy. Math intuition prevents you from treating ML models as "black boxes" when they fail.
- **🛠️ How to do it:** Spend 1 hour daily solving Python data manipulation problems. Spend weekends building a scraper that pulls raw, messy data from a public API (e.g., job boards, real estate) and cleans it.
- **🎯 What to focus upon:** 
  - *Python for Data Analysis*: Chapters on Data Cleaning, Missing Data Handling, and GroupBy operations.
  - *Math*: Vector/matrix multiplication intuition and probability distributions (mean, variance, Bayes' theorem).
- **🔍 Why to focus:** 80% of an ML engineer's job is data wrangling. Understanding GroupBy and matrix operations is the foundation of both Pandas and Neural Network forward passes.

### 💻 Core Project: Automated Data Pipeline & EDA Dashboard
- **Tech Stack:** Python, Requests/BeautifulSoup, Pandas, Matplotlib/Seaborn, Streamlit.
- **Deliverable:** A GitHub repo with a script that fetches raw data, cleans it, and a local Streamlit dashboard visualizing anomalies and correlations.

### ✅ Phase 0 Checklist
- [ ] Completed Kaggle Python & Pandas micro-courses.
- [ ] Built a web scraper that handles missing values and duplicates.
- [ ] Can explain the geometric intuition of a dot product and matrix multiplication.

---

## 🟡 Phase 1: Classical Machine Learning 
**Goal:** Master the end-to-end ML lifecycle, feature engineering, and experiment tracking.

- **📚 What to do:** 
  - Hands-on ML (Kaggle Learn) [Intro to ML]https://www.kaggle.com/learn/intro-to-machine-learning) + [Intermediate ML](https://www.kaggle.com/learn/intermediate-machine-learning) 
  - Course: *Machine Learning Specialization* (Andrew Ng, DeepLearning.AI)
  - [Introduction to Machine Learning for Coders! By fast.ai](https://course18.fast.ai/ml.html) 
  - Book: *Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow* (Aurélien Géron)
- **💡 Why to do it:** Andrew Ng teaches the mathematical "why"; Géron teaches the production-grade "how".
- **🛠️ How to do it:** For every algorithm Ng teaches, implement it in Scikit-Learn. Do not just call `.fit()`. Build a `Pipeline` that includes preprocessing and the model.
- **🎯 What to focus upon:** 
  - *Hands-On ML*: Chapter 2 (End-to-End Project), Chapter 4 (Training Models), Chapter 6 (Decision Trees), Chapter 7 (Ensemble Learning).
  - Concepts: Bias-Variance Tradeoff, Cross-Validation, Handling Imbalanced Data (SMOTE), Precision/Recall vs. Accuracy.
- **🔍 Why to focus:** Employers test your ability to prevent data leakage and build reproducible pipelines, not your ability to memorize math formulas.

### 💻 Core Project: Customer Churn & Lifetime Value (CLV) Predictor
- **Tech Stack:** Scikit-Learn, XGBoost, Imbalanced-Learn, MLflow, Streamlit.
- **Deliverable:** A version-controlled pipeline that reads transactional data, runs through a Scikit-Learn `Pipeline`, logs metrics/artifacts in **MLflow**, and serves predictions via a Streamlit UI.

### ✅ Phase 1 Checklist
- [ ] Built an end-to-end ML pipeline with proper train/test splits and no data leakage.
- [ ] Successfully handled an imbalanced dataset using SMOTE or class weights.
- [ ] Tracked at least 5 different model experiments using MLflow or Weights &a mp; Biases (W&B).

---

## 🟠 Phase 2: Deep Learning & PyTorch (Weeks 8–11)
**Goal:** Demystify neural networks by building them from scratch, then master state-of-the-art computer vision architectures.

- **📚 What to do:** 
  - Courses: 
    - [MIT 6.S191 Introduction to Deep Learning](https://introtodeeplearning.com/) 
    - *[Practical Deep Learning for Coders](https://course.fast.ai/)* (fast.ai) 
    - *[PyTorch for Deep Learning](https://www.deeplearning.ai/specializations/deep-learning?_gl=1*1iyqnl1*_gcl_au*MTYxMTUyOTQxMS4xNzg0MTA5MTQw*_ga*MjAyMzc4NTA4OS4xNzg0MTA5MTQw*_ga_FR2MZ1VLMS*czE3ODQxMDkxNDEkbzEkZzEkdDE3ODQxMDk0NDMkajYwJGwwJGgw)* 
    - [PyTorch for Deep Learning – by Daniel Bourke](https://www.learnpytorch.io/)

  - Books: 
    - [The Illustrated Transformer (Blog)](https://jalammar.github.io/illustrated-transformer/)
    - *[Dive into Deep Learning](https://d2l.ai/)* (Zhang et al.) 
    - *[Deep Learning (by Goodfellow, Bengio, Courville)](https://www.deeplearningbook.org/)* – Read chapters 6–9 only (feedforward, backprop, optimization, CNNs).
- **💡 Why to do it:** fast.ai gets you building immediately (top-down), while D2L provides the rigorous code+theory balance (bottom-up).
- **🛠️ How to do it:** Write a raw Python/NumPy neural network training loop (forward/backward pass) first. Then, refactor it using PyTorch `nn.Module`.
- **🎯 What to focus upon:** 
  - *Dive into Deep Learning*: Chapters 3 (Linear Networks), 4 (Multilayer Perceptrons), 7 (CNNs).
  - Concepts: Custom training loops, Backpropagation, Dropout, Batch Normalization, Transfer Learning.
- **🔍 Why to focus:** Writing a training loop from scratch is the single best way to debug vanishing gradients and understand how optimizers actually update weights.

### 💻 Core Project: Satellite Image Land-Use Segmentation System
- **Tech Stack:** PyTorch, TorchVision, Weights & Biases (W&B).
- **Deliverable:** A PyTorch pipeline using a pre-trained ResNet or U-Net. Must include W&B callbacks to trace training metrics, gradients, and validation losses in real-time.

### ✅ Phase 2 Checklist
- [ ] Wrote a neural network training loop from scratch (no `nn.Module`).
- [ ] Implemented Data Augmentation and Transfer Learning on a custom image dataset.
- [ ] Can explain how Backpropagation and the Chain Rule update weights.

---

## 🔵 Phase 3: Natural Language Processing (NLP) 
**Goal:** Transition from legacy NLP (RNNs) to the modern Transformer paradigm and Hugging Face ecosystem.

- **📚 What to do:** 
  - Courses: 
    - [Hugging Face NLP Course](https://huggingface.co/learn/nlp-course)
    - [Natural Language Processing Specialization (Instructors: Younes Bensouda Mourri, Łukasz Kaiser) by DeepLearning.AI](https://www.deeplearning.ai/specializations/natural-language-processing?_gl=1*krwywa*_gcl_au*MTYxMTUyOTQxMS4xNzg0MTA5MTQw*_ga*MjAyMzc4NTA4OS4xNzg0MTA5MTQw*_ga_FR2MZ1VLMS*czE3ODQxMDkxNDEkbzEkZzEkdDE3ODQxMDk0NzQkajI5JGwwJGgw)  
    - [Stanford CS224N (NLP with DL)](https://web.stanford.edu/class/cs224n/): The gold standard. Covers attention, pretraining, RLHF 

  - Books: 
    - *Natural Language Processing with Transformers* (Tunstall, von Werra, Wolf)
    - *[Speech and Language Processing (by Jurafsky & Martin)](https://web.stanford.edu/~jurafsky/slp3/)* – Read chapters on Transformers, LLMs, Prompting. 
  - Video: [Andrej Karpathy’s *Neural Networks: Zero to Hero* (GPT build)](https://karpathy.ai/zero-to-hero.html)
- **💡 Why to do it:** The Hugging Face course is the industry standard for modern NLP. Karpathy’s series builds unparalleled intuition for LLMs.
- **🛠️ How to do it:** Take a niche text dataset. Tokenize it, fine-tune a small Transformer (e.g., DistilBERT), and push the model to the Hugging Face Hub.
- **🎯 What to focus upon:** 
  - *NLP with Transformers*: Chapters on Tokenization, Fine-Tuning, and the `Trainer` API.
  - Concepts: Self-Attention mechanism, Parameter-Efficient Fine-Tuning (PEFT/LoRA), Padding/Truncation strategies.
- **🔍 Why to focus:** Understanding tokenization is critical for debugging LLM context window limits and weird generation artifacts. LoRA is the industry standard for cost-effective fine-tuning.

### 💻 Core Project: Domain-Specific Document Q&A Engine
- **Tech Stack:** PyTorch, Hugging Face (`transformers`, `datasets`), Gradio.
- **Deliverable:** A fine-tuned encoder model (e.g., RoBERTa) for Named Entity Recognition (NER) or Question Answering on a niche dataset, hosted on Hugging Face Spaces with a Gradio demo.

### ✅ Phase 3 Checklist
- [ ] Completed the Hugging Face NLP Course up to Chapter 6.
- [ ] Fine-tuned a model using the Hugging Face `Trainer` API and pushed it to the Hub.
- [ ] Can draw and explain the Multi-Head Attention mechanism on a whiteboard.

---

## 🟣 Phase 4: Data Engineering 
**Goal:** Bridge the gap between local Jupyter notebooks and scalable, automated, containerized data pipelines.

- **📚 What to do:** 
  - Courses: 
  - [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) 
  - *[Data Engineering (Instructor: Joe Reis) on DeepLearning.AI](https://www.deeplearning.ai/specializations/data-engineering?_gl=1*1jsx8eu*_gcl_au*MTYxMTUyOTQxMS4xNzg0MTA5MTQw*_ga*MjAyMzc4NTA4OS4xNzg0MTA5MTQw*_ga_FR2MZ1VLMS*czE3ODQxMDkxNDEkbzEkZzEkdDE3ODQxMDkxNDckajU0JGwwJGgw)* 
  - Book: *Designing Data-Intensive Applications* (Martin Kleppmann)
- **💡 Why to do it:** ML models are useless without reliable data. DDIA is the "bible" of distributed systems and will make you think like a Senior Engineer.
- **🛠️ How to do it:** Stop using local CSVs. Containerize your database and Python scripts using Docker. Orchestrate a daily data pull.
- **🎯 What to focus upon:** 
  - *DDIA*: Chapters 1 (Reliable, Scalable, Maintainable), 3 (Storage & Retrieval), 4 (Encoding).
  - Tools: Docker, PostgreSQL, Apache Airflow (or Mage), dbt (Data Build Tool).
- **🔍 Why to focus:** Understanding columnar vs. row-based storage and orchestration DAGs is what separates a "notebook data scientist" from a "production ML engineer."

### 💻 Core Project: Automated Batch & Event-Driven Data Pipeline
- **Tech Stack:** Docker, PostgreSQL, Airflow/Mage, dbt.
- **Deliverable:** A `docker-compose.yml` file that spins up a PostgreSQL DB and an Airflow DAG that extracts data from a public API, loads it, and runs dbt models to create analytics-ready tables.

### ✅ Phase 4 Checklist
- [ ] Containerized a Python application and database using Docker.
- [ ] Built an orchestrated pipeline (Airflow/Mage) that runs on a schedule.
- [ ] Read and summarized Chapters 1 & 3 of *Designing Data-Intensive Applications*.

---

## 🔴 Phase 5: AI in Practice – LLMs, RAG, Agents & MCP 
**Goal:** Build stateful, non-linear, multi-agent architectures with rigorous evaluation and monitoring.

- **📚 What to do:** 
  - Courses: *Agentic AI* (Andrew Ng), *AI Agents in LangGraph* (LangChain), *Full Stack LLM Bootcamp*
  - Book: *Build a Large Language Model (From Scratch)* (Sebastian Raschka)
  - Docs: Official [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) Documentation
- **💡 Why to do it:** Linear RAG chains fail in production. Stateful agents and standardized tool connections (MCP) are the current industry frontier.
- **🛠️ How to do it:** Build a RAG system, then upgrade it with a Reranker. Then, wrap it in a LangGraph state machine. Finally, connect it to a live database via an MCP server.
- **🎯 What to focus upon:** 
  - *Raschka's Book*: Chapters on Tokenization, Attention, and Pretraining (to demystify the LLM).
  - *LangGraph*: State management, conditional edges, and tool-calling loops.
  - *Evaluation*: RAGAS or TruLens for measuring hallucination and faithfulness.
- **🔍 Why to focus:** You must know how to *evaluate* an LLM system mathematically, not just by "vibing" with the chatbot. MCP is rapidly becoming the standard for secure LLM-to-tool communication.

### 💻 Core Project: Multi-Agent Enterprise RAG System & MCP Analytics Hub
- **Tech Stack:** LangGraph, LlamaIndex/LangChain, Qdrant/Chroma, MCP Protocol, Streamlit, RAGAS, LangSmith.
- **Deliverable:** A LangGraph workflow with 3 agents (Router, RAG Retriever, Evaluator). Includes a custom MCP server to query a live SQL database. Fully traced via LangSmith.

### ✅ Phase 5 Checklist
- [ ] Built a RAG pipeline with Hybrid Search (BM25 + Dense) and a Reranker.
- [ ] Created a multi-agent workflow using LangGraph with cyclical state (e.g., Critic loops back to Writer).
- [ ] Built and connected a custom MCP server to an external tool (e.g., local file system or SQL DB).
- [ ] Implemented an evaluation script using RAGAS to score the RAG system.

---

## ⚫ Phase 6: Capstone & Portfolio Polish 
**Goal:** Combine all skills into a portfolio-worthy system that gets you hired.

### 💻 Capstone Project: "AI-Powered Autonomous Data Analyst"
- **Concept:** An application where a user uploads a CSV. An LLM Agent analyzes the schema, writes and executes safe Pandas code to answer the user's question, generates a Matplotlib chart, and returns a summarized insight.
- **Tech Stack:** FastAPI (Backend), LangGraph (Agent logic), Streamlit (Frontend), Docker (Deployment), GitHub Actions (CI/CD).
- **Deliverable:** 
  1. Clean GitHub repository with a detailed `README.md` (Architecture diagram, setup instructions).
  2. Live demo URL (Hugging Face Spaces, Render, or AWS EC2).
  3. A 3-minute Loom video walkthrough explaining your technical choices and debugging process.

### ✅ Phase 6 Checklist
- [ ] Capstone project is deployed and accessible via a public URL.
- [ ] Repository has a professional `README.md` with an Excalidraw architecture diagram.
- [ ] Wrote at least 2 technical blog posts (Medium/Substack/LinkedIn) detailing challenges faced in Phase 4 or 5.

---

## 📅 Weekly Execution Model (The "Non-Negotiables")

| Days | Focus Area | Direct Actions |
| :--- | :--- | :--- |
| **Days 1–2** | **Conceptual Absorption** | Watch course videos at 1.25x speed. Read assigned book chapters. Take handwritten notes. |
| **Days 3–4** | **System Core Coding** | Close the tutorials. Write the project code from scratch. Type every line manually. |
| **Days 5–6** | **Production Refactoring** | Add Docker, set up MLflow/W&B/LangSmith tracking, write unit tests, fix environment bugs. |
| **Day 7** | **Documentation & Packaging** | Write the `README.md`. Create an architecture diagram. Post a "Learnings of the Week" thread on LinkedIn. |

---

## 🧠 Golden Rules of AI Practice

1. **The Baseline Rule:** Always build a stupidly simple baseline first (e.g., simple prompt, linear regression). If your complex LLM agent doesn't beat the baseline, you don't need the complex agent.
2. **The Abstraction Ladder:** Whenever you use `trainer.train()` or `agent.invoke()`, spend 15 minutes reading the source code on GitHub to see what it actually does under the hood.
3. **Embrace the "Suck":** You will spend 80% of your time debugging Docker container errors, tensor shape mismatches, and API rate limits. **This is the actual job.** Debugging is where the real learning happens.
4. **Git Hygiene:** Commit often. Use clear commit messages (`feat: add reranker to RAG pipeline`, not `update code`). Never commit `.env` files or raw API keys.

---
