///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

import AVFoundation

import SwiftUI
import WandURL

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
@main
struct PlayApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

}

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
struct ContentView: View {

    var body: some View {

        VStack {
            Image(systemName: "wand.and.stars")
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: load)

    }

    func load() {

        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error.localizedDescription)
        }

        Wand.Log.level = .verbose

        let query = "паша+техник"
        let path = "https://itunes.apple.com/search?term=\(query)&entity=song&limit=5"

        var headers = JSON.defaultHeaders
        headers["Accept"] = "text/javascript"

        let player = AVQueuePlayer()

        var prev: AVPlayerItem? = nil

        (path, headers) | { (raw: [String: Any]) in

            let result = raw["results"] as! [[String: Any]]

            result | {

                let path = $0["previewUrl"] as! String

                let item = AVPlayerItem(url: path|)
                player.insert(item, after: prev)

                prev = item

            } as Void

            player.play()

        } |? { (e: Error) in
            print(e)
        }

    }
}

@available(iOS 14, macOS 12, tvOS 14, watchOS 7, *)
#Preview {
    ContentView()
}
