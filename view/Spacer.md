# 2.4 Spacer
------

### 특징
- 뷰 사이 간격 설정
- 뷰의 크기 확장
- 스택 외부에서 사용시 
  - 부모 뷰가 제공하는 공간 내에서 가능한 최대 크기로 확장. 
  - 시각적 요소 적용할 수 있는 뷰 (Spacer 내부의 컨텐츠가 보임)
- 스택 내부
  - HStack, VStack : 시각적 요소 x, 단지 공간 확장. 콘텐츠가 없는 경우 뷰 처럼 취급됨
  - ZStack에서 각각 개별적인 뷰가 계층 구조를 이루고 있는 형태 -> 시각적 요소 + 확장성
  ```swift
          HStack {
            Text("text1").font(.title).foregroundColor(.blue)
            Text("text2")
            Text("text3").font(.title3).foregroundColor(.red)
            Spacer().background(.blue)
        }
  ```
    - 위 코드에서 Spacer는 콘텐츠 없이 사용되어 출력되는 내용 없이 (색상 변경 없음) 공간을 차지함
    - ZStack으로 변경시 차지할 수 있는 최대의 공간으로 확장되며 시각적 요소(현재 코드에서는 색상)도 나타남


### 길이제한
- Spacer의 크기는 frame 수식어로 변경
```swift
Spacer().background(.blue).frame(width: 100)
```

### 최소 간격
- 지정한 minLength 보다 큰 값을 가지며 이 보다 작아지지 않음
``swift
Spacer(minLength: 80)
```