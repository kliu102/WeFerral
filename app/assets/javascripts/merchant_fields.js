function remove_fields(link) {

}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).up().insert({
        before: content.replace(regexp, new_id)
    });
}

$(function() {
    $('.remove_fields').click(function() {
        // Some complex code
        $(this).previous("input[type=hidden]").value = "1";
        $(this).up(".fields").hide();
        return false;
    });
});