<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<!--자바스크립트 -->
<head>
<meta charset="UTF-8">
<title>프로젝트 동작 화면</title>

<div>운동 하기 >>>  시작버튼을 눌러주세요!! </div>
<button type="button" onclick="init()">운동 시작  </button>
<div id="webcam-container"></div>
<div id="label-container"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "${contextPath}/resources/trainingModel/FirstModel/";

    let model, webcam, labelContainer, maxPredictions;

    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(600, 600, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop() {
    	webcam.update(); // update the webcam frame
        await predict();
        document.frmTrainer.count.value = count;
        window.requestAnimationFrame(loop);

    }
	var status = "Class 1";
	var count = 0;
    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }
        if (prediction[0].probability.toFixed(2) >= 0.90){
        	if(status == "Class 2"){
        		count++;
        	}
        	labelContainer.childNodes[0].innerHTML = "안경"; 
        	status = "Class 1";
        }
        else if(prediction[1].probability.toFixed(2) >= 0.90){
        	labelContainer.childNodes[0].innerHTML = "지갑";
        	status = "Class 2";
        }
    }
    /* var data = $('input[name=count]').val(); */ 
    // count가 form태그로 넘어가지 않는다. >>>> null값이 map으로 들어가 현재 부적합한 열 유형: 1111발생 count를 form태그로 넣을 방법을 찾아야함 
    
</script>

</head>
<body>

<form method="post" action="${contextPath}/trainer/save.do" name="frmTrainer">
	<input type="hidden" name="count" /> <!-- 자바스크립트 변수를 html에서 호출할때 &{값};  실패 -->
	<input type="submit" name="운동량 저장하기" onClick="location.href=${contextPath}/trainer/save.do"/>
</form>
<input type="button" value="홈으로 돌아가기" onClick="location.href='${contextPath}/main.do'">
</body>
</html>