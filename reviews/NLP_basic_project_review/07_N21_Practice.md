# N21 자연어 문제 모델링 및 분석 (실습참고자료)

## 핵심 요약

-   **Instance-based**: KNN 활용, 임베딩 공간에서 유사도 기반 분류
-   **Head-based**: BERT + FC Layer 학습, Cross Entropy Loss
-   **평가**: Accuracy + Tensorboard + 예측 확인
-   **앙상블**: 여러 모델 결합(Voting)으로 성능 향상

------------------------------------------------------------------------

## 1. 문제 정의

-   입력: 1개의 문장 (예: *"with his usual intelligence and subtlety"*)
-   출력: 이진 라벨 (0 = Negative, 1 = Positive)
-   예시) 활용 데이터: **SST-2 (Stanford Sentiment Treebank)**
-   주요 접근 방식:
    -   **Instance-based Classification**
    -   **Head-based Classification**

------------------------------------------------------------------------

## 2. Instance-based Classification

### 전체 Process

1.  **Embedding Space 구축**
    -   BERT 임베딩 활용
    -   Train/Test 데이터를 벡터화하여 공간 형성
2.  **Embedding 적용**
    -   Euclidean Distance 사용 (문장 간 거리 계산)
3.  **Neighbors 도출**
    -   K값(KNN) 설정 (가장 가까운 이웃 수)
    -   가까운 임베딩 벡터 탐색
4.  **최종 라벨 도출**
    -   K개의 이웃 라벨 중 다수결 투표 → 최종 예측

``` python
from sklearn.neighbors import KNeighborsClassifier

# KNN 분류기
knn = KNeighborsClassifier(n_neighbors=5, metric="euclidean")
knn.fit(train_embeddings, train_labels)

# 예측
preds = knn.predict(test_embeddings)
```

------------------------------------------------------------------------

## 3. Head-based Classification

### 전체 Process

1.  **입력**: 토크나이저 거친 Embedding Vector
2.  **BERT Encoder 통과** → 문장당 768차원 벡터
3.  **Fully Connected Layer (FC Layer)** → 2차원(Logit)
4.  **Softmax 적용** → 확률 분포
5.  **Cross Entropy Loss** 활용 학습

``` python
import torch.nn as nn

class SentimentClassifier(nn.Module):
    def __init__(self, bert_model):
        super().__init__()
        self.bert = bert_model
        self.fc = nn.Linear(768, 2)  # 이진 분류
        self.softmax = nn.Softmax(dim=1)

    def forward(self, input_ids, attention_mask):
        outputs = self.bert(input_ids=input_ids, attention_mask=attention_mask)
        cls_output = outputs.pooler_output
        logits = self.fc(cls_output)
        probs = self.softmax(logits)
        return probs
```

------------------------------------------------------------------------

## 4. 평가

-   **Accuracy**: 정확도 측정
-   **Tensorboard**: 학습 과정(Loss, Metric) 시각화
-   **실제 예측 확인**: 모델이 올바르게 분류했는지 검증

``` python
from sklearn.metrics import accuracy_score

acc = accuracy_score(test_labels, preds)
print("Accuracy:", acc)
```

------------------------------------------------------------------------

## 5. 앙상블 기법 적용

### Majority Voting

-   여러 사전학습 모델(BERT, RoBERTa, ALBERT 등)의 예측을 모아 다수결로
    최종 예측

``` python
import numpy as np

def majority_voting(predictions_list):
    # predictions_list: [[bert_preds], [roberta_preds], [albert_preds]]
    stacked = np.stack(predictions_list, axis=0)
    voted = np.apply_along_axis(lambda x: np.bincount(x).argmax(), axis=0, arr=stacked)
    return voted
```

------------------------------------------------------------------------

