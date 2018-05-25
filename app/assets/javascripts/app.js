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
        // response is an array of lead objects
        console.log(this.leads)
          this.leads = _.orderBy(this.leads, "updated_at");
        console.log(this.leads)
        // this.leads = _.sortBy(this.leads, function(item){
          // if (item.events[0] && item.events[0].updated_at){
           // return _.sortBy(item.events, "updated_at")
            // return (item.events[0].updated_at)}
          // }
          // else{
            // return _.sortBy(item.events,"updated_at")
        // })
        // console.log(orderedCheck)
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
      },
      sortColumns: function(sortTerm) {
        var orderedCheck = _.orderBy(this.leads,sortTerm, 'asc');
        
        if (this.leads[0][sortTerm] === orderedCheck[49][sortTerm]) {
          var newOrder = _.orderBy(this.leads,sortTerm, 'asc');
          return this.leads = newOrder;
        } else {
          var newOrder = _.orderBy(this.leads,sortTerm, 'desc');
          return this.leads = newOrder;
        }
      }
    },
    computed: {
      
    },
  });
});
