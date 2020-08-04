//
//  PostView.swift
//  MyFirstApp
//
//  Created by jorgemht on 04/08/2020.
//  Copyright © 2020 jorgemht. All rights reserved.
//

import SwiftUI

import SwiftUI

struct PostDetailView: View {
        
    @ObservedObject var observed = Observer()
    @State private var showDetailsId = 0
    @State private var defaults = UserDefaults.standard

    var item: Post

    var body: some View {
        
        VStack {
            
            Text(item.body).bold()
            
            Spacer()
            
            List(observed.comment){ i in
                
                if self.showDetailsId == i.id {
                    Text(i.body)
                }else{
                    Text(i.body).lineLimit(2)
                }
                
                Spacer()
                
                Button(action: {
                    self.showDetailsId = i.id
                    
                    self.defaults.object(forKey: "CommentRead")
                }) {
                    Text("Read More")
                }
            }.onAppear(perform:
            {
                //LoadingView()
                self.observed.getComment(idPost: self.item.id)
            })
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(item: <#Post#>)
//    }
//}
