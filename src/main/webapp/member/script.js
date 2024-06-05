//유효성 검사 (validatuon check)
function check_ok(){
//	DOM구조 ->html document~
//	폼 이름에 name 값으로 찾아감  //alert 경고문 출력
//	if(document.reg_frm.mem_uid.value==""){
//	document생략
//	if(reg_frm.mem_uid.value==""){
//	value=="" 대신 value.length==0 로도 가능하다
	if(reg_frm.mem_uid.value.length==0){
		alert("아이디를 입력해주세요");
//		document.reg_frm.mem_uid.focus();
		reg_frm.mem_uid.focus();
		return;
	}
	if(reg_frm.mem_uid.value.length<4){
		alert("아이디는 4글자 이상이여야 합니다.");
		reg_frm.mem_uid.focus();
		return;
	}
	if(reg_frm.mem_pw.value.length==0){
		alert("비밀번호를 입력해주세요");
		reg_frm.mem_pw.focus();
		return;
	}
	if(reg_frm.mem_pw.value.length<1){
		alert("비밀번호는 1글자 이상이여야 합니다.");
		reg_frm.mem_pw.focus();
		return;
	}
	if(reg_frm.mem_pw.value!=reg_frm.pw_check.value){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pw_check.focus();
		return;
	}
	if(reg_frm.mem_name.value.length==0){
		alert("이름을 입력해주세요");
		reg_frm.mem_name.focus();
		return;
	}
	if(reg_frm.mem_email.value.length==0){
		alert("이메일을 입력해주세요");
		reg_frm.mem_email.focus();
		return;
	}
	if(reg_frm.mem_addr.value.length==0){
		alert("주소를 입력해주세요");
		reg_frm.mem_addr.focus();
		return;
	}
//	폼이름이 reg_frm 에서 action 속성의 파일을 호출
	reg_frm.submit();
}
function update_check_ok(){
	if(upd_frm.mem_pw.value.length==0){
		alert("패스워드를 써주세요.");
		upd_frm.mem_pw.focus();
		return;
	}
	if(upd_frm.mem_pw.value != upd_frm.pw_check.value){
		alert("패스워드가 일치하지 않습니다.");
		upd_frm.pw_check.focus();
		return;
	}
	if(upd_frm.mem_email.value.length==0){
		alert("E-mail을 써주세요.");
		upd_frm.mem_email.focus();
		return;
	}
	upd_frm.submit();
}






