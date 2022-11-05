
# Operator
-----------------

## ```+(_:_:)```
```swift
static func + (lhs: Text, rhs: Text) -> Text
```
- 새로운 Text view에 두 개의 Text view를 합침
- 더할 각 Text view는 각각 속성을 지정해 줄 수 있음
```swift
Text("Hello World").font(.title).italic()
+ Text("Hello SwiftUI").foregroundColor(.blue)
```