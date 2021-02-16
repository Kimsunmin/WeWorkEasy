
let memberList = Array();


/* 프로젝트 생성 modal창 */
		let openModal = () => {
			let url = "/project/fetchmember"; //url: 정보를 요청할 경로(controller의 switch문)
			let headerObj = new Headers();
			headerObj.append('content-type','application/x-www-form-urlencoded');
			
			fetch(url,{
				method : "GET",
				headers : headerObj
			}).then(response =>{
				if(response.ok){
					return response.text();
				}else{
					throw new AsyncPageError(response.text());
				}
			}).then(data =>{
				let mList = JSON.parse(data);
				console.dir(mList);
				for(let i = 0; i < mList.length; i++){
                    memberList.push(mList[i].userID);
				}
				autocomplete(document.getElementById("myInput"),memberList);
				$('#new-project-modal').show();
				
			}).catch(error =>{
				error.alertMessage();
			});
			
		}

		let closeModal = () => {
			$('#title').val("");
			$('#deadline').val("");
			$('#myInput').val("");
			$('#addedMember').val("");
			$('#new-project-modal').hide();
		}

        
            /* 생성 버튼 클릭 시 실행 */
            let addProject = () => {
            	//제목, 기한, 추가된 팀원 받기 
            	let title = document.querySelector('#title').value;
            	let deadline = document.querySelector('#deadline').value;
            	let tempList = $('#addedMember').val().split('\n');
            	
            	if(title != "" && deadline != "") {
            			
            			//이전날짜 실행 막기 
                    	let date = document.querySelector('#deadline').value;
                       
                        let today = new Date();
                        let year = today.getFullYear();
                        let month = ("0" + (1 + today.getMonth())).slice(-2);
                        let day = ("0" + today.getDate()).slice(-2);
                        today = new Date(year, month - 1, day);
                        
                        let tempArr = date.split('-');
                        let modDate = new Date(tempArr[0], tempArr[1] - 1, tempArr[2]);
                        let betweenDay = (modDate.getTime() - today.getTime()) / 1000 / 60 / 60 / 24;
                        
                        	//기한이 안 맞으면
	                        if (betweenDay < 0) {
	                            alert("지정할 수 없는 날짜입니다.");
	                        
	                        //기한이 올바르면
	                        }else {

                        		const url = '/project/newproimpl'; //controller의 newproImpl 함수 실행
            	                let paramObj = new Object();
            	                
            	                //만약 tempList가 있다면
            	                if(tempList != "") { 
	            	            	let memberArray = new Array();
	              	                 
	            	                for(let i = 0; i < tempList.length-1; i++){
	            	                	memberArray.push(tempList[i]);
	            	                }
	            	                
	            	                paramObj.addedMember = memberArray;
            	                }
            	                
            	                paramObj.title = $('#title').val();
            	                paramObj.deadline = $('#deadline').val();
            	                
            	                let headerObj = new Headers();
            	                headerObj.append("content-type", "application/x-www-form-urlencoded");
            	               
            	                fetch(url, {
            	                    method: "post",
            	                    headers: headerObj,
            	                    body: "data=" + JSON.stringify(paramObj)
            	                    
            	                }).then(response => {
            	                    if (response.ok) {
            	                        return response.text();
            	                    }
            	                    
            	                }).then((text) => {
            	                        if (text == 'success') {
            	                        	location.href = '/task/main';
            	                        }
            	                    }
            	                );
	                        }
                    	}else {
                    		alert('제목과 마감기한을 입력해주세요.')
                    	}  
            	}
		

 
            /* 최근 프로젝트를 클릭했을 시 task메인 페이지로 이동 */
            let recentProject = (projectId,userId,workTime) => {
            	
            	let url = '/project/selectpro'; 
            	let paramObj = new Object();
            	paramObj.projectId = projectId;
            	paramObj.userId = userId; 
            	paramObj.workTime = workTime;
            	
            	console.log(paramObj);
            	
            	let headerObj = new Headers();
            	headerObj.append('content-type', 'application/x-www-form-urlencoded');
            	
            	fetch(url, {
            		method : "post",
            		headers : headerObj,
            		body : "data="+ JSON.stringify(paramObj) //data: 키값
            		
            	}).then(response => {
            		if(response.ok) {
            			return response.text();
            		}else {
            			throw new AsyncPageError(response.text());
            		}
            		
            	}).then((text) => {
            		if(text == 'success') {
            			location.href = '/task/main';
            		}else {
            			alert("프로젝트를 불러오지 못했습니다.")
            		}
            		
            	}).catch((error) => {
            		error.alertMessage();
            	})

            }
            
        
            /* 초대된 프로젝트를 클릭했을 시 task메인 페이지로 이동*/
            let invitedProject = (projectId,userId,workTime) => {
            	
            	let url = '/project/invitedpro'; 
            	let paramObj = new Object();
            	paramObj.projectId = projectId;
            	paramObj.userId = userId;
            	paramObj.workTime = workTime;
            	
            	let headerObj = new Headers();
            	headerObj.append('content-type', 'application/x-www-form-urlencoded');
            	
            	fetch(url, {
            		method : "post",
            		headers : headerObj,
            		body : "data="+ JSON.stringify(paramObj) //data: 키값
            		
            	}).then(response => {
            		if(response.ok) {
            			return response.text();
            		}else {
            			throw new AsyncPageError(response.text());
            		}
            	}).then((text) => {
            		if(text == 'success') {
            			location.href = '/task/main';
            		}else {
            			alert("프로젝트를 불러오지 못했습니다.")
            		}
            	}).catch((error) => {
            		error.alertMessage();
            	})
            }
            
            
            
            /* 팀원 추가 (Autocomplete) */
            function autocomplete(inp,arr) {
                /*the autocomplete function takes two arguments,
                the text field element and an array of possible autocompleted values:*/
                var currentFocus;
                /*execute a function when someone writes in the text field:*/
                inp.addEventListener("input", function (e) {
                    var a, b, i, val = this.value;
                    /*close any already open lists of autocompleted values*/
                    closeAllLists();
                    if (!val) {
                        return false;
                    }
                    currentFocus = -1;
                    /*create a DIV element that will contain the items (values):*/
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    /*append the DIV element as a child of the autocomplete container:*/
                    this.parentNode.appendChild(a);
                    /*for each item in the array...*/
                    for (i = 0; i < arr.length; i++) {
                        /*check if the item starts with the same letters as the text field value:*/
                        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            /*create a DIV element for each matching element:*/
                            b = document.createElement("DIV");
                            /*make the matching letters bold:*/
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            /*insert a input field that will hold the current array item's value:*/
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            /*execute a function when someone clicks on the item value (DIV element):*/
                            b.addEventListener("click", function (e) {
                                /*insert the value for the autocomplete text field:*/
                                inp.value = this.getElementsByTagName("input")[0].value;
                                /*close the list of autocompleted values,
                                (or any other open lists of autocompleted values:*/
                                closeAllLists();
                            });
                            a.appendChild(b);
                        }
                    }
                });
                /*execute a function presses a key on the keyboard:*/
                inp.addEventListener("keydown", function (e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x) x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        /*If the arrow DOWN key is pressed,
                        increase the currentFocus variable:*/
                        currentFocus++;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 38) { //up
                        /*If the arrow UP key is pressed,
                        decrease the currentFocus variable:*/
                        currentFocus--;
                        /*and and make the current item more visible:*/
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        /*If the ENTER key is pressed, prevent the form from being submitted,*/
                        e.preventDefault();
                        if (currentFocus > -1) {
                            /*and simulate a click on the "active" item:*/
                            if (x) x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    /*a function to classify an item as "active":*/
                    if (!x) return false;
                    /*start by removing the "active" class on all items:*/
                    removeActive(x);
                    if (currentFocus >= x.length) currentFocus = 0;
                    if (currentFocus < 0) currentFocus = (x.length - 1);
                    /*add class "autocomplete-active":*/
                    x[currentFocus].classList.add("autocomplete-active");
                } 
                
                function removeActive(x) {
                    /*a function to remove the "active" class from all autocomplete items:*/
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                } 
                
                
                function closeAllLists(elmnt) {
                    /*close all autocomplete lists in the document,
                    except the one passed as an argument:*/
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                } 
                          
                /*execute a function when someone clicks in the document:*/
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }
            /*An array containing all the country names in the world:*/
            //console.log: 자기만 보여주고, console.dir: 자식요소까지 다 보여줌 (=> 배열일때는 dir)
            /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
            //autocomplete(document.getElementById("myInput"),memberList);
           
            
            //팀원 추가 버튼 눌렀을 때
            let addMember = (data)=>{
            	
            	let addedMember = document.querySelector('#myInput').value;
            	
            	if(addedMember!=""){      
            		let url = "/project/filtermember";
            		let paramObj = new Object();
            		paramObj.userId = addedMember;
            		paramObj.leaderId = data;
            		
            		let headerObj = new Headers();
            		headerObj.append('content-type','application/x-www-form-urlencoded');
            		
            		fetch(url, {
            			method: "post",
            			headers: headerObj,
            			body: "data="+ JSON.stringify(paramObj) //JSON인 paramObj를 string으로 만들어줌
            		
            		}).then(response => {
            			if(response.ok) { //요청해서 응답 성공 시
            				return response.text(); //controller에서 넘어온 success나 failed 반환
            			}else {
            				throw new AsyncPageError(response.text());
            			}
            			
            		}).then((text) => {
            			if(text == 'success') {
            				document.querySelector('#addedMember').value += addedMember +"\n";
                    		document.querySelector('#myInput').value ="";
                        	document.querySelector('#myInput').focus();
            			}else {
            				alert("아이디가 올바르게 입력되지 않았습니다.")
            			}
            		}).catch((error) => {
            			error.alertMessage();
            		})
            	}
            }
            
            //팀원 삭제 버튼 눌렀을 때
            let deleteMember = () => {
            	$('#addedMember').val("");
            }

 
            
            
            