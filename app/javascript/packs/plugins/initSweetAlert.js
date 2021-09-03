import Swal from "sweetalert2";

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector('#sweet-alert-demo');
  let quantity = document.getElementById('quantity').innerText;
  if (swalButton) {
    // protect other pages
    swalButton.addEventListener("click", (event) => {
      event.preventDefault();
      let quantityConverted = parseInt(quantity, 10);
      console.log(quantityConverted);
      // swal(options);
      Swal.fire({
        title: "Do you wanna buy this sock?",
        text: `There are just ${quantityConverted} left`,
        icon: "question",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, buy now!",
      }).then((result) => {
        if (result.isConfirmed) {
          // Swal.fire(
          //   "Sock Bought!",
          //   "You'll receive a message from the owner soon!",
          //   "success"
          // );
          document.querySelector('#new_booking').submit();
        }
      });
    });
  }
};

export { initSweetalert };
