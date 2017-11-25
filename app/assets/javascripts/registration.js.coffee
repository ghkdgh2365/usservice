jQuery ->
    $('#user_college_id').parent().hide()
    colleges = $("#user_college_id").html()
    $("#user_univ_id").change ->
        univ = $("#user_univ_id :selected").text()
        escape_univ = univ.replace(/([ #;$,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(colleges).filter("optgroup[label="+escape_univ+"]").html()
        if options
            $("#user_college_id").html(options)
            $("#user_college_id").prepend('<option value='+'""'+'selected="selected"'+'>단과대를 선택해주세요</option>')
            $('#user_college_id').parent().show()
        else
            $("#user_college_id").empty()
            $('#user_college_id').parent().hide()
    
    $('#user_major_id').parent().hide()
    majors = $("#user_major_id").html()
    $("#user_college_id").change ->
        college = $("#user_college_id :selected").text()
        escape_college = college.replace(/([ #;$,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(majors).filter("optgroup[label="+escape_college+"]").html()
        if options
            $("#user_major_id").html(options)
            $('#user_major_id').parent().show()
        else
            $("#user_major_id").empty()
            $('#user_major_id').parent().hide()
    