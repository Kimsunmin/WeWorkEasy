// my list 드래그 드롭기능
let taskId;
function onDragStart(data,event){
	event.dataTransfer.setData('text/plain',event.target.id);
	event.currentTarget.style.backgroundColor = 'gray';
	taskId = data.childNodes[0].innerHTML
	console.log(taskId);
}
        	
function onDragOver(event){
	event.preventDefault();
}
        	
function onDrop(event){
	const id = event.dataTransfer.getData('text');
	const draggableElement = document.getElementById(id);
	const dropzone = event.target;   
	
	const state = dropzone.parentNode.childNodes[5].id;
    
	//console.dir(event);
	dropzone.appendChild(draggableElement);
	/*document.querySelectorAll('#taskName').forEach((e,i)=>{
		if()
			alert(e.innerHTML)
			
	});*/
	
    updateState(state);
    //드롭 완료 후 이벤트 버블링을 막기 위해 호출           
    event.stopPropagation();
 		
    event.dataTransfer.clearData();
}

//state값을 보내서 상태값 변경
let updateState = (state)=>{
	
	
	const url = "/task/updatestate"
	let paramObj = new Object();
	paramObj.state = state;
	paramObj.taskId = taskId;
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
		if(msg=='success'){
			console.dir('수정완료');
		}else{
			console.dir('수정실패');
		}
	}).catch(error=>{
		error.alertMessage();
	});
}