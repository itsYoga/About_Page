//
//  ContentView.swift
//  About_Page
//
//  Created by Jesse Liang on 2024/09/25.
//

import SwiftUI
import Foundation
import MapKit


fileprivate let HORIZONTAL_SPACING: CGFloat = 24

// Music 結構體用於表示音樂項目，並且遵循 Identifiable 協議以便於 SwiftUI 的列表和迭代

struct Music: Identifiable {
    let id = UUID()  // 唯一識別碼
    let name: String  // 名稱
    let artistName: String  // 藝術家名稱
    let coverImage: Image  // 封面圖片
    let description: String?  // 可選專輯描述
    let Link: URL?  //
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
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedAlbum: Music?
    @State private var selectedMusic: Music?
    @State private var showMap = false // New state to show the map

    var body: some View {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)

            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    HomeHeaderView(headerStr: viewModel.headerStr)
                    
                    HomeAlbumsView(albums: viewModel.albums) { album in
                        selectedAlbum = album
                    }
                    
                    HomePopularReleasesView(popularReleases: viewModel.popularReleases) { music in
                        selectedMusic = music
                        viewModel.selectMusic(music: music)
                    }
                    
                    HomeArtistView(onSelect: viewModel.selectMusic)
                    
                    
                    .padding(.horizontal, HORIZONTAL_SPACING)

                    Spacer().frame(height: 150)
                    Spacer()
                }
                .fullScreenCover(item: $selectedAlbum) { album in
                    AlbumDetailView(album: album)
                }
                .fullScreenCover(item: $selectedMusic) { music in
                    PlayerView(viewModel: PlayerViewModel(model: music))
                }

            }
            .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
}

// HomeHeaderView 結構體表示首頁標題視圖
fileprivate struct HomeHeaderView: View {
    let headerStr: String // 標題文字
    var body: some View {
        HStack(alignment: .center) {
            Text(headerStr)
                .foregroundColor(.text_header)
                .modifier(FontModifier(.black, size: 28))
            Spacer()
            Button(action: { /* Implement search functionality */ }) {
                Image.search
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(12)
                    .background(Color.primary_color)
                    .cornerRadius(20)
                    .modifier(NeuShadow())
                    .accessibilityLabel("Search Music")  // Adding accessibility label
            }
        }
        .padding(.top, 12)
        .padding(.horizontal, HORIZONTAL_SPACING) // 設置邊距
    }
}

