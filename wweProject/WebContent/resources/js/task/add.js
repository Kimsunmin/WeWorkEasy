
//업무 수정 모달을 띄워주는 함수
let addTask = () => {
	$('#task_add_modal').show();
}
	

// 업무 수정 모달을 닫는 함수
$('#btn_add_close').click(function(e) {

	$('#task_add_modal').hide();
});

//업무를 수정하는 함수
let add = () => {
	let addTask = document.querySelector('#task_content').value;
	addTask = addTask.replace(/(?:\r\n|\r|\n)/g, '<br>');

	let addTaskId = document.querySelector('#task_id').value;
	let addDeadLine = document.querySelector('#dead_Line').value;
	
	if (addTask!="" && addTaskId!="" && addDeadLine!= "") {
		let today = new Date();
		let year = today.getFullYear();
		let month = ("0" + (1 + today.getMonth())).slice(-2);
		let day = ("0" + today.getDate()).slice(-2);


		today = new Date(year, month - 1, day);
		let tempArr = addDeadLine.split('-');
		let modDate = new Date(tempArr[0], tempArr[1] - 1, tempArr[2]);
		let betweenDay = (modDate.getTime() - today.getTime()) / 1000 / 60 / 60 / 24;

		if (betweenDay < 0) {
			alert("이전 날짜는 선택할 수 없습니다.");
		} else {
			let url = "/task/addimpl"
			let paramObj = new Object();
			paramObj.taskId = addTaskId;
			paramObj.deadLine = addDeadLine;
			paramObj.taskContent = addTask;

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
				if (msg) {
					alert('업무를 추가했습니다.');
					$('#task_add_modal').hide();
					location.reload();

				}else{
					console.dir('실패');
				}
			})
		}
	}else{
		alert("정보를 정확히 입력해주세요.");
	}

}

