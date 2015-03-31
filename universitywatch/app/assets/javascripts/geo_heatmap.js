// Adding 500 Data Points
// var map, pointarray, heatmap;

// var taxiData = [
//   { location: new google.maps.LatLng(37.751266, -122.403355), weight: 2 },
//   { location: new google.maps.LatLng(37.782, -122.443), weight: 15 }
// ];

// function initialize() {
//   var mapOptions = {
//     zoom: 5,
//     //center: new google.maps.LatLng(37.6, -95.665),
//     center: new google.maps.LatLng(37.6, -95.665),
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };

//   map = new google.maps.Map(document.getElementById('map-canvas'),
//       mapOptions);

//   var pointArray = new google.maps.MVCArray(taxiData);

//   heatmap = new google.maps.visualization.HeatmapLayer({
//     data: pointArray
//   });

//   heatmap.setMap(map);
// }

// function toggleHeatmap() {
//   heatmap.setMap(heatmap.getMap() ? null : map);
// }

// function changeGradient() {
//   var gradient = [
//     'rgba(0, 255, 255, 0)',
//     'rgba(0, 255, 255, 1)',
//     'rgba(0, 191, 255, 1)',
//     'rgba(0, 127, 255, 1)',
//     'rgba(0, 63, 255, 1)',
//     'rgba(0, 0, 255, 1)',
//     'rgba(0, 0, 223, 1)',
//     'rgba(0, 0, 191, 1)',
//     'rgba(0, 0, 159, 1)',
//     'rgba(0, 0, 127, 1)',
//     'rgba(63, 0, 91, 1)',
//     'rgba(127, 0, 63, 1)',
//     'rgba(191, 0, 31, 1)',
//     'rgba(255, 0, 0, 1)'
//   ]
//   heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
// }

// function changeRadius() {
//   heatmap.set('radius', heatmap.get('radius') ? null : 20);
// }

// function changeOpacity() {
//   heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
// }

// google.maps.event.addDomListener(window, 'load', initialize);
