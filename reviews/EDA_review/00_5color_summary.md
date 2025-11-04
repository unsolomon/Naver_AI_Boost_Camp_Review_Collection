
# 색감을 활용한 간단 코드 및 설명 가이드

1.  **범주형 색상 (Qualitative)**
    -   Tab10, Set2, Pastel 등
    -   서로 다른 집단을 구분할 때 사용
    -   `plt.scatter(..., cmap='tab10')`
2.  **연속형 색상 (Sequential)**
    -   밝기/채도를 이용한 연속적 데이터 표현
    -   Heatmap, Contour Plot 등에 적합
    -   `plt.scatter(..., c=data, cmap='Blues')`
3.  **발산형 색상 (Diverging)**
    -   중심값을 기준으로 음/양 차이를 강조
    -   상관관계, 지리적 데이터 등에 활용
    -   `TwoSlopeNorm(vmin=0, vcenter=50, vmax=100)`
4.  **색상 대비 이해**
    -   명도 대비: 밝고 어두움 차이 강조
    -   채도 대비: 선명함 차이 활용
    -   보색 대비: 반대 색상 활용으로 강조
    -   `plt.scatter(..., color=colors, alpha=0.5)`

## 📌 핵심 코드 한 줄 정리

``` python
plt.scatter(x, y, c=values, cmap="tab10")  # 범주형 색상
plt.scatter(x, y, c=values, cmap="Blues")  # 연속형 색상
plt.scatter(x, y, c=TwoSlopeNorm(vmin=0, vcenter=50, vmax=100)(values), cmap="RdBu")  # 발산형 색상
```

