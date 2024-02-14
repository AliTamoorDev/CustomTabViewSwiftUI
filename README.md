# Custom TabView

 The goal of this library is to provide a **`TabView`** in iOS using `SwiftUI` similar to `tvOS` which looks much better in some UIs.

## Results
![customTabView](https://github.com/AliTamoorDev/CustomTabViewSwiftUI/assets/95581643/a93a811f-f0f2-4fa6-a58a-c158a4d75510)



## Requirements
SwiftUI
iOS 13.0 or above.


## Installation
TabBar is available through Swift Package Manager

Swift Package Manager
In Xcode select:

File > Swift Packages > Add Package Dependency...
Then paste this URL:

https://github.com/onl1ner/TabBar.git


## Usage

To start using `TabView` you have to create an enum which will implement `Tabbable` protocol so that custom Image and Title can be provided:


```Swift

enum Item: Int, Tabbable {

    case first = 0
    case second
    case third

    // If you want to add Titles
    var title: String {
        switch self {
            case .first: 
            case .second:
            case .third: 
        }
    }

    // If you want to use icons too
    var icon: String {
        switch self {
            case .first: 
            case .second:
            case .third: 
        }
    }
}
```
***
After that you need create a default TabView inside a `ZStack` and instead of creating `tabItem` for each View inside `TabView`, assign tags to them.

```Swift
ZStack {
    TabView(selection: $selectedTab) {
        // Example Views
        HomeView()
            .tag(0)
                    
        FavoriteView()
            .tag(1)
                    
        ChatView()
            .tag(2)
                    
        ProfileView() 
            .tag(3)
    }
}
```
***
Now create an extension of your view in which you are using `TabView` and add this function in it.

```Swift

// Extension of the Struct Containing your tabView
extension ExampleContainerView { 

    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Text(title)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(isActive ? .red.opacity(0.8) : .clear) // // Adjust the color of Active tabItem as needed
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: isActive ? 1 : 0)
        )
        .fixedSize(horizontal: true, vertical: false)
    }
}

```
Inside this `CustomTabItem` function, we are creating **custom** `tabItem` with desired **imageName** and **title**.
- Active Tab will be hightlighted according to the color you provided.

***
After that create a ZStack just below your `TabView` with following code:

```Swift
ZStack{
    HStack{
        ForEach((TabbedItems.allCases), id: \.self){ item in
             Button{
                    selectedTab = item.rawValue
                    } label: {
                        CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
    }
    .background(.black.opacity(0.8)) // Adjust background color of tabView
    .cornerRadius(35)
    .overlay(
             RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 1) // Adjust the color and border width as needed
            )
            .padding(.horizontal, 26)

```
This will create new view with list of all the required tabItems in form of buttons.
As you can see that whatever `button` will be pressed the **selectedTab** will be updated according and that Screen will appear. 
- Provide background color of `TabView` as you like.

---
Now your custom tabView Similar to the tvOS TabView is ready:

![Simulator Screenshot - iPad Pro (11-inch) (4th generation) - 2024-02-14 at 16 17 30 (1)](https://github.com/AliTamoorDev/CustomTabViewSwiftUI/assets/95581643/64a4ce29-b851-40af-864b-4f57075fca17)

***
> **Note:**
This is currently designed for **ipads**, if you want to use it in **iphones** please adjust the font size and paddings accordingly, I know you can :)

# Contribution
If you struggle with something feel free to [open an issue](https://github.com/AliTamoorDev/CustomTabViewSwiftUI/issues/new). Pull requests are also appreciated.
