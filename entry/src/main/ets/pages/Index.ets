import { promptAction } from '@kit.ArkUI'
import { BleEngine } from '../ble/BleEngine';
import { MyButton } from '../struct/MyButton';

@Entry
@Component
struct Index {
  @State message: string = 'BLE STATE';

  build() {
    Column({space: 20}) {
      Column(){
        Text(this.message).align(Alignment.Center)
      }.borderWidth(1).borderColor(Color.White).borderRadius(10)

      MyButton({text:'检查权限',onclick:dialog})
      MyButton({text:'扫描',onclick:()=>{ BleEngine.getInstance().startScanning() }})
    }.height('100%').width('100%').margin({top:15})
  }
}

let dialog = ()=>{
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
      BleEngine.getInstance().requestBluetoothPermission()
    })
    .catch((err:Error) => {
      console.info('showDialog error: ' + err);
    })
}