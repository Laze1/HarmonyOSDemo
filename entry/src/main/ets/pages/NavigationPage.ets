import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct NavigationExample {
  private TooTmp: ToolbarItem[] = [
   {'value': "navigation", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.house')), 'action': ()=> {}},
   {'value': "mine", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.person')), 'action': ()=> {}},
   {'value': "setting", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), 'action': ()=> {}},
  ];
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: number[] = [1, 2, 3];

  @Builder
  PageMap(name: string) {
    if (name === "NavDestinationTitle1") {
      pageOneTmp()
    } else if (name === "NavDestinationTitle2") {
      pageTwoTmp()
    } else if (name === "NavDestinationTitle3") {
      pageThreeTmp()
    }
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        TextInput({ placeholder: 'search...' })
          .width("90%")
          .height(40)
          .backgroundColor('#FFFFFF')

        List({ space: 12 }) {
          ForEach(this.arr, (item:string) => {
            ListItem() {
              Text("NavRouter" + item)
                .width("100%")
                .height(72)
                .backgroundColor('#FFFFFF')
                .borderRadius(24)
                .fontSize(16)
                .fontWeight(500)
                .textAlign(TextAlign.Center)
                .onClick(()=>{
                  this.pageInfos.pushPath({ name: "NavDestinationTitle" + item})
                })
            }
          }, (item:string):string => item)
        }
        .width("90%")
        .margin({ top: 12 })
      }
      .title("导航主页")
      .titleMode(NavigationTitleMode.Full)
      .mode(NavigationMode.Auto)
      .navDestination(this.PageMap)
      .menus([
        {value: "", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), action: ()=> {}},
        {value: "", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), action: ()=> {}},
        {value: "", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), action: ()=> {}},
        {value: "", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), action: ()=> {}},
        {value: "", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.more')), action: ()=> {}}
      ])
      .toolbarConfiguration([this.TooTmp[0], this.TooTmp[1], this.TooTmp[2]])
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}

// PageOne.ets
@Component
export struct pageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent1")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle1")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}

// PageTwo.ets
@Component
export struct pageTwoTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent2")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle2")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}

// PageThree.ets
@Component
export struct pageThreeTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent3")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle3")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}