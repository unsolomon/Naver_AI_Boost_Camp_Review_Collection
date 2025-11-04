# Barplot 활용 가이드

## 1. 기본 Bar Plot 사용법

- `matplotlib.pyplot.bar()` 함수 사용.
- x축에 데이터 인덱스 또는 카테고리, y축에 값 전달.

```python
plt.bar(x, height)
plt.show()
```


## 2. Bar 색깔 지정법

- `color` 파라미터 활용.
- 색상 문자열, RGB, HEX 코드 가능.

```python
plt.bar(x, height, color='skyblue')
```


## 3. 컬럼 그룹화 후 Bar 그리기

- `groupby()`로 그룹화 후 집계(sum, mean 등).
- 그룹별 데이터별 Bar를 나란히 또는 누적으로 표현.

```python
grouped = df.groupby('category')['value'].mean()
plt.bar(grouped.index, grouped.values)
```


## 4. y축 값 설정법 (sharey, for문 활용)

- 서브플롯 간 y축 공유는 `sharey=True`.
- for문 활용해 반복적으로 y축 설정 가능.

```python
fig, axes = plt.subplots(nrows=2, sharey=True)
for ax in axes:
    ax.set_ylim(0, 100)
```


## 5. 투명도 설정법, Bottom 활용한 누적 Bar 비교

- `alpha`로 투명도 조절 가능 (0~1).
- `bottom` 옵션을 주어 누적 bar 생성.

```python
plt.bar(x, height1, alpha=0.7)
plt.bar(x, height2, bottom=height1, alpha=0.7)
```


## 6. Advanced 테크닉 예시

- 여러 색상, 패턴 조합.
- 에러바 추가.
- 커스텀 tick 설정 등.


## 7. x축 조정 (width, xticks, xticklabels)

- `width`로 막대 너비 조절.
- `plt.xticks()`로 위치 및 레이블 지정.

```python
plt.bar(x, height, width=0.4)
plt.xticks(ticks=x, labels=labels)
```


## 8. 그룹이 N개일 때 규칙과 시각화 방법

- 막대 위치를 그룹 수에 맞춰 계산.
- 그룹별 offset 적용.

```python
bar_width = 0.2
for i, group in enumerate(groups):
    positions = x + i * bar_width
    plt.bar(positions, group_values[i], width=bar_width)
```


## 9. 다양한 공간 테크닉

- 축 범위 조정: `ax.set_xlim()`, `ax.set_ylim()`
- 마진 조절: `ax.margins(x=0.05, y=0.1)`
- 막대 너비: `width` 파라미터
- 테두리(스파인) 숨기기: `ax.spines['top'].set_visible(False)`
- 같은 데이터 두 개의 플롯 대조: subplot 활용


## 10. ETC - 오차막대(Error Bars) 사용법

- `yerr` 옵션에 오차범위 값을 넣으면 오차막대 자동 추가.
- 예시:

```python
plt.bar(x, height, yerr=errors, capsize=5)
```

