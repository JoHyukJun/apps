# ``Intermediate``

## ARC(Automatic Reference Counting)

- 컴파일 시 코드를 분석해 자동으로 retail, release 생성
- 참조된 횟루를 추적해 더 이상 참조되지 않는 인스턴스 메모리 해제

### Strong Reference

- 해당 인스턴스의 소유를 가짐
- 자신이 참조하는 인스턴스의 retain count 증가
- 값 지정 시점에 retain 되고 참조 종료시 release
- 선언할때 아무것도 적지 않으면 default 값이 Strong Reference 임

### Weak Reference

- 해당 인스턴스의 소유권 없음
- 주소값만 가지고있는 포인터 개념
- 자신이 참조하는 인서턴스의 retain count / release 증가 없음
- 메모리가 해제될 경우 자동으로 reference 가 nil 로 초기화
- weak 속성을 사용하는 객체는 항상 optional 타입이여야함
