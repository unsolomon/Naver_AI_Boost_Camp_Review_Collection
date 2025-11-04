# 📊 데이터 시각화 핵심 정리 (EDA)

## 1. 데이터와 시각화
- 텍스트만으로는 정보 손실 발생 → 시각화는 직관 + 인지 강화.
- 데이터 의미 = **도메인 · 수집 방식 · 해석 관점**에 따라 달라짐.

데이터 형태:
- **정형 데이터** (CSV/TSV)
- **시계열** (시간 기반 변화)
- **지리 데이터** (지도 + 분포/경로)
- **관계형/네트워크** (노드/링크)
- **계층적** (Tree, Treemap)
- **비정형** (텍스트, 이미지 등)

---

## 2. 시각화 기본 원리
- **Expressiveness**: 데이터 정보를 모두 표현.
- **Effectiveness**: 중요한 정보가 부각되어야 함.
- **Marks (마크)**: 점·선·면 → 기본 단위.
- **Channels (채널)**: 색상, 크기, 위치 등 시각 속성.

### 시각화 5원칙
1. Accuracy (정확성)  
2. Discriminability (구별 가능성)  
3. Separability (채널 간 분리)  
4. Popout (시각 대비)  
5. Grouping (유사성 인지)

---

## 3. 그래프별 핵심

### 📦 Bar Plot (범주 비교)
- `plt.bar()` / `plt.barh()`
- 변형: Multiple, Grouped, Stacked, Overlapped
- 유의:
  - X축은 반드시 0부터 시작 (비율 왜곡 방지)
  - 데이터 정렬 필수 (시간/크기/순서/범주 기준)
  - 불필요한 3D 효과 지양

---

### 📈 Line Plot (추세 확인)
- `plt.plot()`
- 시간·순서 데이터에 적합
- Noise → smoothing (이동평균, Gaussian filter 등)
- 축은 0일 필요 없음 (추세 중심)
- 불규칙 간격 → 점(marker) 표시
- 보간(interpolation) = 발표용, 분석에서는 지양
- 이중축(dual axis) → 오해 소지, 피하는 게 좋음

---

### 🔵 Scatter Plot (상관관계)
- `plt.scatter(x, y)`
- 속성: 색(color), 크기(size), 모양(marker)
- 문제: 점이 많으면 overplotting  
  → alpha(투명도), jittering, 2D histogram, contour plot 활용
- **상관 ≠ 인과** (해석 시 주의)
- 추세선은 1개만 사용하는 게 가독성 ↑

---

### 📝 Text & Color
- Text 요소: Title, Label, Tick, Legend, Annotation
- Color 원칙:
  - 범주형 → Discrete 팔레트 (최대 7~10개 색)
  - 연속형 → 단일 색조 gradient
  - 발산형 → 중앙 기준 양쪽으로 발산
- 강조 = 대비(명도/채도/보색) 활용
- 색각 이상 고려 (연구/과학 분야 필수)

---

## 4. 실무 적용 팁
- `pandas` + `matplotlib` → 기본  
- `seaborn` → 확장  
- **정렬 + 레이블링 + 최소한의 색상** 유지
- 분석 목적: 추세·패턴·이상치 발견  
- 발표 목적: 단순화 + 시각적 강조

---
