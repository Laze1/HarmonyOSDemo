@Component
export struct TodoPage {
  // @Consume('pageInfos') pageInfos: NavPathStack;

  @Builder componentBuilder() {
    Text(`Parent builder `)
  }

  build() {
    Column() {
      Child({ customBuilderParam: this.componentBuilder })
    }
  }

  // build() {
    // NavDes({ title: 'Todo', builder: this.componentBuilder })
  // }
}
//
// @Component
// export struct NavDes {
//   @Prop title: string = ""
//
//   @Builder
//   doNothingBuilder() {};
//   @BuilderParam builder: () => void = this.doNothingBuilder;
//
//   build() {
//     Column() {
//       this.builder
//     }
//   }
// }
@Component
struct Child {
  @Builder customBuilder() {};
  // 使用父组件@Builder装饰的方法初始化子组件@BuilderParam
  @BuilderParam customBuilderParam: () => void = this.customBuilder;

  build() {
    Column() {
      this.customBuilderParam()
    }
  }
}
