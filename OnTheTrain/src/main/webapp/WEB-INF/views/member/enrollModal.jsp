<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>


<div id="modal1" class="modal">
    <div class="modal-backdrop" id="modal-backdrop1"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">약관상세</div>
            </div>
            <div class="modal-body">
                <h1>온더트레인 이용약관 안내(필수)</h1>
                <pre>

제1조(목적)
이 약관은 온더트레인(이하 “회사”라 합니다)의 회원가입 및 이용에 관한 약관(이하 “약관”이라 합니다)으로 회원으로 가입하고자 하는 사람(이하 “회원”이라 합니다)과
회사 간의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

제2조(약관의 적용)
① 이 약관은 회원의 열차이용 및 회사에서 제공하는 부가서비스 등에 적용하며 이 약관에서 정하지 않은 사항은 회사의 여객운송약관 및 관련 규정을 적용합니다.
② 회사의 회원과 제휴사간의 개별적인 계약조건은 회사와 무관합니다.
③ 회사와 제휴사간에 체결된 서비스는 제휴 계약조건 혹은 제휴사 사정에 따라 사전 통보 없이 변경되거나 중단될 수 있습니다.
④ 회원이 회원혜택을 제공받기 위하여 제휴사를 이용할 경우 해당 제휴사의 규정을 따라야 하며, 제휴사 이용과정에서 발생할 수 있는 회원의 피해에 대하여 회사는 책임이 없습니다.

제3조(정의)
이 약관에서 사용하는 용어의 정의는 다음과 같으며, 이 조항에서 정하는 것을 제외하고는 관계 법령 및 서비스별 안내에서 정하는 바에 의합니다.
    1. “회원”이란 열차이용, 여행상품 등 회사가 제공하는 서비스를 이용하기 위하여 회사의 홈페이지 또는 모바일 앱에서 이용계약을 체결한 사람을 말합니다.
    2. “서비스”라 함은 회원이 PC, 이동전화 등 각종 유무선 기기 또는 역창구를 통하여 이용할 수 있는 회사가 제공하는 모든 서비스를 말합니다.
    3. “디지털회원증”이라 함은 회원으로 가입한 사람에게 회사가 제공하는 서비스를 이용할 수 있도록 고유번호를 부여하여 발행한 디지털카드(홈페이지 및 모바일 앱에서 확인)를 말합니다.
    4. “회원등급”이라 함은 회사가 회원의 열차이용실적을 평가하여 회원혜택을 제공하기 위하여 BRONZE회원, SILVER회원, GOLD회원, VIP회원으로 구분하는 것을 말합니다.
    5. “운임할인쿠폰”이라 함은 회사가 회원에게 열차운임할인혜택을 제공하기 위하여 발행한 전자할인쿠폰을 말합니다.
    6. “좌석승급쿠폰”이라 함은 회사가 회원에게 열차좌석승급혜택을 제공하기 위하여 발행한 전자승급쿠폰을 말합니다.
    
제4조(회원가입)
① 누구나 홈페이지 또는 스마트폰 앱을 통해 회사의 회원으로 가입할 수 있습니다.
② 회원으로 가입하고자 하는 사람은 홈페이지 또는 스마트폰 앱에서 다음 각 호에 정한 사항을 등록하고 회원가입 동의와 확인버튼을 누름으로서 회원가입이 완료됩니다.
    1. 아이디 (필수사항)
    2. 비밀번호 (필수사항)
    3. 닉네임 (필수사항)
    4. 이름 (필수사항)
    5. 생년월일 (필수사항)
    6. 이메일 (필수사항)
    7. 휴대전화번호 (필수사항)
    8. 기타 회원관리에 필요한 사항(본인확인정보(DI), 스마트기기 고유식별번호(MAC주소, IMEI, UUID)) (필수사항)
