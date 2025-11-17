
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SnappyObjC",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SnappyObjC",
            targets: ["SnappyObjC"]
        )
    ],
    targets: [
        // Objective-C 封装层目标
        .target(
            name: "SnappyObjC",
            dependencies: ["SnappyC"], // 依赖 C 核心代码
            path: "Classes", // 现有 Objective-C 源码目录
            publicHeadersPath: "." // 公开头文件（Snappy-ObjC.h）
        ),
        // C 核心代码目标
        .target(
            name: "SnappyC",
            path: "Sources/SnappyC", // 存放 snappy-c 源码的目录
            publicHeadersPath: ".",
            cSettings: [
                .define("HAVE_STDINT_H"), // 根据 snappy-c 需要的宏定义
                .define("HAVE_MEMMOVE"),
                .headerSearchPath(".") // 让 C 代码能引用自身头文件（如 #import "snappy.h"）
            ]
        ),
    
    ]
)
