//
//  StringLiteral.swift
//  Albaid
//
//  Created by 박지윤 on 9/28/24.
//

struct AlbaidString {
    /// onboarding
    static let onboardingTitle1 = "근로계약서를 찍어볼까요?"
    static let onboardingTitle2 = "월급 책정과 근무 관리를 한번에!"
    static let onboardingTitle3 = "내 알바 관리는 알바에이드에서!"
    static let onboardingContent1 = """
                                    스캔한 계약서의 정보 요약과 함께
                                    안전한 계약서인지 간편하게 알려줘요
                                    """
    static let onboardingContent2 = """
                                    근로계약서를 등록하면 이번 달 월급 책정과
                                    전용 캘린더에 근무 일자가 나와요
                                    """
    static let onboardingContent3 = """
                                    등록된 근로계약서를 나만의 이력서에
                                    보관할 수 있어요
                                    """

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
    static let danger = "근로기준법 위반이 의심돼요!"

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

    static let dummyNoti = """
                           알바에이드 가입을 환영합니다!

                           나한테 맞춘 알바 관리,
                           원클릭으로 알바에이드에서 시작해 보세요!
                           """

    /// url
    static let dangerDetail = "https://www.moel.go.kr/mainpop2.do"
}
