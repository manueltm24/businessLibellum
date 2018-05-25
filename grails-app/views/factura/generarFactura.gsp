<!DOCTYPE html>
<html>
<body>
<p id="visits"></p>
<script>
    var visits = parseInt(document.cookie.split("=")[1]);
    if (isNaN(visits)) visits = 0;
    visits++;
    document.cookie = "visits =" + visits;
    document.getElementById("visits").innerHTML = "The page ran " + timesVisited + " times.";
</script>
</body>
</html>