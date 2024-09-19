@Component
export struct TabNavigation {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Consume('pageArr') private pageArr: string[];
  build() {
    Column() {
      TextInput({ placeholder: 'search...' })
        .width("90%")
        .height(40)
        .backgroundColor($r('sys.color.comp_background_list_card'))

      List({ space: 12 }) {
        ForEach(this.pageArr, (item: string) => {
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

  }
}