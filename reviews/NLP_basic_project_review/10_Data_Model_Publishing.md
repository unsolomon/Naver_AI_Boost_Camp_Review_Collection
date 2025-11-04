# 📌 Hugging Face - Data & Model Publishing, Project Serving

## 정리
- **퍼블리싱**: 모델/데이터를 Hugging Face Hub에 업로드  
- **카드 작성**: Model Card & Dataset Card → 재현성/공유성 보장  
- **Serving**: Streamlit/Gradio/FastAPI로 웹 서비스화  



---

## 1. Model Publish Process 순서
1. 데이터 수집 (Collecting Training Datasets)  
2. 모델 학습 (Training Model)  
3. 학습된 모델 저장 (Save Trained Model)  
4. 퍼블리싱 (Publishing Model/Dataset)  

### 퍼블리싱 형태
- **Trained Model 배포** (모델만 공개)  
- **Dataset 배포** (데이터셋만 공개)  
- **Dataset + Model 배포** (재현성 보장 목적)

---

## 2. Dataset Publishing vs Model Publishing

| 구분 | Dataset Publishing | Model Publishing |
|------|------------------|-----------------|
| **Name** | Dataset Name | Model Name |
| **Overview** | 데이터셋 개요 | 모델 개요 |
| **구성 요소** | Composition | Model Architecture |
| **생성 과정** | Collection Process | Training Data |
| **전처리 과정** | Preprocessing | Training Procedure |
| **사용법** | How to Use | How to Use |
| **평가** | Evaluation | Evaluation |
| **제한점** | Limitations | Limitations |

---

## 3. Hugging Face 사용 방법

### 3.1 Select Model
- 학습 완료된 모델 경로 지정  
- `Saved Model` 폴더에 저장 후 불러오기  

```python
from transformers import AutoModelForSequenceClassification

model = AutoModelForSequenceClassification.from_pretrained("./saved_model")
```

### 3.2 Select Dataset
- 동일하게 `Saved Dataset` 경로 지정  
- `datasets` 라이브러리 사용  

```python
from datasets import load_from_disk

dataset = load_from_disk("./saved_dataset")
```

---

## 4. Model Card & Dataset Card 작성 순서

### Model Card
- Model Name  
- Overview  
- Model Architecture  
- Training Data  
- Training Procedure  
- How to Use  
- Evaluation  
- Limitations  

### Dataset Card
- Dataset Name  
- Overview  
- Composition  
- Collection Process  
- Preprocessing  
- How to Use  
- Evaluation  
- Limitations  

**📌 저장 방법**  
- 저장된 학습 모델/데이터와 **같은 경로**에 `README.md` 형식으로 저장  
- Hugging Face Hub 업로드 시 함께 올라감  

---

## 5. Project Serving

### 5.1 순서
1. 학습된 모델 저장  
2. 웹 기반 Serving 구성  
3. 사용자 입력을 받아 모델 결과 반환  

### 5.2 사용 가능 툴
- **Streamlit** (가장 쉬움)  
- **Gradio**  
- **FastAPI**

---

## 6. Streamlit 사용 방법

### 6.1 설치
```bash
pip install streamlit
pip install transformers datasets
```

### 6.2 실행 파일 예시 (`app.py`)
```python
import streamlit as st
from transformers import pipeline

st.title("Hugging Face 모델 Demo")

# 파이프라인 로드
classifier = pipeline("sentiment-analysis")

# 사용자 입력
text = st.text_area("텍스트를 입력하세요:")

if st.button("분석하기"):
    result = classifier(text)
    st.write(result)
```

### 6.3 실행
```bash
streamlit run app.py
```

---

