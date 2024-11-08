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

## Core Data

### Features

- Apple 에서 지원하는 Local DB
- App 이 종료되어도 데이터를 영구적으로 저장
- 많은 양의 데이터 처리 용이
- Relationship 가능해서 다른 데이터와 연결 가능
- Persistaence 저장
- Undo, Redo 데이터 변화 추적 및 되돌리기, 재실행 가능
- 백그라운드 데이터 작업
- 데이터 변화를 자동으로 전파하여 모델 일관성 유지
- 데이터 처리 최적화를 통해 오버헤드 줄임
- 데이터 버전관리나 마이그레이션 기능 제공

### Model(NSManagedObjectModel)

- CoreData 를 관리하는 객체들과 그 객체들 사이의 관계를 표현한 데이터 모델 파일

### Storage Coordinator(NSPersistenceStorageCoordinator)

- Model 에 의해 정의된 데이터들이 실제로 저장된 Persistence Store 를 관리
- Persistence Store 에서 데이터를 가져오고 저장할 때 데이터 검증

### Context(NSManagedObjectContext)

- Persistance Store 뷰에 해당하는 객체
- 해당 객체를 통해 원하는 데이터를 가져오고 Persistence Store 에 가져옴

### Persistence Container(NSPersistenceContainer)

- 간편하게 사용하도록 한꺼번에 초기화 할 수 있는 객체

### @FetchRequest

- SwiftUI 에서 View 로 Core Data 에 저장된 데이터를 요청하는 property wrapper
- FetchRequest 는 SwiftUI 뷰에 로직 없이 추가 가능
- entity, sortDescription 선언해서 사용해야함

### @AppStorate, UserDefaults

- 기본적으로 Data 를 저장하는데 의미는 같음
- 적은량의 데이터, Boolean 값 저장 용도
