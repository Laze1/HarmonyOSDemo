import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @State message: string = 'BLE STATE';

  dialog:()=>void = ()=>{
    promptAction.showDialog({
      title: 'Title Info',
      message: 'Message Info',
      buttons: [
        {
          text: '取消',
          color: '#000000'
        },
        {
          text: '确定',
          color: '#000000'
        }
      ],
    })
      .then(data => {
        console.info('showDialog success, click button: ' + data.index);
      })
      .catch((err:Error) => {
        console.info('showDialog error: ' + err);
      })
  }

  build() {
    Column({space: 20}) {
      Column(){
        Text(this.message).align(Alignment.Center)
      }.borderWidth(1).borderColor(Color.White).borderRadius(10)

      MyButton({text:'检查权限',onclick:this.dialog})
      MyButton({text:'扫描',onclick: ()=>{
        promptAction.showToast({message:'扫描'})
      }})
    }.height('100%').width('100%').margin({top:15})
  }
}

@Component
struct MyButton{
  @Prop text: string = '';
  @Prop onclick: () => void;

  build() {
    Button(this.text){
      Text('扫描').fontSize(20).align(Alignment.Center)
    }.padding(15).width('90%').backgroundColor(Color.Blue).type(ButtonType.Normal)//Normal才可以设置borderRadius
    .borderRadius(10).fontColor(Color.White).onClick(this.onclick)
  }
}