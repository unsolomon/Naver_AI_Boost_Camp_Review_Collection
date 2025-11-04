# 🧩 전체 흐름 요약

| 구분 | 주요 방법 | 핵심 아이디어 | 장점 |
|------|-------------|----------------|------|
| 🧠 Chain-of-Thought | 단계별 Reasoning | 명시적 사고과정 유도 | 복잡한 문제 해결 |
| ⚙️ Zero-Shot CoT | 예시 없는 추론 | “Let’s think step by step” | 단일 Prompt로 Reasoning |
| 🔁 Self-Consistency | 다중 Reasoning 병합 | Sampling 기반 Ensemble | 정확도 향상 |
| 🧩 Least-to-Most | 작은 단계부터 해결 | 단계적 문제 분해 | 계산/추론 문제에 강함 |
| 🧱 Decomposed Prompting | Sub-task 모듈화 | 구조적 분해 | 일반화 성능 우수 |
| 🌐 ReAct | Reasoning + Acting 결합 | 외부 지식 활용 | 도구 기반 추론 가능 |

---


## 1️⃣ LLM은 생각을 할까?

### 🔸 LLM의 한계
- LLM은 **Auto-Regressive 모델** → “다음 단어를 예측”하는 구조.
- 즉, **‘생각’**이라기보다는 **패턴 인식 기반 확률적 예측**.
- 예: `232 - 197 + 37 = ?`  
  → LLM이 실제로 계산한 것이 아니라,  
  “72”라는 단어가 다음에 나올 확률이 높았기 때문에 출력.

### 🔸 핵심 포인트
- LLM 자체는 **사고(Thinking)** 능력을 가지지 않음.
- 하지만 “생각하는 과정을 흉내내도록” 학습/유도할 수 있음 → **Reasoning & Planning**의 필요성.

---

## 2️⃣ 생각해보기

### 🧩 2.1 Chain-of-Thought (CoT)

> Wei et al., *Chain-of-Thought Prompting Elicits Reasoning in LLMs*, NeurIPS 2022

- 문제 해결 과정을 **자연어로 서술**하게 하여, 단계적 Reasoning을 유도.
- **복잡한 문제(산수, 상식, 기호 추론)**에서 뛰어난 성능을 보임.
- 특히 **대규모 모델(>100B)**에서 **Emergent Ability**로 나타남.

#### ✅ 특징
- 자연어 형태의 설명이 포함되어야 효과적.
- 단순 수식/결과만 적는 것은 효과 없음.
- “답 → 이유” 구조보다 “이유 → 답” 구조가 효과적.
- 코드 데이터로 사전학습된 모델일수록 Reasoning 성능 우수.

---

### 🧩 2.2 Zero-Shot Chain-of-Thought

> Kojima et al., *Large Language Models are Zero-Shot Reasoners*, NeurIPS 2022

- **예시 없이(CoT 예시 제공 없이)**도 스스로 Reasoning 가능.
- `"Let's think step by step"` 과 같은 간단한 트리거 문구로도 작동.

#### ✅ 특징
- Naïve Zero-Shot보다 정확도가 높음.
- 복잡한 문제(GSM8K 등)에서 특히 성능 향상.
- **Zero-Plus-Few-Shot CoT**:  
  Zero-shot으로 생성된 예시를 다시 Few-shot CoT로 활용 시 정확도 상승.
- **Emergent Ability**: 큰 모델에서만 유의미한 효과 발생.

---

### 🧩 2.3 Self-Consistency

> Wang et al., *Self-Consistency Improves CoT Reasoning in LLMs*, ICLR 2023

- CoT의 **단일 Reasoning 경로 오류** 문제를 해결하기 위한 기법.
- 여러 Reasoning 경로를 샘플링하여 **다수결로 최종 답 결정**.
- 일종의 **Ensemble 방식**.

#### ✅ 특징
- 다양한 모델(GPT-3, UL2, LaMDA, PaLM 등)에서 효과 검증.
- **Beam search보다 Sampling 기반 추론이 정확도 높음.**
- Temperature를 높여 다양성을 확보할수록 성능 향상.
- Sample 수 증가 → 정확도 상승 후 수렴.

