# RNN과 Attention

## RNN의 문제점
- 순차적(단방향)으로 데이터를 처리 → 과거 정보만 반영.
- 장기 의존성(Long-term dependency) 문제: 입력이 길어질수록 과거 정보가 소실됨 (gradient vanishing).

## Attention의 아이디어
- 각 시점의 hidden state (`h0, h1, h2, h3`)를 전부 모아두고,
- 현재 토큰이 “집중해야 할” 위치를 **가중치(Softmax 확률)**로 정해서 다시 합성.
- 이때 사용하는 것이 **Q(쿼리), K(키), V(밸류)**.
  - **Query**: 지금 단어가 "무엇을 찾고 싶은지"
  - **Key**: 각 단어의 "특징"
  - **Value**: 실제 정보(의미)
- 가중치는 `Q · K^T` (내적)으로 계산 → Softmax로 확률화 → 이 확률로 Value들을 가중합.

👉 RNN이 **순차적으로 하나만 이어받는 구조**라면, Attention은 **모든 hidden state를 동시에 참조**해서 중요한 정보를 뽑아냄.

## 실습 자료
- [어텐션을 사용한 인공 신경망 기계 번역 | TensorFlow Core](https://www.tensorflow.org/tutorials/text/nmt_with_attention?hl=ko)

## 요약
- **RNN**: 순차적으로 과거에서 현재로 정보가 흐르므로 장기 기억 손실 문제 발생.
- **Attention**: 모든 시점의 hidden state를 동시에 보고, Softmax 기반 가중 평균으로 중요한 정보만 추출.
- **Transformer**: RNN을 아예 버리고 Attention만으로 시퀀스를 처리하는 구조.
