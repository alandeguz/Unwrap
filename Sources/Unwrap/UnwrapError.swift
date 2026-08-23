//
//  UnwrapError.swift
//  Unwrap
//
//  Created by Alan DeGuzman on 2026/08/22.
//

/// An error representing a failed safe-unwrap operation.
public struct UnwrapError: Error, CustomStringConvertible {
    public let type: Any.Type
    public let reasoning: String
    public let file: StaticString
    public let line: UInt
    
    public init(type: Any.Type, reasoning: String, file: StaticString, line: UInt) {
        self.type = type
        self.reasoning = reasoning
        self.file = file
        self.line = line
    }

    public var description: String {
        return "Forced unwrap of type \(String(describing: type)) asserting '\(reasoning)' failed at \(file):\(line)"
    }
}
