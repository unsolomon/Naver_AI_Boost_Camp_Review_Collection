# Line Plot 간단 코드 및 설명 가이드

## 1. 기본 Line Plot

- 가장 기본적인 선그래프 그리기. x, y 데이터 필요.

```python
plt.plot(x, y)  # x와 y값으로 선 그래프 생성
```


## 2. 색상, 마커, 선 스타일 지정

- 라인 그래프의 색, 점 모양, 선 종류를 변경할 수 있음.

```python
plt.plot(x, y, color='black', marker='*', linestyle='solid')  # 검은색, 별모양 마커, 실선
```


## 3. 시계열 데이터 시각화

- 시간 데이터를 x축으로 사용해 주가 변화 등 시계열 데이터 표현.

```python
ax.plot(df.index, df['close'])  # 날짜를 x축, 종가를 y축으로 그래프
```


## 4. 이동 평균 계산 및 시각화

- 변동성 완화를 위해 일정 기간 평균값을 구해 부드러운 선을 그림.

```python
rolling = df['close'].rolling(window=20).mean()
plt.plot(rolling)  # 20일 이동평균선 그리기
```


## 5. 축 눈금 간격 조절

- `MultipleLocator` 사용해 x, y축 눈금의 단위를 지정.

```python
ax.xaxis.set_major_locator(MultipleLocator(1))  # x축 눈금 간격 1
ax.yaxis.set_major_locator(MultipleLocator(0.05))  # y축 눈금 간격 0.05
```


## 6. 부드러운 곡선 보간

- 산점도를 부드러운 곡선으로 연결하고 싶을 때 보간(interpolation) 사용.

```python
spl = make_interp_spline(x_num, y)
plt.plot(spl(np.linspace(min(x_num), max(x_num), 50)))  # 50개 점으로 보간 후 선 그리기
```


## 7. 이중 축(line) 사용하기

- 두 개의 y축이 필요한 데이터 표현 시 활용.

```python
ax2 = ax1.twinx()
ax2.plot(x, y2, color='red')  # 두 번째 y축에 선 그래프 추가
```


## 8. 그래프의 테두리(스파인) 숨기기

- 상단과 우측 테두리를 없애 그래프를 깔끔하게 할 수 있음.

```python
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
```


## 9. 그래프에 텍스트 추가

- 특정 데이터 포인트 등에 라벨을 달아 가독성 높임.

```python
ax.text(x[-1], y[-1], 'label', bbox=dict(facecolor='yellow', alpha=0.3))  # 마지막 점 라벨링
```


## 10. 최대값, 최소값 강조 표시

- 최대, 최소 지점을 점(dot)으로 시각화해 강조.

```python
ax.scatter(x[np.argmax(y)], max(y), c='red', s=50)  # 최대값 위치에 빨간 점
ax.scatter(x[np.argmin(y)], min(y), c='blue', s=50)  # 최소값 위치에 파란 점
```


