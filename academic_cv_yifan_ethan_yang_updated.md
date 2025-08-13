# Yifan (Ethan) Yang 杨易凡

**Email:** yyang29@stanford.edu · **LinkedIn:** linkedin.com/in/yifan-yang-ethan/ · **GitHub:** https://github.com/EthanGeekFan · **Google Scholar:** https://scholar.google.com/citations?user=P4cZDD0AAAAJ&hl=en&oi=sra · **Location:** Bay Area, CA

---

## Research Interests
- Low‑power machine learning for edge devices; hardware–software co‑design for on‑device intelligence
- Hyperdimensional Computing (HDC): statistical early termination, anytime/early‑halt inference, learned encoders & class HVs
- Dynamic pruning/elastic inference for neural networks; time‑series/audio ML under tight latency & memory budgets

---

## Education
**Stanford University**, B.S. in Electrical Engineering — *Sep 2021 – Jun 2024*  
GPA: **3.9/4.0**

**Selected Coursework:** Operating Systems, Compilers, Computer Architecture, Parallel Computing, Machine Learning, Computer Security, Blockchain, Digital System Design, VLSI, Web Development.

---

## Publications & Preprints
- **Pu (Luke) Yi, _Yifan Yang_, Chae Young Lee, Sara Achour.** *Early Termination for Hyperdimensional Computing Using Inferential Statistics (OMEN).* **ASPLOS 2025**, pp. 342–360.  
  PDF: dl.acm.org/doi/pdf/10.1145/3669940.3707254  
- **Pu (Luke) Yi, Tianlang Chen, _Yifan Yang_, Sara Achour.** *Exchangeability in Neural Network Architectures and its Application to Dynamic Pruning.* **ICML 2025 Workshop (ES‑FoMo III)**; **NeurIPS** submission under review.  
  OpenReview: openreview.net/forum?id=V0tOv6thjN
- **_Yifan Yang_, Yujie Wang, Yangkai Lin, Liye Jia.** *IoT System for Collecting Vital Signs and Geographic Location Data of Mobile Users.* **2020 International Conference on Communications, Information System and Computer Engineering (CISCE)**, pp. 163–168. IEEE, 2020.

---

## Research Experience
**Research Assistant — Stanford University (Advisor: Prof. Sara Achour)** — *Sep 2022 – Present*  
- Co‑developed **OMEN**, a statistical early‑termination framework for HDC, reframing HD inference with inferential statistics to reduce computation while preserving accuracy guarantees.
- Re‑engineered the experimental stack to leverage GPU parallelism, shrinking per‑experiment turnaround **from days to <1 minute**, enabling richer ablations and broader dataset coverage.
- Led artifact engineering for reproducibility (one‑command runners; fixed seeds; data/log parsers → auto‑generated LaTeX tables) and helped secure artifact‑quality recognition.
- Proposed and implemented **LearningHD** (learned encoders & learned class HVs) to densify representations and improve downstream accuracy vs. random HVs.
- Built a microcontroller‑based on‑device evaluation pipeline (precise timing & memory accounting) to support edge‑intelligence claims and documentation.

**Post‑OMEN Research — Dynamic Pruning via Exchangeability (with Prof. Sara Achour)** — *2024 – 2025*  
- Formalized **exchangeability** in NN parameters/activations, showing exploitable redundancy at inference time; derived **ExPrune**, a per‑input **dynamic pruning** rule.
- Built an evaluation harness over CNN/Transformer backbones with controlled sparsity–accuracy–latency ablations; standardized early‑exit vs. dynamic‑pruning baselines for fair comparisons.
- Refactored the codebase for reproducibility (scripts, seed discipline, reporting) and prepared public artifacts/experiment sheets.

**Exploratory Project — Music Note Prediction (with Prof. Sara Achour)** — *2023 – 2024*  
- Formulated **symbolic music note prediction** as a time‑series task; benchmarked **HDC** encoders vs. RNN/LSTM & lightweight Transformers under strict memory/latency constraints.
- Implemented dataset curation (MIDI → event sequences), on‑device profiling, and **anytime/early‑halt** evaluators; recorded negative results (e.g., degradation under highly diverse styles) and introduced a hybrid encoder with stabilized voting.
- Outcomes: clarified regimes where HDC wins (short horizon, noisy labels, tight memory) and where learned encoders dominate; distilled insights into follow‑up ablations for ExPrune/OMEN.

