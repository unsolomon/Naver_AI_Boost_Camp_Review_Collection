# 📊 Matplotlib 핵심 정리 (EDA 실무용)

## 1. 기본 세팅
```python
import matplotlib.pyplot as plt
import numpy as np
```

- **순차적 방식 (Stateful API)**  
  ```python
  plt.plot([1, 2, 3], [4, 5, 6])
  plt.title("Title")
  plt.xlabel("X")
  plt.ylabel("Y")
  plt.show()
  ```

- **객체 지향 방식 (Object-Oriented API, 권장)**  
  ```python
  fig, ax = plt.subplots()
  ax.plot([1, 2, 3], [4, 5, 6])
  ax.set_title("Title")
  ax.set_xlabel("X")
  ax.set_ylabel("Y")
  plt.show()
  ```

---

## 2. 그래프 기본 요소

### 선 그래프 + 막대 그래프
```python
fig, ax = plt.subplots()
ax.plot([1, 2, 3], [1, 2, 3])          # 선 그래프
ax.bar([1, 2, 3], [1, 2, 3])           # 막대 그래프
plt.show()
```

### 색상 지정
```python
ax.plot([1, 1, 1], color='r')          # 단축 코드
ax.plot([2, 2, 2], color='forestgreen') # 이름 지정
ax.plot([3, 3, 3], color='#000000')    # HEX 코드
```

### 범례 + 제목
```python
ax.plot([1, 2, 3], label="Line A")
ax.plot([3, 2, 1], label="Line B")
ax.legend()
ax.set_title("Basic Plot")
```

---

## 3. 축 (Axis) 설정
```python
ax.set_xticks([0, 1, 2])
ax.set_xticklabels(['zero', 'one', 'two'])  # 눈금 라벨 변경
```

---

## 4. 주석 (Annotation)
```python
ax.annotate(
    text='Point',
    xy=(1, 2), xytext=(1.2, 2.2),
    arrowprops=dict(facecolor='black')
)
```

---

## 5. 자주 쓰는 옵션 정리
- **Figure 크기 조정**: `fig, ax = plt.subplots(figsize=(12, 7))`
- **여백/간격 조정**: `plt.tight_layout()`
- **여러 Subplot**:
  ```python
  fig, (ax1, ax2) = plt.subplots(2, 1)   # 2행 1열
  ```
- **Grid 추가**: `ax.grid(True)`
- **저장하기**: `plt.savefig("plot.png", dpi=300)`

---

## ✅ 실무 팁
1. **EDA 단계** → 추세/이상치 확인 → `lineplot`, `scatter`
2. **범주형 비교** → `barplot`
3. **노이즈 많은 데이터** → `rolling mean`, `smoothing` 적용 후 시각화
4. **발표용** → Annotation/Color 강조, 축/legend 최소화
5. **재현성** → `figsize`, `seed`, `style` 고정

---
