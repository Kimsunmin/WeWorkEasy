/*
	total_task.jsp파일에서 사용하는 js파일
*/

let isChk = $('#wholeChk').data('chk');
let pageIdx = 1;
let pageCycle = 3;
let menu = '업무명';	
let jsonData = 0;

//전체선택 클릭 시
function wohleCheck(){
   if($('#wholeChk').data('chk')==false){
           $('input[name=_selected_').prop('checked',true);
            $('#wholeChk').data('chk',true);
       }else{
           $('input[name=_selected_').prop('checked',false);
            $('#wholeChk').data('chk',false);
       }
   }

//페이지 번호 클릭 시
$(document).on('click','#btn_page',function(event){
	let wrapBtnPages =document.querySelectorAll('#wrap_btn_page');
	wrapBtnPages.forEach((e,i)=>{
		if(e.childNodes[0].getAttribute('idx')==event.target.getAttribute('idx')){
			e.className = "paginate_button page-item previous active";
			pageIdx = parseInt(event.target.getAttribute('idx'));
			console.log(pageIdx+"번 클릭!");
			
			document.querySelector('tbody').innerHTML="";
			if(jsonData==0){
				selectTaskList("");
			}else{
				selectTaskList(jsonData);
			}
		}else{
			e.className = "paginate_button page-item previous";
		}
	});
	reroadChk();	
});

//다음버튼 클릭 시
let nextBtnClick =(totalPageCount)=>{
	console.log("다음버튼 클릭!")
	if(pageIdx!=totalPageCount){
		let lastPage;
		document.querySelectorAll('#btn_page').forEach((e,i)=>{
		lastPage = e.getAttribute('idx');
	});
	if(pageIdx<lastPage){
		console.log("마지막 번호가 아닙니다.")
		pageIdx++;
		document.querySelectorAll('#wrap_btn_page').forEach((e,i)=>{
			if(e.childNodes[0].getAttribute('idx')==pageIdx){
				e.className = "paginate_button page-item previous active";
			}else{
				e.className = "paginate_button page-item previous";
			}
			document.querySelector('tbody').innerHTML="";
			if(jsonData==0){
				selectTaskList("");
			}else{
				selectTaskList(jsonData);
			}
		});
	
	}else if(pageIdx==lastPage){
		
		console.log("다음페이지로 이동!");
		pageCycle = pageIdx +  3 <= totalPageCount ? pageIdx +  3 : totalPageCount;
		pageIdx++;
		document.querySelector('#paging_ui').innerHTML = "";
		console.log("현재 번호는 : "+ pageIdx+" 번 입니다.");
		console.log("전체 페이지 수는 : "+totalPageCount+" 입니다.");
		console.log("현재 사이클은 : "+pageCycle+" 입니다.");
		if(jsonData==0){
			doPaging("");
		}else{
			doPaging(jsonData.length);
		}
		document.querySelectorAll('#wrap_btn_page').forEach((e,i)=>{
			if(e.childNodes[0].getAttribute('idx')==pageIdx){
				e.className = "paginate_button page-item previous active";
			}else{
				e.className = "paginate_button page-item previous";
			}
			document.querySelector('tbody').innerHTML="";
				if(jsonData==0){
					selectTaskList("");
				}else{
					selectTaskList(jsonData);
				}
			});
		}
		reroadChk();
	}
	
}
//이전버튼 클릭 시
let prevBtnClick = (totalPageCount)=>{
		if(pageIdx!=1){
			let firstPage;
			document.querySelectorAll('#btn_page').forEach((e,i)=>{
				if(i==0){
					firstPage = e.getAttribute('idx');
					return false;
				}
			
			});
			console.log("first : "+firstPage);
			
			if(pageIdx!=firstPage){
				pageIdx--;
				document.querySelectorAll('#wrap_btn_page').forEach((e,i)=>{
				if(e.childNodes[0].getAttribute('idx')==pageIdx){
					e.className = "paginate_button page-item previous active";
				}else{
					e.className = "paginate_button page-item previous";
				}
				document.querySelector('tbody').innerHTML="";
				if(jsonData==0){
					selectTaskList("");
						}else{
							selectTaskList(jsonData);
						}
					});
			}else if(pageIdx==firstPage){
				pageIdx = pageIdx - 3;
				pageCycle = pageIdx + 2;
				document.querySelector('#paging_ui').innerHTML = "";
				if(jsonData==0){
					doPaging("");
				}else{
					doPaging(jsonData.length);
				}
				document.querySelectorAll('#wrap_btn_page').forEach((e,i)=>{
				if(e.childNodes[0].getAttribute('idx')==pageIdx+2){
					e.className = "paginate_button page-item previous active";
					pageIdx = pageIdx+2;
				}else{
					e.className = "paginate_button page-item previous";
				}
				document.querySelector('tbody').innerHTML="";
				if(jsonData==0){
					selectTaskList("");
					}else{
						selectTaskList(jsonData);
					}
				});
			}
		}
		reroadChk();
	}

//업무목록을 검색
let searchtask = ()=>{
	//페이지 사이클 초기화
	//pageCycle = 3;
	let word = document.querySelector('#inp_word').value;
	let url;
	console.log(menu)
	if(menu=='업무명'){
		url = "/leader/searchbytask";
	}else if(menu=='아이디'){
		url = "/leader/searchbyid";
	}
	let paramObj = new Object();
	paramObj.word = word;
	let headerObj = new Headers();
	headerObj.append('content-type','application/x-www-form-urlencoded');
	if(word){
		fetch(url,{
			method : "POST",
			headers : headerObj,
			body : "data=" + JSON.stringify(paramObj)
		}).then(response=>{
			if(response.ok){
				return response.text();
			}
			throw new AsyncPageError(response.text());
		}).then(msg=>{
			if(msg != 'failed'){
				jsonData = JSON.parse(msg);
				document.querySelector('tbody').innerHTML="";
				document.querySelector('#paging_ui').innerHTML = "";
				pageIdx = 1;
				pageCycle = jsonData.length/10 >=3 ? 3 : jsonData.length%10 ==0 ?jsonData.length/10 :parseInt(jsonData.length/10) + 1;
				selectTaskList(jsonData);
				doPaging(jsonData.length);
			}else{
				alert("조건에 일치하는 업무가 없습니다.");
			}
		}).catch(error=>{
			error.alertMessage();
			
		});
	}
	reroadChk();
}

//업무목록을 업무명으로 검색할 것인지 유저 아이디로 결정할 것이지 선택
let selectMenu = (data)=>{
	menu = data.innerHTML;
	document.querySelector('#dropdown_menu').innerHTML=menu;
}


//페이지를 새로고침하는 함수
let reloadPage = ()=>{
	location.reload();
}

//전체선택을 초기화 하는 함수
let reroadChk = ()=>{
	 $('input[name=_selected_').prop('checked',false);
            $('#wholeChk').data('chk',false);
}