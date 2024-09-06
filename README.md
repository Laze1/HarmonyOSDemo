# 页面生命周期
Navigation作为路由容器，其生命周期承载在NavDestination组件上，以组件事件的形式开放。

其生命周期大致可分为三类，自定义组件生命周期、通用组件生命周期和自有生命周期。其中，aboutToAppear和aboutToDisappear是自定义组件的生命周期。如果NavDestination外层包含自定义组件时则存在，OnAppear和OnDisappear是组件的通用生命周期。剩下的六个生命周期为NavDestination独有。

生命周期时序如下图所示：

![生命周期时序](https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240905180421.92867017517191893557617766265796:50001231000000:2800:539B33EFFA414F5726683D177158F6278CF131EF0CB3FEA22A8090B17EAB1111.png?needInitFileName=true?needInitFileName=true)

- aboutToAppear：在创建自定义组件后，执行其build()函数之前执行（NavDestination创建之前），允许在该方法中改变状态变量，更改将在后续执行build()函数中生效。
- onWillAppear：NavDestination创建后，挂载到组件树之前执行，在该方法中更改状态变量会在当前帧显示生效。
- onAppear：通用生命周期事件，NavDestination组件挂载到组件树时执行。
- onWillShow：NavDestination组件布局显示之前执行，此时页面不可见（应用切换到前台不会触发）。
- onShown：NavDestination组件布局显示之后执行，此时页面已完成布局。
- onWillHide：NavDestination组件触发隐藏之前执行（应用切换到后台不会触发）。
- onHidden：NavDestination组件触发隐藏后执行（非栈顶页面push进栈，栈顶页面pop出栈或应用切换到后台）。
- onWillDisappear：NavDestination组件即将销毁之前执行，如果有转场动画，会在动画前触发（栈顶页面pop出栈）。
- onDisappear：通用生命周期事件，NavDestination组件从组件树上卸载销毁时执行。
- aboutToDisappear：自定义组件析构销毁之前执行，不允许在该方法中改变状态变量。