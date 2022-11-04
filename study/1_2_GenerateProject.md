# 1.2 SwiftUI 프로젝트 생성하기

## 1.2.1 프로젝트 생성
- XCode 실행 > Create a new Xcode project > Single View App > Interface를 SwiftUI로 설정
  
## 1.2.2 프로젝트 둘러보기

### ContentView.swift
```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}
```
- 기존에 자동으로 생성되었던 ViewController.swift가 아닌 ContentView.swift 파일이 생성됨을 알 수 있음
- View 프로토콜을 준수하는 구조체를 사용함

#### View protocol
```swift
public protocol View {
    associatedtype Body : View
    @ViewBuilder @MainActor var body: Self.Body { get }
}
```
- 기존에 Swift에서 UIView를 상속받았던 것과 달리 SwiftUI에서는 View 프로토콜을 준수하여 커스텀 뷰를 구성함
- 필수로 body연산 프로퍼티를 구현해 주어야 함
  - read only
- 뷰 경량화
  - View 프로토콜의 경우 기존에 많은 연산자를 포함하고 있던 UIView 와 달리 각각의 뷰 객체가 각자 자신에게 필요한 속성만 가지고 필요한 뷰를 생성하도록 구현되어 있음. 
  - 따라서 불필요한 속성과 프로퍼티를 보유하지 않아도 됨

```swift
    public typealias Body = Never
```
- Body는 다시 View 프로토콜을 준수하는 타입을 받음
- 뷰 프로토콜의 재귀호출
- som View -- (var body) --> som View -- (var body) --> som View -- (var body) --> ...
- 실제 컨텐츠를 표시하는 Primitive Views(Text, Image, Color)와 Stack, Group, CeometryReader 등의 컨테이너 뷰는 Never 타입을 사용하여 더는 재귀호출이 일어나지 않게 함
```swift
extension Text : View {
    public typealias Body = Never
}
```
- Text는 Primitive View 이기 때문에 Body 타입이 Never로 지정되어 있고 뷰가 재귀 호출을 하다가 Never을 반환하는 Text 뷰를 만나 재귀 호출을 끝나게 되는 구조

-----------------
### Preview
- SwiftUI interface에서 스토리보드 사용이 가능하지만 프리뷰라는 강력한 기능을 제공함
- Preview Content 파일에 Preview Assets : 개발 과정시 프리뷰에서만 사용할 별도의 에셋을 넣을 수 있는 파일. 구분이 필요한 경우 사용함
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
- PreviewProvider를 준수하는 타입이 구현되어야 프리뷰가 캔버스에 노출됨

-----------------
### App Protocol
- XCode 12 베타 버전 부터 지원 (프로젝트 생성시 Life Cycle을 SwiftUI App으로 지정하는 경우)
- 현재 XCode 14는 SwiftUI App이 default
- App 프로토콜을 준수하는 구조체가 생성되며 파일 이름은 [프로젝트이름]App.swift
```swift
@main
struct FirstApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
- Swift 프로젝트에서 기존에 AppDelgate와 SceneDelegate를 생성하던것과 달리 간단한 구조
- 추가적으로 필요한 생명주기(active, inactive, background)는 옵셔널이며 필요할 시 추가 가능함
- @main은 해당 지점이 앱의 진입 지점이라는 것을 알려줌. 따라서 @main은 하나의 지점에만 표시 가능
- App 프로토콜은 앱의 구조와 행동을 표현함
```swift
public protocol App {
    associatedtype Body : Scene
    @SceneBuilder @MainActor var body: Self.Body { get }
    @MainActor init()
}
```
- SwiftUI의 App 프로토콜의 Body는 Scene 속성으로 되어 있음
- 각각의 Scene은 뷰 계층 구조에서 root view를 포함하고 있으며 life cycle은 시스템에 의해 관리됨
  - 시스템은 플랫폼(macOS, watchOS..)에 적합하고 앱의 현재 상태에 따라 뷰 사용자 인터페이스에 있는 뷰 계층을 어떻게 보여줄지 결정함
  - macOS나 iPadOS에서 여러개의 Scene을 가질 수 있음
  - Scene은 앱의 뷰를 감싸고 있으므로 Scene의 상태를 관리하고 재사용하기 쉽게 만듬
- Scene은 view들을 담고 있는 컨테이너의 개념

```swift
@main
struct FirstApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

public struct WindowGroup<Content> : Scene where Content : View {
    ... 생략

```
- WindowGroup은 Scene을 준수하며 View를 감싸고 있음
  - View는 ContentView에 표시됨
- WindowGroup은 하나의 Scene을 사용하는 것

#### App Life Cycle
1. scenePhase 프로퍼티 생성
   1. 시스템에서 현재 작업 상태를 가지고 올 수 있음
    ```swift
    @Environment(\.scenePhase) private var scenePhase
    ```
    2. \ 백대쉬는 keypath 사용을 의미. 값을 참조하는 것이 아닌 속성 자체를 참조하므로서 상태값 변화를 가지고 옴
2. onChange 수식어(Modifier) 추가
   1. 상태가 변경되면 onChange 수식어가 호출됨

```swift
@main
struct FirstApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
            @unknown default:
                print("unknown")
            }
        }
    }
}

```
- 홈 화면 이동이나 푸시 노티피케이션을 사용하는 경우 AppDelegate에서 필요했던 함수를 사용할 수 있음
```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool { 
        return true
    }
}
```

--------------
## 참고 자료 및 출처
* 깃허브: [aheze/AppDelegateAdaptor](https://gist.github.com/aheze/6998b4bae660c8dade8ba6a75687772c)
* 미디움: [Say Goodbye to SceneDelegate in SwiftUI](https://betterprogramming.pub/say-goodbye-to-scenedelegate-in-swiftui-444173b23015)