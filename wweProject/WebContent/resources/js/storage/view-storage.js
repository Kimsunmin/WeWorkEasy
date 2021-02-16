function downloadFile(ofname,rfname,savePath) {
    let params = {
        'ofname' : ofname,
        'rfname' : rfname,
        'savePath' : savePath
    };
    location.href = '${context}' + "/storage/download?" + urlEncodeForm(params);
}

function deleteFile(idx,rfname,savePath,isTeam) {
    let params = {
        'fileIdx' : idx,
        'rfname' : rfname,
        'savePath' : savePath,
        'isTeam' : isTeam
    };
    location.href = '${context}' + "/storage/delete?" + urlEncodeForm(params);
}

function searchMyFile(isTeam) {
    if(window.event.keyCode == 13){
        let keyWord = document.querySelector('#searchValue').value;
        document.cookie = 'searchKeyword=' + keyWord;
        if(isTeam === 'true'){
            location.href = '${context}' + "/storage/share";
        }else{
            location.href = '${context}' + "/storage/personal";
        }

    }
}

function reset(isTeam) {
    document.cookie = 'searchKeyword=;'
    if(isTeam === 'true'){
        location.href = '${context}' + "/storage/share";
    }else{
        location.href = '${context}' + "/storage/personal";
    }
}