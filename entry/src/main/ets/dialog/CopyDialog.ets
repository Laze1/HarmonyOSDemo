import { promptAction } from '@kit.ArkUI';

let copyDialog = ()=>{
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