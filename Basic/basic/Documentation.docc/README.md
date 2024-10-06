# Basic

## MVVM

    - 장점
        - 개발 단계에서 UI 화면구성(VIEW), 앱의 로직(VIEW MODEL) 을 구분하여 작업 가능
        - UI 코드를 분리하여 순수한 앱의 기능과 로직에 집중하여 테스트 가능
    - 단점
        - 일반화된 VIEW MODEL 을 초기 설계의 어려움
        - MODEL 데이터를 VIEW MODEL 에 다시 작성함에 따라 추가 리소스 발생

## ViewModel

    - @ObservedObject
        - 객체화를 만들어서 내부에 일어나는 변화를 기반으로 어떻게 화면을 다시 그리는지 보여줌
        - 새로 고침되면 일부 애니메이션이 있기 때문에 값이 업데이트됨
        - 이미 객체화된 것을 넘겨 받고 나서 사용
    - @StateObject
        - 하나의 객체로 만들어지고, View 가 얼마나 초기화 되는지 상관없이 별개의 객체 관리
        - View 와 별개의 메모리 공간에 저장해 데이터를 안전하게 보관
        - 객체 처음 초기화 할 때 사용