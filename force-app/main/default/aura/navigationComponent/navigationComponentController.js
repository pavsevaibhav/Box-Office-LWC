({
    init: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        var moviesData = myPageRef.state.c__moviesData;
        cmp.set("v.movies", moviesData);
        
    }
})
