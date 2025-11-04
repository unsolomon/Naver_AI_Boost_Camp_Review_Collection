# 🧭 전체 흐름 요약

| 구분 | 주요 이슈 | 핵심 내용 | 대표 연구 / 대응 방법 |
|------|------------|-------------|------------------------|
| 🌀 **Hallucination** | 거짓 정보 생성 | TruthfulQA 기반 평가, RAG·Prompt 개선으로 완화 | Lin et al., ACL 2022 |
| ⚠️ **Toxicity & Bias** | 공격적/편향된 텍스트 생성 | PerspectiveAPI, CrowS-Pairs, StereoSet으로 측정 | Samuel et al., EMNLP 2020 / Nadeem et al., ACL 2021 |
| 🧩 **Bias 완화** | Self-Diagnosis & Self-Debiasing | 모델이 스스로 독성/편견 인식 후 조정 | Schick et al., TACL 2021 |
| 🔐 **Privacy Invasion** | 개인정보 암기 및 노출 | Deduplication / Knowledge Unlearning | Carlini et al., USENIX 2021 |
| 🌍 **AI 윤리의 방향** | 신뢰성·공정성·안전성 확보 | Alignment, Safety Fine-tuning, Unlearning | LeCun, 2023 등 |

---

## **1️⃣ Hallucination (환각)**

> LLM이 **사실과 다른 정보를 생성**하는 현상.  
> 이는 신뢰성과 안전성의 핵심 문제 중 하나입니다.

### 🔹 정의
- LLM이 존재하지 않거나 사실과 다른 정보를 생성하는 현상.  
- 즉, **그럴듯한 거짓말(Confidently Wrong Answer)**.

### 🔹 측정 방법 — TruthfulQA
> Lin et al., *TruthfulQA: Measuring How Models Mimic Human Falsehoods*, ACL 2022

- **데이터 구성**
  - 38개 카테고리, 817개 질문
  - {질문, 정답, 오답, 출처} 형태
- **평가 방법**
  - 사람이 생성된 텍스트를 평가하여 Truthfulness / Informativeness 점수 부여
  - 0.5 이상이면 참(True), 미만이면 거짓(False)
- **결과**
  - 모델 크기가 클수록 Informativeness ↑, Truthfulness ↓  
  - GPT 시리즈보다 **T5 기반 UnifiedQA**가 더 높은 진실성 기록.

### 🔹 자동 평가 방식
1. **Classifier 기반 평가**  
   - TruthfulQA 데이터를 이용해 GPT-3를 Fine-tuning → 진실성 분류기 학습  
   - Accuracy 약 **90%**, 비용 $100 내외.
2. **객관식 형태 평가 (Perplexity 기반)**  
   - 정답 후보의 Perplexity 측정 → 가장 낮은 값을 정답으로 선택  
   - 대형 모델일수록 Truthfulness 감소.

### 🔹 완화 방법
- **Prompt 개선:** “Think carefully before answering.” 등의 프롬프트 사용 → Truthfulness ↑  
- **RAG (Retrieval-Augmented Generation):**  
  외부 지식 베이스에서 관련 정보를 검색 후 반영하여 환각을 감소시킴.  
  > Chen et al., *Open-Domain QA Tutorial*, ACL 2020

---

## **2️⃣ Toxicity & Bias**

> LLM이 공격적이거나 사회적으로 편향된 텍스트를 생성하는 문제.

---

### 🧪 2.1 Toxicity

> Samuel et al., *RealToxicityPrompts: Evaluating Neural Toxic Degeneration in LMs*, EMNLP 2020

#### ⚙️ Toxicity 측정 — PerspectiveAPI
- Google이 개발한 다언어 Toxicity 평가 API.
- 문장에 대해 8개 속성별 점수 반환 (0~1 범위).  
  - 0.5 이상일 경우 “Toxic”으로 분류.
- **다언어 BERT + CNN** 기반으로 훈련된 모델 사용.

#### 📊 LLM의 Toxic 경향
- 입력이 없어도 EOS 토큰 전까지 생성 시 Toxic 발화 가능.  
- 1,000 span 생성 시 Toxicity 0.9에 도달.  
- Fine-tuning 데이터(Wikipedia 등)가 있는 모델이 가장 낮은 독성 보임.

#### 📈 평가용 데이터 — RealToxicityPrompts
- Reddit 기반 OpenWebText에서 Toxicity 점수 분포에 따라 4구간 샘플링.
- Toxic하지 않은 Prompt로 시작해도 독성 문장을 생성할 확률이 **80% 이상**.
- **LLM의 독성 생성 경향성을 정량 평가하는 기준 데이터셋**으로 활용.

---

### ⚖️ 2.2 Bias (편향)

> Navigli et al., *Biases in Large Language Models*, JDIQ 2023

- LLM은 인터넷 기반 데이터를 학습하면서 **사회적 편견(Stereotype)**을 함께 학습.
- 특히 **Gender, Race, Disability, Nationality** 등에서 편향이 뚜렷함.

#### 📊 Bias 측정 지표

| 데이터셋 | 특징 | 평가 방식 |
|-----------|-------|------------|
| **CrowS-Pairs** | 9개 사회적 편향, 1,508개 예시 | Stereotype 문장 vs. Non-stereotype 문장의 Likelihood 비교 |
| **StereoSet** | Intrasentence / Intersentence 편향 구분 | Stereotype과 Anti-stereotype의 Perplexity 비교 (50%가 이상적) |

