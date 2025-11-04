# 🌏 최신 국내 및 해외 NLP 데이터 소개

> 이 문서는 국내외 주요 NLP 데이터셋과 벤치마크를 요약하고,  
> 개인 프로젝트나 연구 Task별로 **어떤 모델과 데이터를 조합하면 좋은지**를 정리한 자료입니다.

---

## 🧩 1. 국내 NLP 데이터 구축 흐름

### 데이터 구축 주체별 분류
| 구분 | 주요 기관 / 프로젝트 | 비고 |
|------|---------------------|------|
| **국가 기관 주도** | 국립국어원(21세기 세종계획, 모두의 말뭉치, 우리말샘), NIA(AI Hub) | 표준화된 공공데이터 중심 |
| **기업 주도** | Naver, KakaoBrain, Upstage(KLUE), LG CNS(KorQuAD), SKT(KoBEST) | 서비스 지향형 고품질 데이터 |
| **학계·개인 주도** | KAIST Corpus, NSMC, Korean Hate Speech, KorLex, Korean CommonGen 등 | 실험적/학습용 데이터 중심 |

---

## 🧱 2. 국내 NLP 데이터 주요 프로젝트

| 프로젝트 | 기간 / 주체 | 데이터 특징 | 추천 Task / 모델 |
|------------|--------------|---------------|------------------|
| **21세기 세종계획** | (1997~2007) 국립국어원 | 한국어 기초자료 2억 어절 구축 / 형태소, 문장, 어휘 중심 | 형태소 분석, POS tagging → `KoNLPy`, `Mecab` |
| **KAIST Corpus** | (1997~2005) KAIST | 다국어 병렬 코퍼스 / 연구 중심 | Translation / Cross-lingual 학습 → `mBERT`, `XLM-R` |
| **엑소브레인(Exobrain)** | (2013~2023) ETRI | 질의응답·지식 기반 언어지능 SW / 전문가 도메인 | QA / MRC Task → `BERT`, `KoELECTRA` |
| **모두의 말뭉치** | (2016~) 국립국어원 | 구어·웹·대화체 중심, JSON 형식, 다층 주석 | 형태소, 구문, 의미역, 개체명 분석 → `ETRI-BERT`, `KLUE-BERT` |
| **우리말샘** | (2015~) 국립국어원 | 공개 국어사전, 오픈 API 제공 | 사전형 NLP, 정의문 추출, 워드 임베딩 → `Word2Vec`, `FastText` |
| **AI Hub** | (2016~) NIA | 1,000+ 공개 AI 데이터 / 도메인별 JSON 제공 | 모든 기본 Task 실습용 (요약, 대화, 감정분석, 윤리검증 등) |
| **KorQuAD 1.0 / 2.0** | (2019~) LG CNS | 한국어 질의응답 / 위키+웹문서 기반 MRC | `BERT`, `RoBERTa`, `KLUE-MRC` |
| **KLUE** | (2021~) Upstage | 한국어 이해 벤치마크 (8개 Task) | 전반적 Benchmark 평가용 → `KLUE-RoBERTa`, `KoBERT` |
| **KorNLI / KorSTS** | (2020) Kakao Brain | 자연어 추론 / 문장 유사도 평가 | Sentence Pair Task → `KoELECTRA`, `RoBERTa` |
| **KOBEST** | (2022) SKT | BoolQ, COPA, WiC, Sentineg 등 한국어 종합 평가 | Zero-shot / Few-shot 모델 검증용 → `KoGPT`, `LLaMA`, `Mistral` |
| **NSMC** | (2016) 개인 | 네이버 영화 리뷰 감정 분석 | Binary Sentiment Classification → `LSTM`, `KoELECTRA`, `BERT` |
| **Korean Comment Corpus (KcBERT)** | (2020) Kaggle | 뉴스 댓글·비속어 포함 대규모 코퍼스 | 언어모델 pre-training / 감정 분석 |
| **Korean Hate Speech (BEEP)** | (2020) KoCoHub | 혐오발언 / 편향 데이터 | Hate Speech Classification → `KoBERT`, `ELECTRA-small` |
| **KorLex** | (Pusan Univ.) | 한국어 WordNet 기반 시소러스형 데이터 | Semantic Reasoning / Ontology Task |
| **Korean CommonGen** | (2022) 고려대 | 상식 기반 문장 생성 데이터 | Text Generation → `T5`, `KoGPT`, `LLaMA-3-Ko` |

---

## 🌍 3. 해외 NLP Benchmark 요약

