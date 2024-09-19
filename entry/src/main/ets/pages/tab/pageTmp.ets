
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