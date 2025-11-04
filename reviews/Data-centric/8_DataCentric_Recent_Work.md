# 📘 Recent Work in Data-Centric NLP (8강 정리)

## **1️⃣ 데이터 증강 (Data Augmentation)**

### 🧩 **Iterative Back-Translation (Hoang et al., 2018)**
- **정의:** 기계 번역(NMT) 모델의 품질을 향상시키기 위해 역방향 번역 시스템을 반복적으로 활용하는 방법.
- **절차:**
  1. 역방향 번역 모델(Reverse Translation Model)을 먼저 훈련
  2. 타깃 언어의 단일 언어 데이터를 소스 언어로 역번역
  3. 생성된 **합성 병렬 코퍼스(Synthetic Parallel Corpus)** 로 NMT 모델 재훈련
- **효과:**
  - 저자원 언어에서도 품질 개선
  - 데이터 부족 문제 완화 및 도메인 적응 성능 향상

---

### 🧩 **Task-Agnostic Data Augmentation for Pretrained Transformers (Longpre et al., 2020)**
- **목적:** 트랜스포머 기반 사전학습 모델에서 작업 독립적인 데이터 증강 기법의 효과성 평가
- **기법:**
  - 동의어 대체 (Synonym Replacement)
  - 무작위 삽입 / 삭제 / 교환 (Random Insertion, Deletion, Swap)
- **결과:**
  - 작업 및 도메인에 따라 성능 변화가 큼
  - 일부 태스크에서는 오히려 성능 저하 → **증강 기법의 선택이 데이터 특성과 맞아야 함**을 시사

---

### 🧩 **ChatAug: Leveraging ChatGPT for Text Data Augmentation (Dai et al., 2023)**
- **아이디어:** ChatGPT를 활용하여 의미적 일관성을 유지하면서 문장 다양성을 확대
- **방법:**
  - ChatGPT에게 레이블 조건 기반 프롬프트 제공
  - 기존 데이터 의미를 유지한 새로운 샘플 생성
- **적용:** BERT 기반 문장 분류 모델 훈련
- **효과:**
  - 데이터가 적은 환경에서도 성능 향상
  - 소규모 데이터셋에 매우 유용

---

## **2️⃣ 데이터 필터링 (Data Filtering)**

### 🧩 **Parallel Corpus Filtering (WAT 2022)**
- **목적:** 기계 번역 성능 향상을 위한 고품질 병렬 데이터 선별
- **주요 기법:**
  1. **규칙 기반 필터링 (Rule-based):** 문장 길이 불일치, 특수기호, 엔티티 불일치 제거
  2. **통계 기반 필터링 (Statistical):** 언어 모델 확률, 단어 정렬 통계, 단어 분포 기반 점수
  3. **신경망 기반 필터링 (NMT-based):** 문장 임베딩 유사도, 모델 교차 엔트로피 기반 스코어
- **참고:** WAT(Workshop on Asian Translation) 2022에서 핵심 주제로 다룸

---

## **3️⃣ 합성 데이터 (Synthetic Data)**

### 🧩 **Prompt-Based Synthetic Data Generation**
- **핵심 개념:** 최근 대형 언어 모델(LLM)은 “프롬프트(Prompt)”를 통해 데이터 생성을 제어함
- **주요 내용:**
  - 입력 문장 템플릿(template)을 프롬프트로 제공
  - 모델이 이를 기반으로 새로운 문장을 생성
  - Fine-tuning 외에도 Prompt Tuning이 모델 성능에 결정적 역할 수행
- **참고 연구:**
  - *Liu et al., 2023 — Pre-train, Prompt, and Predict*
  - *Reynolds & McDonell, 2021 — Meta Prompt (프롬프트를 생성하는 프롬프트)*
- **응용 사례:**
  - PromptBase(https://promptbase.com): 프롬프트 매매 플랫폼
  - NLPedia Pretrain (https://github.com/pfliu-nlp/NLPedia-Pretrain): Prompt 기반 연구 모음

---

### 🧩 **BTS (Back TranScription for Speech-to-Text Post-Processor, Park et al., 2021)**
- **목적:** 음성 인식 후처리(Post-Processing) 연구를 위한 합성 데이터 생성
- **방법:** Text → Speech → 다시 Text로 변환하는 **TTS-STT 파이프라인** 구성
- **효과:**
  - 띄어쓰기, 구두점, 외래어 변환 등의 오류 포함
  - 다양한 실제 오류 패턴 반영으로 모델 일반화 향상

---

## **4️⃣ 데이터 측정 (Data Measurement)**

### 🧩 **새로운 IAA (Inter-Annotator Agreement) Measure (Braylan et al., 2022)**
- **기존 한계:**
  - Krippendorff’s Alpha는 복잡한 태스크에 적용 어려움
  - 거리 함수(distance function) 선택 기준 불명확
  - 해석 기준이 모호함
- **제안된 개선:**
  - Kolmogorov–Smirnov 통계 기반으로 일관성 측정
  - PDF(확률분포 함수)의 적분으로 주석자 간 일치도 계산
- **특징:**
  - 다중 주석자, 구조적 데이터, 자유 텍스트 태스크에도 적용 가능
  - 해석 기준 명확
    - < 0.667 → 데이터 폐기
    - 0.667–0.8 → 조건부 신뢰
    - > 0.8 → 신뢰 가능

---

### 🧩 **Annotation Disagreement Prediction using Demographic Information (Wan et al., 2023)**
- **목적:** 주석자 간 불일치(Disagreement)를 예측하여 데이터 품질 관리 향상
- **방법:**
  - RoBERTa-base 모델을 사용하여 주석자의 인구통계학적 정보(나이, 성별, 문화권 등) 기반 불일치 예측
- **결과:**
  - SBIC (SNS 기반 데이터)보다 SChem101 (크라우드소싱 기반)에서 예측 경향이 뚜렷함
  - 일부 이상치(outlier)를 제외하면 높은 예측 일관성 확보

---

## **5️⃣ 기타 주요 연구 동향**

| 연구 주제 | 주요 내용 |
|------------|-----------|
| **Label Errors** | 자동 탐지 및 정정 기법 |
| **Data-centric Evaluation** | 데이터 품질 중심 모델 평가 |
| **Class Imbalance & Outliers** | 데이터 불균형, 분포 변화 대응 |
| **Data Privacy & Security** | 프라이버시 보호 및 데이터 보안 강화 |
| **Training Strategies** | 커리큘럼 학습 등 데이터 중심 학습 전략 |
| **Cross-Lingual Transfer Learning** | 다국어 간 데이터 효율적 이전 연구 (*Lee et al., 2021*) |

---

## ✅ **요약**
Data-Centric NLP의 최근 연구는 **모델 수정 없이 데이터 품질만으로 성능을 높이는 방향**으로 진화하고 있으며,
**데이터 생성(Augmentation), 정제(Filtering), 합성(Synthetic), 측정(Measurement)**의 4대 축을 중심으로 발전 중이다.

이러한 접근은 **저자원 언어, 도메인 적응, 공정성(Fairness), 데이터 신뢰성 향상**에 핵심적 기여를 하고 있다.
