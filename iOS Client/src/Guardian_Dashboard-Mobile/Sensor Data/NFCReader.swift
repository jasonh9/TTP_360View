//
//  NFCReader.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/14/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import Foundation
import CoreNFC

class NFCReader: NSObject {
    var defReader: NFCNDEFReaderSession!
    var tagReader: NFCTagReaderSession!
    
    override init() {
        super.init()
        
        defReader = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        tagReader = NFCTagReaderSession(pollingOption: .iso14443, delegate: self, queue: nil)
    }
    
}

extension NFCReader: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC DEF reader session didInvalidateWithError: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("NFC DEF reader session didDetectNDEF messages: \(messages.description)")
    }
}

extension NFCReader: NFCTagReaderSessionDelegate {
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("NFC tag reader session now active")
        guard session.connectedTag == nil else { return }
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("NFC Tag reader session didInvalidateWithError: \(error.localizedDescription)")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("NFC Tag reader session didDetectNDEF tags: \(tags.description)")
    }
    
    
}
