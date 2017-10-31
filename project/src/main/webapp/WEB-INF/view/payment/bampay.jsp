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
			$.ajax({
				url: "complete",
				type: 'POST',
				dataType: 'json',
				data:{
					imp_amount : rsp.paid_amount,
					imp_tid : rsp.pg_tid,
					imp_time : rsp.paid_at,
					imp_method : rsp.pay_method
				},
			}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( $.trim(data) == 1 ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			alert(msg);
	    			window.open('', '_self').close();
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
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