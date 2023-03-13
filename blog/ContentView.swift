enum Food {
    case noodle
    case apple
    case rice
    
    var title: String {
        switch self {
        case .noodle:
            return "국수"
        case .apple:
            return "사과"
        case .rice:
            return "쌀밥"
        }
    }
}

struct ContentView: View {
    @State var isOn = true
    @State var menu = Food.noodle
    @State var name = ""
    var body: some View {
        Form {
            Section("첫 번째 메뉴") {
                Text("1")
                Text("2")
            }
            
            Section("두 번째 메뉴") {
                Text("3")
                Text("4")
            }
            
            Section("다양한 컨트롤") {
                Button("버튼") {
                    print("test")
                }.disabled(!isOn)
                
                Toggle(isOn: $isOn) {
                    Text("토글")
                }
                
                Picker("오늘의 메뉴", selection: $menu) {
                    Text(Food.noodle.title).tag(Food.noodle)
                    Text(Food.apple.title).tag(Food.apple)
                    Text(Food.rice.title).tag(Food.rice)
                }
                
                TextField("이름을 입력하세요.", text: $name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
