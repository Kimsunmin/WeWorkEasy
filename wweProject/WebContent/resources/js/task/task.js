let feedBack = ()=>{
	
	const url = "/task/insertfeedback"
	let paramObj = new Object();
	paramObj.taskId = document.querySelector('#taskId').innerHTML;
	paramObj.tIdx = document.querySelector('#tIdx').innerHTML;
	paramObj.feedbackComment = document.getElementById('feedbackComment').value;

	let headerObj = new Headers();
	headerObj.append('content-type','application/x-www-form-urlencoded');
	
	fetch(url,{
		method : "POST",
		headers : headerObj,
		body : "data="+JSON.stringify(paramObj)
	}).then(response=>{
		if(response.ok){
			return response.text();
		}else{
			throw new AsyncPageError(response.text());
		}
	}).then(msg =>{
		if(msg){
			console.dir('완료');
			document.getElementById('feedbackComment').value=" ";

			let jsonData = JSON.parse(msg);
			
			let nameDiv = document.createElement('div');
			let commentDiv = document.createElement('div');
			let delDiv = document.createElement('a');
			let totalDiv = document.createElement('div');
			
			nameDiv.setAttribute('class','form-control form-control-user nameDiv bg-light col-sm-2 mr-2 border-0');
			commentDiv.setAttribute('class','form-control form-control-user bg-light border-0');
			delDiv.setAttribute('class','far fa-trash-alt pt-2 text-gray-500');
			delDiv.setAttribute('href','#');
			delDiv.setAttribute('onclick','deleteFeed(this);');
			totalDiv.setAttribute('class','d-flex justify-content-between');
			
			nameDiv.innerHTML += jsonData.userId;
			commentDiv.innerHTML += jsonData.feedbackComment;

			totalDiv.appendChild(nameDiv);
			totalDiv.appendChild(commentDiv);
			totalDiv.appendChild(delDiv);
			document.querySelector('.commentList').after(totalDiv);

			
			
		}else{
			console.dir('실패');
		}
	})
}

let deleteFeed = (data) =>{
	
	let isDel = '1';
	let tIdx = document.querySelector('#tIdx').innerHTML;
	let feedbackComment = data.parentNode.childNodes[3].innerHTML;
	
	const url = "/task/updatefeedback"
	let paramObj = new Object();
	paramObj.tIdx = tIdx;
	paramObj.isDel = isDel;
	paramObj.feedbackComment = feedbackComment;

	let headerObj = new Headers();
	headerObj.append('content-type','application/x-www-form-urlencoded');
	
	fetch(url,{
		method : "POST",
		headers : headerObj,
		body : "data="+JSON.stringify(paramObj)
	}).then(response=>{
		if(response.ok){
			return response.text();
		}
	}).then(msg =>{
		if(msg){
			location.reload();
			
		}else{
			console.dir('실패');
		}
	})
}