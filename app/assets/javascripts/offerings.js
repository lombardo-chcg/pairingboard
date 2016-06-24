$(document).ready(function() {

  // Mentor submits new offerings
  $('#myModal form').on("submit", "#mentor-submit-button", function(event) {
    event.preventDefault();
    var request = $.ajax({
      method: "POST",
      url: "/offerings",
      data: $(this).serialize()
    });
    request.done(function(response) {
        $('.container').append(response);
        $(".flash_area").show();
        $(".flash_area").html("<div class='alert alert-success flash-alert'>Appointment Booked!</div>").fadeOut(3500);
        $('#myModal').modal('hide');
    });
    request.fail(function(error) {
        console.log(error);
        var errors = error.responseText;
        var message = JSON.parse(errors).message;
        var errorMessage = message.student[0];    
        $('#myModal').modal('hide');
        $(".flash_area").show();
        $(".flash_area").html("<div class='alert alert-danger flash-alert'>"+errorMessage+"</div>").fadeOut(3500);
    });
  });

  // DateFinder function for New Mentor Offerings
  var today = new Date();
  $('#mentor-submit-button .input-group.date').datepicker({
    format: "dd-mm-yyyy",
    weekStart: 0,
    daysOfWeekDisabled: "0,1,2,3,4,5",
    daysOfWeekHighlighted: "6",
    todayHighlight: true,
    startDate: today,
    autoclose: true,
  });

  // bring up book appt
  $('body').on("click", ".open_offering_link", function(event) {
    event.preventDefault();
    // var thisButton = $(this);
      var time = $(this).attr("value");
      var user = ($(this).parent().parent().find('button').attr('name'));
      var userName = ($(this).parent().parent().find('button').text());
      $('#appointmentModal').modal();
      $(".mentorName").html(userName).attr('name' , user);
      $(".mentorTime").html(time);
  });

  // booking of appt
    $('body').on("click", "button[name='bookAppointment']", function(event) {
      event.preventDefault();
      var user = $(this).parent().parent().find('.mentorName').attr('name');
      var time = $(this).parent().parent().find('.mentorTime').text();
      var request = $.ajax({
        method: "Post",
        url: "/appointments",
        data: { time:time, user:user }
      });
      request.done(function(response){
        $(".flash_area").show();
        $(".flash_area").html("<div class='alert alert-success flash-alert'>Appointment Booked!</div>").fadeOut(3500);
        $("a[href='/offerings/"+response.offeringId+"']").removeClass('open_offering_link').addClass('taken_offering_link').attr('href', "/appointments/"+response.appointmentId);
        $('#appointmentModal').modal('hide');
      });
     request.fail(function(error){
        var errors = error.responseText;
        var message = JSON.parse(errors).message;
        var errorMessage = message.student[0];    
        $('#appointmentModal').modal('hide');
        $(".flash_area").show();
        $(".flash_area").html("<div class='alert alert-danger flash-alert'>"+errorMessage+"</div>").fadeOut(3500);
      });

    });

  // show appointment
  $('body').on("click", ".taken_offering_link", function(event) {
    event.preventDefault();
    var thisButton = $(this);
    var time = $(this).attr("value");
    var user = ($(this).parent().parent().find('button').attr('name'));
    var appointmentId = $(this).attr('name');
    var request = $.ajax({
      method: "Get",
      url: "/appointments/"+appointmentId,
      data: { time:time, user:user }
    });
    request.done(function(response) {
      $('.show-mentor-name').html('Mentor Name: ' + response.mentor);
      $('.show-student-name').html('Student Name: ' + response.student);
      $('.show-appointment-time').html('Time: ' + time);
      $('#show-appointment-modal').modal();
      if (response.appointmentHolder === true ) {
        $('.show-appointment-cancel').html("<button type='button' class='btn btn-info btn-lg cancel-appointment' name="+response.appointmentId+">Cancel Appointment</button>");
      } else {
        $('.show-appointment-cancel').html('');
      }
    });
  });

    // cancel appointment
    $('body').on("click", ".cancel-appointment", function(event) {
      event.preventDefault();
      var appointmentId = $(this).attr('name');
      var time = $(this).attr("value");
      var user = ($(this).parent().parent().find('button').attr('name'));
      var request = $.ajax({
        method: "DELETE",
        url: "/appointments/"+appointmentId
      });
      request.done(function(response) {
        $(".flash_area").show();
        $(".flash_area").html("<div class='alert alert-danger flash-alert'>Appointment Cancelled!</div>").fadeOut(3500);
        $("a[href='/appointments/"+response.appointmentId+"']").removeClass('taken_offering_link').addClass('open_offering_link').attr('href', "/offerings/"+response.offeringId);
        $('#show-appointment-modal').modal('hide');
      });
    });

    // click on user name and see profile modal
    $('body').on('click', '.name_button', function(event) {
      userId = $(this).attr('name');
      request = $.ajax({
        method: "GET",
        url:  "/users/"+userId
      });

      request.done(function(response) {
        var name = response.userName;
        $('.mentor-title').html(response.userName);
        if (response.userPhase === null) {
           $('.show-mentor-phase').html("No phase provided");
        }else {
          $('.show-mentor-phase').html(response.userPhase);
        }
        if(response.userPhone === null ){
           $('.show-mentor-phone').html("Sorry, no phone number provided!");
        }else{
          $('.show-mentor-phone').html(response.userPhone);
        }if(response.userDescription === null ){
          $('.show-mentor-description').html("No story provided");
        }else{
          $('.show-mentor-description').html(response.userDescription);
        }
        $('.link-to-profile').html("<a class='btn btn-default user-profile' href='/users/" + userId +"'>"+ name +"profile </a>");
        $('#show-user-modal').modal();

      });
    });
});
