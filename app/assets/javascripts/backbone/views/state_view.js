var StateView = Backbone.View.extend({
    tagName: 'option',
    template: _.template('<%= name %>'),
    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        this.el.value = this.model.toJSON().id;
    }
});

var StateListView = Backbone.View.extend({
    tagName: 'select',
    render: function(){
        this.collection.forEach(this.addOne, this);
    },
    addOne: function(state){
        var stateView = new StateView({model: state});
        stateView.render();
        this.$el.append(stateView.el);
    }
});