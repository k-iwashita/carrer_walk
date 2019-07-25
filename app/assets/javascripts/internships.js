<script>
    function over(obj) {
        $(obj).find('.vuc').css('color', 'lightskyblue');
    }

    function out(obj) {
        $(obj).find('.vuc').css('color', 'black');
    }

    function clk(i) {
        if (i == 0) {
            $('#std').addClass('active');
            $('#intern').removeClass('active');
        } else if (i == 1) {
            $('#std').removeClass('active');
            $('#intern').addClass('active');
        }
    }
</script>
