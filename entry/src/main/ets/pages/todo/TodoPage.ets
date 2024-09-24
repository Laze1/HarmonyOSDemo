
@Component
export struct TodoPage {
  @State private pageArr: string[] = ['打酱油', '写语文作业'];
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      List({ space: 10 }) {
        ForEach(this.pageArr, (item: string) => {
          ListItem() {
            TodoItem({content:item})
          }
        }, (item: string): string => item)
      }
      .width("90%")
      .height('100%')
      .margin({ top: 12 })
    }.title('TODO')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}

@Component
struct TodoItem{
  @Prop content:string = ''

  build() {
    Text(this.content)
      .width("100%")
      .height(32)
      .backgroundColor($r('sys.color.comp_background_list_card'))
      .borderRadius(24)
      .fontSize(14)
      .fontWeight(500)
      .textAlign(TextAlign.Center)
      .onClick(() => {
        //detail
      })
  }
}