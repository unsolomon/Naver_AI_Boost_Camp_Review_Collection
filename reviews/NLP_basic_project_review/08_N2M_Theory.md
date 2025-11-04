# 📘 N2M 자연어 문제 모델링 및 분석 (이론)

## 핵심 요약

-   **N2M 문제**: N개의 입력 → M개의 출력
-   **모델 구조**: Encoder-Decoder / Decoder-Only
-   **Search Strategy**: Greedy, Beam, Top-K, Top-P, Temperature
-   **Loss**: Cross Entropy Loss
-   **평가**: ROUGE, BLEU

------------------------------------------------------------------------


## 1. N2M 문제 정의

-   **N개의 입력 → M개의 출력**
-   주요 예시:
    -   언어 모델 (Language Modeling)
    -   텍스트 요약 (Summarization)
    -   번역 (Translation)
    -   질의응답 (Question Answering)

### Text Summarization 유형

-   **Extractive Summarization**: 원문에서 중요 문장만 추출
-   **Abstractive Summarization**: 새로운 문장 생성 (생성형 요약)

------------------------------------------------------------------------

## 2. 아키텍처 유형

### 2.1 Seq2Seq 모델

-   **RNN 기반 Encoder-Decoder 구조**
    -   입력 시퀀스를 인코딩 후 디코딩
-   **Decoder-Only 구조**
    -   인코더 없이 과거 토큰만 활용해 다음 토큰 예측

### 2.2 Transformer 모델

-   **Encoder-Decoder 구조**
    -   대표: BART, T5
    -   입력 전체를 인코딩 후 디코더에서 생성
-   **Decoder-Only 구조**
    -   대표: GPT 시리즈
    -   이전 출력 토큰들을 기반으로 순차적 생성

### 2.3 Search Strategy (생성 방식)

-   **Deterministic Search (결정적 탐색)**
    -   Greedy Search
    -   Beam Search
-   **Random Sampling (확률적 탐색)**
    -   Top-K Sampling
    -   Top-P (Nucleus) Sampling
-   **Temperature 조절**: 확률 분포의 다양성/집중도를 제어

------------------------------------------------------------------------

## 3. Loss Function

-   **Cross Entropy Loss**
    -   각 토큰의 예측 확률과 실제 정답 간의 차이 계산
    -   생성 모델 학습의 기본 Loss

------------------------------------------------------------------------

## 4. 평가 지표

### 4.1 ROUGE (Recall-Oriented Understudy for Gisting Evaluation)

-   **N-gram Recall 기반**
-   주요 지표:
    -   ROUGE-N: N-gram 단위 비교
    -   ROUGE-L: Longest Common Subsequence

### 4.2 BLEU (BiLingual Evaluation Understudy)

-   **N-gram Precision 기반**
-   정밀도를 기하평균으로 계산
-   번역 및 생성 품질 평가에 널리 사용

### 4.3 Reported SOTA 성능 (예시)

-   CNN/Daily Mail: Pegasus → ROUGE-L 약 44
-   XSum: Pegasus → ROUGE-L 약 47
-   WMT'14 번역: BiBERT → BLEU 30+

------------------------------------------------------------------------


