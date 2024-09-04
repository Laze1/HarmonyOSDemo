
@Component
export struct MyButton{
  @Prop text: string = '';
  onclick = () => {}

  build() {
    Button(this.text){
      Text(this.text).fontSize(20).align(Alignment.Center)
    }.padding(15).width('90%').backgroundColor(Color.Blue).type(ButtonType.Normal)//Normal才可以设置borderRadius
    .borderRadius(10).fontColor(Color.White)
    .onClick(this.onclick)
  }
}