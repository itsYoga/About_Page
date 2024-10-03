//
//  ContentView.swift
//  About_Page
//
//  Created by Jesse Liang on 2024/09/21.
//

import SwiftUI
import Foundation
import MapKit


fileprivate let HORIZONTAL_SPACING: CGFloat = 24 // 定義水平間距

// Music 結構體用於表示音樂項目，並且遵循 Identifiable 協議以便於 SwiftUI 的列表和迭代

struct Music: Identifiable {
    let id = UUID()  // 唯一識別碼
    let name: String  // 音樂名稱
    let artistName: String  // 藝術家名稱
    let coverImage: Image  // 封面圖片
    let description: String?  // 可選專輯描述
    let Link: URL?  // 音樂連結
}


struct MusicData {
    
    // 獲取專輯資料的靜態函數
    static func getAlbums() -> [Music] {
        return [
            Music(
                name: "HELP EVER HURT NEVER",
                artistName: "Fuji Kaze",
                coverImage: Image.cover1,
                description: """
                鋼琴小生藤井 風首張出道專輯《HELP EVER HURT NEVER》台壓盤發行！

                2019年數位限定的單曲〈何なんw〉、〈もうええわ〉上架後，都市曲風加上日本岡山方言的歌詞(第一人稱是用「ワシ」)，直接在日本歌壇投下一枚震撼彈，不但擠進數位平台歌曲排行榜，也受到了許多歌曲創建者的讚賞，可說是在各處都受盡矚目！

                2020年5月，在全世界疫情肆虐的時間點發行，宣揚著中心概念「絕對不做出任何傷害」的本作，全收錄曲皆由藤井 風本人作詞作曲，音樂製作人則找來主宰「Tokyo Recordings」並曾替多位音樂人製作的「Yaffle」。收錄曲包括從海外火爆逆襲紅回日本的〈死ぬのがいいわ〉等共11首。被視為2020年經典名盤的《HELP EVER HURT NEVER》，絕對值得樂迷收藏！
                """,
               Link: URL(string: "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://music.apple.com/tw/album/help-ever-hurt-never/1505498769&ved=2ahUKEwi5nsi_8fCIAxXnh68BHZO1LEcQFnoECBIQAQ&usg=AOvVaw0yp2UE7aPMvSa3zKvDMlSQ")!
            ),
            Music(
                name: "LOVE ALL SERVE ALL",
                artistName: "Fuji Kaze",
                coverImage: Image.cover2,
                description: """
                鋼琴小生藤井 風眾所期盼的第二張完整專輯《LOVE ALL SERVE ALL》台壓盤發行！

                本作收錄包括〈へでもねーよ〉、〈＂青春病”〉、〈旅路〉、超人氣曲〈きらり〉，以及在紅白歌合戰驚喜現場演唱的〈燃えよ〉等共11首作品。音樂製作人而與首張專輯一樣，依舊找來活躍於全世界的「Yaffle」，與藤井 風共同參與了全收錄曲的編曲。
                """,
                Link: URL(string: "https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://music.apple.com/tw/album/love-all-serve-all/1611482396&ved=2ahUKEwiowLyZ7vCIAxWMdfUHHXoZGd0QFnoECBMQAQ&usg=AOvVaw2VeE63i-Ozeny5XqdHYbh9")!
            )
        ]
    }
    
