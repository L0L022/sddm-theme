import QtQuick 2.0
import Material 0.1
import Material.Extras 0.1

ApplicationWindow {
  	//anchors.fill: parent
  
  	Image {
		anchors.fill: parent	
  		source: Qt.resolvedUrl("wallpaper.png")
  	}

  	Card {
	    anchors.centerIn: parent
	    
	    elevation: 2
	    radius: units.dp(2)
	    
	    CircleImage {
	    	id: image
	    	source: Qt.resolvedUrl("face.jpg")
	    	anchors {
	    		horizontalCenter: parent.horizontalCenter
	    		top: parent.top
	    		topMargin: units.dp(20)
	    	}
	    	
	    	width: units.dp(100)
	    	height: width
	    	
	    	Rectangle {
	    		anchors.fill: parent
	    		color: "transparent"
	    		radius: width/2
	    		border.color: Qt.rgba(0,0,0,0.4)
	    	}
	    }
	    
	    Label {
	    	id: label
	    	anchors {
	    		horizontalCenter: parent.horizontalCenter
	    		top: image.bottom
	    		topMargin: units.dp(10)
	    	}
	    	
	    	style: "subheading"
	    	text: "Michael Spencer"
	    }
	    
	    TextField {
	    	anchors {
	    		horizontalCenter: parent.horizontalCenter
	    		top: label.bottom
	    		topMargin: units.dp(10)
	    	}
	    	
	    	floatingLabel: true
	    	
	    	hintText: "Password"
	    }
  	}
}
