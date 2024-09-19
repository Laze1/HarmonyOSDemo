import { SymbolGlyphModifier } from '@kit.ArkUI';

@Entry
@Component
struct NavigationExample {
  private menus: NavigationMenuItem[] = [
    {
      value: "扫码", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.line_viewfinder')), action: () => {
    }
    },
    {
      value: "喜欢", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.heart')), action: () => {
    }
    },
    {
      value: "收藏", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.star')), action: () => {
    }
    },
    {
      value: "日历", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.calendar')), action: () => {
    }
    },
    {
      value: "待办", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.checkmark_square')), action: () => {
    }
    }
  ]
  private TooTmp: ToolbarItem[] = [
    {
      'value': "navigation", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.navigation')), 'action': () => {
      this.indexTooTmp = 0
    }
    },
    {
      'value': "mine", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.person')), 'action': () => {
      this.indexTooTmp = 1
    }
    },
    {
      'value': "setting", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.gearshape')), 'action': () => {
      this.indexTooTmp = 2
    }
    },
  ];
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  private arr: string[] = ['pageOneTmp', 'pageTwoTmp', 'DialogPage'];
  @State private indexTooTmp: number = 0;

  @Builder
  PageMap(name: string) {
    if (name === this.arr[0]) {
      pageOneTmp()
    } else if (name === this.arr[1]) {
      pageTwoTmp()
    } else if (name === this.arr[2]) {
      DialogPage()
    }
  }

  @Builder
  IndexPage() {
    if (this.indexTooTmp == 0) {
      this.IndexNavigation()
    }
    if (this.indexTooTmp == 1) {
      this.IndexMine()
    }
    if (this.indexTooTmp == 2) {
      this.IndexSetting()
    }
  }

  @Builder
  IndexNavigation() {
    TextInput({ placeholder: 'search...' })
      .width("90%")
      .height(40)
      .backgroundColor($r('sys.color.comp_background_list_card'))

    List({ space: 12 }) {
      ForEach(this.arr, (item: string) => {
        ListItem() {
          Text(item)
            .width("100%")
            .height(72)
            .backgroundColor($r('sys.color.comp_background_list_card'))
            .borderRadius(24)
            .fontSize(16)
            .fontWeight(500)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.pageInfos.pushPath({ name: item })
            })
        }
      }, (item: string): string => item)
    }
    .width("90%")
    .height('100%')
    .margin({ top: 12 })
  }

  @Builder
  IndexMine() {
    Text('A HarmonyOS developer')
  }

  @Builder
  IndexSetting() {
    Text('Setting')
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        this.IndexPage()
      }
      .title("导航主页")
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .navDestination(this.PageMap)
      .menus(this.menus)
      .toolbarConfiguration(this.TooTmp)
      .hideTitleBar(this.indexTooTmp == 0 ? false : true)
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


@Component
export struct DialogPage {
  @Consume('pageInfos') pageStack: NavPathStack;

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Center }) {
        Column() {
          Text("Dialog NavDestination")
            .fontSize(20)
            .margin({ bottom: 100 })
          Button("Close").onClick(() => {
            this.pageStack.pop()
          }).width('30%')
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .height('30%')
        .width('80%')
      }.height("100%").width('100%')
    }
    .backgroundColor('rgba(0,0,0,0.5)')
    .hideTitleBar(true)
    .mode(NavDestinationMode.DIALOG)
  }
}