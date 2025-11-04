# 📊 EDA용 데이터 유형 & 전처리 핵심 정리

## 1. 범주형 데이터 (Categorical)
- **명목형 (Nominal)**: 순서 없음 (성별, 국가, 혈액형, MBTI)
- **순서형 (Ordinal)**: 순서 존재 (리커트 척도, 별점)

### 전처리 방법
- **Label Encoding**: 각 범주 → 숫자 (순서형에 적합, 명목형은 주의)
- **One-Hot Encoding**: 각 범주 → 벡터 (일반적, 차원 ↑ 주의)
- **Binary Encoding**: 범주 → 이진수 벡터
- **Embedding / Hashing**: NLP, 대규모 카테고리 처리 시 활용
- **빈도/통계값 기반 인코딩**: 범주의 등장 횟수/평균값으로 치환

---

## 2. 순환형 데이터 (Cyclical)
- 순서 있지만 반복 구조 (요일, 월, 각도 등)
- 변환 예시:  
  `sin(2πi/n), cos(2πi/n)`

---

## 3. 수치형 데이터 (Numerical)
- **이산형 (Discrete)**: 정수값 (인구 수, 횟수)
- **연속형 (Continuous)**: 실수값 (키, 체중, 온도)
- **구간형 (Interval)**: 차이가 의미 있음 (온도, 시간)
- **비율형 (Ratio)**: 0 기준, 비율 비교 가능 (인구수, 밀도)

---

## 4. 전처리 기법
### 스케일링
- **정규화 (Normalization)**: [0,1] 범위로 변환  
  \[ x' = (x - min) / (max - min) \]
- **표준화 (Standardization)**: 평균 0, 표준편차 1  
  \[ x' = (x - μ) / σ \]

### 분포 왜곡 보정
- **Positive Skew (오른쪽 꼬리)**: Log, Square-root 변환
- **Negative Skew (왼쪽 꼬리)**: Square, Exponential 변환

---

✅ **실무 팁**  
- 명목형 → One-Hot / 빈도 인코딩  
- 순서형 → Label Encoding  
- 순환형 → sin/cos 변환  
- 수치형 → Normalization / Standardization  
- 스케일링은 **알고리즘 성능 & 수렴 속도**에 직접적 영향 있음
