기초 신경망 이론

Linear Classifier 단점 

시각적 
각 클래스 당 하나의 template(카테고리만)만 학습 가능


기하학적 
직석 형태의 decision boundary들만 그릴 수 있음 -복접한 관계로 이루어진 두 개의 클래스들은 완벽하게 분리 불가능

해결 방법 Features(특징 추출 과정)
original space에서 처리할 수 없을때 로 다른 space로 보내 처리가 가능하도록 만드는것 feature space(특징 공간)


뉴럴네트워크
인공신경망은 행렬 수학을 모델로 삼아 소프트웨어적으로 인간의 뉴런 구조를 본떠 만든 기계학습 모델로 인공지능을 구현하기 위한 기술 중 한 형태

뉴럴네트워크 구조
Independent variables - weights - hidden Layer - weights - Dependent variable Prediction

Activation Functions :  인공 신경망에서 입력을 변환하는 함수(sigmoid,tanh,ReLU)
activation Functions을 통해 MLP(Multi-linear layers을 non-linear하게 변환)


최적화 GD에서는 classification loss에 대한 그래디언트를 필요로 한다.
w.r.t 각 파라미터(weight) 각각 파라미터를 업데이트 하기 위해 변수가 loss에 얼마나 큰 영향을 미치는지 나타냄

백 프로퍼게이션(Backpropagation)은 인공 신경망의 학습 과정에서 사용되는 알고리즘

구현 공식 수기로 계산 직접 해보기(추후 추가 예정)
