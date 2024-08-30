@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button(this.message){
        Text('scan')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .id('scan')
      .padding(15)
    }
    .height('100%')
    .width('100%')
  }
}