# 🧠 NLP Recent Trends — NAVER Boostcamp AI Tech  
> Instructor: 조호준 (KAIST Ph.D Candidate)  
> Summary by: 정리본 (NAVER Connect Foundation, 2024)  
> 비영리적 교육 및 복습용 정리  

---

## 📘 강의 구성

| 강의 | 주제 | 핵심 키워드 |
|------|------|--------------|
| [1강](#1️⃣-reasoning--planning) | Reasoning & Planning | CoT, ReAct, Decomposition |
| [2강](#2️⃣-llm-applications--agents) | LLM Applications & Agents | Auto-GPT, Visual ChatGPT, LLM-Planner |
| [3강](#3️⃣-ethics--responsible-llms) | Ethics & Responsible LLMs | Hallucination, Bias, Privacy |
| [4강](#4️⃣-knowledge-update--continual-learning--rag) | Knowledge Update | Temporal Misalignment, Continual Learning, RAG |
| [5강](#5️⃣-llm-providers--applications--deployment) | LLM Market & Deployment | Open vs Proprietary, Copilot, LangChain |

---

## 1️⃣ Reasoning & Planning  
> From Chain-of-Thought to ReAct — Prompting-based Reasoning Strategies

### 🔹 주요 내용
- **LLM은 사고(thinking)가 아니라 예측(prediction)**  
  → Reasoning과 Planning 기법을 통해 “생각하는 모델”처럼 동작하게 함.
- **Chain-of-Thought (CoT)**: 문제 해결 과정을 단계적으로 표현해 Reasoning 유도.
- **Zero-shot CoT**: `"Let's think step by step"` 문구만으로도 추론 가능.
- **Self-Consistency (SC)**: 여러 Reasoning 결과 중 다수결로 정답 결정.
- **Least-to-Most Prompting**: 쉬운 문제부터 난이도 순차 해결.
- **Decomposed Prompting**: 문제를 하위 모듈 단위로 분해해 해결.
- **ReAct**: Reasoning + Acting 결합 (도구 사용과 추론을 통합).

### 🧩 핵심 요약
| 기법 | 개념 | 대표 논문 |
|------|------|-------------|
| CoT | 단계적 추론 | Wei et al., NeurIPS 2022 |
| Zero-shot CoT | 예시 없는 추론 | Kojima et al., NeurIPS 2022 |
| Self-Consistency | 다중 추론 결합 | Wang et al., ICLR 2023 |
| Least-to-Most | 단계적 문제 분해 | Zhou et al., ICLR 2023 |
| ReAct | Reason + Acting | Yao et al., ICLR 2023 |

---

## 2️⃣ LLM Applications & Agents  
> From Auto-GPT to LLM-Planner — How Agents Think and Act

### 🔹 주요 내용
- **LLM Agent**: 스스로 계획을 세우고 도구를 활용해 문제 해결 (예: Auto-GPT).  
- **Visual ChatGPT**: ChatGPT + Visual Foundation Models (VFM) → 이미지 생성/편집.
- **JARVIS (HuggingGPT)**: ChatGPT가 HuggingFace 모델들을 조율하며 복합 작업 수행.
- **LLM-Planner**: 언어 기반 로봇 행동 계획 (Few-shot Grounded Planning).
- **Generative Agents**: 인간 사회를 시뮬레이션하는 LLM 기반 에이전트.
- **RAG 기반 보강형 에이전트**로 발전 중.

### 🧠 전체 요약

| 분류 | 주요 연구 | 핵심 아이디어 |
|------|------------|----------------|
| Auto-GPT | Self-Planning LLM | 외부 도구 호출 및 실행 |
| Visual ChatGPT | 멀티모달 확장 | VFM + ChatGPT 융합 |
| JARVIS | Model Orchestration | LLM이 다른 모델 조율 |
| LLM-Planner | Embodied Agent | 언어 → 행동 계획 |
| Generative Agents | 인간 시뮬레이션 | 기억-계획-행동 루프 |

---

## 3️⃣ Ethics & Responsible LLMs  
> Building Safe, Fair, and Private Large Language Models

### ⚖️ 주요 이슈
| 구분 | 설명 | 주요 대응 |
|------|------|------------|
| **Hallucination** | 사실과 다른 정보 생성 | TruthfulQA, RAG |
| **Toxicity** | 공격적 텍스트 생성 | Perspective API, Fine-tuning |
| **Bias** | 사회적 편향 반영 | CrowS-Pairs, StereoSet, Self-Debiasing |
| **Privacy** | 학습 중 개인정보 유출 | Deduplication, Knowledge Unlearning |

### 🔹 핵심 기법
- **Self-Diagnosis & Self-Debiasing**  
  → 모델이 스스로 편향 여부를 판단하고 수정.  
- **Knowledge Unlearning**  
  → “잊힐 권리(Right to be Forgotten)” 실현을 위한 선택적 지식 삭제.  
- **Ethical Fine-tuning**  
  → 안전성과 신뢰성 강화용 Fine-tuning 보상 신호 추가.

---

## 4️⃣ Knowledge Update — Continual Learning & RAG  
> Overcoming Temporal Misalignment in LLMs

### 🕰️ Temporal Misalignment
- 시간이 지나면 모델의 지식이 낡아 정확도 저하.
- 학습 시점과 평가 시점이 어긋날수록 Perplexity 상승 (Lazaridou et al., 2021).

### 💥 Catastrophic Forgetting
- 새 데이터 학습 시 기존 지식을 잊는 문제.

### 🔁 Continual Learning
| 방식 | 개념 | 대표 연구 |
|------|------|------------|
| Regularization | 파라미터 변경 최소화 | EWC, Rec-Adam |
| Parameter Expansion | 새로운 모듈만 추가 | LoRA, K-Adapter |
| Rehearsal | 과거 데이터 복습 | Mix-Review, DGR |

### 🔍 Retrieval-Augmented Generation (RAG)
- 외부 데이터 검색을 통해 최신 정보를 반영.
- Hallucination 완화 및 Temporal Misalignment 개선.
- 확장형 기법: **GopherCite**, **WebGPT**, **BlenderBot 3**.

---

## 5️⃣ LLM Providers, Applications & Deployment  
> Understanding the Commercial Landscape of LLMs

### 💼 LLM 시장
- AI 시장은 2030년까지 **740억 달러 규모** 예상.
- 학습 비용: LLaMA-65B 기준 약 **18억 원 이상**.
- 대기업 중심 → 점차 Open-weight 모델로 분산화.

### 🧱 LLM Provider vs Application
| 구분 | Provider | Application |
|------|-----------|--------------|
| 정의 | 모델을 직접 학습·제공 | LLM 기반 서비스 제작 |
| 대표 | OpenAI, Google, Meta | MS, NAVER, Upstage |
| 장점 | 독점적 기술, 고성능 | 빠른 상용화, 접근성 |

### 🧠 주요 모델
| 구분 | 모델명 | 특징 |
|------|---------|--------|
| Proprietary | GPT-4 Turbo, Gemini, HyperCLOVA X | API 기반 상용 모델 |
| Open-weight | LLaMA 2, Mistral, Upstage SOLAR | 공개 가중치 + 자유 활용 |

### ⚙️ LLM Deployment
- **LangChain**: LLM 응용 통합 프레임워크  
- **Quantization**: 모델 경량화 (GPTQ, AWQ, LLaMA.cpp)
- **API 기반 서비스**가 GPU 자원 대비 더 경제적일 수 있음.

---

## 🔚 전체 요약

| Part | 주제 | 핵심 포인트 |
|------|------|--------------|
| 1강 | Reasoning & Planning | Prompt를 통한 사고 유도 |
| 2강 | LLM Applications & Agents | LLM을 행동형 Agent로 발전 |
| 3강 | Ethics | 안전하고 공정한 AI 개발 |
| 4강 | Knowledge Update | 지속적 학습 + 외부 검색 (RAG) |
| 5강 | LLM Trends | LLM 시장, 주요 모델, 상용화 기술 |

---

📚 **참고 자료**
- Wei et al., *Chain-of-Thought Prompting*, NeurIPS 2022  
- Yao et al., *ReAct*, ICLR 2023  
- Lin et al., *TruthfulQA*, ACL 2022  
- Lazaridou et al., *Temporal Generalization in LMs*, NeurIPS 2021  
- Lewis et al., *Retrieval-Augmented Generation*, NeurIPS 2020  
- Gemini Team, *Gemini Models*, arXiv 2023  
- Upstage, *SOLAR 10B Release*, 2023  

---

🧾 **출처:**  
NAVER Connect Foundation — *NLP Recent Trends (2024)*  
비영리적 교육 및 복습 목적의 요약 자료입니다.
