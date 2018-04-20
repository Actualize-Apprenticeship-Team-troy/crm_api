/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      leads: [],
      searchTerm: "",
      events: [],
      time_format: "12/25/17",
      url: "https://www.google.com/"
    },
    mounted: function() {
      $.get('/api/v1/leads.json').success(function(response) {
        this.leads = response;
      }.bind(this));
    },
    methods: {
      moment: function(date) {
        return moment(date);
      },
      foundLead: function(inputName) {
        var foundFirstName = inputName.first_name.toLowerCase().includes(this.searchTerm.toLowerCase());
        var foundLastName = inputName.last_name.toLowerCase().includes(this.searchTerm.toLowerCase());
        var foundEmail = inputName.email.toLowerCase().includes(this.searchTerm.toLowerCase());
        return foundFirstName || foundLastName || foundEmail;
      },
      edit: function(lead) {
        window.location.href = '/leads/' + lead.id + '/edit';
        console.table(lead);
      }

    },
    computed: {

    },
  });
});
