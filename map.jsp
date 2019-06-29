<%@page import="java.util.HashMap"%>
<%@page import="lab.java.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%
	double x = 37.501874;
	double y = 127.040170;
%>
	<div board ="1" id="map" style="width:500px;height:400px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aad4bf3f77dfed13f54d32cd0ddf635d">
	</script>
	<script>	
		//##############################################################################
		//지도가 처음 표시 될 곳
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(<%=x %>,<%=y %>),//DB
			level: 3
		};
		var map = new daum.maps.Map(container, options);
		
		//##############################################################################
		//마커 생성하기
		//빌딩 개수 파악해서 주변 마커 찍기
		var markerPosition  = new kakao.maps.LatLng(37.501574,127.040170); 
		
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		//##############################################################################
		// 마커 올리면 정보 나오게 하기
		// 마커 올리면 보일 정보 정하기
		var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});
		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});
		// 마커에 마우스 클릭했을때 이벤트
		kakao.maps.event.addListener(marker, 'click', function() {
		    location.href='../about_startup.jsp';
		});
		// 마커에 마우스아웃 이벤트를 등록합니다 올렸을때 이벤트
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    infowindow.close();// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		});
		
		//##############################################################################
	</script>
	<% %>

</body>
</html>