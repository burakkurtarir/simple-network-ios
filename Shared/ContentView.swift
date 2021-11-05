//
//  ContentView.swift
//  Shared
//
//  Created by Eralp Mobile on 15.10.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts.indices, id: \.self){ i in
                    let post = viewModel.posts[i]
                    
                    VStack(alignment: .leading) {
                        Text(post.title ?? "")
                            .font(.title3)
                        Text(post.body ?? "")
                            .font(.body)
                    }
                }
            }
            .navigationTitle("Post List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
