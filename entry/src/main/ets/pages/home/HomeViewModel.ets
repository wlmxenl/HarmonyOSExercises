import ItemData from './ItemData';

export class HomeViewModel {

  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.fig1'),
    $r('app.media.fig2'),
    $r('app.media.fig3'),
    $r('app.media.fig4')
    ];
    return swiperImages;
  }

  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.love')),
      new ItemData($r('app.string.history_record'), $r('app.media.record')),
      new ItemData($r('app.string.message'), $r('app.media.message')),
      new ItemData($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new ItemData($r('app.string.my_goal'), $r('app.media.target')),
      new ItemData($r('app.string.group'), $r('app.media.circle')),
      new ItemData($r('app.string.favorites'), $r('app.media.favorite')),
      new ItemData($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }


  getSecondGridData(): Array<ItemData> {
    let secondGridData: ItemData[] = [
      new ItemData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new ItemData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new ItemData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new ItemData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found')),
      new ItemData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top'))
    ];
    return secondGridData;
  }
}

export default new HomeViewModel()