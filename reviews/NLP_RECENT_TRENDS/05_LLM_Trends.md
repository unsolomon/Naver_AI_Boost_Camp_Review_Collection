# 🌐 NLP Recent Trends — LLM Providers, Applications & Deployment  

## 🧭 전체 흐름 요약

| 구분 | 주요 내용 | 대표 예시 | 특징 |
|------|------------|------------|------|
| 💼 **LLM 시장 현황** | AI 시장 급성장과 학습비용 폭증 | LLaMA, GPT-4 | GPU 클러스터 기반 대규모 학습 |
| 🏗️ **LLM Provider (제공자)** | 모델을 직접 학습·배포하는 기업 | OpenAI, Google, Meta | 독점적 기술력 및 높은 비용 |
| 💡 **LLM Application (응용)** | LLM을 활용해 서비스를 제공하는 기업 | ChatGPT Plugins, Copilot, HyperCLOVA X | 빠른 서비스화와 상용화 중심 |
| 🧩 **Open vs Proprietary LLM** | 공개형과 비공개형 모델의 차이 | Llama2, Mistral vs GPT-4, Gemini | 비용·보안·유연성의 균형 필요 |
| ⚙️ **LLM Deployment** | 실제 서비스에 적용하는 기술적 인프라 | LangChain, Quantization, LLaMA.cpp | 효율적 운용 및 확장성 확보 |

---

## **1️⃣ LLM 시장의 현황**

> LLM 시장은 고성능 모델 경쟁과 응용 생태계 확장으로 빠르게 성장 중입니다.

### 📊 AI 시장 성장 추세
- 2023년 약 **450억 달러 규모 → 2030년 740억 달러 이상 전망**  
  (Statista, 2024)
- **생성형 AI 비중이 급격히 증가**하며, 텍스트 생성 분야가 시장 주도.
- 주요 서비스 사용 비율:
  - ChatGPT 73%
  - DeepL 16%
  - Google Bard 4%
  - QuillBot 4%

### 💸 학습 비용의 현실
- **LLaMA-65B 모델 기준**
  - GPU: NVIDIA A100-80GB × 2048대
  - GPU 시간: 약 **100만 GPU-hours**
  - AWS p4d 스팟 기준 약 **136만 달러 (18억 원)**  
  - 전기료 약 **9,200만 원 + 서버 유지비 별도**
- 거대 모델 학습은 **“대기업도 부담되는 수준”**  
  → 학습 효율 및 압축 기술이 점차 중요해짐.

---

## **2️⃣ LLM Providers vs. Applications**

### 🧱 LLM Providers (모델 제공자)
- LLM을 **직접 학습 및 제공하는 기업**  
  → 예: **OpenAI, Google DeepMind, Meta, StabilityAI, Upstage**
- **특징**
  - API를 통해 모델 사용 허가
  - 대규모 인프라 유지 (GPU 클러스터, 데이터 센터)
  - 독점적 기술로 높은 진입 장벽 형성
- **시장 구조**
  - 고비용 → 소수 기업 독과점
  - 하지만 점차 “**자유시장화(Open-weight 모델 확산)**”로 변화 중

### 🧠 LLM Applications (응용 서비스)
- LLM을 직접 만들진 않지만, **API 기반으로 기능을 구현하는 기업**
- 예시:
  - **ChatGPT Plugins / GPT Store**
  - **MS Copilot**
  - **NAVER HyperCLOVA X**
  - **Upstage AskUp**
  - **Speak (AI 영어 튜터)**
- **특징**
  - 빠른 서비스 구현과 사용자 피드백 중심
  - 스타트업이 뛰어들기 좋은 구조 (비교적 진입비용 낮음)

---

## **3️⃣ Proprietary LLM vs. Open-Weight LLM**

| 구분 | Proprietary LLM | Open-Weight LLM |
|------|-----------------|----------------|
| **가중치 공개 여부** | ❌ 비공개 | ✅ 공개 |
| **사용 방식** | API 호출 | 모델 직접 운용 |
| **초기 비용** | 낮음 | 높음 (GPU·서버 필요) |
| **유지 비용** | 사용량 기반 과금 | 상시 서버 운영비 발생 |
| **보안** | 데이터 외부 전송 위험 | 온프레미스 보안 유지 |
| **Fine-tuning** | 매우 비쌈 | 자유로운 커스터마이징 가능 |

---

### 🔹 Proprietary LLM Examples

#### **OpenAI — ChatGPT**
- **GPT-4 Turbo**
  - 최대 128k Context 지원
  - DALL·E-3 연동 (이미지 생성)
  - PDF 업로드 및 문서 검색 가능
  - 학습 데이터: 2023년 4월까지
