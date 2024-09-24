
@Component
export struct NavDes {
  @Prop title: string = ""
  @Consume('pageInfos') pageInfos: NavPathStack;

  @Builder doNothingBuilder() {};
  @BuilderParam builder: () => void = this.doNothingBuilder;


  build() {
    NavDestination() {
      Column(){
        Text('hello todo')
        this.builder
      }
    }.title(this.title)
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }
}