제5조(회원정보보호)
회원의 개인정보보호에 대한 상세한 내용은 회사 웹사이트 (http://localhost:8088/onthetrain/)상의 개인정보취급방침에서 정하는 바에 따릅니다.

제6조(회원혜택)
① 회사는 회원의 열차이용실적에 따라 운임할인쿠폰 또는 좌석승급쿠폰 등을 제공할 수 있습니다.
② 운임할인쿠폰은 운임에만 할인이 적용(요금 제외)되며 최저운임이하로는 할인이 적용되지 않습니다.
③ 좌석승급쿠폰은 일반실운임으로 특실을 이용 하실 수 있습니다.
④ 운임할인쿠폰과 좌석승급쿠폰의 유효기간은 쿠폰에서 확인할 수 있으며 홈페이지 및 모바일 앱 에서만 사용할 수 있습니다.
⑤ 회원의 등급별 열차이용실적 산정기준, 회원혜택, 운임할인쿠폰의 종류별 할인율은 역에 따로 게시하거나 인터넷 등에 게재합니다.
⑥ 회사는 회원의 이용실적산정이 잘못된 경우에는 이를 임의로 정정할 수 있으며 부당한 방법에 의해 적립된 실적은 인정하지 않습니다.
⑦ 회원의 이용실적 산정은 이용을 완료한 승차권의 전체 구입금액 중에서 온라인(홈페이지 및 모바일 앱)으로 결제한 금액만을 반영합니다.
    다만, 다음 각 호의 경우에는 온라인으로 결제한 경우에도 이용실적 산정에서 제외합니다.
    1. 승차일이 설, 추석 수송 기간 중에 해당하는 승차권
    2. 정기권ㆍ단체승차권, 입장권, 회수승차권, 여행상품으로 판매하는 승차권
    3. ㈜onthetrain과 별도 운송계약을 체결하고 운임을 후급으로 지급하는 승차권
    4. 승차권과 연계하여 판매하는 패키지 상품 등의 요금
⑧ 쿠폰의 사용은 1개의 좌석 당 1회에 한 합니다.

제7조(회원정보 이용)
회사는 회원의 사전 동의를 받고 제4조 제2항의 회원 정보를 공동사업자 또는 제휴사업자 등 제3자에게 제공할 수 있습니다. 다만, 각 호에 정한 경우는 사전 동의를 받지 않을 수 있습니다.
    1. 관련 법령에 특별한 규정이 있는 경우
    2. 범죄에 대한 수사상의 목적으로 국가기관의 요구가 있는 경우
    3. 방송통신심의위원회의 요청이 있는 경우
    4. 특정 개인을 식별할 수 없는 통계작성, 홍보자료, 학술연구 등의 목적으로 요청이 있는 경우
    5. 기타 회원서비스 제공 등 제휴 사업을 수행하는 경우
    
제8조(회원정보 변경)
① 회원은 회원가입 시 기재한 사항이 변경된 경우에 인터넷 또는 통신매체를 이용하여 이를 수정하거나 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다.
② 회사는 회원이 변경사항을 알리지 아니하여 발생한 손해에 대하여 책임을 지지 않습니다.
③ 회원은 홈페이지 또는 모바일 앱의 회원정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.

제9조(탈퇴)
① 탈퇴하고자 하는 회원은 홈페이지 또는 모바일 앱의 회원정보 변경에서 탈퇴를 신청할 수 있습니다.
② 제1항의 경우에 발권한 승차권이 있는 경우에는 이용을 완료한 후, 또는 발권한 승차권을 환불하신 후에 탈퇴 신청을 하셔야 합니다.
③ 제1항에 따라 회원이 탈퇴하는 경우 회사는 제6조에 정한 회원혜택을 제공하지 않습니다.
④ 회원이 탈퇴를 신청할 경우 회사는 관련법 및 회사의 개인정보처리방침에 따라 회사가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터를 소멸 합니다.

제10조(자격상실 및 서비스 이용제한)
① 회사는 회원이 다음 각 호에 해당하는 경우에는 탈퇴 조치시킬 수 있습니다.
    1. 회원가입 정보를 허위로 작성하는 등 서비스의 건전한 이용을 저해하는 행위
    2. 다른 사람의 회원번호 및 비밀번호를 도용한 행위
    3. 이중으로 등록한 경우
    4. 기타 관계법령이나 회사가 정한 약관을 위반한 경우 또는 회원으로서 자격을 지속시키는 것이 부적절하다고 회사가 판단하는 경우
② 회원이 사망한 경우에는 제9조 및 제1항에 정한 절차 없이 회원 자격을 상실(또는 탈퇴)한 것으로 간주합니다.
③ 제1항에 따라 회원(또는 제3자)에게 발생하는 손해는 회사가 책임을 부담하지 아니합니다.
④ 제1항에 정한 사유로 회원 자격을 상실한 경우 회사는 제6조에 정한 회원 이용실적을 무효로 하고 이를 삭제합니다.

제11조(정보제공 및 안내 등)
① 회사는 변경된 영업제도 안내, 각종 여행상품, 서비스 이용방법, 여행정보 등 다양한 서비스를 회원에게 전자우편, 휴대전화 메세지, 그 밖의 방법으로 제공할 수 있습니다.
② 회사는 회원 전체에게 통지 또는 공지할 필요가 있는 사항에 대하여 홈페이지에 1주일 이상 게재함으로서 이를 대신할 수 있습니다.

제12조 (책임 등)
① 회원은 회원번호(아이디를 별도로 부여할 경우 아이디 포함)와 비밀번호에 관한 관리책임이 있습니다.
② 회사는 제4조에 정한 정보관리를 회원담당 책임자(업무 위탁시 해당 업체 회원 담당자)로 한정하며 정보의 분실, 도난, 유출, 변조 등에 대한 책임을 부담합니다.
③ 회사는 회원정보·운영 등 회원관리에 관한 업무 중 일부를 위탁·운영할 수 있습니다. 이 경우 회사는 개인정보가 외부로 유출되지 않도록 하여야 합니다.
④ 회사는 회원의 고의 또는 과실로 인하여 발생한 손해에 대하여 책임을 부담하지 아니합니다.

부칙
이 약관은 2023.04.28일부터 시행한다.
</pre>
            </div>
            <div class="modal-footer">
                <button class="cancel-button" id="cancel-button1">확인</button>
            </div>
        </div>
    </div>
</div>

<div id="modal2" class="modal">
    <div class="modal-backdrop" id="modal-backdrop2"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">약관상세</div>
            </div>
            <div class="modal-body">
                <h1>회원의 개인정보 수집 및 이용에 대한<br>동의 사항(필수)</h1>
                <pre>
온더트레인은 온더트레인 회원가입 및 승차권 예약발매와 숙소예약을 위하여 아래와 같이 개인정보를 수집·이용하고자 합니다. 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.

1. 수집하는 개인정보의 항목
가. 회원가입
(1) 필수항목 : 아이디(ID), 비밀번호, 성명, 생년월일, 휴대전화번호, 이메일주소
(2) 선택항목 : 주소
나. 기타 홈페이지 이용
(1) 결제 : 성명, 휴대전화번호, 신용카드번호, 생년월일, 계좌번호, 카드번호, 유효기간, 승인번호 등
(2) 환불 : 계좌번호, 은행명, 승인번호 
다. 자동으로 생성되는 개인정보
서비스 이용과정이나 정보처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 등

2. 개인정보의 수집·이용목적
가. 온더트레인 예약발매 서비스 회원가입 및 정보 안내
회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달
나. 온더트레인 승차권・숙박 예약・결제 및 처리 안내
보너스 예약 및 발권, 우수회원 자격 부여 및 심사, 고객 맞춤형 서비스 제공, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금결제, 요금추심

3. 개인정보의 보유 목적 및 이용 기간
이용자의 동의 하에 수집된 개인정보는 이용자가 대한항공 인터넷 웹사이트상의 서비스를 이용하는 동안 보유· 및 이용됩니다.

당사는 아래와 같이 개인정보의 수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다.

가. 회원가입 정보의 경우
회원 탈퇴 요청이 있거나 회원 자격을 상실한 때

나. 설문조사, 이벤트 등 일시적 목적을 위하여 회원가입 시 수집하지 않았던 개인정보를 추가로 수집한 경우
당해 설문조사, 이벤트 등이 종료한 때

다. 사업을 폐지하는 경우

라. 기타 관련 법률에 의해 정해진 경우
다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다.
(1) 계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록
- 보존 사유 : 전자상거래 등에서의 소비자 보호에 관한 법률
- 보존 기간 : 5년

(2) 소비자의 불만 또는 분쟁 처리 기록
- 보존 사유 : 전자상거래 등에서의 소비자 보호에 관한 법률
- 보존 기간 : 3년
	
(3) 본인확인에 관한 기록
- 보존 사유 : 정보통신망 이용촉진 및 정보보호 등에 관한 법률
- 보존 기간 : 6개월

(4) 홈페이지 방문에 관한 기록
- 보존 사유 : 통신비밀보호법
- 보존 기간 : 3개월

4. 개인정보의 수집 및 이용에 대한 동의 거부 관련
이용자는 개인정보의 수집 및 이용 동의에 거부하실 수 있으며, 필수항목의 수집 및 이용에 동의하지 않으시는 경우 회원가입이 제한됩니다.
</pre>
            </div>
            <div class="modal-footer">
                <button class="cancel-button" id="cancel-button2">확인</button>
            </div>
        </div>
    </div>
</div>
<div id="modal3" class="modal">
    <div class="modal-backdrop" id="modal-backdrop3"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">약관상세</div>
            </div>
            <div class="modal-body">
                <h1>위치기반서비스 이용약관(선택)</h1>
                <pre>
제 1 조 (목적)
본 약관은 온더트레인(이하 “회사”)가 제공하는 위치기반서비스 약관에 부합하여 관련서비스 제공하는 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (이용약관의 효력 및 변경)
본 약관은 서비스를 이용하는 고객 또는 개인위치정보주체가 본 약관에서 정의하는 회사의 서비스에 절차에 따라 동의함으로써 효력이 발생합니다.
이용자는 서비스의 동의 요청에 따라서 지정한 “동의” 선택 및 위치정보 조회에 대한 문자를 수신하였을 경우 이용자가 위치 정보와 관련된 내용을 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.
회사는 위치정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자기본법, 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 공지만을 하고, 개정 내용이 이용자에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 이용자에게 음성 또는 전자적 형태(SMS 등)로 약관 개정 사실을 발송하여 고지합니다.
회사가 전항에 따라 이용자에게 통지하면서 공지 또는 고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이용약관에 승인한 것으로 봅니다.

제 3 조 (관계법령의 적용)
본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.

제 4조 (서비스의 내용)
회사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
   - 여행정보 서비스 제공
   :개인위치정보주체 또는 이동성이 있는 기기의 위치정보를 제공 시 위치정보를 이용한 여행정보, 이벤트 등 다양한 편의 서비스를 제공합니다.
회사는 만 14세 이상의 회원에 대해서만 개인위치정보를 이용한 위치기반서비스를 제공합니다.

제 5 조 (서비스 이용요금)
    회사가 제공하는 서비스는 기본적으로 무료입니다.

제 6 조 (서비스 내용 변경 통지 등)
회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 이용자의 유입 전화번호로 문자를 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.
1 항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 등 기타 회사의 공지사항을 통하여 이용자들에게 통지할 수 있습니다.

제 7 조 (서비스이용의 제한 및 중지)
회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 이용자의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
이용자가 회사 서비스의 운영을 고의 또는 중과실로 방해한 경우
서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우
전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우
국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때
기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우
회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 이용자에게 알려야 합니다.

제 8 조 (개인위치정보의 이용 또는 제공)
회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.
단, “회사”는 영업방침에 따라 본 이용약관 제4조의 “서비스”의 제공을 중단할 수 있으며, “서비스” 중단기간 동안에는 본 이용약관의 동의를 득하였더라도 위치정보를 수집하지 않고 “서비스” 재개 시 수집 및 이용합니다.
이용자 및 법정대리인의 권리와 그 행사방법은 제소 당시 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
이용자가 서비스를 이용 시 즉시 문자로 서비스 내용을 통보하고 위치 정보를 즉시 자동 삭제 합니다.
회사는 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우에는 개인정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.
개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
회원이 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우

제 9 조 (개인위치정보의 보유)
"회사"는 위치정보보호법 제16조 제2항을 근거로 개인위치정보를 보유하며 서비스를 제공하고자 할 경우 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.
"회사"는 개인위치정보의 이용 즉시 파기하며, 이용목적 범위 이외의 제3자에게 제공하지 않습니다.
"회사"는 이용 고객과의 민원처리를 위해 위치정보 이용사실 확인자료를 자동 기록ㆍ보존하며 해당 자료는 1년간 보관합니다. 단 관계법령의 규정에 의하여 보존할 필요성이 있는 경우에는 관계법령에 따라 보존합니다.

제 10 조 (위치정보관리책임자의 지정)
"회사"는 개인위치정보주체의 위치정보를 보호하고 위치정보와 관련한 개인위치정보주체의 불만사항을 처리하기 위하여 위치정보관리책임자와 위치정보보호관리자를 지정합니다.

소 속 : 온더트레인 개발팀
책임자 : 개인정보보호책임자 겸직
연락처 : 7788-7788
팩스 : 7788-7788

제 11 조 (개인위치정보주체의 권리 등)
개인위치정보주체는 개인위치정보의 수집, 이용 및 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
개인위치정보주체는 언제든지 개인위치정보의 수집, 이용 및 제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 "회사"는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있어야 합니다.
개인위치정보주체는 “회사”에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 “회사”는 정당한 사유 없이 이용자의 요구를 거절할 수 없습니다.
본인에 대한 위치정보 수집, 이용 사실 확인자료
본인의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용
개인위치정보주체는 제1항 내지 제3항의 권리 행사를 위해 “회사”에 소정의 절차를 통해 요구할 수 있습니다.

제 12 조 (손해배상)
회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위로 이용자에게 손해가 발생한 경우 이용자는 회사에 대하여 손해배상 청구를 할 수 있습니다. 이 경우 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.
이용자가 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 이용자에 대하여 손해배상을 청구할 수 있습니다. 이 경우 이용자는, 고의 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.

제 13 조 (면책)
회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 이용자에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우
서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제3자의 고의적인 서비스 방해가 있는 경우
이용자의 귀책사유로 서비스 이용에 장애가 있는 경우
제1호 내지 제3호를 제외한 기타 회사의 고의 ㆍ 과실이 없는 사유로 인한 경우
회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.

제 14 조 (규정의 준용)
약관에 명시되지 않은 사항에 대해서는 위치정보보호법 등의 관계법령과 회사의 이용약관, 개인정보취급방침 및 회사가 별도로 정한 지침 등을 따릅니다.

제 15 조 (분쟁의 조정 및 기타)
회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의 보호 및 이용 등에 관한 법률 제 28조의 규정에 의한 방송통신위원회에 재정을 신청할 수 있습니다.
회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보 보호법 제 43조의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.

제 16 조 (회사의 연락처)
회사의 상호 및 주소 등은 다음과 같습니다.

상 호 : 온더트레인
주 소 : 서울특별시 강남구 강남구 테헤란로14길 6‎
대표전화 : 7788-7788

[부칙]
제1조 (시행일) 이 약관은 2023년 04월 28일부터 시행한다.</pre>
            </div>
            <div class="modal-footer">
                <button class="cancel-button" id="cancel-button3">확인</button>
            </div>
        </div>
    </div>
</div>
<div id="modal4" class="modal">
    <div class="modal-backdrop" id="modal-backdrop4"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">약관상세</div>
            </div>
            <div class="modal-body">
                <h1>마케팅 및 광고 활용 동의(선택)</h1>
                <pre>
온더트레인에서 제공하는 이벤트 및 서비스(제휴서비스 포함) 안내 등 광고성 정보를 받으시려면 마케팅 목적 이용에 동의하여 주시기 바랍니다

이용 범위
당사 및 제휴사 상품 안내, 이벤트 등 광고성 정보 전달 및 참여기회 제공, 여행 맞춤 서비스 및 정보제공, 회원 대상 각종 마케팅 활동

고객님께서는 마케팅 활용 동의를 거부할 권리가 있습니다.
이 경우, 서비스 및 정보제공이 일부 제한 될 수 있으며 승차권서비스, 여행서비스 이용에는 영향이 없습니다.
</pre>
            </div>
            <div class="modal-footer">
                <button class="cancel-button" id="cancel-button4">확인</button>
            </div>
        </div>
    </div>
</div>