- **정확도 100%** → 심한 편향  
- **정확도 0%** → 역편향  
- **정확도 50%** → 편향 없음 (이상적 상태)

---

### 🧩 2.3 Toxicity & Bias 완화

#### 🧠 Fine-tuning / Alignment
> Touvron et al., *LLAMA2: Open Foundation and Fine-tuned Chat Models*, arXiv 2023  
- Model alignment 과정에서 **Safety 보상 신호** 추가 학습  
- 사용자 유해 입력에 대해 안전한 응답을 강화.

#### 🧰 Logit Bias (단순 필터링)
> [OpenAI API logit_bias](https://platform.openai.com/docs/api-reference/completions/create#completions-create-logit_bias)
- 특정 토큰의 생성 확률을 낮추거나 제거 (`-∞` 가중치 적용)
- 한계:  
  - 다단어 표현 처리 불가  
  - 문맥적 독성 구분 어려움  

#### 🔄 Self-Diagnosis & Self-Debiasing
> Schick et al., *Self-Diagnosis and Self-Debiasing*, TACL 2021

##### Step 1️⃣ Self-Diagnosis
- 모델이 스스로 생성문장의 Toxicity를 판단.  
- `"Does the above text contain toxicity?"`  
- Perspective API 라벨과의 정확도 비교 시, 모델 크기↑ → 진단 정확도↑.

##### Step 2️⃣ Self-Debiasing
- Biased token의 확률을 줄이는 방식으로 Decoding 수행.  
- 예시:  
  - “All terrorists are ___” → “Muslims”의 확률을 낮추어 대체 단어 생성.  
- RealToxicityPrompts 기준으로 Perplexity 유지하며 Toxicity 감소.

---

## **3️⃣ Privacy Invasion (개인정보 침해)**

> Carlini et al., *Extracting Training Data from LLMs*, USENIX 2021

### 🔍 정의
- LLM이 학습 데이터 속 **개인 정보를 암기(Memorization)**하여 그대로 재생성하는 문제.

### 📉 사례: GPT-2 Memorization
- 20만 개 샘플 중 1,800개를 Membership Inference Attack으로 복원.  
- 구글 검색 결과와 일치한 604개 텍스트 → 실제 개인 정보 포함.  
- 학습 데이터 중복도가 높을수록 Memorization 확률 급증.

---

### 🧩 완화 방법

#### 1️⃣ **Deduplication**
> Kandpal et al., *Deduplicating Training Data Mitigates Privacy Risks*, ICML 2022  
> Lee et al., *Deduplicating Training Data Makes LMs Better*, ACL 2022

- 학습 데이터 중복을 제거하면 Memorization 현상 완화.  
- 단, 완전한 중복 제거만으로는 개인정보 재생산 방지 불가.  
- 이메일 등 패턴 기반 필터링 필요 (e.g., `@gmail.com`).

#### 2️⃣ **Knowledge Unlearning**
> Jang et al., *Knowledge Unlearning for Mitigating Privacy Risks*, ACL 2023

- 이미 학습된 모델에서 특정 지식을 **선택적으로 제거(Unlearn)**.  
- “잊힐 권리(Right to be Forgotten)” 구현 가능성.

---

## **4️⃣ 핵심 정리**

| 구분 | 문제 | 주요 대응 방법 |
|------|------|----------------|
| 🌀 Hallucination | 거짓 정보 생성 | TruthfulQA 평가, RAG, Prompt 최적화 |
| ⚠️ Toxicity | 공격적 텍스트 생성 | Perspective API, Fine-tuning, Filtering |
| 🧩 Bias | 사회적 편향 반영 | CrowS-Pairs, StereoSet, Self-Debiasing |
| 🔐 Privacy | 개인 정보 노출 | Deduplication, Knowledge Unlearning |

---

## **5️⃣ 윤리적 방향성 및 미래 과제**

- **LLM의 성능 발전**과 함께 **신뢰성·안전성·공정성** 확보가 필수.  
- **Self-aware LLM**: 스스로 문제를 인식·수정하는 방향의 연구가 확대 중.  
- 향후 핵심 연구 키워드:
  - ✅ **Self-Diagnosis / Self-Debiasing**  
  - ✅ **Dynamic RAG** (실시간 검증 기반 생성)  
  - ✅ **Ethical Fine-tuning & Evaluation Frameworks**

---

📚 **참고 논문**
- Lin et al., *TruthfulQA*, ACL 2022  
- Samuel et al., *RealToxicityPrompts*, EMNLP 2020  
- Nadeem et al., *StereoSet*, ACL 2021  
- Schick et al., *Self-Diagnosis & Self-Debiasing*, TACL 2021  
- Carlini et al., *Extracting Training Data from LLMs*, USENIX 2021  
- Kandpal et al., *Deduplication for Privacy*, ICML 2022  
- Jang et al., *Knowledge Unlearning*, ACL 2023  

---

🧾 **출처:**  
[NLP Recent Trends] Ethics (NAVER Connect Foundation, 2024)  
비영리적 교육 목적에 한해 요약 및 재구성됨.
