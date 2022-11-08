# 3.1 @State
-----------

## 3.1.1 개념
- SwiftUI에서는 개발자가 직접 UI를 위한 레이아웃을 구성하는 코드를 작성하지 않음
- 기본 데이터가 변경되면 이에 따른 UI 변화를 반영하는 코드를 작성하지 않아도 뷰를 업데이트 시킬 수 있음
- 뷰와 바인딩 된 상태(state) 객체의 값이 변경되면 자동으로 뷰가 업데이트 됨
- SwiftUI는 state로 선언한 프로퍼티의 저장공간을 관리함
- state의 값이 변경되면 SwiftUI가 이 값에 의존하는 뷰 계층 구조의 일부를 업데이트 함
- 모든 스레드에서 sate 프로퍼티 변경 가능

### 3.1.2 정의
```swift
@frozen @propertyWrapper struct State<Value>
```
- property wrapper (한국어 발음은 프로퍼티 래퍼)
- 읽고 쓰기가 가능한 값 (read and write)
- 해당 뷰에서만 사용되며 privagte 형태로 선언함(SwiftUI의 스토리지 관리와 충돌할 수 있기 때문에 initializer로 값을 받지 않아야 함)

```swift
@State private var isShow: Bool = false
```

### 3.1.3 값 사용하기
- 기본값에 엑세스 하기 위해 프로퍼티 이름으로 접근함
```swift
Text(isShow ? "show!" : "hide!")
```
- 위 코드에서 Text는 프로퍼티 값을 직접적으로 참조함
- for read-only access
- 프로퍼티 값의 변경 -> 해당 프로퍼티가 선언된 뷰 계층 구조를 다시 랜더링 -> 재생성 하여 표시 -> 최신 값이 반영됨

### 3.1.4 값 변경
- child view에 상태값을 전달할 수 있으며 parent의 값이 변경되면 child view도 업데이트 됨. 
- 하지만 child view는 값을 변경할 수 없음 (하위 뷰 혹은 다른 뷰에서 값을 변경하고자 할 때는 Binding을 사용함)
- state property를 정의 한뒤 해당 이름에 앞에 달러 사인 '$' 접두어를 사용해서 값을 binding 해줄 수 있음
- read-write access
- 바인딩이 되어 있는 뷰에서 변경이 일어나면 해당 상태 프로퍼티에 자동으로 바인됭됨
```swift
@State private var age = 40
...
TextField("insert age", test: $age)
```

--------------
## 참고 자료 및 출처
* 핵심만 골라 배우는 SwiftUI 기반의 iOS 프로그래밍: [서점 연결](http://www.yes24.com/Product/Goods/89421220)
* Apple Developer Documentation: [doc](https://developer.apple.com/documentation/swiftui/state)