    // 獲取熱門發行曲目的靜態函數
    static func getPopularReleases() -> [Music] {
        return [
                Music(name: "死ぬのがいいわ", artistName: "Fuji Kaze", coverImage: Image.cover1, description: nil, Link: URL(string: "https://music.apple.com/jp/song/%E6%AD%BB%E3%81%AC%E3%81%AE%E3%81%8C%E3%81%84%E3%81%84%E3%82%8F/1505498792")),
                Music(name: "きらり", artistName: "Fuji Kaze", coverImage: Image.cover3, description: nil, Link: URL(string: "https://music.apple.com/jp/song/%E3%81%8D%E3%82%89%E3%82%8A/1564752145")),
                Music(name: "満ちてゆく", artistName: "Fuji Kaze", coverImage: Image.cover4, description: nil, Link: URL(string: "https://music.apple.com/jp/album/michi-teyu-ku-overflowing-single/1733129984")),
                Music(name: "何なんw", artistName: "Fuji Kaze", coverImage: Image.cover1, description: nil, Link: URL(string: "https://music.apple.com/jp/album/nan-nan-single/1487401474")),
                Music(name: "旅路", artistName: "Fuji Kaze", coverImage: Image.cover2, description: nil, Link: URL(string: "https://music.apple.com/jp/album/tabiji-single/1555177249")),
                Music(name: "Feelin’ Go(o)d", artistName: "Fuji Kaze", coverImage: Image.cover5, description: nil, Link: URL(string: "https://music.apple.com/mo/song/feelin-go-o-d/1752806679")),
                Music(name: "青春病", artistName: "Fuji Kaze", coverImage: Image.cover2, description: nil, Link: URL(string: "https://music.apple.com/mo/song/seishun-sick/1537214263")),
                Music(name: "damn", artistName: "Fuji Kaze", coverImage: Image.cover2, description: nil, Link: URL(string: "https://music.apple.com/tw/song/damn/1748185865")),
                Music(name: "まつり", artistName: "Fuji Kaze", coverImage: Image.cover2, description: nil, Link: URL(string: "https://music.apple.com/jp/song/%E3%81%BE%E3%81%A4%E3%82%8A/1611482688"))
            ]    }
    
    // 獲取藝術家的靜態屬性
    static let Singer = Music(
        name: "Fuji Kaze",
        artistName: "Fuji Kaze",
        coverImage: Image.profile_pic,
        description: nil,
        Link: nil
    )
}




// HomeViewModel 類別用於管理主頁的狀態
class HomeViewModel: ObservableObject {
    
    @Published private(set) var headerStr = "FUJI KAZE"  // 標題
    @Published private(set) var albums = [Music]()  // 專輯列表
    @Published private(set) var popularReleases = [Music]()  // 熱門音樂列表
    
    @Published private(set) var selectedMusic: Music? = nil  // 當前選擇的音樂
    @Published var displayPlayer = false  // 是否顯示播放器
    
    init() {
        fetchAlbums()  // 初始化時獲取專輯
        fetchPopularReleases()  // 初始化時獲取熱門發行
    }
    
    // 獲取專輯資料的函數
    private func fetchAlbums() {
        albums = MusicData.getAlbums()
    }
    
    // 選擇音樂的函數
    private func fetchPopularReleases() {
        popularReleases = MusicData.getPopularReleases()
    }
    
    func selectMusic(music: Music) {
        selectedMusic = music
        displayPlayer = true  // 顯示播放器
    }
}

// PlayerViewModel 類別用於管理播放器的狀態
class PlayerViewModel: ObservableObject {
    
    let model: Music
    
    @Published var liked = true
    @Published var slider: Double = 30  // 播放進度條的值
    @Published var isPlaying = true  // 播放狀態
    
    init(model: Music) {
        self.model = model
    }
}


// HomeView 結構體表示主頁視圖
struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel() // 初始化視圖模型
    @State private var selectedAlbum: Music?  // 選擇的專輯
    @State private var selectedMusic: Music? // 選擇的音樂
    @State private var showMap = false // 用於顯示地圖的狀態

    var body: some View {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all) // 背景顏色

            ScrollView(.vertical, showsIndicators: false) { // 垂直滾動視圖
                VStack(alignment: .leading, spacing: 0) {
                    HomeHeaderView(headerStr: viewModel.headerStr) // 顯示標題
                    
                    HomeAlbumsView(albums: viewModel.albums) { album in
                        selectedAlbum = album // 選擇專輯
                    }
                    
                    HomePopularReleasesView(popularReleases: viewModel.popularReleases) { music in
                        selectedMusic = music // 選擇音樂
                        viewModel.selectMusic(music: music)  // 通知視圖模型
                    }
                    
                    HomeArtistView(onSelect: viewModel.selectMusic) // 顯示藝術家視圖
                    
                    
                    .padding(.horizontal, HORIZONTAL_SPACING) // 設置邊距

                    Spacer().frame(height: 150)  // 留白
                    Spacer()  // 留白
                }
                .fullScreenCover(item: $selectedAlbum) { album in
                    AlbumDetailView(album: album) // 全螢幕專輯詳細視圖
                }
                .fullScreenCover(item: $selectedMusic) { music in
                    PlayerView(viewModel: PlayerViewModel(model: music)) // 全螢幕播放器視圖
                }

            }
            .edgesIgnoringSafeArea([.horizontal, .bottom]) // 內容邊距
        }
    }
}

