$(document).ready(function(){

	$('.student').click(function(){
		$(this).toggleClass('selected');
	});

	$('.submit').click(function () {
		if ($('.selected').length > 0) {
			$('#overlay').empty();
			$('#grey-background').css("display", "block");
			$('#student-action-modal').modal('hide')
			var enrollments = $.makeArray($('.student.selected').map(function(index, student) {
				return this.dataset.enrollmentId;
			}));

			var course_id = this.dataset.courseId

			var data = {
				enrollment_ids: enrollments,
				action_id: this.dataset.actionId
			};

			$.ajax({
				type: "POST",
				url: '/teachers/courses/' + course_id + '/liveclass',
				data: data,
				success: displaySuccessfulResponse,
				dataType: 'json'
			});
		};
	});
	var displaySuccessfulResponse = function (response) {
		var numberOfStudents = response.enrollmentIds.length;
		var message = response.actionType + ' recorded for ' + numberOfStudents
		if(numberOfStudents == 1){
			message += ' student.'
		}else{
			message += ' students.'
		}
		$('.student').removeClass('selected');
		$('#overlay').css("display", "block");
		$('#overlay').text(message);
		setTimeout(function() { $("#overlay").hide(); }, 800)
		setTimeout(function() { $("#grey-background").hide(); }, 800)
	}

//===============iPad Swipe functionality==============//



$(".student-container").swipe( { swipeRight:selectStudents, swipeLeft:clearStudents, allowPageScroll:"none"} );

function selectStudents(event, direction, distance, duration, fingerCount) {
	$('.student').removeClass('selected');
	$('.student').addClass('selected');
}

function clearStudents(event, direction, distance, duration, fingerCount) {
	$('.student').removeClass('selected');
}

});

