# 🧱 Data-Centric NLP 응용 분야

## 1️⃣ 모델 수정 없이 성능 향상 (Without Model Modification)

### 🔹 1. 토큰화 (Tokenization)

| 구분 | 설명 | 대표 기법 |
|------|------|------------|
| **단어 기반 (Word-level)** | 공백 기준으로 단어 분리 | 단순하지만 신조어·OOV 처리 어려움 |
| **형태소 기반 (Morpheme-level)** | 어간·접사 단위로 분석 | 한국어 등 교착어에 유리 |
| **서브워드 기반 (Subword-level)** | 단어를 자주 등장하는 부분 단위로 분해 | OOV 문제 해결, 신조어 대응 |
| **문자 기반 (Character-level)** | 글자 단위 처리 | 표현력 높지만 길이 증가 |

**주요 알고리즘**
- **BPE(Byte Pair Encoding)**: 가장 빈번한 문자쌍을 병합해 어휘 생성  
- **WordPiece**: BERT에서 사용되는 변형된 BPE  
- **Unigram LM**: 확률 기반 서브워드 분리 방식  

**한국어 적용**
- 교착어 특성상 **형태소 기반 서브워드 토큰화** (예: Mecab-ko → BPE 32K vocab)이 효과적  
- 실제 사례: **KLUE, ONE-Piece Tokenization (Park et al., 2021)**

---

### 🔹 2. 데이터 증강 (Data Augmentation)

**목적**: 데이터 다양성 확보, 오버피팅 방지, 일반화 성능 향상  

**① Rule-based Techniques**
- **EDA (Easy Data Augmentation)**  
  - SR(Synonym Replacement): 동의어 대체  
  - RI(Random Insertion): 무작위 단어 삽입  
  - RS(Random Swap): 단어 순서 변경  
  - RD(Random Deletion): 단어 제거  
- **UDA (Unsupervised Data Augmentation)**  
  - 비지도 학습 기반 데이터 증강 (Consistency Training 활용)

**② Example Interpolation Techniques**
- **MixUp**: 두 샘플을 혼합해 새로운 입력·레이블 생성  
- **MSDA (Mixed Sample Data Augmentation)**: 문장 단위 보간 확장 기법  

**③ Model-based Techniques**
- **Seq2Seq 기반 증강**: 번역기나 언어모델을 이용한 문장 생성  
- **Back Translation (BT)**: 번역 → 역번역을 통한 데이터 다양화  
- **Fine-tuned GPT Paraphrasing**: GPT 모델로 문장 재구성  

---

### 🔹 3. 데이터 필터링 (Data Filtering)

**목적**: 저품질 데이터 제거로 모델 효율 향상  

**유형**
- **언어 감지 필터**: 지정 언어 여부 확인  
- **수용 가능성 필터**: 의미상 유사성 판단  
- **도메인 필터**: 특정 주제 외 문서 제거  

**활용 예시**
- **Parallel Corpus Filtering (Zhang et al., 2020)**  
- 대표 말뭉치: **OPUS, AI Hub, Wikipedia 병렬 데이터**

---

### 🔹 4. 합성 데이터 (Synthetic Data)

- 실제 수집 대신 **통계적·언어모델 기반으로 생성된 데이터**
- **GPT-3 / GPT-4 기반 Synthetic Generation**  
  → 라벨링 비용 절감, 저자원 언어 보완 가능  
- **활용 사례**: 한국어 맞춤법 교정, QA 데이터 자동 생성 등

---

### 🔹 5. 훈련 전략 (Training Strategies)

- **Curriculum Learning**  
  - 쉬운 샘플 → 어려운 샘플 순서로 학습  
  - 학습 안정화 및 일반화 향상  
  - 예시: *Curriculum Learning for NLU (Xu et al., 2020)*

---

## 2️⃣ 데이터 측정 (Data Measurement)

### **어노테이터 신뢰도 (Inter-Annotator Agreement, IAA)**

| 지표 | 설명 | 특징 | 신뢰도 구간 |
|------|------|------|--------------|
| **Cohen’s Kappa** | 두 명의 주석자 간 일치도 | 단순하면서 널리 사용 | <0.2 약함 / >0.8 매우 높음 |
| **Fleiss’ Kappa** | 세 명 이상 주석자 간 일치도 | 범주형 데이터에 적합 | 동일 구간 기준 |
| **Krippendorff’s Alpha (α)** | 척도·결측치 고려 가능 | 일반성 높음 | <0.667 폐기 / 0.8↑ 신뢰 가능 |

**수식 개념 요약**
\[
\alpha = 1 - \frac{D_o}{D_e}
\]
- \( D_o \): 실제 관측된 불일치도  
- \( D_e \): 우연히 발생할 기대 불일치도  
→ 1에 가까울수록 높은 신뢰성

**어노테이터 품질 관리 팁**
- 명확한 **라벨링 가이드라인 제공**
- 주기적 **교차 검증**
- 라벨 품질 기준: 일관성·재현성·명료성

---

## 3️⃣ HCI & 좋은 데이터의 조건

### **좋은 데이터의 특징**
- 일관성 있게 라벨링됨  
- 중요·희귀 케이스 포함  
- 예외적 상황까지 포괄  
- 적절한 크기 유지  

### **데이터 캐스케이드 (Data Cascade)**
- 데이터 품질 문제 → 하위 단계까지 연쇄적 부정 영향  
- 원인: 데이터 검증 부재, 불균형, 라벨링 오류  

### **데이터 라이프사이클 (Data Lifecycle)**

- **Motivation (동기 부여)** / **Composition (구성)** / **Collection (수집)**  
- **Preprocessing (전처리)** / **Cleaning (정제)** / **Labeling (라벨링)**  
- **Use (활용)** / **Distribution (배포)** / **Maintenance (유지보수)**  

### **Model-based Data-Centric AI**
- DMOps 프로세스 도입  
- 명확한 라벨링 기준 & 버전 관리  
- 모델 예측 기반 지속적 클렌징  

---

## 📘 요약
- 모델 성능 향상의 핵심은 **데이터 품질 관리와 확장**  
- **Subword Tokenization + Data Augmentation + Filtering** 조합이 효과적  
- 데이터 품질 측정(IAA 등)과 **DMOps** 도입으로 안정된 Data Pipeline 구축 가능  