// HomeHeaderView 結構體表示首頁標題視圖
fileprivate struct HomeHeaderView: View {
    let headerStr: String // 標題文字
    
    // 添加狀態變量來控制動畫效果
    @State private var isAnimating = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(headerStr) // 顯示標題
                .foregroundColor(.text_header) // 標題顏色
                .modifier(FontModifier(.black, size: 28)) // 字型修飾
            
            Spacer() // 彈性空間，將標題與按鈕分開
            
            // 使用SF Symbols的搜索圖標並添加動畫
            Button(action: {
                // 點擊按鈕時觸發動畫
                withAnimation(.easeInOut(duration: 0.2)) {
                    isAnimating.toggle()
                }
                // 這裡可以添加更多搜索功能的實現
            }) {
                Image(systemName: "magnifyingglass") // 使用SF Symbols的搜索圖標magnifyingglass
                    .resizable()  // 可調整大小
                    .scaledToFit() // 保持圖標比例
                    .frame(width: 16, height: 16)  // 設定圖標大小
                    .padding(12) // 設定內邊距
                    .background(Color.primary_color) // 背景顏色
                    .cornerRadius(20) // 圓角
                    .modifier(NeuShadow()) // 陰影效果
                    .foregroundColor(.text_header) // 設置圖標顏色
                    .scaleEffect(isAnimating ? 1.2 : 1.0) // 根據狀態調整縮放比例
                    .animation(.spring(), value: isAnimating) // 添加彈簧動畫
                    .accessibilityLabel("Search Music")  // 添加可訪問性標籤
            }
        }
        .padding(.top, 12)  // 上邊距
        .padding(.horizontal, HORIZONTAL_SPACING) // 設置水平邊距
    }
}

// HomeAlbumsView 結構體表示首頁專輯視圖
fileprivate struct HomeAlbumsView: View {
    let albums: [Music] // 專輯資料
    let onSelect: (Music) -> () // 選擇專輯的回調函數
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Albums")  // 專輯標題
                .foregroundColor(.text_header) // 顏色
                .modifier(FontModifier(.bold, size: 20)) // 字型修飾
                .padding(.leading, HORIZONTAL_SPACING) // 左邊距
            ScrollView(.horizontal, showsIndicators: false) { // 水平滾動視圖
                HStack {
                    ForEach(albums) { album in // 遍歷專輯
                        Button(action: {
                            // 點擊專輯時調用回調
                            onSelect(album)
                        }) {
                            AlbumsView(name: album.name,
                                         artistName: album.artistName,
                                         coverImage: album.coverImage)
                        }
                        .padding(.top, 6)
                        .padding(.bottom, 40)
                    }
                }
                .padding(.horizontal, HORIZONTAL_SPACING)
            }
        }
        .padding(.top, 36)
    }
}

// HomePopularReleasesView 結構體表示首頁熱門發行視圖
fileprivate struct HomePopularReleasesView: View {
    let popularReleases: [Music] // 熱門發行資料
    let onSelect: (Music) -> ()  // 選擇音樂的回調函數
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Popular Releases") // 熱門音樂標題
                .foregroundColor(.text_header) // 顏色
                .modifier(FontModifier(.bold, size: 20))// 字型修飾
                .padding(.leading, HORIZONTAL_SPACING)  // 設置邊距
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(popularReleases) { music in // 遍歷熱門音樂
                        Button(action: { onSelect(music) }) {  // 點擊音樂時調用回調
                            MusicDiscView(name: music.name,
                                          artistName: music.artistName,
                                          coverImage: music.coverImage) // 顯示音樂視圖
                        }
                        .padding(.top, 6)
                        .padding(.bottom, 40)
                    }
                }
                .padding(.horizontal, HORIZONTAL_SPACING) // 設置邊距
            }
        }
    }
}

