# 🧠 Data-Centric 관점으로 본 NLP의 역사

> **핵심 요약:**  
> NLP는 규칙 기반에서 시작해 통계 기반, 딥러닝, 사전학습-미세조정, LLM, 그리고 인간 피드백 중심의 시대로 발전해왔다.  
> 즉, **전문가의 데이터 → 모두의 데이터 → 인간 피드백 데이터**로 진화한 과정이다.

---

## 1️⃣ 규칙 기반 NLP (Rule-Based NLP)
> **전문가의 시대**

- 언어학자가 규칙을 정의해 컴퓨터에 적용 (형태소, 구문, 의미 분석)
- 데이터 = 전문가가 만든 인위적 데이터
- **장점:** 논리적 추론 가능  
- **한계:** 확장성 낮고 복잡한 언어 변화에 취약  
- **예시:** 초기 번역기, ELIZA 등  

---

## 2️⃣ 통계 기반 NLP (Statistical NLP)
> **모두의 시대 — “무의식적 데이터 생성”**

- 대규모 텍스트 데이터를 통계적으로 분석하여 단어 간 관계 학습  
- 빅데이터 등장과 함께 발전 (Wikipedia, Google 등)  
- **핵심 문제:** 희소성(Sparsity Problem)  
- **예시:**  
  - 단어 기반 → 구(Phrase) 기반 → 계층적(Hierarchical) 번역으로 발전  
  - 통계적 기계번역(SMT): 병렬 말뭉치 활용

---

## 3️⃣ 머신러닝 & 딥러닝 기반 NLP
> **전문가 + 대중의 공존 시대**

- **데이터 중심 학습:** 규칙 대신 데이터에서 직접 패턴을 학습  
- **핵심요소:** Big Data + GPU + 혁신적 알고리즘  
- **지도학습:** 감정분석, QA, NER 등 (정답 데이터 필요)  
- **비지도학습:** 언어모델 학습 (BERT, GPT 등)  
- **장점:** 사람을 뛰어넘는 성능 가능  
- **한계:** 고품질 대량 데이터 필요, 해석 어려움

---

## 4️⃣ Pre-train & Fine-tuning 기반 NLP
> **전문가 + 대중 데이터의 융합 시대**

- 대규모 일반 데이터로 **Pre-train**,  
  소규모 전문 데이터로 **Fine-tuning**
- **벤치마크 시대 도래:** GLUE, KLUE 등 리더보드 중심 경쟁  
- **대표 모델:**  
  - **BERT (Encoder)** — 문맥 이해 중심  
  - **GPT (Decoder)** — 텍스트 생성 중심  
  - **BART / T5 (Encoder-Decoder)** — 요약·번역 등 범용 태스크  

---

## 5️⃣ Neural Symbolic NLP
> **전문가의 지식 재등장**

- **지식 + 추론 강화형 NLP**
- 심볼릭 지식(논리 기반)과 신경망 학습 결합  
- **예시:** Knowledge Graph 기반 질의응답 (KBQA)
- **의의:** 딥러닝의 “상식 부족” 보완  

---

## 6️⃣ 초거대 언어모델 (LLMs)
> **모두의 시대 — 대규모 무의식적 데이터 학습**

- **정의:** 수십억~수천억 파라미터의 Transformer 기반 모델  
- **핵심:** 인터넷, 위키, 뉴스 등 대중이 생성한 데이터를 활용  
- **대표 사례:**  
  - GPT-3 (OpenAI): 175B 파라미터, 45TB 데이터  
  - PaLM (Google), LLaMA (Meta)  
  - **한국어:** HyperCLOVA (Naver), KoGPT / MinDALL-E (Kakao), EXAONE (LG)  
- **특징:** Few-shot / Prompt Learning 가능  

---

## 7️⃣ Human Feedback 기반 NLP
> **모두의 시대 — 의식적 피드백**

- 인간의 평가·피드백 데이터를 모델 학습에 활용  
- **기술:** RLHF (Reinforcement Learning from Human Feedback)  
- **대표:** ChatGPT  
- **변화:** 검색 중심 → 대화·생성 중심 패러다임 전환  
- **새로운 직군 등장:** Prompt Engineer  

---

## 📊 정리 요약표

| 시대 | 주요 주체 | 데이터 성격 | 대표 기술/모델 | 키워드 |
|------|------------|--------------|------------------|---------|
| 규칙 기반 | 전문가 | 언어 규칙 중심 | ELIZA, Rule-based MT | 언어학적 지식 |
| 통계 기반 | 대중 | 무의식적 대량 데이터 | SMT | Co-occurrence |
| 딥러닝 기반 | 전문가+대중 | 지도/비지도 데이터 | NER, QA, LM | Data-driven |
| Pre-train & FT | 전문가+대중 | 혼합형 데이터 | BERT, GPT | 벤치마크 경쟁 |
| Neural Symbolic | 전문가 | 상식·추론 데이터 | KBQA | Explainable AI |
| LLMs | 대중 | 초대규모 데이터 | GPT-3, HyperCLOVA | Few-shot |
| Human Feedback | 사용자 | 의식적 피드백 | ChatGPT | RLHF, Prompt |

---

## 💬 결론

> NLP는 “전문가 중심 → 모두 중심 → 사용자 중심”으로 발전 중이다.  
> 결국 **좋은 데이터 품질과 인간의 참여**가  
> 더 강력하고 신뢰할 수 있는 AI를 만든다.
