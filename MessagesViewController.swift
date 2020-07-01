//
//  MessagesViewController.swift
//  Extension
//
//  Created by Summer on 2020/7/1.
//  Copyright © 2020 Summer. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController,MSStickerBrowserViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadStickersData()
        createStickerBrowser()
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

    var stickersArr = [MSSticker]()

    func loadStickersData() {
        for i in 1...15 {
            
            
            if let url = Bundle.main.url(forResource: "Sticker \(i)", withExtension: "png") {
                do {
                    let sticker = try MSSticker(contentsOfFileURL: url, localizedDescription: "")
                    stickersArr.append(sticker)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func createStickerBrowser() {
        let controller = MSStickerBrowserViewController(stickerSize: .large)
        
        addChild(controller)
        view.addSubview(controller.view)
        
        controller.stickerBrowserView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        controller.stickerBrowserView.dataSource = self
        
        view.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: controller.view.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: controller.view.rightAnchor).isActive = true
    }
    
    func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickersArr.count
    }

    func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickersArr[index]
    }
    
}
