
# 기본세팅
```python
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
```

# Scatter Plot 간단 코드 및 설명 가이드

## 1. 기본 Scatter Plot

- x, y 데이터 이용해 점으로 분포를 시각화.

```python
plt.scatter(x, y)  # 기본 산점도 그리기
```


## 2. 점 색상과 크기 설정

- `c`(색상), `s`(크기) 파라미터로 점 스타일 지정 가능.

```python
plt.scatter(x, y, c='red', s=50)  # 붉은색, 크기 50 점
```


## 3. 그룹별 색상 다르게 표현

- 카테고리별로 색상을 다르게 지정해 구분 가능.

```python
for species, group in df.groupby('Species'):
    plt.scatter(group['SepalLengthCm'], group['SepalWidthCm'], label=species)
plt.legend()
```


## 4. 투명도 조절

- `alpha` 파라미터로 점 투명도 지정.

```python
plt.scatter(x, y, alpha=0.5)  # 50% 투명도 적용
```


## 5. 마커 모양 변경

- `marker`를 변경해 다양한 점 모양 사용.

```python
plt.scatter(x, y, marker='^')  # 삼각형 모양 마커
```


## 6. 축 및 범례 설정

- `xlabel()`, `ylabel()`, `title()`로 축 이름과 제목 지정.
- `legend()`로 범례 표시.

```python
plt.xlabel('Sepal Length'); plt.ylabel('Sepal Width'); plt.title('Iris Sepal Size'); plt.legend()
```


## 7. 여러 subplot에 산점도 그리기

- `plt.subplots()`와 반복문으로 여러 그룹 산점도 한 화면에.

```python
fig, axes = plt.subplots(1, 3, figsize=(15,5))
for ax, species in zip(axes, df['Species'].unique()):
    subset = df[df['Species'] == species]
    ax.scatter(subset['SepalLengthCm'], subset['SepalWidthCm'])
    ax.set_title(species)
```


