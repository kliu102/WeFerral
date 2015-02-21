function remove_fields(link) {
    $(link).prev("input[type=hidden]").val(true);
    $(link).parent(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).before(
        content.replace(regexp, new_id)
    );
}