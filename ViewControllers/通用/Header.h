//
//  Header.h
//  TinyCartoon
//
//  Created by qianfeng on 15/4/22.
//  Copyright (c) 2015年 HTL. All rights reserved.
//

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height


//有妖气 全部列表
#define U17CATEGORY @"http://app.u17.com/v3/app/android/phone/sort/list?sortVersion=835"
//全部列表的详情列表
#define U17CATEGORYLIST @"http://app.u17.com/v3/app/android/phone/list/index?size=40&page=1&argName=%@&argValue=%@&con=%@"
//文章详情
#define U17CATEGORYLISTDETAIL @"http://app.u17.com/v3/app/android/phone/comic/detail?comicid=%@"



//猫团 全部列表
#define MAOTUAN @"http://manhua.haomee.cn/?m=Cartoon&a=channelgroupNew&hasCoser=1"

//全部列表的详情列表
#define MAOTUANLIST @"http://manhua.haomee.cn/?&pf=1&m=Api&a=listByType&limit=15&id=%@&order=1&page=1"
