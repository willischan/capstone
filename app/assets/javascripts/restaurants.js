/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: 'Hello Vue!',
      restaurants:[],
      nameFilter: 'Gary'
    },
    mounted: function() {

      $.get('https://api.yelp.com/v3/businesses/' + nameFilter, function(result) {
        this.restaurants = result;
        console.log(restaurantName);
      }.bind(this))

    },
    methods: {

    isValidRestaurant: function(restaurant){
      var validName = restaurant.name.toLowerCase().indexOf(this.nameFilter.toLowerCase()) > -1;
      return validName;
    },

    },
    computed: {

    }
  });
});