// HomeAlbumsView 結構體表示首頁專輯視圖
fileprivate struct HomeAlbumsView: View {
    let albums: [Music]
    let onSelect: (Music) -> ()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Albums")
                .foregroundColor(.text_header)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(albums) { album in
                        Button(action: {
                            // Navigate to album detail view
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
            Text("Popular Releases")
                .foregroundColor(.text_header)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)  // 設置邊距
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(popularReleases) { music in // 遍歷熱門音樂
                        Button(action: { onSelect(music) }) {
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
            Text("Artist") // 藝術家
                .foregroundColor(.text_header)
                .modifier(FontModifier(.bold, size: 20))
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


struct Concert: Identifiable {
    let id = UUID() // Unique identifier for each concert
    let title: String // Title of the concert
    let date: String // Date of the concert
    let venue: String // Venue where the concert is held
    let location: String // General location
    let image: Image // Image for the concert
    let latitude: Double // Latitude of the concert location
    let longitude: Double // Longitude of the concert location
}

struct ConcertData {
    static func getConcerts() -> [Concert] {
        return [
            Concert(title: "ASIA TOUR",
                    date: "2024.10.26 (土)",
                    venue: "Singapore Indoor Stadium",
                    location: "Singapore",
                    image: Image("concert1"),
                    latitude: 1.2990,
                    longitude: 103.8744),
            
            Concert(title: "ASIA TOUR",
                    date: "2024.11.02 (土)",
                    venue: "Axiata Arena",
                    location: "Kuala Lumpur",
                    image: Image("concert1"),
                    latitude: 3.0674,
                    longitude: 101.5936),
            
            Concert(title: "ASIA TOUR",
                    date: "2024.11.09 (土)",
                    venue: "Impact Arena",
                    location: "Bangkok",
                    image: Image("concert1"),
                    latitude: 13.8772,
                    longitude: 100.5670),
            
            Concert(title: "ASIA TOUR",
                    date: "2024.11.16 (土)",
                    venue: "Taipei Arena",
                    location: "Taipei",
                    image: Image("concert1"),
                    latitude: 25.0520,
                    longitude: 121.5531),
            // Add more concerts as needed
        ]
    }
}

struct ConcertMapView: View {
    var latitude: Double
    var longitude: Double

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    // Define a structure to represent a concert location
    struct ConcertLocation: Identifiable {
        let id = UUID() // Ensure this is present
        let coordinate: CLLocationCoordinate2D
    }

    // Create an array of concert locations
    private var concertLocations: [ConcertLocation] {
        [ConcertLocation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))]
    }

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, annotationItems: concertLocations) { location in
            MapPin(coordinate: location.coordinate, tint: .red) // Example of adding a pin
        }
        .onAppear {
            // Set the map center to the concert's location
            region.center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        .cornerRadius(12) // Optional: Round corners of the map
        .shadow(radius: 5) // Optional: Add shadow for better aesthetics
    }
}


struct ConcertView: View {
    var concert: Concert
    
    var body: some View {
        VStack {
            // Display the concert image
            concert.image
                .resizable() // Make the image resizable
                .scaledToFit() // Maintain aspect ratio
                .frame(height: 200) // Set a height for the image
                .cornerRadius(12) // Optional: Round corners for aesthetics
            
            
            Text(concert.title)
                .font(.largeTitle)
                .padding(.top) // Add some space above the title
            
            
            Text(concert.location)
                .font(.subheadline)
                .padding(.bottom, 7) // Add some space below the location
            
            Text(concert.venue)
                .font(.subheadline)
                .padding(.bottom, 5) // Add some space below the venue
            
            // Display the concert date
            Text(concert.date)
                .font(.body)
                .padding(.bottom) // Add some space below the date
            
            // Small embedded map view
            ConcertMapView(latitude: concert.latitude, longitude: concert.longitude)
                .frame(height: 200) // Set the height of the map
            
            Spacer() // Add some space below the map
        }
        .padding()
    }
    
    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium // Use a medium date style
        return dateFormatter.string(from: date)
    }
}

struct PlayerView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            Color.primary_color
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                // 頂部工具列
                HStack(alignment: .center) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image.close
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(8)
                            .background(Color.primary_color)
                            .cornerRadius(20)
                            .modifier(NeuShadow())
                    }
                    Spacer()
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
                .padding(.horizontal, HORIZONTAL_SPACING)
                .padding(.top, 12)
                
                // 專輯封面
                PlayerDiscView(coverImage: viewModel.model.coverImage)
                    .padding(.top, 24)
                
                // 歌曲詳情
                Text(viewModel.model.name)
                    .foregroundColor(.text_primary)
                    .modifier(FontModifier(.black, size: 30))
                    .padding(.top, 12)
                Text(viewModel.model.artistName)
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.semibold, size: 18))
                    .padding(.top, 12)
                
                Spacer()
                
                // 播放進度條和喜歡按鈕
                HStack(alignment: .center, spacing: 12) {
                    Text("01:30")
                        .foregroundColor(.text_primary)
                        .modifier(FontModifier(.bold, size: 12))
                    Slider(value: $viewModel.slider, in: 0...100)
                        .accentColor(.main_white)
                    Button(action: { viewModel.liked.toggle() }) {
                        (viewModel.liked ? Image.heart_filled : Image.heart)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal, 45)
                
                Spacer()
                
                // 播放控制按鈕
                HStack(alignment: .center) {
                    Button(action: { /* 實現上一曲功能 */ }) {
                        Image.next
                            .resizable()
                            .frame(width: 18, height: 18)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(24)
                            .background(Color.primary_color)
                            .cornerRadius(40)
                            .modifier(NeuShadow())
                    }
                    Spacer()
                    Button(action: {
                        viewModel.isPlaying.toggle()
                        
                        // Open the link when the play button is tapped
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
                    Spacer()
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
            .padding(.bottom, HORIZONTAL_SPACING)
            .animation(.spring(), value: viewModel.isPlaying)
        }
    }
}
struct AlbumDetailView: View {
    let album: Music
    @Environment(\.presentationMode) var presentationMode // Add this line

    var body: some View {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)
            VStack {
                // Album cover
                album.coverImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(20)

                Text(album.name)
                    .foregroundColor(.text_primary)
                    .modifier(FontModifier(.black, size: 30))
                    .padding(.top, 12)

                Text(album.artistName)
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.semibold, size: 18))
                    .padding(.top, 12)

                // Scrollable description
                ScrollView {
                    Text(album.description ?? "No description available.")  // Provide default value
                        .foregroundColor(.text_primary_f1)
                        .modifier(FontModifier(.regular, size: 16)) // Adjust font size and style as needed
                        .padding()
                }
                .frame(maxHeight: 300) // Set the maximum height for the scrollable area

                // Check if there's a valid purchase link and show it
                if let link = album.Link {
                    Link("Enjoy the Album", destination: link)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }

                Spacer()

                Button("Back") {
                    presentationMode.wrappedValue.dismiss() // Dismiss the view
                }
                .padding()
            }
            .padding(.bottom, 20)
        }
    }
}


