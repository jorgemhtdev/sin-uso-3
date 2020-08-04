//
//  ContentView.swift
//  MyFirstApp
//
//  Created by jorgemht on 04/08/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var observed = Observer()

    var body: some View {
        
        NavigationView{
            
            VStack {
                
                //LoadingView()

                List(observed.post){ i in
                    NavigationLink(destination: PostDetailView(item: i)) {
                        
                        Text(i.title)

                        if i.id == self.observed.commentRead.count{
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 15, height: 15)
                        }
                        
                    }
                }
                
            }
            .navigationBarTitle("SwiftUI Alamofire")
        }
    }
    
    func Add(id: Int){
        UserDefaults.standard.set(id, forKey: "PostRead")
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}


struct LoadingView: View {
    
    let timer = Timer.publish(every: 1.6, on: .main, in: .common).autoconnect()
    @State var leftOffset: CGFloat = -100
    @State var rightOffset: CGFloat = 100
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1))
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.2))
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.4))
        }
        .onReceive(timer) { (_) in
            swap(&self.leftOffset, &self.rightOffset)
        }
    }
    
}
