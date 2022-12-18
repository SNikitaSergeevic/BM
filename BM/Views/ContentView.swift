//
//  ContentView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI


struct ContentView: View {
    
    @State var progress: CGFloat = 0
    @State var doneLoading: Bool = false
    
    
   
    @ObservedObject var configurator: Configurator
    @ObservedObject var viewRouter: ViewRouter
    
    init(configurator: Configurator){
        print("ContentView init")
        self.viewRouter = configurator.viewRouter
        self.configurator = configurator
    }
    
    var body: some View {
        ZStack {
            if doneLoading {
                TabBarView()
                    .environmentObject(configurator)
                    .environmentObject(viewRouter)
            } else {
                VStack {
                    LoadingView(content: Image("BMLogo")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 50),
                                progress: $progress)
                    .onAppear {
                        // simulate asynchronous data loading
                        // по идее тут нужно чекать и запрашивать данные
//                        Task {
//                            try await viewRouter.authorisation.authorisedUserWithToken()
//                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0){
//                            withAnimation {
//                                self.progress = 0
//
//                            }
//                            try await viewRouter.authorisation.authorisedUserWithToken()
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//                                withAnimation {
//                                    self.doneLoading = true
//                                }
//                            }
//                        }
                        
//                        do { //FIXME
//                            try configurator.authorisation.authorisedUserWithToken {
//                                withAnimation {
//                                    
//                                    
//                                }
//                            }
                            self.doneLoading = true
//                        } catch {
//                            print(error.localizedDescription)
//                        }
                        
                    }
                }
            }
        }
        
        
        
    }
    
    
    
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewRouter: ViewRouter())
////            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