- **API 제공** (Azure 기반)
  - gpt-4-turbo, gpt-4o-mini 등 다양한 버전 존재
  - Function calling, Assistants API 등 통합 기능 제공  
  🔗 [OpenAI Pricing](https://openai.com/pricing)

---

#### **Google — Gemini (Ultra / Pro / Nano)**
- **2023년 12월 공개**
- Text, Image, Video, Audio를 모두 처리하는 **멀티모달 모델**
- **32개 벤치마크 중 30개에서 GPT-4를 초월**
- **Ultra**: 대형 작업용 / **Pro**: 범용 / **Nano**: 경량 온디바이스용  
  🔗 [Gemini Research](https://arxiv.org/abs/2312.11805)

---

#### **NAVER — HyperCLOVA X**
- 2023년 9월 24일 공개
- 한국어 데이터 **ChatGPT 대비 6,500배** 이상 학습
- 파트너십: 쏘카, 스마일게이트, 다수 스타트업 협업
- 서비스 예시:
  - **Cue:** 생성형 AI 검색
  - **Clova Studio / NeuroCloud:** 기업용 생성형 AI 솔루션  
  🔗 [clova-x.naver.com](https://clova-x.naver.com)

---

### 🔹 Open-Weight LLM Examples

#### **Meta — LLaMA 2**
- 7B / 13B / 70B 모델 제공  
- **상업적 사용 가능**, 단 월간 사용자 7억 명 이상은 별도 계약 필요  
- RLHF 기반 Chat 모델도 함께 공개 → 연구 표준으로 자리 잡음  
  🔗 [LLaMA 2 Paper](https://arxiv.org/abs/2307.09288)

#### **Mistral & Mixtral**
- 프랑스 기업 **Mistral AI**에서 개발  
- **Mistral 7B (2023.09)** — Llama2-13B보다 우수  
- **Mixtral 8×7B (2023.11)** — Sparse Mixture of Experts 구조  
- **Apache 2.0 License**, DPO 기반 Alignment 모델 추가 공개  
  🔗 [mistral.ai](https://mistral.ai)

#### **Upstage — SOLAR 10.7B**
- 한국 스타트업 Upstage의 오픈 LLM  
- **HuggingFace Open LLM Leaderboard 1위 (2023.12)**  
- Llama2 기반 확장형 구조 + DPO Fine-tuning  
- License: Apache-2.0 (일반) / cc-by-nc-4.0 (Instruct)  
  🔗 [Upstage SOLAR](https://www.upstage.ai/newsroom/solar10b-huggingface-no1)

---

## **4️⃣ LLM Applications**

> LLM은 생산성, 검색, 번역, 교육, 코딩 등 다양한 영역으로 확장되고 있습니다.

### 💬 주요 응용 사례
- **ChatGPT Plugins**
  - 외부 도구와의 연동을 통해 기능 확장
  - 예: Expedia, WolframAlpha, Zapier 연동  
  🔗 [ChatGPT Plugins](https://openai.com/blog/chatgpt-plugins)

- **GPTs / GPT Store**
  - 사용자가 직접 GPT를 생성·판매 가능  
  - “ChatGPT판 App Store”  
  🔗 [Introducing GPTs](https://openai.com/blog/introducing-gpts)

- **Microsoft Copilot**
  - GPT-4 및 DALL·E-3 기반  
  - Office, Windows, GitHub 등과 통합  
  🔗 [Microsoft Copilot](https://www.microsoft.com/ko-kr/microsoft-copilot)

- **Speak (AI 영어 학습)**  
  - 대화형 영어 튜터 서비스  
  - OpenAI 협업 기반  
  🔗 [usespeak.com](https://www.usespeak.com)

- **Upstage AskUp**
  - 카카오톡 기반 챗봇, OCR + GPT 결합  
  - 이미지 인식 및 자연어 응답 지원  
  🔗 [AskUp](https://pf.kakao.com/_BhxkWxj)

---

## **5️⃣ LLM Deployment — 실제 서비스 환경 적용**

> 대규모 LLM을 실제 제품에 통합하려면, **효율적 운영 기술**이 필요합니다.

### ⚙️ LangChain
- **LLM 응용 통합용 프레임워크** (2022년 10월 공개)
- 기능:
  - Prompt Chaining, Agents, Tool Integration
  - Embedding & Vector Store (e.g., FAISS, Chroma)
  - 다양한 LLM Wrapper 지원 (OpenAI, Anthropic, Mistral 등)
- **LLM 서비스 개발 표준 라이브러리**로 자리잡음  
  🔗 [LangChain](https://www.langchain.com)

---

### 🧮 Quantization (양자화)
- 모델 크기 감소 → CPU 및 경량 디바이스에서도 추론 가능
- 주요 기법 및 오픈소스:
  - **GPTQ** → [github.com/IST-DASLab/gptq](https://github.com/IST-DASLab/gptq)
  - **AWQ** → [github.com/mit-han-lab/llm-awq](https://github.com/mit-han-lab/llm-awq)
  - **LLaMA.cpp** → [github.com/ggerganov/llama.cpp](https://github.com/ggerganov/llama.cpp)
- 주의: GPU 활용률이 낮으면 비용 효율성이 급격히 떨어짐  
  → **API 기반 Proprietary LLM이 더 경제적일 수도 있음**

---

## **6️⃣ 핵심 정리**

| 구분 | 내용 | 예시 |
|------|------|------|
| 💼 **LLM Provider** | 모델 자체를 제작·배포하는 기업 | OpenAI, Google, Meta |
| 💡 **LLM Application** | LLM을 이용한 서비스 제공자 | MS, NAVER, Upstage |
| ⚙️ **Open-Weight LLM** | 가중치 공개형 모델 | Llama2, Mistral, SOLAR |
| 🔒 **Proprietary LLM** | 비공개 상용 API형 모델 | GPT-4, Gemini |
| 🧩 **LLM Deployment** | 효율적 실행을 위한 기술 | LangChain, Quantization |

---

📚 **참고 자료**
- Touvron et al., *LLaMA: Open and Efficient Foundation LMs*, arXiv 2023  
- Gemini Team, *Gemini: Multimodal Models*, arXiv 2023  
- Upstage, *SOLAR 10B Release*, 2023  
- Harrison Chase, *LangChain Framework*, 2022  
- OpenAI, *Introducing GPTs & Plugins*, 2023  

---

🧾 **출처:**  
[NLP Recent Trends] LLM Trends (NAVER Connect Foundation, 2024)  
비영리적 교육 목적에 한해 요약 및 재구성됨.