---

## 3️⃣ 어려운 문제를 작은 문제로 나누기

### 🧩 3.1 Least-to-Most Prompting

> Zhou et al., *Least-to-Most Prompting Enables Complex Reasoning in LLMs*, ICLR 2023

- 복잡한 문제를 **단계적으로 분해하여 해결**하는 접근.
- “쉬운 문제 → 점차 어려운 문제” 순으로 추론.

#### ✅ 특징
- Chain-of-Thought보다 복잡한 계산/기호 추론 과제에서 우수.
- 단계 수가 많을수록 CoT보다 더 높은 정확도.
- Few-shot 예시의 형태가 달라져도 일반화 성능 유지.
- **코드 데이터 학습 모델**에서 성능이 더 좋음.

---

### 🧩 3.2 Decomposed Prompting

> Khot et al., *Decomposed Prompting: A Modular Approach for Solving Complex Tasks*, ICLR 2023

- 문제를 **Sub-task 단위로 분해**하고,  
  **Decomposer ↔ Sub-task handler** 간 상호작용을 통해 해결.
- 복잡한 작업을 **모듈식**으로 처리하는 구조.

#### ✅ 특징
- Least-to-Most보다 더 높은 **정확도와 일반화 성능**.
- **계층적 / 재귀적 분해** 방식으로 긴 시퀀스에도 강함.
- 외부 도구 또는 함수 호출과 연계 가능.

---

## 4️⃣ 외부 기능을 활용한 Reasoning

### 🧩 4.1 ReAct (Reason + Act)

> Yao et al., *ReAct: Synergizing Reasoning and Acting in LLMs*, ICLR 2023

- LLM이 **Reasoning(추론)**과 **Acting(행동, 즉 외부도구 사용)**을 동시에 수행하도록 설계.

#### 🧠 주요 기능
| 함수 | 설명 |
|------|------|
| `Search[entity]` | entity의 위키페이지 첫 5문장 반환 (없을 경우 유사 entity 반환) |
| `Lookup[string]` | 문자열 포함 문장 검색 (Ctrl+F 유사) |
| `Finish[answer]` | 정답 반환 후 종료 |

#### ✅ 특징
- 단독 ReAct는 정확도가 낮아 **Self-Consistency**와 함께 사용.
- 반복 검색/오류 검색 시 오답 유발 가능.
- **CoT-SC ↔ ReAct** 상호보완적 사용:
  - CoT-SC 실패 시 → ReAct 사용  
  - ReAct 실패 시 → CoT-SC 대체
- **Fine-tuning 방식**이 In-context보다 높은 정확도.
- 약 3,000개 Sample로 학습.

---


## 🧭 핵심 Takeaway

- LLM은 “생각하는” 모델이 아니라 “패턴 예측” 모델이지만,  
  **Prompt 설계에 따라 Reasoning 능력을 유도할 수 있음.**
- **CoT → Self-Consistency → Decomposition → ReAct**로 이어지는  
  흐름은 **“단순 패턴 인식 → 복합적 추론 + 행동”**으로의 발전을 의미.
- 향후 LLM의 발전 방향은 **Reasoning, Planning, Acting**의 융합.

---

📚 **참고 논문**
- Wei et al., *Chain-of-Thought Prompting Elicits Reasoning in Large Language Models*, NeurIPS 2022  
- Kojima et al., *Large Language Models are Zero-Shot Reasoners*, NeurIPS 2022  
- Wang et al., *Self-Consistency Improves CoT Reasoning in LLMs*, ICLR 2023  
- Zhou et al., *Least-to-Most Prompting Enables Complex Reasoning in LLMs*, ICLR 2023  
- Khot et al., *Decomposed Prompting: A Modular Approach for Solving Complex Tasks*, ICLR 2023  
- Yao et al., *ReAct: Synergizing Reasoning and Acting in LLMs*, ICLR 2023

---

🧾 **출처:**  
[NLP Recent Trends] Reasoning & Planning (NAVER Connect Foundation, 2024)  
비영리적 교육 목적에 한해 요약 및 재구성됨.
