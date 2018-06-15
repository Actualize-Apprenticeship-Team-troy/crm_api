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
        console.log(this.leads);
        this.leads.map(function(lead) {
          var sortedEvents = _.orderBy(lead.events, ['updated_at'], ['desc']);
          lead.events = sortedEvents;
        });
        var stuff = _.orderBy(this.leads, function(lead){
          if (lead.events[0] != undefined) {
            return lead.events[0].updated_at;
          };
        })
        this.leads = stuff.reverse();
        this.leads = _.orderBy( this.leads, ['events[0]',], ['desc'])
        var emptyEvents = _.remove(this.leads, function(lead) {
          return lead.events == 0;
        });
        this.leads = this.leads.concat(emptyEvents);
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
      },
      emptyOutreach: function(outreaches, events) {
        // if event > outreach DONE
        // blue DONE
        // if outreach is 0 DONE
        // orange DONE
        // if event < outreach

        // do nothing

        //console.log(outreaches[0].updated_at)
        if (outreaches.length === 0) {
          return '#f7c204';
        } else if (events && events[0].updated_at > outreaches[0].updated_at){     
          return '#0cc6f4';
        }

      }
    },
    computed: {
    },
  });
});
