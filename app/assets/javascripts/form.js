(function() {
    'use strict';

    $(document).ready(function () {
        var $answerInput = $('#answer'),
            $checkmark = $('.help-scout-form__check'),
            $lengthRequirement = 8;

        $answerInput.focus();

        $answerInput.keyup(function () {
            validateAnswer($(this).val());
        });

        function validateAnswer(input) {
            if (input.length > $lengthRequirement) {
                $checkmark.css('display', 'block');
            } else {
                $checkmark.css('display', 'none');
            }
        }
    });
})();