// HomeArtistView 結構體表示首頁藝術家視圖
fileprivate struct HomeArtistView: View {
    let onSelect: (Music) -> () // 選擇藝術家的回調函數
    @State private var concerts = ConcertData.getConcerts() // Add this line

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Artist") // 藝術家標題
                .foregroundColor(.text_header) // 顏色
                .modifier(FontModifier(.bold, size: 20)) // 字型修飾
                .padding(.leading, HORIZONTAL_SPACING) // 設置邊距
            
            Button(action: { onSelect(MusicData.Singer) }) {
                ArtistView() // 顯示藝術家視圖
            }
            .padding([.horizontal, .top], HORIZONTAL_SPACING)
            .padding(.bottom, 20)

            Text("Upcoming Concerts") // Add a section header
                .foregroundColor(.text_header)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(concerts) { concert in
                        ConcertView(concert: concert) // Use the new ConcertView
                    }
                }
                .padding(.horizontal, HORIZONTAL_SPACING)
            }
        }
    }
}


// 定義 Concert 結構體，遵循 Identifiable 協議以便於 SwiftUI 使用
struct Concert: Identifiable {
    let id = UUID() // 每個音樂會的唯一識別碼
    let title: String // 音樂會的標題
    let date: String // 音樂會的日期
    let venue: String // 音樂會舉辦的場地
    let location: String // 音樂會的一般位置（例如城市或區域）
    let image: Image // 音樂會的圖片（展示用）
    let latitude: Double // 音樂會位置的緯度
    let longitude: Double // 音樂會位置的經度
}

struct ConcertData {
    // 靜態方法，返回一個演唱會數組
    static func getConcerts() -> [Concert] {
        return [
            // 第一場演唱會
            Concert(title: "ASIA TOUR", // 演唱會標題
                    date: "2024.10.26 (土)", // 演唱會日期
                    venue: "Singapore Indoor Stadium", // 演唱會場地
                    location: "Singapore", // 演唱會地點
                    image: Image("concert1"), // 演唱會圖片
                    latitude: 1.2990, // 經度
                    longitude: 103.8744), // 緯度
            
            // 第二場演唱會
            Concert(title: "ASIA TOUR",
                    date: "2024.11.02 (土)",
                    venue: "Axiata Arena",
                    location: "Kuala Lumpur",
                    image: Image("concert1"),
                    latitude: 3.0674,
                    longitude: 101.5936),
            
            // 第三場演唱會
            Concert(title: "ASIA TOUR",
                    date: "2024.11.09 (土)",
                    venue: "Impact Arena",
                    location: "Bangkok",
                    image: Image("concert1"),
                    latitude: 13.8772,
                    longitude: 100.5670),
            
            // 第四場演唱會
            Concert(title: "ASIA TOUR",
                    date: "2024.11.16 (土)",
                    venue: "Taipei Arena",
                    location: "Taipei",
                    image: Image("concert1"),
                    latitude: 25.0520,
                    longitude: 121.5531),
            // 可以根據需要添加更多演唱會
        ]
    }
}

// 演唱會地圖視圖
struct ConcertMapView: View {
    var latitude: Double // 緯度
    var longitude: Double // 經度

    // 使用 State 屬性來管理地圖的區域
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0), // 初始中心點
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // 地圖的縮放範圍
    )
    
    // 定義一個結構來表示演唱會位置
    struct ConcertLocation: Identifiable {
        let id = UUID() // 確保每個位置都有唯一的識別碼
        let coordinate: CLLocationCoordinate2D // 位置的坐標
    }

    // 創建一個演唱會位置的數組
    private var concertLocations: [ConcertLocation] {
        [ConcertLocation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
    }

    var body: some View {
        // 顯示地圖，綁定地圖的區域到 region，並添加演唱會位置的標記
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: concertLocations) { location in
            MapPin(coordinate: location.coordinate, tint: .red) // 添加紅色釘子標記
        }
        .onAppear {
            // 當視圖出現時，設置地圖的中心點為演唱會的位置
            region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        .cornerRadius(12) // 可選：圓角處理
        .shadow(radius: 5) // 可選：添加陰影以增強美觀
    }
}


// 演唱會視圖
struct ConcertView: View {
    var concert: Concert // 演唱會數據模型

