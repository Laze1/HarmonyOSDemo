import { ble } from '@kit.ConnectivityKit'
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';
import { UUID } from './UUIDEnum';

export class BleEngine {
  // 静态实例变量，用于存储单例实例
  private static instance: BleEngine | undefined = undefined;
  // BleGattService
  private ble = ble.createGattServer();

  // 私有构造函数，防止从外部实例化
  private constructor() {
    // 初始化代码，例如设置 BLE 引擎等
    console.log("BleEngine initialized");
  }

  // 静态方法，用于获取单例实例
  static getInstance(): BleEngine {
    // 检查是否已创建实例
    if (!BleEngine.instance) {
      BleEngine.instance = new BleEngine();
    }
    return BleEngine.instance;
  }

  onReceiveEvent(data: Array<ble.ScanResult>) {
    console.info('BLE scan device find result = ' + JSON.stringify(data));
  }

  // 示例方法，用于 BLE 操作
  public startScanning(): void {
    console.log("Scanning for BLE devices...");
    // 扫描代码
    try {
      ble.on("BLEDeviceFind", this.onReceiveEvent);
      let scanFilter: ble.ScanFilter = {
        serviceUuid: UUID.serviceUUID
      };
      let scanOptions: ble.ScanOptions = {
        interval: 500,
        dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
        matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
      }
      ble.startBLEScan([scanFilter], scanOptions);
    } catch (err) {
      console.error('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }

  public stopScanning(): void {
    console.log("Stopped scanning.");
    // 停止扫描代码
  }

  // 请求蓝牙权限的方法
  async requestBluetoothPermission() {
    const am = abilityAccessCtrl.createAtManager()
    const permissionName = "ohos.permission.ACCESS_BLUETOOTH";
    am.requestPermissionsFromUser(getContext(), [permissionName]).then((data: PermissionRequestResult) => {
      let grantStatus: Array<number> = data.authResults;
      let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
          console.log("permission success")
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
          console.log("permission err")
          return;
        }
      }
      // 授权成功
      console.log("permission finish")
    }).catch((err: BusinessError) => {
      console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
    })

  }
}
