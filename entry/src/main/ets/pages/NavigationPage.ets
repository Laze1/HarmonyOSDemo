import { SymbolGlyphModifier } from '@kit.ArkUI';
import { DialogPage, pageOneTmp } from './tab/pageTmp';
import { TabMine } from './tab/TabMine';
import { TabNavigation } from './tab/TabNavigation';
import { TabSetting } from './tab/TabSetting';
import { TodoPage } from './todo/TodoPage';

@Entry
@Component
struct NavigationExample {
  private menus: NavigationMenuItem[] = [
    {
      value: "扫码", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.line_viewfinder')), action: () => {
    }
    },
    {
      value: "喜欢", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.heart')), action: () => {
    }
    },
    {
      value: "收藏", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.star')), action: () => {
    }
    },
    {
      value: "日历", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.calendar')), action: () => {
    }
    },
    {
      value: "待办", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.checkmark_square')), action: () => {
    }
    }
  ]
  private TooTmp: ToolbarItem[] = [
    {
      'value': "navigation", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.navigation')), 'action': () => {
      this.indexTooTmp = 0
    }
    },
    {
      'value': "mine", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.person')), 'action': () => {
      this.indexTooTmp = 1
    }
    },
    {
      'value': "setting", 'symbolIcon': new SymbolGlyphModifier($r('sys.symbol.gearshape')), 'action': () => {
      this.indexTooTmp = 2
    }
    },
  ];
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @Provide('pageArr') private pageArr: string[] = ['pageOneTmp', 'pageTwoTmp', 'DialogPage'];
  @State private indexTooTmp: number = 0;

  @Builder
  PageMap(name: string) {
    if (name === this.pageArr[0]) {
      pageOneTmp()
    } else if (name === this.pageArr[1]) {
      TodoPage()
    } else if (name === this.pageArr[2]) {
      DialogPage()
    }
  }

  @Builder
  IndexPage() {
    if (this.indexTooTmp == 0) {
      TabNavigation()
    }
    if (this.indexTooTmp == 1) {
      TabMine()
    }
    if (this.indexTooTmp == 2) {
      TabSetting()
    }
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        this.IndexPage()
      }
      .title("导航主页")
      .titleMode(NavigationTitleMode.Free)
      .mode(NavigationMode.Auto)
      .navDestination(this.PageMap)
      .menus(this.menus)
      .toolbarConfiguration(this.TooTmp)
      .hideTitleBar(this.indexTooTmp == 0 ? false : true)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}
