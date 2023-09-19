/**
 * 
 */	 
document.addEventListener('DOMContentLoaded', function() {
         // Add event listener to each radio button
         const radioButtons = document.querySelectorAll('.radio-button');
         let selectedRadioButton = null; // Variable to store previously selected radio button

         radioButtons.forEach(radioButton => {
             radioButton.addEventListener('click', () => {
                 // Find the deliverHere div with matching id
                 const deliverHere = document.querySelector(`[data-set='${radioButton.getAttribute('id')}']`);
                 
                 if (deliverHere) {
                     // Remove class from previously selected deliverHere div
                     if (selectedRadioButton) {
                         const previousDeliverHere = document.querySelector(`[data-set='${selectedRadioButton.getAttribute('id')}']`);
                         previousDeliverHere.parentElement.classList.remove('data-find-address');
                     }
                     
                     // Add class to currently selected deliverHere div
                     deliverHere.parentElement.classList.add('data-find-address');
                     selectedRadioButton = radioButton; // Update previously selected radio button
                 }
             });
         });
     });