**RISC‑V Course Migration & Infrastructure (CS107E)** — *Aug 2023 – Jun 2024; ongoing support through Aug 2025*  
- Migrated the course from ARM/Raspberry Pi to RISC‑V boards: rebuilt the teaching codebase (display pipeline, PS/2 keyboard, build/flash workflows), studied schematics/ISA, and recreated peripheral drivers (I²C/SPI/SD, etc.).
- Researched and **enabled RVV 0.7.1** and **FPU** in the MangoPi toolchain; authored activation guides & intrinsics notes **integrated into the official project guide**.
- Provided ongoing office hours/debugging support post‑graduation and maintained issues/patches with course staff.

---

## Industry & Engineering Experience
**NVIDIA — Deep Learning Infrastructure Engineer** — *Full‑time: Jun 2024 – Present; Intern: Jun–Sep 2022, Jun–Sep 2023*  
- **Project owner/architect & primary implementer** of a **distributed, asynchronous log analytics platform** for silicon verification teams (design → APIs → implementation → rollout).
- Capabilities: **real‑time tail & regex**, **multi‑line parsing/structured extraction**, **error detection & alerting**, **precise stack‑trace mapping**, **free‑text search with millisecond‑level latency**, and **elastic autoscaling** at **TBs/day** scale.
- Internal baseline vs. off‑the‑shelf engines (e.g., columnar search engines): typical tail‑to‑query delay at our scale was **minute‑level**; our design achieves **millisecond‑level** end‑to‑end query latency under production load (measured internally).
- Additional contributions: containerized and migrated chip‑verification services to **Kubernetes**; deployed Redis HA; built an **OpenTelemetry** observability pipeline and an internal tracing library; designed **Tasker**, a job scheduling/management platform for chiplet workflows.

**Si‑Tech (Urumqi) — Software Engineer Intern** — *Jan – Jun 2021*  
- Built an AI work‑order system (Java/Web + NLP), reducing human triage by **>90%**; modularized backend to decouple subsystems; automated workflows to cut processing time by **~80%**.

**China Unicom (Urumqi) — O&M Engineer Intern** — *Jan – Mar 2020*

---

## Selected Projects
- **EE374 Blockchain Node & Mining Pool (Team Lead)** — *Spring 2022*  
  Implemented a full blockchain node and a pool **coordinator**; developed a cross‑platform miner in C++/OpenCV+CUDA using **CPU+GPU**. When a fork/DoS‑like incident stalled the class chain, **open‑sourced** the miner+pool to aggregate peers’ compute and restore chain liveness.

- **CS229 → CS194W: Music Genre / Time‑series & HDC** — *2023 – 2024*  
  Explored audio time‑series; **HDC** surpassed RNN/LSTM baselines in our setting. Productized the pipeline and applied OMEN‑derived ideas to improve accuracy while remaining mobile‑friendly.

- **CS224W: Graph Neural Networks & HDC** - *Fall 2023*
  Explored Graph Neural Network structures and understood how graph neural networks can capture/represent graph structures. Explored expressivity of HDC of entities and compared GNN inspired HDC representations & GNN in various basic tasks.

- **PiAuto (Open‑source)**  
  Turned iPads into portable head units via Raspberry Pi: iOS client + on‑board server (12V power), Wi‑Fi AP, AirPlay audio to car speakers, and OBD integration.

- **IoT System for Pandemic Control (with Prof. Fouad Tobagi)** — *2020*  
  IoT research project designed as a system prototype for pandemic control. Initiated in Jan 2020 at the emergence of COVID‑19. Led a 4‑person team in developing the system for collecting vital signs and geographic location data of mobile users. Published at IEEE CISCE 2020.

---

## Teaching & Service
- Contributed write‑ups to the **CS107E project guide** (RISC‑V RVV/FPU activation, intrinsics usage, periperal drivers and lab materials); continued **office hours & debugging** support after graduation; contribution spanned over a year.

---

## Skills
**Programming:** C/C++, Python, Go, JavaScript/TypeScript, CUDA, Verilog/RTL
**Systems & Infra:** RISC‑V/ARM bare‑metal, RVV, GPU optimization, Linux, Kubernetes, Docker, OpenTelemetry, CI/CD
**ML:** on‑device benchmarking, PyTorch, general knowlegde and exposure to CNN, GNN, RNN
**Tools:** LaTeX, Git

