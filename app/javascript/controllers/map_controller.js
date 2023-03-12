import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",


    })

    // const mapDiv = document.querySelector('.mapboxgl-canvas-container');
    // if (mapDiv.style.visibility === true) this.map.resize();

    // this.map.on('load', function () { this.map.resize() })

  //   map.on('load', function() {
  //     $('.mapboxgl-canvas').css('width', '100%');
  //     $('.mapboxgl-canvas').css('height', '100%');
  //     map.resize();
  // });

//   this.map.on('load', function() {
//     var mapCanvas = document.getElementsByClassName('mapboxgl-canvas')[0];
//     var mapDiv = document.getElementById('map');
//     var breakButton = document.getElementById('resizeDiv');
//     var fixButton = document.getElementById('resizeMap');


//     fixButton.onclick = function() {
//         map.resize();
//     }

// })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