    var body: some View {
        VStack {
            // 顯示演唱會圖片
            concert.image
                .resizable() // 使圖片可調整大小
                .scaledToFit() // 維持圖片的寬高比
                .frame(height: 200) // 設置圖片高度為 200
                .cornerRadius(12) // 可選：圓角處理
            
            // 顯示演唱會標題
            Text(concert.title)
                .font(.largeTitle) // 設置字體為大標題
                .padding(.top) // 在標題上方添加一些空間
            
            // 顯示演唱會地點
            Text(concert.location)
                .font(.subheadline) // 設置字體為子標題
                .padding(.bottom, 7) // 在地點下方添加一些空間
            
            // 顯示演唱會場地
            Text(concert.venue)
                .font(.subheadline) // 設置字體為子標題
                .padding(.bottom, 5) // 在場地下方添加一些空間
            
            // 顯示演唱會日期
            Text(concert.date)
                .font(.body) // 設置字體為正文
                .padding(.bottom) // 在日期下方添加一些空間
            
            // 嵌入的小型地圖視圖
            ConcertMapView(latitude: concert.latitude, longitude: concert.longitude)
                .frame(height: 200) // 設置地圖高度為 200
            
            Spacer() // 在地圖下方添加一些空間
        }
        .padding() // 整體視圖添加內邊距
    }
    
    // 輔助函數，用於格式化日期
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium // 使用中等日期樣式
        return dateFormatter.string(from: date) // 返回格式化後的日期字符串
    }
}

// 播放器視圖
struct PlayerView: View {
    
    // 獲取當前視圖的呈現模式，以便於關閉視圖
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // 使用狀態對象來管理播放視圖的數據
    @StateObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            // 背景顏色
            Color.primary_color
                .edgesIgnoringSafeArea(.all) // 擴展顏色至全屏
            
            VStack(alignment: .center, spacing: 0) {
                // 頂部工具列
                HStack(alignment: .center) {
                    // 返回按鈕
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image.close
                            .resizable()
                            .frame(width: 20, height: 20) // 設置按鈕大小
                            .padding(8)
                            .background(Color.primary_color)
                            .cornerRadius(20)
                            .modifier(NeuShadow()) // 添加陰影效果
                    }
                    Spacer() // 使返回按鈕和選項按鈕之間的間距
                    
                    // 選項按鈕
                    Button(action: { /* 實現選項功能 */ }) {
                        Image.options
                            .resizable()
                            .frame(width: 16, height: 16)
                            .padding(12)
                            .background(Color.primary_color)
                            .cornerRadius(20)
                            .modifier(NeuShadow())
                    }
                }
                .padding(.horizontal, HORIZONTAL_SPACING) // 添加水平內邊距
                .padding(.top, 12) // 添加上方內邊距
                
                // 專輯封面
                PlayerDiscView(coverImage: viewModel.model.coverImage)
                    .padding(.top, 24)
                
                // 歌曲詳情
                Text(viewModel.model.name) // 歌曲名稱
                    .foregroundColor(.text_primary)
                    .modifier(FontModifier(.black, size: 30))
                    .padding(.top, 12)
                Text(viewModel.model.artistName) // 藝人名稱
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.semibold, size: 18))
                    .padding(.top, 12)
                
                Spacer() // 添加間距以推動元素向上
                
                // 播放進度條和喜歡按鈕
                HStack(alignment: .center, spacing: 12) {
                    Text("01:30") // 播放進度顯示
                        .foregroundColor(.text_primary)
                        .modifier(FontModifier(.bold, size: 12))
                    Slider(value: $viewModel.slider, in: 0...100) // 播放進度條
                        .accentColor(.main_white)
                    Button(action: { viewModel.liked.toggle() }) { // 喜歡按鈕
                        (viewModel.liked ? Image.heart_filled : Image.heart)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal, 45)
                
                Spacer() // 添加間距以推動元素向上
                
                // 播放控制按鈕
                HStack(alignment: .center) {
                    // 上一曲按鈕
                    Button(action: { /* 實現上一曲功能 */ }) {
                        Image.next
                            .resizable()
                            .frame(width: 18, height: 18)
                            .rotationEffect(Angle(degrees: 180)) // 旋轉圖標
                            .padding(24)
                            .background(Color.primary_color)
                            .cornerRadius(40)
                            .modifier(NeuShadow())
                    }
                    Spacer() // 添加間距
                    
                    // 播放/暫停按鈕
                    Button(action: {
                        viewModel.isPlaying.toggle() // 切換播放狀態
                        
                        // 如果有鏈接，則在點擊時打開鏈接
                        if let url = viewModel.model.Link {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }) {
                        (viewModel.isPlaying ? Image.pause : Image.play)
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(50)
                            .background(Color.main_color)
                            .cornerRadius(70)
                            .modifier(NeuShadow())
                    }
                    Spacer() // 添加間距
                    
                    // 下一曲按鈕
                    Button(action: { /* 實現下一曲功能 */ }) {
                        Image.next
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding(24)
                            .background(Color.primary_color)
                            .cornerRadius(40)
                            .modifier(NeuShadow())
                    }
                }
                .padding(.horizontal, 32)
            }
            .padding(.bottom, HORIZONTAL_SPACING) // 添加底部內邊距
            .animation(.spring(), value: viewModel.isPlaying) // 根據播放狀態添加動畫效果
        }
    }
}