fileprivate struct PlayerDiscView: View {
    let coverImage: Image
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.primary_color)
                .frame(width: 300, height: 300)
                .modifier(NeuShadow())
            ForEach(0..<15, id: \.self) { i in
                RoundedRectangle(cornerRadius: (150 + CGFloat((8 * i))) / 2)
                    .stroke(lineWidth: 0.25)
                    .foregroundColor(.disc_line)
                    .frame(width: 150 + CGFloat((8 * i)),
                           height: 150 + CGFloat((8 * i)))
            }
            coverImage
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
        }
    }
}

struct AlbumsView: View {
    
    let name: String
    let artistName: String
    let coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            coverImage
                .resizable()
                .scaledToFill()
                .frame(width: 114, height: 88)
                .cornerRadius(16)
            Text(name)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12)
                .padding(.bottom, 6)
            Text(artistName)
                .foregroundColor(.text_primary_f1)
                .modifier(FontModifier(.regular, size: 12))
                .padding(.bottom, 8)
        }
        .padding(12)
        .background(Color.primary_color)
        .cornerRadius(24)
        .modifier(NeuShadow())
    }
}

struct MusicDiscView: View {
    
    let name: String
    let artistName: String
    let coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                Circle()
                    .foregroundColor(.primary_color)
                    .frame(width: 180, height: 180)
                    .modifier(NeuShadow())
                ForEach(0..<10, id: \.self) { i in
                    RoundedRectangle(cornerRadius: (80 + CGFloat((6 * i))) / 2)
                        .stroke(lineWidth: 0.25)
                        .foregroundColor(.disc_line)
                        .frame(width: 80 + CGFloat((6 * i)),
                               height: 80 + CGFloat((6 * i)))
                }
                coverImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .cornerRadius(35)
            }
            Text(name)
                .foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12)
                .padding(.bottom, 6)
            Text(artistName)
                .foregroundColor(.text_primary_f1)
                .modifier(FontModifier(.regular, size: 12))
                .padding(.bottom, 8)
        }
    }
}

struct ArtistView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image.profile_pic
                .resizable()
                .scaledToFill()
                .frame(width: 114, height: 140)
                .cornerRadius(16)
            VStack(alignment: .leading, spacing: 8) {
                Text("藤井 風")
                    .foregroundColor(.text_primary)
                    .modifier(FontModifier(.bold, size: 18))
                Text("Fujii Kaze is a Japanese vegetarian singer songwriter i He is spreading love and freedom to the world thru his music and life sid He's released two albums so far, both reached No. 1 on Billboard Japan's Hot Albums chart.")
                    .foregroundColor(.text_primary_f1)
                    .modifier(FontModifier(.regular, size: 13))
            }
            .padding(.leading, 12)
            Spacer()
        }
        .padding(12)
        .background(Color.primary_color)
        .cornerRadius(24)
        .modifier(NeuShadow())
    }
}


extension Color {
    
    static let primary_color = Color(white)
    static let main_color = Color(hex: "657592")
    static let main_white = Color(hex: "657592")
    
    static let text_header = Color(hex: "333333")
    static let text_primary = Color(hex: "657592")
    static let text_primary_f1 = Color.text_primary.opacity(0.8)
    
    static let disc_line = Color(hex: "666666")
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}

// 定義字體類型的枚舉
enum ArialFontType: String {
    case regular = "ArialMT"       // Regular 字體
    case semibold = "Arial-Semibold" // Semibold 字體（根據需要確保存在）
    case bold = "Arial-BoldMT"     // Bold 字體
    case black = "Arial-Black"     // Black 字體（根據需要確保存在）
}

// 自定義字體修改器
struct FontModifier: ViewModifier {
    
    var type: ArialFontType    // 使用新的字體枚舉
    var size: CGFloat
    
    init(_ type: ArialFontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))  // 使用新字體
    }
}


extension Image {
    
    // 圖示
    static let close = Image("arrow_down")
    static let options = Image("options_icon")
    static let search = Image("search_icon")
    static let play = Image("play_icon")
    static let pause = Image("pause_icon")
    static let heart = Image("heart_icon")
    static let heart_filled = Image("heart-filled_icon")
    static let next = Image("next_icon")
    
    // 個人資料圖片
    static let profile_pic = Image("profile_pic")
    
    // 封面圖片
    static let cover1 = Image("cover1")
    static let cover2 = Image("cover2")
    static let cover3 = Image("cover3")
    static let cover4 = Image("cover4")
    static let cover5 = Image("cover5")
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
