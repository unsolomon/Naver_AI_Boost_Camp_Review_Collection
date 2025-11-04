# N2M 자연어 문제 모델링 및 분석 (실습참고자료)

## 핵심 개념 정리

- **N2M 문제**: 다대다 시퀀스 생성 (번역, 요약, QA 등)
- **모델 구조**: Decoder-Only (GPT-2), Autoregressive
- **전처리**: Tokenization + Special Token 관리
- **학습 관리**: Hugging Face `Trainer`, `TrainingArguments`
- **평가 지표**: ROUGE (Recall 기반), BLEU (Precision 기반)
- **모니터링**: wandb 활용



## 1. 개요

- **N2M 문제 정의**  
  - 입력 N개 → 출력 M개를 생성하는 문제  
  - 대표 Task: **Text Summarization (요약)**  
  - 데이터셋: **CNN/Daily Mail** (기사 본문 + 하이라이트)


## 2. 데이터 전처리

### 2.1 Dataset Class
- `input_ids – labels` 쌍 구성
- Trainer 학습 단계에서 Tokenization 수행
- Article과 Summarization을 구분하기 위해 **Separator Token (예: "TL;DR")** 추가

### 2.2 Data Load
- Hugging Face `load_dataset()` 활용
- **GPT-2 Tokenizer 주의점**: 기본적으로 `pad_token` 미지원 → **수동 추가 필요**

---

## 3. 모델 설명

### 3.1 Decoder-Only 모델
- 사용 모델: **GPT-2 Small** (12 Decoder Block)
- 구조: **Masked Self-Attention 기반 Autoregressive 방식**

### 3.2 TrainingArguments
- Hugging Face에서 제공하는 학습 옵션 모듈
- 주요 설정값:
  - Optimizer
  - Batch size
  - Epoch
  - Output directory
  - Logging / Evaluation strategy

### 3.3 Trainer
- `Trainer`에 Dataset, TrainingArguments 입력
- `compute_metrics` 옵션으로 외부 평가 함수 연결
  - **ROUGE, BLEU** 계산
- 학습 후 `Trainer.train()` 호출 → 모델/토크나이저 저장

---

## 4. 평가 (Evaluation)

### 4.1 Metric
- `Trainer.evaluate(test_dataset)` 실행
- BLEU, ROUGE 점수 산출

### 4.2 Prediction
- 저장된 모델 불러와 요약문 생성
- 생성 결과와 정답 요약 비교

### 4.3 WandB
- 학습 및 평가 과정의 Loss, Metric 변화 추적
- 시각적 모니터링 지원

---

