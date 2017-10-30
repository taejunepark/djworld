<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp28107780'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	var result = false;
	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원.
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : 'DJWorld 밤 구매',
		amount : '${money}',
		buyer_email : '${email}',
		buyer_name : '${name}',
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			result = true;
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
		if(result){
			window.open('', '_self').close();
		}
	});
</script>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
</body>
</html>