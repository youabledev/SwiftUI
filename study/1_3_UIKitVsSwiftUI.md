# 1.3 UIKit Vs. SwiftUI
* UIKit과 SwiftUI 비교 및 공식 설명 바로가기 링크 모음
* deprecated 된 것은 그 바로 아래 row에 대체 요소 추가함

## Views and Controls
|             UIKit              |           SwiftUI            | Doc Link                                                                                                                               | Note                                                                                                                                    |
| :----------------------------: | :--------------------------: | :------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------- |
|            UILabel             |             Text             | [Text](https://developer.apple.com/documentation/swiftui/text/)                                                                        | A view that displays one or more lines of read-only text.                                                                               |
|          UITextField           |          TextField           | [TextField](https://developer.apple.com/documentation/swiftui/textfield/)                                                              | A control that displays an editable text interface.                                                                                     |
| UITextField(isSecureTextEntry) |         SecureField          | [SecureField](https://developer.apple.com/documentation/swiftui/securefield/)                                                          | A control into which the user securely enters private text.                                                                             |
|            UIButton            |            Button            | [Button](https://developer.apple.com/documentation/swiftui/button/)                                                                    | A control that initiates an action.                                                                                                     |
|          UIImageView           |            Image             | [Image](https://developer.apple.com/documentation/swiftui/image/)                                                                      | A view that displays an image.                                                                                                          |
|            UISwitch            |            Toggle            | [Button](https://developer.apple.com/documentation/swiftui/toggle/)                                                                    | A control that toggles between on and off states.                                                                                       |
|            UISlider            |            Slider            | [Slider](https://developer.apple.com/documentation/swiftui/slider)                                                                     | A control for selecting a value from a bounded linear range of values.                                                                  |
|           UIStepper            |           Stepper            | [Stepper](https://developer.apple.com/documentation/swiftui/stepper)                                                                   | A control that performs increment and decrement actions.                                                                                |
|          UIPickerView          |   Picker(WheelPickerStyle)   | [Picker](https://developer.apple.com/documentation/swiftui/picker)                                                                     | A control for selecting from a set of mutually exclusive values.                                                                        |
|       UISegmentedControl       | Picker(SegmentedPickerStyle) | [Picker](https://developer.apple.com/documentation/swiftui/picker)                                                                     | A control for selecting from a set of mutually exclusive values.                                                                        |
|          UIDatePicker          |          DatePicker          | [DatePicker](https://developer.apple.com/documentation/swiftui/DatePicker)                                                             | A control for selecting an absolute date.                                                                                               |
|          UIStackView           |        HStack, VStack        | [HStack](https://developer.apple.com/documentation/swiftui/hstack), [VStack](https://developer.apple.com/documentation/swiftui/vstack) | A view that arranges its subviews in a horizontal/vertical line.                                                                        |
|          UIScrollView          |          ScrollView          | [ScrollView](https://developer.apple.com/documentation/swiftui/ScrollView)                                                             | A scrollable view.                                                                                                                      |
|       UITableView(Plain)       |             List             | [List](https://developer.apple.com/documentation/swiftui/list)                                                                         | A container that presents rows of data arranged in a single column, <br>optionally providing the ability to select one or more members. |
|      UITableView(Grouped)      |    List(GroupedListStyle)    | [List](https://developer.apple.com/documentation/swiftui/list)                                                                         | A container that presents rows of data arranged in a single column, <br>optionally providing the ability to select one or more members. |
|        UICollectionView        |        동일요소 없음         |                                                                                                                                        | 🤔                                                                                                                                       |
|           UITextView           |        동일요소 없음         |                                                                                                                                        | 🧐                                                                                                                                       |

--------------
## ViewControllers
|           UIKit            |    SwiftUI     | Doc Link |
| :------------------------: | :------------: | :------- |
|      UIViewController      |      View      | [View](https://developer.apple.com/documentation/swiftui/view/)         |
|   UINavigationController   | NavigationView |     deprecated     |
|UINavigationController|NavigationStack|[NavigationStack](https://developer.apple.com/documentation/swiftui/navigationstack)|
|     UITabBarController     |    TabView     |[TabView](https://developer.apple.com/documentation/swiftui/tabview)          |
|   UISplitViewController    | NavigationView |   deprecated       |
|UINavigationController|NavigationSplitView|[NavigationSplitView](https://developer.apple.com/documentation/swiftui/navigationsplitview)|
|   UITableViewController    |      List      |  [List](https://developer.apple.com/documentation/swiftui/List)     |
| UICollectionViewController | 동일 요소 없음 |     TODO: 🤔 Grid일려나.. 나중에 공부해서 메우기     |
|UIAlertController|ActionSheet|deprecated|
|UIAlertController|View's Instance Method ```confirmationDialog```|[Method](https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:message:)-8y541)|

---------
## 참고 자료 및 출처
* 스윗한 SwiftUI: [서점 연결](http://www.yes24.com/Product/Goods/89912849)
* 스윗한 SwiftUI: [GitHub](https://github.com/giftbott/SweetSwiftUIExamples)
* 애플 공식 문서: [Apple SwiftUI Doc](https://developer.apple.com/documentation/swiftui)