| 벤치마크 | 주요 Task | 설명 | 대표 모델 |
|-----------|------------|--------|-------------|
| **SQuAD / SQuAD2.0** | Machine Reading Comprehension | 위키 기반 질의응답 | `BERT`, `RoBERTa`, `DeBERTa` |
| **GLUE / SuperGLUE** | NLU 종합 평가 | 자연어 이해 전반 벤치마크 | `BERT`, `ALBERT`, `T5`, `DeBERTa` |
| **CoNLL-2003** | Named Entity Recognition | 영어/독일어 개체명 인식 | `BiLSTM-CRF`, `BERT-NER` |
| **TACRED** | Relation Extraction | 주어-목적어 관계 추출 | `RoBERTa`, `SpanBERT` |
| **CNN/Daily Mail** | Text Summarization | 추상 요약 말뭉치 | `T5`, `BART`, `PEGASUS` |
| **WMT** | Machine Translation | 다국어 번역 벤치마크 | `Transformer`, `M2M-100`, `NLLB` |
| **Wizard-of-Oz / DSTC** | Dialogue System | 대화 상태 추적 (DST) | `T5`, `BERT-DST`, `DialoGPT` |
| **GEM Benchmark** | Text Generation | Multi-lingual Generation 평가 | `Flan-T5`, `GPT-3.5`, `Mistral` |
| **BIG-Bench / MMLU** | LLM 평가 | 200+ Task 대규모 벤치마크 | `GPT-4`, `Claude 3`, `LLaMA 3` |

---

## 🌐 4. Multilingual Benchmark 데이터

| 데이터셋 | 주요 언어 수 | 목적 / 특징 | 활용 모델 |
|-----------|---------------|---------------|-------------|
| **LASER / LASER2** | 50 → 200 | 언어 불문 문장 임베딩 | `LASER Encoder`, `mUSE` |
| **WikiMatrix / CCMatrix** | 85+ | 대규모 병렬 문장 쌍 | 다국어 번역 사전 구축 |
| **M2M-100** | 2,200 | 영어 중심 X, 직접 다국어 간 번역 | `M2M-100`, `NLLB` |
| **FLORES-101 / 200** | 101 → 200 | Low-resource MT 평가용 | `NLLB-200`, `LLaMA-3-MT` |
| **NLLB (No Language Left Behind)** | 200 | 저자원 언어 번역 성능 향상 | `NLLB-200`, `SeamlessM4T` |

---

## 🧠 5. 프로젝트별 데이터 & 모델 매칭 가이드

| 프로젝트 유형 | 추천 데이터셋 | 추천 모델 | 설명 |
|----------------|----------------|------------|--------|
| **감정 분석 (Sentiment Analysis)** | NSMC, AI Hub 감정 대화, BEEP | `KoELECTRA`, `KoBERT` | 긍·부정 분류 및 문장 감정 인식 |
| **질의응답 (Q&A, MRC)** | KorQuAD, KLUE-MRC, SQuAD2.0 | `KLUE-RoBERTa`, `DeBERTa` | 기계독해 및 문서 기반 응답 생성 |
| **문장 유사도 / 자연어 추론** | KorSTS, KorNLI, SNLI | `KoELECTRA`, `Sentence-BERT` | 문장 간 의미적 거리 계산 |
| **요약 / 리포트 생성** | AI Hub 요약문 데이터, CNN/Daily | `KoT5`, `BART`, `PEGASUS` | Extractive / Abstractive Summarization |
| **대화형 AI / 챗봇** | AI Hub 대화체, DSTC, WoZ | `KoGPT`, `DialoGPT`, `LLaMA-3-Instruct` | 대화 상태 추적 및 응답 생성 |
| **번역 / 다국어 처리** | KAIST Corpus, M2M-100, NLLB-200 | `M2M-100`, `NLLB`, `SeamlessM4T` | 한↔다국어 번역 및 Cross-lingual |
| **윤리검증 / 혐오탐지** | AI Hub 윤리데이터, Korean Hate Speech | `ELECTRA-small`, `DistilBERT` | 텍스트 유해성 분류 |
| **상식추론 / 생성 (Commonsense)** | Korean CommonGen, KoBEST-HellaSwag | `T5`, `GPT-3.5`, `LLaMA 3` | 컨텍스트 기반 문장 생성 |
| **개체명 인식 (NER)** | KLUE-NER, CoNLL-2003 | `BERT-NER`, `SpanBERT` | 문장 내 엔티티 추출 |

---

## 🔎 6. 정리 및 인사이트

- **데이터는 모델보다 중요하다** — 특히 한국어 NLP에서는 표준화된 말뭉치와 주석 일관성이 성능의 핵심.
- **모델 선택보다 데이터 적합성이 우선** — Task 목적에 따라 모델 파라미터보다 데이터 형태가 더 큰 영향.
- **국내→해외 데이터 연계** — 예: KorQuAD → SQuAD2.0, KLUE → GLUE/ SuperGLUE.
- **저자원 언어 확장 흐름** — Multilingual 연구는 LASER, NLLB, FLORES 중심으로 발전 중.

---

## 💬 참고 링크

- [모두의 말뭉치](https://corpus.korean.go.kr)  
- [우리말샘 API](https://opendict.korean.go.kr)  
- [AI Hub](https://aihub.or.kr)  
- [KLUE Benchmark](https://klue-benchmark.com)  
- [KorQuAD Dataset](https://korquad.github.io)  
- [KoBEST Paper (2022)](https://arxiv.org/abs/2210.03252)  
- [NLLB: No Language Left Behind](https://ai.facebook.com/research/no-language-left-behind)  

---

> ✅ **TIP:**  
> 개인 프로젝트를 설계할 때,  
> - “**Task 목적 → 데이터 형태 → 모델 구조**” 순서로 결정
