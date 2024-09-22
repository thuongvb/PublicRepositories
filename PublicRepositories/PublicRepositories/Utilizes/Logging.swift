//
//  Logging.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Logger

struct Logging {
    
    static func configure() {
        let logManager = LogManager.shared

        logManager.setApplicationCallbackLogger(onLevel: .info)

        let consoleLogger = ConsoleLogger()
        consoleLogger.levels = [.warn, .debug, .info, .error, .process, .system, .verbose]
        logManager.add(consoleLogger)
    }
    
    static func debug(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .debug,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }
    
    static func error(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .error,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }

    static func info(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .info,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }

    static func process(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .process,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }

    static func system(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .system,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }
    
    static func verbose(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .verbose,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }

    static func warn(
        _ message: Any,
        inFile file: String = #file,
        inFunction function: String = #function,
        onLine line: Int = #line
    ) {
        Log(
            "\(message)",
            onLevel: .warn,
            inFile: file,
            inFunction: function,
            onLine: line
        )
    }
}
