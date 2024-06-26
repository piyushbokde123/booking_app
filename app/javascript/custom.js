function selectSeat(seatNumber) {
  var checkbox = document.getElementById("seat_" + seatNumber);
  var isChecked = checkbox.checked;

  if (isChecked) {
    console.log("Seat " + seatNumber + " selected.");
  } else {
    console.log("Seat " + seatNumber + " deselected.");
  }
}

document.addEventListener('DOMContentLoaded', function() {
    const addShowTimeButton = document.getElementById('add_show_time');
    const showTimesFields = document.getElementById('show_times_fields');
    const submitButton = document.getElementById('submit_button');

    addShowTimeButton.addEventListener('click', function(e) {
      e.preventDefault();
      const index = parseInt(addShowTimeButton.getAttribute('data-index'));
      const template = `

        <div class="form-group">
          <label class="control-label col-sm-2" for="movie_show_times_attributes_${index}_date">Start Time</label>
          <div class="col-sm-10">
            <input class="form-control" type="date" name="movie[show_times_attributes][${index}][date]" id="movie_show_times_attributes_${index}_date">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="movie_show_times_attributes_${index}_start_time">Start Time</label>
          <div class="col-sm-10">
            <input class="form-control" type="time" name="movie[show_times_attributes][${index}][start_time]" id="movie_show_times_attributes_${index}_start_time">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-sm-2" for="movie_show_times_attributes_${index}_seat_count">Seats</label>
          <div class="col-sm-10">
            <input class="form-control" type="number" name="movie[show_times_attributes][${index}][seat_count]" id="movie_show_times_attributes_${index}_seat_count">
          </div>
        </div>
      `;
      const div = document.createElement('div');
      div.innerHTML = template;
      showTimesFields.appendChild(div);
      addShowTimeButton.setAttribute('data-index', index + 1); // Update index
    });
  });