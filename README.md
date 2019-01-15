# BaiduMapKit

百度地图 iOS SDK(官方)

--------------------------------------------------------------------------------------

iOS 地图 SDK v4.1.1是适用于iOS系统移动设备的矢量地图开发包

--------------------------------------------------------------------------------------

地图SDK功能介绍（全功能开发包）：

地图：提供地图展示和地图操作功能；

POI检索：支持周边检索、区域检索和城市内兴趣点检索；

地理编码：提供经纬度和地址信息相互转化的功能接口；

线路规划：支持公交、驾车、步行三种方式的线路规划；

覆盖物图层：支持在地图上添加覆盖物（标注、几何图形、热力图、地形图图层等），展示更丰富的LBS信息；

定位：获取当前位置信息，并在地图上展示（支持普通、跟随、罗盘三种模式）；

离线地图：使用离线地图可节省用户流量，提供更好的地图展示效果；

调启百度地图：利用SDK接口，直接在本地打开百度地图客户端或WebApp，实现地图功能；

周边雷达：利用周边雷达功能，开发者可在App内低成本、快速实现查找周边使用相同App的用户位置的功能；

LBS云检索：支持查询存储在LBS云内的自有数据；

特色功能：提供短串分享、Place详情检索、热力图等特色功能，帮助开发者搭建功能更加强大的应用；


--------------------------------------------------------------------------------------
 
 
 【 新 版 提 示 】
 【 注 意 】
 1、自v3.2.0起，百度地图iOS SDK全面支持HTTPS，需要广大开发者导入第三方openssl静态库：libssl.a和libcrypto.a（存放于thirdlib目录下）
 添加方法：在 TARGETS->Build Phases-> Link Binary With Libaries中点击“+”按钮，在弹出的窗口中点击“Add Other”按钮，选择libssl.a和libcrypto.a添加到工程中 。
 
 2、支持CocoaPods导入
 pod setup //更新CocoPods的本地库
 pod search BaiduMapKit  //查看最新地图SDK
 

【新增】
1. 个性化地图新增缩放级别控制
    功能说明：
        个性化地图的自定义样式可以根据地图缩放级别进行设置，即不同的缩放级别可以呈现不同的自定义样式。
    接口说明：
    A. Json样式的stylers中新增："level"字段，用来控制样式的生效级别，如果stylers中不配置"level"字段，则认为该样式在所有地图缩放级别生效;
    B. "level"字段的值在Json样式中以字符串表现，取值对标普通地图的缩放级别范围[4-21]。如果该字段值小于地图缩放级别的最小值，则取地图缩放级别的最小值；如果该字段大于地图缩放级别的最大值，则取地图缩放缩放级别的最大值；
    C. 如果Json样式，存在未指定缩放级别样式1和指定了生效的缩放级别样式2的同一元素，则在指定的缩放级别展示样式2，在其他缩放级别展示样式1；
    使用示例：
        [
				    {
                "featureType":"green",
                "elementType":"geometry",
                "stylers": {
                "color": "#232c3aff",
                "level": "14"
                }
            }
        ]
        
2. 个性化地图新增宽度样式
    功能说明：
	宽度样式可以控制点元素，线元素的宽度展示，当前生效的元素包括：点元素（poi类元素，字体），线元素（如高速，地铁等）；
			
    接口说明：
       A. Json样式的stylers中新增: "weight"字段，用于指定元素要展示的宽度，不设置该字段则以默认样式宽度展示；
       B. "weight"字段的值类型在Json样式中以字符串表现，取值范围为[0, 255]，当取值小于0时，实际以0值生效，当大于255时，以255生效；
       
    使用示例：
      [
         {
            "featureType":"green",
            "elementType":"geometry",
            "stylers": {
            "weight": "10"
            }
         }
      ]

3. 个性化地图开放更加细粒度的元素种类，提供更强的个性化能力。分别如下
   面元素，支持的样式同之前的面元素
       "estate"                         // 人造区域之地产小区区域
       "shopping"                       // 人造区域之购物区域，包括购物中心和商场
       "transportation"                 // 人造区域之交通设施区域，包括火车站，飞机场，跑到面，航站楼面，机场内停车场面，其它面
 
   点元素，支持的样式同之前的点元素
       "estatelabel"                    // 房产小区标注
       "businesstowerlabel"             // 商务大厦标注
       "companylabel"                   // 公司企业标注
       "governmentlabel"                // 政府机构标注
       "restaurantlabel"                // 餐饮类标注
       "hotellabel"                     // 宾馆类标注
       "shoppinglabel"                  // 购物类标注
       "lifeservicelabel"               // 生活服务类标注
       "carservicelabel"                // 汽车服务类标注
       "transportationlabel"            // 交通设施类标注
       "financelabel"                   // 金融类标注
       "otherlabel"                     // 其它类标注

4. 同一元素多个样式同时同级别设置，生效策略做调整
    功能说明：
       因为涉及到样式缩放级别的控制，所以可见性(visibility)，颜色（color），宽度（weight）等样式的生效策略做了调整，
       即：当同一元素的可见性（visibility）分别颜色（color），宽度（weight）一起设置时，以最后设置的样式生效；
       
    使用示例： 
      [ 
         {
            "featureType":"green",
            "elementType":"geometry",
            "stylers": {
                "weight": "10"
            }
         },
         {
            "featureType":"green",
            "elementType":"geometry",
            "stylers": {
                 "visibility": "off"
            }
         }
      ] 
   实际效果则以visibility样式生效。（注意：visibility默认为on）
 
【优化】
 1.升级POI检索服务，包括城市检索、矩形检索、周边检索、详情检索、室内检索。注意：部分请求字段与结果字段会有变动，不完全向下兼容；请求和响应类对应的修改主要是：
    A.每种POI检索对应一个请求参数类，命名规则为 BMKPOIXXXSearchOption，主要变化为支持多个关键字检索、支持多标签检索、支持按过滤条件检索等。
    B.POI城市检索、POI周边检索、POI矩形区域检索服务都使用 BMKPOISearchResult 类
      POI详情检索使用 BMKPOIDetailSearchResult 类
      POI室内检索使用 BMKPOIIndoorSearchResult 类
 2.升级地理编码、反地理编码服务；
 3.优化引擎内存管理；
 4.优化资源文件体积，mapapi.bundle的体积由6.4MB减小到4.3MB，减少33%；
 
【修复】
 1.修复某些场景下极小概率出现的crash。


# Baidu4210