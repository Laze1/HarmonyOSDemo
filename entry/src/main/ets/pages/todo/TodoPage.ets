import { TodoBean } from './TodoBean';

@Component
export struct TodoPage {
  @State private pageArr: TodoBean[] = [new TodoBean('打酱油','miss'), new TodoBean('写语文作业'),
    new TodoBean('去超市买其他调味品，盐巴味精鸡精，醋不用买，食用油也要买',
      '去超市买其他调味品，盐巴味精鸡精，醋不用买，食用油也要买')];
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      List({ space: 10 }) {
        ForEach(this.pageArr, (item: TodoBean) => {
          ListItem() {
            TodoItem({ todo: item })
          }
        }, (item: TodoBean, index:number): string => item.title)
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
struct TodoItem {
  @Prop todo: TodoBean
  @State handlePopup: boolean = false

  build() {
    Column() {
      Text(this.todo.title)
        .width("100%")
        .fontSize(16)
        .fontWeight(500)
        .textAlign(TextAlign.Start)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .textOverflow({overflow:TextOverflow.Ellipsis})

      Text(this.todo.content)
        .width("100%")
        .fontSize(12)
        .fontWeight(500)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Start)
        .maxLines(1)
        .ellipsisMode(EllipsisMode.END)
        .textOverflow({overflow:TextOverflow.Ellipsis})
    }
    .width("100%")
    .backgroundColor($r('sys.color.comp_background_list_card'))
    .borderRadius(24)
    .onClick(() => {
      //detail
      if (this.todo.content == '') return
      this.handlePopup = !this.handlePopup
    })
    .bindPopup(this.handlePopup, {
      message: this.todo.content,
    })
  }
}