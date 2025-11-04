# Transformer 모델 이해 총정리

## 1. Transformer 개요
- **등장 배경**: RNN/LSTM의 한계(순차 처리, 장기 의존성 문제)를 극복하기 위해 제안
- **구조**: 인코더(Encoder)와 디코더(Decoder)로 구성.
- **핵심 아이디어**: Recurrent 구조 없이 **Attention**만으로 문맥(Context)을 학습.
- **장점**: 병렬화 가능, 긴 문맥 처리, 번역/언어모델/이미지/음성 등 다양한 분야 적용.

---

## 2. 인코더 (Encoder)
- **역할**: 입력 문장을 벡터 표현으로 변환 → 문맥 정보를 풍부하게 반영한 고차원 표현 생성.

- **입력 처리**:
  - **Input Embedding**: 토큰 → 고정 차원 벡터 변환
  - **Positional Encoding**: 순서 정보 추가  

- **구조 (각 층)**:
  1. **Multi-Head Self-Attention**
  3. **Add & norm**
  4. **Feed Forward Network (FFN)**
  5. **Add & norm**

    
---

## 3. 디코더 (Decoder)
- **역할**: 인코더 출력과 지금까지의 생성 결과를 바탕으로 새로운 단어 생성.

- **입력 처리**:
  - **Output Embedding**: 입력결과
  - **Positional Encoding**: 순서 정보 추가  

- **구조 (각 층)**:
  1. **Masked Multi-Head Self-Attention**  
     - 현재까지 생성된 단어만 참조 (미래 단어 가려짐)
  2. **Add & norm**
  3. **Encoder-Decoder Cross-Attention**  
     - Q는 디코더에서, K/V는 인코더 출력에서 가져옴
  4. **Add & norm**
  5. **Feed Forward Network (FFN)**
  6. **Add & norm**

  7. **Linear**
  8. **Softmax**

---

## 4. Attention 메커니즘
- **Self-Attention 수식**:
 
- **Q (Query)**: "질문자" → 현재 토큰이 어떤 정보가 필요한가?
- **K (Key)**: "검색 키" → 각 토큰이 가진 특징
- **V (Value)**: "값" → 실제 정보

- **동작 과정**:
  1. Query와 모든 Key 내적 → 유사도 점수
  2. Softmax → 확률 분포(가중치)
  3. Value 벡터 가중합 → 새로운 표현 (문맥 반영)
- **Multi-Head Attention**:
  - 여러 개의 Wq, Wk, Wv를 통해 Q/K/V 생성
  - 병렬로 Attention 수행 후 concat + 선형 변환
  - 다양한 표현 공간에서 관계 학습

---

## 5. Residual Connection & FFN
- **Residual Connection (Add & Norm)**: 입력 + 출력 합한 후 LayerNorm → 학습 안정화 & 성능 향상
- **Feed Forward Network (FFN)**:
  - 각 단어 위치별로 독립적 변환 수행
  - 일반적으로 2개의 선형 변환 + ReLU (또는 GELU)

---

## 6. Masking
- **Padding Mask**: 실제 문장 길이보다 짧은 입력 padding을 무시하기 위함
- **Look-Ahead Mask (Decoder)**: 미래 단어를 참조하지 못하도록 막음 → 올바른 생성 학습

---

## 7. 데이터 흐름 예시
문장 `"나는 **이야"` → `"I am ..."`
1. 입력 임베딩 + 위치 임베딩 → 인코더 입력
2. 인코더 출력 전체 시퀀스 표현 생성
3. 디코더 입력: 지금까지 생성된 `"I am"`
4. 디코더 Self-Attention → 현재까지 단어만 참조
5. Cross-Attention → 인코더 출력 전체 참조
6. FFN → 다음 단어 `"a"` 예측
7. 반복하여 최종 번역 완성

---

## 8. 학습 과정
- **목표**: 다음 단어 예측 (Language Modeling)
- **손실 함수**: Cross-Entropy Loss
- **최적화**: Adam + 학습률 스케줄링 (Warm-up → Decay)
- **Teacher Forcing**: 학습 시 정답 단어를 디코더 입력으로 제공

---

## 9. 핵심 요약
- Transformer는 **Attention 기반 모델**로 RNN의 한계를 극복.
- **인코더**: 입력 문맥 인코딩  
- **디코더**: 조건부 단어 생성  
- **Self-Attention**: 문장 내 단어 관계 파악  
- **Cross-Attention**: 입력-출력 관계 파악  
- **Multi-Head**: 다양한 표현 공간에서 병렬 Attention  
- 다양한 NLP/비NLP 태스크에서 SOTA 달성 → BERT, GPT, T5, ViT 등으로 확장.

---
