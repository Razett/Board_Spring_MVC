/**
 * Reply Scripts For get Board Page.
 */

var replyService = (function () {

    function getList(param, callback, error) {
        var bno = param.bno;
        var page = param.page || 1;

        $.getJSON("/reply/bno/" + bno + "/" + page, function (data) {
            if (callback) {
                callback(data.count, data.list);
            }
        }).fail(function (xhr, status, err) {
            if (error)
                error();
        })
    }

    function add(reply, callback, error) {
        $.ajax({
            type: 'post',
            url: '/reply/new',
            data: JSON.stringify(reply),
            contentType: 'application/json;charset=UTF-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } else {
                    console.log("added.");
                    showList(-1);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error();
                } else {
                    console.log('add failed.');
                }
            }
        });
    }
    
    function verify(reply, callback, error) {
        $.ajax({
            type: 'post',
            url: '/reply/verify',
            data: JSON.stringify(reply),
            contentType: 'application/json;charset=UTF-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } else {
                    console.log("verified.");
               
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error();
                } else {
                    console.log('verification failed.');
                }
            }
        });
    }

    function remove(rno, reply, callback, error) {
        $.ajax({
            type: 'delete',
            url: '/reply/' + rno,
            data: JSON.stringify(reply),
            contentType: 'application/json;charset=UTF-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } else {
                    console.log("deleted.");
                    showList(-1);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error();
                } else {
                    console.log('delete failed.');
                }
            }
        });
    }

    function update(rno, reply, callback, error) {
        $.ajax({
            type: 'patch',
            url: '/reply/' + rno,
            data: JSON.stringify(reply),
            contentType: 'application/json;charset=UTF-8',
            success: function (result, status, xhr) {
                if (callback) {
                    callback(result);
                } else {
                    console.log("modified.");
                    showList(-1);
                }
            },
            error: function (xhr, status, er) {
                if (error) {
                    error();
                } else {
                    console.log('modify failed.');
                }
            }
        });
    }

    function displayTime(timeValue) {
    	var currentDate = new Date();
        var clientTimeZoneOffset = currentDate.getTimezoneOffset() * 60000;
        
        var jsDate = Date.parse(timeValue);
        var gmtDate = new Date(jsDate - (clientTimeZoneOffset));
//        console.log(gmtDate);

        var formattedDate = gmtDate.toLocaleString('ko-KR', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit'
        });    
        
        return formattedDate;                                                                                                                                              
    }

    function showList(page) {

        replyService.getList({ bno: bnoValue, page: page || 1 }, function (count, list) {

            if (page == -1) {
                pageNum = Math.ceil(count / 15.0);
                showList(pageNum);
                return;
            }

            var str = "";

            if (list == null || list.length == 0) {
	            $('#reply_area').html(str);
	            $('#reply_count').text('0' + '개');
                return;
            }

            for (var i = 0, len = list.length || 0; i < len; i++) {
                if (i == 0) {
                    str += '<div class="card shadow mb-4">'
                    str += '<div class="card-body">'
                    str += '<div>'
                }
                str += '<div>';
                str += '<div class="d-flex flex-row align-items-center justify-content-between">';
                str += '<label>작성자: <span class="text-gray-800">' + list[i].replyer + '</span></label>';
                str += '<div>';
                str += '<label class="pl-2">작성시간: ' + replyService.displayTime(list[i].replyDate) + '</label>';
                str += '<a class="pl-2 reply_modify" href="' + list[i].rno + '">수정</a>';
                str += '<a class="pl-2 reply_delete" href="'+ list[i].rno + '">삭제</a>';
                str += '</div>';
                str += '</div>';
                str += '<div>';
                str += '<span class="text-gray-800 text-break reply' + list[i].rno + '">' + list[i].reply + '</span>';
                str += '</div>';
                str += '<hr>';
                str += '</div>';

                if (i == len - 1) {
                		str += '<div id="reply_page_area"></div>';
                    str += '</div>';
                    str += '</div>';
                    str += '</div>';
                }
            }

            $('#reply_area').html(str);
            $('#reply_count').text(count +'개');

            showReplyPage(count);
        })
    }

    function showReplyPage(count) {

        var endNum = Math.ceil(pageNum / 15.0) * 15;
        var startNum = endNum - 14;
        
        var prev = (pageNum != 1);
        var next = false;
        
        if (endNum * 15 >= count) {
            endNum = Math.ceil(count / 15.0);
        }
        
        if (pageNum < endNum) {
            next = true;
        }

        var str = '<div>';
        str += '<div class="dataTables_paginate paging_simple_numbers" id="paginate">';
        str += '<ul id="reply_page_ul" class="pagination mt-3 justify-content-center">';

        // prev
        if (prev) {
            str += '<li class="paginate_button page-item previous" id="paginate_previous_li">';
        } else {
            str += '<li class="paginate_button page-item previous disabled" id="paginate_previous_li">';
        }
        str += '<a href="' + (pageNum - 1) + '" class="page-link" id="paginate_previous">Prev</a>';
        str += '</li>';

        //num
        for (var i = startNum; i <= endNum; i++) {
            var active = pageNum == i ? "active" : "";

            str += '<li class="paginate_button page-item ' + active + '">';
            str += '<a href="' + i + '" class="page-link">' + i + '</a>';
            str += '</li>';
        }

        // next
        if (next) {
            str += '<li class="paginate_button page-item next" id="paginate_next_li">';
        } else {
            str += '<li class="paginate_button page-item next disabled" id="paginate_next_li">';
        }
        str += '<a href="' + (parseInt(pageNum) + 1) + '" class="page-link" id="paginate_next">Next</a>';
        str += '</li>';

        str += '</ul>';
        str += '</div>';
        str += '</div>';

        $("#reply_page_area").html(str);
    }

    return {
        add: add,
        getList: getList,
        showList: showList,
        verify: verify,
        remove: remove,
        update: update,
        displayTime: displayTime
    };
})();

