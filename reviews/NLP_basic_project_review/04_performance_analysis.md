# NLP 성능 분석 정리


------------------------------------------------------------------------
## 📌 정리

-   **분류(Classification)**: Confusion Matrix, Precision/Recall/F1,
    ROC/AUC\
-   **회귀(Regression)**: MSE, MAE, RMSE, R²\
-   **다중 출력(Multi-Label)**: Exact Match, Hamming Loss\
-   **시퀀스 출력(Sequential)**: BLEU, ROUGE\
-   **랭킹 평가(Ranking)**: Precision@K, Recall@K, MAP, MRR\
-   **통계적 검증**: T-value, P-value, Correlation\
-   **Transformer 분석**: Attention 기반 내부 작동 시각화

------------------------------------------------------------------------


## 1. Performance Metrics 이해

모델의 출력 형태(Output Types)에 따른 성능 지표 분류:

-   **Categorical Information → Classification Metrics**
    -   Accuracy, Precision, Recall, F1-score, ROC, AUC 등
-   **Numerical Information → Regression Metrics**
    -   MSE, RMSE, MAE, MAPE, R² 등
-   **Multiple Output Items → Sequence / Multi-Label Metrics**
    -   BLEU, ROUGE, Exact Match Ratio, Hamming Loss 등
-   **Information Retrieval Metrics**
    -   Precision@K, Recall@K, MAP, MRR 등

------------------------------------------------------------------------

### 1.1 Classification

-   **Hard Decision** : 단일 클래스 출력 (예: 고양이/개)
-   **Soft Decision** : 확률 분포 출력 (예: 고양이=0.7, 개=0.3)

주요 지표: - Confusion Matrix - Accuracy (전체 중 올바른 비율) 
Precision (양성 예측 중 실제 양성 비율) - Recall (실제 양성 중 올바르게
예측된 비율) - F1 Score (Precision & Recall 조화 평균) - ROC & AUC (TPR
vs FPR 곡선 면적) - Precision-Recall Tradeoff

------------------------------------------------------------------------

### 1.2 Regression

-   **MSE (Mean Squared Error)**: 오차 제곱 평균
-   **MAE (Mean Absolute Error)**: 오차 절댓값 평균
-   **RMSE (Root Mean Squared Error)**: MSE 제곱근
-   **MAPE (Mean Absolute Percentage Error)**: 비율 기반 오차
-   **R² (결정계수)**: 모델 설명력

------------------------------------------------------------------------

### 1.3 Multiple Outputs

-   **정의**: 여러 개의 독립적인 출력을 동시에 예측
-   활용 예시: 영화 장르 예측(액션, SF, 드라마 ...)
-   주요 지표:
    -   Exact Match Ratio
    -   Hamming Loss
    -   Precision, Recall, F1

------------------------------------------------------------------------

### 1.4 Sequential Outputs

-   순차적으로 생성되는 데이터(번역, 요약, 대화)
-   대표 지표:
    -   **BLEU** (기계 번역)
    -   **ROUGE** (텍스트 요약)

------------------------------------------------------------------------

### 1.5 Multiple Rank

-   순위 기반 검색/추천 성능 평가
-   주요 지표:
    -   Precision@K
    -   Recall@K
    -   F1@K
    -   MRR (Mean Reciprocal Rank)
    -   MAP (Mean Average Precision)
-   **제한점**: 순서 고려 부족, 클래스 불균형에 민감

------------------------------------------------------------------------

## 2. 통계적 유의성 검증

-   **T-value**: 두 그룹 평균 차이 검증
-   **P-value**: 관측 결과가 우연일 확률
-   **Correlation (상관계수)**
    -   Pearson, Spearman 계수
    -   0 \~ 0.2 매우 낮음 / 0.8 \~ 1.0 매우 높음

------------------------------------------------------------------------

## 3. Transformer 상세 분석

-   **Attention**
    -   Query-Key-Value 기반, 입력 간 반응도 학습
-   **Transformer**
    -   다중 Attention Layer로 구성
-   **분석 기법**
    -   Attention Visualization (토큰 간 반응 시각화)
    -   Embedding Attention (CLS 등 특정 토큰 집중도 확인)
    -   Attention Flow (층 간 정보 전달 시각화)
    -   Attention Maps (단어 간 연관도 맵)
    -   Pattern Analysis (학습 변화, Layer별 비교)

