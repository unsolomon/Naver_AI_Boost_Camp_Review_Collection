# 텍스트(Text) 활용 간단 코드 및 설명 가이드

## 1. 그래프 내 기본 텍스트 추가

- 그래프 안 임의 위치에 텍스트 삽입.

```python
ax.text(x, y, '텍스트 내용')  # (x, y) 위치에 텍스트 추가
```


## 2. 텍스트 폰트 및 스타일 지정

- 폰트 크기, 색상, 굵기, 정렬 등 설정 가능.

```python
ax.text(x, y, '라벨', fontsize=12, color='red', fontweight='bold', ha='center', va='center')
```


## 3. 텍스트 배경 박스 추가

- 텍스트 배경에 박스(테두리, 배경색, 투명도) 삽입.

```python
ax.text(x, y, '배경 텍스트', bbox=dict(facecolor='yellow', alpha=0.3, boxstyle='round,pad=0.5'))
```


## 4. 그래프 제목, 축 제목 텍스트

- `set_title()`, `set_xlabel()`, `set_ylabel()` 함수 사용.

```python
ax.set_title('그래프 제목', fontsize=14)
ax.set_xlabel('X축 이름')
ax.set_ylabel('Y축 이름')
```


## 5. 여러 텍스트 함께 사용하기

- 범례 대신 텍스트로 데이터 구분 등 활용 가능.

```python
ax.text(x1, y1, '그룹 A')
ax.text(x2, y2, '그룹 B')
```


## 6. 텍스트 위치 조정 팁

- `ha` (horizontal alignment): 'left', 'center', 'right'
- `va` (vertical alignment): 'top', 'center', 'bottom'