// 專輯詳細視圖
struct AlbumDetailView: View {
    let album: Music // 專輯資料
    @Environment(\.presentationMode) var presentationMode // 用於控制視圖的呈現模式

    var body: some View {
        ZStack {
            // 設置背景顏色
            Color.primary_color.edgesIgnoringSafeArea(.all)
            
            VStack {
                // 專輯封面
                album.coverImage
                    .resizable() // 使圖片可調整大小
                    .scaledToFit() // 按比例縮放以適應框架
                    .frame(height: 250) // 設置高度
                    .cornerRadius(20) // 添加圓角效果
                
                // 專輯名稱
                Text(album.name)
                    .foregroundColor(.text_primary) // 設置字體顏色
                    .modifier(FontModifier(.black, size: 30)) // 設置字體樣式和大小
                    .padding(.top, 12) // 添加上方內邊距

                // 藝人名稱
                Text(album.artistName)
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.semibold, size: 18)) // 設置字體樣式和大小
                    .padding(.top, 12) // 添加上方內邊距

                // 可滾動的描述
                ScrollView {
                    Text(album.description ?? "No description available.") // 提供默認值以防無描述
                        .foregroundColor(.text_primary_f1)
                        .modifier(FontModifier(.regular, size: 16)) // 調整字體大小和樣式
                        .padding() // 添加內邊距
                }
                .frame(maxHeight: 300) // 設置可滾動區域的最大高度

                // 檢查是否有有效的購買鏈接並顯示
                if let link = album.Link {
                    Link("Enjoy the Album", destination: link) // 使鏈接可點擊
                        .foregroundColor(.blue) // 設置字體顏色
                        .padding(.top, 20) // 添加上方內邊距
                }

                Spacer() // 添加間距以推動元素向上

                // 返回按鈕
                Button("Back") {
                    presentationMode.wrappedValue.dismiss() // 關閉當前視圖
                }
                .padding() // 添加內邊距
            }
            .padding(.bottom, 20) // 添加底部內邊距
        }
    }
}


// 播放器專輯封面視圖
fileprivate struct PlayerDiscView: View {
    let coverImage: Image // 專輯封面圖片
    
    var body: some View {
        ZStack {
            // 繪製圓形背景
            Circle()
                .foregroundColor(.primary_color) // 設置圓形的填充顏色
                .frame(width: 300, height: 300) // 設置圓形的大小
                .modifier(NeuShadow()) // 添加模糊陰影效果
            
            // 繪製多個圓形邊界
            ForEach(0..<15, id: \.self) { i in
                RoundedRectangle(cornerRadius: (150 + CGFloat((8 * i))) / 2) // 繪製圓角矩形
                    .stroke(lineWidth: 0.25) // 設置邊界的線寬
                    .foregroundColor(.disc_line) // 設置邊界顏色
                    .frame(width: 150 + CGFloat((8 * i)), // 設置寬度
                           height: 150 + CGFloat((8 * i))) // 設置高度
            }
            
            // 顯示專輯封面圖片
            coverImage
                .resizable() // 使圖片可調整大小
                .scaledToFill() // 按比例填充視圖
                .frame(width: 120, height: 120) // 設置圖片的大小
                .cornerRadius(60) // 添加圓角效果
        }
    }
}

// 專輯視圖
struct AlbumsView: View {
    
