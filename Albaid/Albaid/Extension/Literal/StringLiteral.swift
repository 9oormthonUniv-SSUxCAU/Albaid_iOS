//
//  StringLiteral.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

struct AlbaidString {
    /// scanGuide
    static let contractGuide = "근로계약서를 등록해 주세요"
    static let cameraGuide = "이렇게 찍어주세요!"
    static let cameraGuideDetail = """
                                    ·  카메라 영역에 맞춰주세요.
                                    ·  초점을 잘 맞춰주세요.
                                    ·  어두운 배경에서 빛반사 없이 찍어 주세요.
                                   """
    /// scanLoading
    static let scanLoading = "근로계약서 스캔 중"
    
    /// scanResult
    static let scanResult = """
                            근로계약서를 스캔했어요
                            내용을 확인해 주세요
                            """
    static let safety = """
                        주요 근로 조건들이 명시되어 있는 안전한
                        근로 계약서예요.
                        """

    /// scan complete
    static let completeGuide = """
                               근로계약서는 최대 3개까지
                               알바 카드에 자동으로 등록돼요.
                               """


    /// scan memo
    static let memoGuide = """
                            최대 50자까지 입력 가능한
                            나만 볼 수 있는 메모에요.
                            """
}
