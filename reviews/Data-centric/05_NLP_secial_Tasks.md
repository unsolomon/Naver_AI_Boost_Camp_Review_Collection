# 🔍 NLP 분야의 특이한 Task 및 Data 요약

> 본 문서는 NLP의 특수 Task 및 관련 데이터셋을 정리하고,  
> 개인 프로젝트에서 사용할 수 있는 **모델 및 데이터 매칭 가이드**를 제공합니다.

## Task별 프로젝트 활용 가이드

| 프로젝트 목적 | 추천 데이터셋 | 추천 모델 |
|----------------|----------------|-------------|
| **온라인 혐오 발언 필터링** | HateXplain / BEEP | `KoELECTRA`, `RoBERTa` |
| **뉴스 진위 판별 시스템** | FakeNewsNet / FEVER | `DeBERTa`, `T5` |
| **AI 번역 품질 자동 평가** | WMT-QE / APE | `M2M-100`, `T5` |
| **공감형 챗봇 개발** | EmpatheticDialogues / AI Hub 감성대화 | `KoGPT`, `LLaMA-3` |
| **교육용 질의응답 자동화** | SQuAD-QG / KorQuAD | `T5`, `BERT` |
| **스토리형 AI 캐릭터 대화** | CMU Movie Corpus | `DialoGPT`, `GPT-4` |


---

## 🚀 핵심 요약

- 일반적인 NLP 과제(분류, 요약, 번역) 외에도, **사회적·언어적 맥락을 다루는 특수 Task**가 존재한다.  
- 이러한 데이터는 감정, 공감, 편향, 설득력, 신뢰성 등 **언어의 비정형적 요소**를 학습하는 데 초점이 있다.  
- 실무나 프로젝트에서는 **"도메인 데이터 + 맞춤형 모델 튜닝"** 전략이 중요하다.

---

## 1️⃣ Hate Speech & Offensive Language

| 주요 개념 | 설명 | 대표 데이터셋 / 활용 |
|------------|------|------------------|
| **HateXplain** | 혐오 발언 탐지용 벤치마크. 혐오 / 공격 / 일반 3단계 분류 및 근거 주석 포함 | `HateXplain`, `BEEP Korean Hate Speech` |
| **Counter Speech Generation** | 혐오 발언에 대응하는 반박 문장 생성 | `CounterContext`, `Reddit CS Dataset` |
| **Sarcasm Detection** | 풍자·반어 탐지. 문맥 기반 의미 해석 필요 | `SARC`, `iSarcasmEval` |

**추천 모델:** `KoELECTRA`, `RoBERTa`, `Flan-T5`, `ChatGPT`  
**적용 예시:** 온라인 커뮤니티 모니터링, 댓글 필터링 시스템

---

## 2️⃣ Deception Detection (허위·조작 탐지)

| 주요 개념 | 설명 | 대표 데이터셋 / 활용 |
|------------|------|------------------|
| **Fake News Detection** | 허위 기사, 조작 콘텐츠 탐지 | `FakeNewsNet`, `LIAR`, `AI Hub Fake News` |
| **Fact Checking** | 주장의 진위 검증, 지식 그래프 기반 비교 | `FEVER`, `Snopes`, `KFact` |

**추천 모델:** `DeBERTa`, `T5`, `GPT-4-turbo`  
**적용 예시:** 미디어 진위 검증, 뉴스 큐레이션, 공공기관 정보 검증 시스템

---

## 3️⃣ Machine Translation (기계 번역)

| 주요 개념 | 설명 | 대표 데이터셋 / 활용 |
|------------|------|------------------|
| **Quality Estimation (QE)** | 번역 품질을 자동 평가하는 태스크 | `WMT-QE`, `QE Shared Task` |
| **Automatic Post-Editing (APE)** | 기계 번역 결과를 자동 수정 | `APE WMT`, `eSCAPE` |

**추천 모델:** `mBART`, `NLLB-200`, `M2M-100`, `T5`  
**적용 예시:** 실시간 번역 품질 모니터링, 저자원 언어 번역

---

## 4️⃣ Dialogue 관련 Task

| 주요 Task | 설명 | 대표 데이터셋 / 활용 |
|------------|------|------------------|
| **Persona-grounded Dialogue** | 대화 참여자의 개인 특성을 반영한 응답 생성 | `PersonaChat`, `ConvAI2` |
| **Persuasive Dialogue** | 설득 목적의 대화 생성 (광고·캠페인 등) | `Persuasion for Good`, `ADGEN` |
| **Dialogue Summarization** | 긴 대화 내용을 요약 | `SAMSum`, `DialogSum` |
| **Knowledge-grounded Dialogue** | 외부 지식을 기반으로 정확한 응답 생성 | `WoW (Wizard of Wikipedia)` |
| **Empathetic Responding** | 감정 인식 및 공감형 대화 | `EmpatheticDialogues`, `EmotionLines` |
| **Character Dialogue** | 소설·게임 캐릭터 간 대화 생성 | `CMU Movie Corpus`, `ScriptBase` |

**추천 모델:** `KoGPT`, `LLaMA-3-Instruct`, `DialoGPT`, `Flan-T5`  
**적용 예시:** AI 상담, 교육용 챗봇, 인터랙티브 스토리텔링

---

## 5️⃣ 기타 특이한 Task & Data

| Task | 설명 | 대표 데이터셋 |
|------|------|----------------|
| **ImageNet-X** | 이미지 왜곡·잡음에 대한 모델 강인성 평가 | `ImageNet-X` |
| **Question Generation (QG)** | 답변을 기반으로 질문 생성 | `SQuAD-QG`, `QuAC` |
| **Document-level Relation Extraction** | 문서 단위 개체 관계 추출 | `DocRED`, `TACRED` |

**추천 모델:** `BART`, `T5`, `DeBERTa`, `Longformer`  
**적용 예시:** QA 시스템, 교육용 자동 문제 생성, 지식그래프 구축

---

## 6️⃣ 한국어 관련 특수 Task

| Task | 설명 | 데이터셋 |
|------|------|-----------|
| **한국어 혐오발언 탐지** | 사회적 맥락 반영한 발화 분석 | `BEEP`, `K-Hate`, `AI Hub 감정대화` |
| **공감형 대화 응답** | 감정 기반 대화 생성 | `AI Hub 감성대화`, `K-EmpatheticDialog` |
| **설득형·정의형 응답** | 윤리·가치 기반 응답 생성 | `AI Hub 윤리발화`, `K-Dialog` |

**추천 모델:** `KoELECTRA`, `KoBERT`, `KoGPT`, `KLUE-RoBERTa`  
**활용 예시:** 한국어 감성대화형 챗봇, 윤리 대화형 AI

---

## 🧭 한 줄 정리

> “Task 중심 데이터 이해가 곧 모델 선택의 기준이다.”  
> - **데이터 특성과 언어 맥락을 고려한 모델 선택**이 가장 효율적인 접근이다.  
> - 특히 한국어 NLP에서는 **감정·공감·윤리 데이터셋**의 품질이 모델 성능을 좌우한다.