    let name: String // 專輯名稱
    let artistName: String // 藝術家名稱
    let coverImage: Image // 專輯封面圖片
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) { // 垂直堆疊視圖
            // 顯示專輯封面圖片
            coverImage
                .resizable() // 使圖片可調整大小
                .scaledToFill() // 按比例填充視圖
                .frame(width: 114, height: 88) // 設置圖片的寬度和高度
                .cornerRadius(16) // 添加圓角效果
            
            // 顯示專輯名稱
            Text(name)
                .foregroundColor(.text_primary) // 設置文字顏色
                .modifier(FontModifier(.bold, size: 16)) // 設置字體樣式和大小
                .padding(.top, 12) // 在上方添加填充
                .padding(.bottom, 6) // 在下方添加填充
            
            // 顯示藝術家名稱
            Text(artistName)
                .foregroundColor(.text_primary_f1) // 設置文字顏色
                .modifier(FontModifier(.regular, size: 12)) // 設置字體樣式和大小
                .padding(.bottom, 8) // 在下方添加填充
        }
        .padding(12) // 在整個視圖周圍添加填充
        .background(Color.primary_color) // 設置背景顏色
        .cornerRadius(24) // 添加圓角效果
        .modifier(NeuShadow()) // 添加陰影效果以增強視覺效果
    }
}

// 音樂圓盤視圖
struct MusicDiscView: View {
    
    let name: String // 專輯名稱
    let artistName: String // 藝術家名稱
    let coverImage: Image // 專輯封面圖片
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) { // 垂直堆疊視圖
            ZStack { // 使用 ZStack 來重疊元素
                // 背景圓形
                Circle()
                    .foregroundColor(.primary_color) // 設置圓形的背景顏色
                    .frame(width: 180, height: 180) // 設置圓形的寬度和高度
                    .modifier(NeuShadow()) // 添加陰影效果

                // 添加多層次的邊框效果
                ForEach(0..<10, id: \.self) { i in
                    RoundedRectangle(cornerRadius: (80 + CGFloat((6 * i))) / 2) // 設置圓角
                        .stroke(lineWidth: 0.25) // 設置邊框寬度
                        .foregroundColor(.disc_line) // 設置邊框顏色
                        .frame(width: 80 + CGFloat((6 * i)), // 設置邊框的寬度
                               height: 80 + CGFloat((6 * i))) // 設置邊框的高度
                }

                // 顯示專輯封面圖片
                coverImage
                    .resizable() // 使圖片可調整大小
                    .scaledToFill() // 按比例填充視圖
                    .frame(width: 70, height: 70) // 設置封面圖片的寬度和高度
                    .cornerRadius(35) // 添加圓角效果
            }
            // 顯示專輯名稱
            Text(name)
                .foregroundColor(.text_primary) // 設置文字顏色
                .modifier(FontModifier(.bold, size: 16)) // 設置字體樣式和大小
                .padding(.top, 12) // 在上方添加填充
                .padding(.bottom, 6) // 在下方添加填充
            
            // 顯示藝術家名稱
            Text(artistName)
                .foregroundColor(.text_primary_f1) // 設置文字顏色
                .modifier(FontModifier(.regular, size: 12)) // 設置字體樣式和大小
                .padding(.bottom, 8) // 在下方添加填充
        }
    }
}

// 藝術家視圖
struct ArtistView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) { // 水平堆疊視圖
            // 藝術家圖片
            Image.profile_pic
                .resizable() // 使圖片可調整大小
                .scaledToFill() // 按比例填充視圖
                .frame(width: 114, height: 140) // 設置圖片的寬度和高度
                .cornerRadius(16) // 添加圓角效果
            
            VStack(alignment: .leading, spacing: 8) { // 垂直堆疊視圖，對齊到左側
                // 藝術家名稱
                Text("藤井 風") // 藝術家的名字
                    .foregroundColor(.text_primary) // 設置文字顏色
                    .modifier(FontModifier(.bold, size: 18)) // 設置字體樣式和大小
                
                // 藝術家簡介
                Text("Fujii Kaze is a Japanese vegetarian singer songwriter. He is spreading love and freedom to the world thru his music and life. He's released two albums so far, both reached No. 1 on Billboard Japan's Hot Albums chart.")
                    .foregroundColor(.text_primary_f1) // 設置文字顏色
                    .modifier(FontModifier(.regular, size: 13)) // 設置字體樣式和大小
            }
            .padding(.leading, 12) // 在左側添加填充
            Spacer() // 添加彈性空間，使其自動對齊
        }
        .padding(12) // 在外部添加填充
        .background(Color.primary_color) // 設置背景顏色
        .cornerRadius(24) // 添加圓角效果
        .modifier(NeuShadow()) // 添加陰影效果
    }
}


// 擴展 Color 結構以添加自定義顏色
extension Color {
    
