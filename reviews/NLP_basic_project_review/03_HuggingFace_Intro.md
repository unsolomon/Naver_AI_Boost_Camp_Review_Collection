# Hugging Face 소개

------------------------------------------------------------------------

## Hugging Face 전체 구조

**Data → Model → Training → Evaluate → Share**

-   **Data**
    -   `datasets` : 데이터셋 로드/처리/공유
    -   `tokenizer` : 텍스트를 모델 입력으로 변환
    -   `dataCollator` : 배치 단위 데이터 전처리
-   **Model**
    -   `transformers` : 다양한 사전학습 모델 제공
    -   `peft` : 파라미터 효율적인 미세조정(Fine-tuning)
    -   `bitsandbytes` : 경량화 및 효율적 훈련
-   **Training**
    -   `Trainer` : 고수준 학습 API
    -   `accelerate` : 분산/가속화 학습
-   **Evaluate**
    -   `evaluate` : 모델 성능 측정
-   **Pipeline**
    -   추론/실험을 위한 고수준 API

------------------------------------------------------------------------

## Data

### 1) Datasets

-   대규모 데이터셋 로드/처리/공유 지원
-   일관된 인터페이스 제공 (허브/로컬 모두 지원)

``` python
from datasets import load_dataset

# 허브에서 불러오기
dataset = load_dataset("glue", "mrpc")

# 로컬에서 불러오기
dataset = load_dataset("path/to/local/data")

# 저장
dataset.save_to_disk("./mydata")
dataset.to_pandas()
```

------------------------------------------------------------------------

### 2) Tokenizer

-   사전학습 모델과 연동
-   Special Token, Padding, Truncation, Batch 토큰화 지원

``` python
from transformers import BertTokenizerFast, BertModel

tokenizer = BertTokenizerFast.from_pretrained("bert-base-uncased")
model = BertModel.from_pretrained("bert-base-uncased")

tokens = tokenizer("The quick brown fox", padding="max_length", truncation=True)
print(tokens.input_ids)
```

-   주요 반환값
    -   `input_ids` : 토큰을 ID로 변환
    -   `attention_mask` : 실제 토큰(1) / 패딩(0)
    -   `token_type_ids` : 문장 구분 ID

------------------------------------------------------------------------

### 3) DataCollator

- 배치 단위 데이터 준비  
- Padding 자동 처리, Task-specific Collator 제공  

| Task                   | Collator                                |
|------------------------|------------------------------------------|
| 기본                   | `DefaultDataCollator`                   |
| Padding                | `DataCollatorWithPadding`               |
| MLM (Masked LM)        | `DataCollatorForLanguageModeling`        |
| Seq2Seq                | `DataCollatorForSeq2Seq`                |
| Token Classification   | `DataCollatorForTokenClassification`     |

``` python
from transformers import DataCollatorWithPadding, AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")
data_collator = DataCollatorWithPadding(tokenizer=tokenizer)
```

------------------------------------------------------------------------

## Model

### Transformers

-   다양한 Task 지원 (분류, 번역, 생성 등)
-   PyTorch, TensorFlow, JAX 호환

``` python
from transformers import AutoModelForSequenceClassification, AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("bert-base-uncased")
model = AutoModelForSequenceClassification.from_pretrained("bert-base-uncased", num_labels=2)
```

------------------------------------------------------------------------

### PEFT (Parameter Efficient Fine-Tuning)

-   효율적인 파라미터 업데이트로 메모리 절약
-   LoRA 대표적 기법

``` python
from peft import LoraConfig, get_peft_model, TaskType
from transformers import AutoModelForSeq2SeqLM

peft_config = LoraConfig(task_type=TaskType.SEQ_2_SEQ_LM, r=8, lora_alpha=32, lora_dropout=0.1)
model = AutoModelForSeq2SeqLM.from_pretrained("bigscience/mt0-large")
model = get_peft_model(model, peft_config)
```

------------------------------------------------------------------------

## Training

### Trainer

-   학습을 단순화한 고수준 API
-   데이터셋, 모델, 파라미터만 지정하면 학습 실행 가능

``` python
from transformers import Trainer, TrainingArguments

training_args = TrainingArguments(output_dir="test_trainer", evaluation_strategy="epoch")

trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=train_dataset,
    eval_dataset=eval_dataset,
    compute_metrics=compute_metrics,
)
trainer.train()
```

------------------------------------------------------------------------

### Accelerate

-   분산 학습을 위한 프레임워크
-   CPU/GPU/TPU 모두 지원, 기존 코드 거의 수정 없이 적용 가능

``` python
from accelerate import Accelerator

accelerator = Accelerator()
model, optimizer, train_dataloader = accelerator.prepare(model, optimizer, train_dataloader)

for batch in train_dataloader:
    outputs = model(**batch)
    loss = outputs.loss
    accelerator.backward(loss)
    optimizer.step()
```

------------------------------------------------------------------------

## Evaluate

-   다양한 Task별 평가기 제공

  Task                  Evaluator Class
  --------------------- -------------------------------
  QA                    `QuestionAnsweringEvaluator`
  Text Classification   `TextClassificationEvaluator`
  Summarization         `SummarizationEvaluator`
  Translation           `TranslationEvaluator`

``` python
import evaluate
metric = evaluate.load("accuracy")

def compute_metrics(eval_pred):
    logits, labels = eval_pred
    predictions = logits.argmax(axis=-1)
    return metric.compute(predictions=predictions, references=labels)
```

------------------------------------------------------------------------

## Pipeline

-   Tokenizer + Model + Output Layer 결합 → 추론 단순화

``` python
from transformers import pipeline

classifier = pipeline("sentiment-analysis")
print(classifier("Hugging Face is amazing!"))
```

출력:

``` json
[{"label": "POSITIVE", "score": 0.999}]
```

------------------------------------------------------------------------

✅ **정리 포인트** - Hugging Face는 **데이터 수집/처리 → 모델 학습 →
평가/추론 → 공유** 전 과정을 하나의 생태계로 제공\
- `datasets`, `tokenizer`, `dataCollator`, `transformers`, `peft`,
`Trainer`, `accelerate`, `evaluate`, `pipeline` 이해가 핵심
