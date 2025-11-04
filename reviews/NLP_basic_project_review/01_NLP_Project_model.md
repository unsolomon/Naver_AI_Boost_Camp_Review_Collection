# NLP 기초 프로젝트

------------------------------------------------------------------------

## 1. 일상생활의 다양한 NLP 문제

-   **Disaster Tweets** : 트윗이 재난 관련인지 분류 (0/1 출력)
-   **Extracting Novel Findings from Texts** : 텍스트에서 생물의학 개체 추출
-   **코드 유사성** : 두 코드의 결과물 동일 여부 판별 (1/0 출력)
-   **Image Captioning** : 이미지 입력 → 설명 텍스트 생성

------------------------------------------------------------------------

## 2. NLP 문제 해결 패턴

| 패턴                  | 설명                  | 주요 문제 유형       |
|-----------------------|-----------------------|----------------------|
| **Sequence to Sequence (S2S)** | 입력과 출력 시퀀스를 연결해 모델링 | 번역, 요약 |
| **Encoder Only**      | 입력을 인코딩 후 분류/예측 | 분류, NER |
| **Encoder-Decoder**   | 입력 인코딩 후 디코더로 생성 | 번역, 요약, 대화 |
| **Decoder Only**      | 입력 토큰 기반 생성   | 언어모델, 생성 |
| **Head-based**        | 새로운 파라미터 학습 필요 | Task-specific |
| **Prompt-based**      | 학습 불필요, 프롬프트만 사용 | 대형 LLM 활용 |

---

------------------------------------------------------------------------

## 3. N21 Problem (입력 문장 → 클래스 확률 분포)

-   **Topic Classification** : 주어진 텍스트 주제 예측
-   **Semantic Textual Similarity (STS)** : 두 문장이 의미적으로
    유사한지 측정
-   **Natural Language Inference (NLI)** : 가설·전제 관계 추론
    (Entailment / Contradiction / Neutral)

------------------------------------------------------------------------

## 4. N2N Problem (입력 문장 → 토큰 단위 클래스 확률 분포)

-   **Named Entity Recognition (NER)** : 텍스트 내 개체 경계와 유형
    분류
-   **Morphology Analysis** : 형태소 단위 분절 및 분석

------------------------------------------------------------------------

## 5. N2M Problem (입력 → 시퀀스 출력)

-   **Machine Translation** : Encoder-Decoder 구조, 입력 언어 → 타겟
    언어
-   **Dialog Model** : 대화 모델링 (사용자 발화 → 시스템 발화)
-   **Summarization** : 텍스트 요약 (Abstractive 방식)
-   **Image Captioning** : 이미지 입력 → 설명 텍스트 생성

------------------------------------------------------------------------

## 6. NLP Benchmarks

| 벤치마크            | 설명                            | 주요 Task |
|---------------------|---------------------------------|-----------|
| **GLUE**            | 다양한 문장/문장쌍 Task         | SST-2, STS-B, MNLI, RTE 등 |
| **SuperGLUE**       | GLUE 후속, 더 어려운 Task       | COPA, BoolQ, WSC 등 |
| **KLUE**            | 한국어 벤치마크                 | YNAT, KLUE-STS, KLUE-NLI, NER 등 |
| **MMLU**            | 57개 멀티태스크 테스트셋        | 인문·사회·자연과학 등 |
| **Chatbot Arena**   | 사용자 평가 기반 LLM 리더보드   | LLM 비교 |
| **HellaSwag**       | 문장 완성 기반 상식 추론 평가   | 상식적 Reasoning |

------------------------------------------------------------------------

## 7. 정리 (Task에 맞는 모델 선정)

-   **N21** : Encoder 모델 (분류, STS, NLI)
-   **N2N** : Encoder 모델 (NER, 형태소 분석)
-   **N2M** : Encoder-Decoder / Decoder-only (번역, 대화, 요약, 이미지
    캡셔닝)
