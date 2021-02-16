let curTidx;
let taskId;
//업무 수정 모달을 띄워주는 함수
let modifyTask = () => {
	$('#task_content_modal').show();
	taskId = document.querySelector('#taskId').innerHTML;
	let content = document.querySelector('#taskContent').innerHTML;
	let taskOwner = document.querySelector('#taskOwner').innerHTML;
	content = content.replace(/<br>|<br\/>|<br \/>/g,'\r\n');
	let curDeadLine = document.querySelector('#deadLine').innerHTML;
	document.querySelector('#task_owner').value = taskOwner;
	document.querySelector('#task_id').value = taskId;
	document.querySelector('#modified_content').value = content;
	document.querySelector('#dead_Line').value = curDeadLine;
	//원래 디테일에 있던 값을 읽어온다.

}

// 업무 수정 모달을 닫는 함수
$('#btn_modify_close').click(function(e) {
	$('#modified_content').val(" ");
	$('#dead_Line').val(" ");
	$('#task_content_modal').hide();
});

//업무를 수정하는 함수
let modify = () => {
	//업수 수정내용을 비동기로 자바에 넘겨주기
	let modTask = document.querySelector('#modified_content').value;
	modTask = modTask.replace(/(?:\r\n|\r|\n)/g, '<br>');

	let modTaskUser = document.querySelector('#task_owner').value;
	let modTaskId = document.querySelector('#task_id').value;
	let modDeadLine = document.querySelector('#dead_Line').value;
	if (modTask!="" && modTaskUser!="" && modTaskId!="" && modDeadLine!="") {
		let today = new Date();
		let year = today.getFullYear();
		let month = ("0" + (1 + today.getMonth())).slice(-2);
		let day = ("0" + today.getDate()).slice(-2);


		today = new Date(year, month - 1, day);
		let tempArr = modDeadLine.split('-');
		let modDate = new Date(tempArr[0], tempArr[1] - 1, tempArr[2]);
		let betweenDay = (modDate.getTime() - today.getTime()) / 1000 / 60 / 60 / 24;

		if (betweenDay < 0) {
			alert("변경할 수 없는 날짜입니다.");
		} else {
			let url = "/task/updatetask"
			let paramObj = new Object();
			paramObj.modTaskUser = modTaskUser;
			paramObj.taskId = modTaskId;
			paramObj.deadLine = modDeadLine;
			paramObj.modifiedContent = modTask;
			paramObj.btaskId = taskId;

			let headerObj = new Headers();
			headerObj.append("content-type", "application/x-www-form-urlencoded");

			fetch(url, {
				method: "POST",
				headers: headerObj,
				body: "data=" + JSON.stringify(paramObj)
			}).then(response => {
				if (response.ok) {
					return response.text();
				} else {
					throw new AsyncPageError(response.text());
				}
			}).then(msg => {
				if (msg == 'success') {
					alert('업무를 수정했습니다.');
					$('#task_content_modal').hide();
					location.reload();

				} 
			})
		}
	}else{
		alert("정보를 정확히 입력해주세요.");
	}

}

let chkInvalidUser = () => {
	let userId = document.
		querySelector('#task_owner').value;
	let headerObj = new Headers();
	headerObj.append('content-type', 'application/x-www-form-urlencoded');
	if (userId) {
		fetch("/leader/chkuser?userId=" + userId, {
			method: "GET",
			headers: headerObj
		}).then(response => {
			if (response.ok) {
				return response.text();
			}
			throw new AsyncPageError(response.text());
		}).then((msg) => {
			if (msg == 'success') {
				modify();
			} else {
				alert('유효하지 않은 아이디입니다.');
			}
		}).catch(error => {
			error.alertMessage();
		});
	}
}
