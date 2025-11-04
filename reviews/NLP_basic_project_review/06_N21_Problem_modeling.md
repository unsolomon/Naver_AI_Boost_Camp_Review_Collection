# 📘 N21 자연어 문제 모델링 및 분석

## 1. N21 Problem  
- **정의**: N개의 input → 1개의 output을 구하는 문제  
- **예시**
  - 감성 분석기 (긍정/부정/중립/객관)
  - 스팸 메일 분류 (ham / spam)
  - 기사 주제 분류 (스포츠, 정치, 기술, 비즈니스)

---

## 2. 접근법  

### (1) Instance-based Classification  
- **개념**: 가장 가까운 Instance의 Class를 최종 예측값으로 사용  
- **Embedding 활용**
  - **Textual Embedding**: 텍스트를 벡터로 변환
  - **Non-trainable**
    - Train 데이터의 임베딩을 그대로 사용
    - 예: **K-Nearest Neighbors (KNN)**
      - 새로운 데이터 벡터를 입력받아 거리 계산
      - 가장 가까운 K개의 이웃으로 분류 (다수결)
  - **Trainable**
    - 학습을 통해 벡터 공간 재조정
    - **Triplet Loss** 등을 활용하여 유사한 데이터는 가깝게, 다른 데이터는 멀게 배치  

---

### (2) Head-based Classification  
- **개념**: 문장 벡터를 Class 차원 수만큼 Projection → 예측 수행  
- **신경망 구조**
  1. **입력 레이어**: 문장 토큰화 → BERT 임베딩
  2. **BERT**: [CLS] 토큰을 사용해 문장 벡터 생성
  3. **Linear Layer**: 클래스 수만큼 Projection
  4. **출력 레이어**: Softmax → 가장 높은 확률 클래스 선택
- **Score Normalization**
  - Softmax: 모델 출력(logit)을 0~1 확률 분포로 변환
  - Cross Entropy Loss: 예측과 정답의 차이를 수치화  
- **Loss Function**
  - Regression → MSE
  - Classification → Cross Entropy

---

## 3. Evaluation Metrics  

- **Accuracy**: 전체 중 올바른 비율
- **Precision**: 양성으로 예측된 것 중 실제 양성
- **Recall**: 실제 양성 중 모델이 맞춘 비율
- **F1 Score**: Precision & Recall의 조화평균
- **Micro vs Macro**
  - **Micro**: 전체 데이터 기준
  - **Macro**: 라벨별 평균
  - **Weighted Macro-F1**: 라벨별 데이터 수 반영  

---

## 4. 요약  

- **N21 문제**: N inputs → 1 output  
- **Instance-based**: 임베딩 공간에서 최근접 이웃 기반 (KNN)  
- **Head-based**: Transformer + Softmax 기반 분류  
- **Loss Function**: CE(Classification), MSE(Regression)  
- **평가지표**: Accuracy, Precision, Recall, F1 (Micro/Macro/Weighted)  

---