    // 自定義顏色屬性
    static let primary_color = Color(white: 1) // 設置主要顏色為白色
    static let main_color = Color(hex: "657592") // 使用十六進制顏色設置主要顏色
    static let main_white = Color(hex: "657592") // 使用同樣的十六進制顏色設置主白色
    
    // 文字顏色設置
    static let text_header = Color(hex: "333333") // 頭部文字顏色
    static let text_primary = Color(hex: "657592") // 主要文字顏色
    static let text_primary_f1 = Color.text_primary.opacity(0.8) // 主要文字顏色的透明度設置為 80%
    
    // 碟片線條顏色
    static let disc_line = Color(hex: "666666") // 碟片邊框顏色
    
    // 十六進制顏色初始化器
    init(hex: String, alpha: Double = 1) {
        // 清理十六進制字符串並轉換為大寫
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) } // 去除前綴 #
        
        let scanner = Scanner(string: cString) // 創建一個掃描器來解析十六進制顏色
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0 // 儲存 RGB 值
        scanner.scanHexInt64(&rgbValue) // 從字符串中掃描十六進制整數
        
        // 提取紅色、綠色和藍色分量
        let r = (rgbValue & 0xff0000) >> 16 // 提取紅色分量
        let g = (rgbValue & 0xff00) >> 8 // 提取綠色分量
        let b = rgbValue & 0xff // 提取藍色分量
        
        // 初始化 Color 物件，使用 sRGB 色彩空間
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff, opacity: alpha)
    }
}

// 定義字體類型的枚舉
enum LatoFontType: String {
    case regular = "Lato-Regular"      // 定義常規字體，對應的字體名稱為 "Lato-Regular"
    case semibold = "Lato-Semibold"    // 定義半粗體字體，對應的字體名稱為 "Lato-Semibold"
    case bold = "Lato-Bold"             // 定義粗體字體，對應的字體名稱為 "Lato-Bold"
    case black = "Lato-Black"           // 定義黑體字體，對應的字體名稱為 "Lato-Black"
}

// 定義 FontModifier 結構以實現自定義字體樣式
struct FontModifier: ViewModifier {
    
    var type: LatoFontType, size: CGFloat  // 存儲字體類型和字體大小
    
    // 初始化 FontModifier，提供默認值
    init(_ type: LatoFontType = .regular, size: CGFloat = 16) {
        self.type = type  // 設置字體類型
        self.size = size  // 設置字體大小
    }
    
    // 定義修飾符的主體內容
    func body(content: Content) -> some View {
        // 應用自定義字體到傳入的內容
        content.font(Font.custom(type.rawValue, size: size))  // 使用自定義字體和大小
    }
}



extension Image {
    
    // 圖示
    static let close = Image("arrow_down")         // 關閉按鈕圖示
    static let options = Image("options_icon")      // 選項按鈕圖示
    static let search = Image("search_icon")        // 搜索按鈕圖示
    static let play = Image("play_icon")            // 播放按鈕圖示
    static let pause = Image("pause_icon")          // 暫停按鈕圖示
    static let heart = Image("heart_icon")          // 喜歡按鈕圖示（空心）
    static let heart_filled = Image("heart-filled_icon") // 喜歡按鈕圖示（實心）
    static let next = Image("next_icon")            // 下一曲按鈕圖示
    
    // 個人資料圖片
    static let profile_pic = Image("profile_pic")   // 個人資料圖片
    
    // 封面圖片
    static let cover1 = Image("cover1")             // 封面圖片1
    static let cover2 = Image("cover2")             // 封面圖片2
    static let cover3 = Image("cover3")             // 封面圖片3
    static let cover4 = Image("cover4")             // 封面圖片4
    static let cover5 = Image("cover5")             // 封面圖片5
}


    // NeuShadow 的視圖修飾符，用於創建具有神經網絡風格（Neumorphism）陰影效果的視圖
struct NeuShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("neuColor1"), radius: 1, x: -7, y: -7)  // 第一層陰影
            .shadow(color: Color("neuColor2"), radius: 4, x: -13, y: -7) // 第二層陰影
            .shadow(color: Color("neuColor3"), radius: 10, x: -8, y: 5)  // 第三層陰影
            .shadow(color: Color("neuColor4"), radius: 10, x: 10, y: 9)  // 第四層陰影
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
