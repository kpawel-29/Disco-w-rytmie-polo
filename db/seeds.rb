# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@python = "def pokaz_argumenty(x, y, *args, **kwargs):
    print \"x=%s, y=%s\" % (x, y)
    print \"Argumenty pozycyjne:\",
    for aa in args:
        print aa,
    print
    print \"Argumenty nazwane:\",
    for kk in kwargs:
        print \"%s=%s\" % (kk, kwargs[kk]),
    print

pokaz_argumenty('abc', 123, 456, 'def', k=789, m='ghi')";

@php = "<?php
$a = 5;
$b = 3;

function suma($zmienna1, $zmienna2)
{
    $wynik = $zmienna1 + $zmienna2;
return $wynik; //Dodajemy argumenty i zwracamy wynik
}

echo suma($a, $b); // 8
?>";


@css = "<!DOCTYPE html>
<html>
<head>
<style>
a:link {text-decoration:none;}    /* unvisited link */
a:visited {text-decoration:none;} /* visited link */
a:hover {text-decoration:underline;}   /* mouse over link */
a:active {text-decoration:underline;}  /* selected link */
</style>
</head>

<body>
<p><b><a href=\"default.asp\" target=\"_blank\">This is a link</a></b></p>
<p><b>Note:</b> a:hover MUST come after a:link and a:visited in the CSS
definition in order to be effective.</p>
<p><b>Note:</b> a:active MUST come after a:hover in the CSS definition in order
to be effective.</p>
</body>
</html>
";


7.times do
  Gist.create(snippet: @php,  lang: 'php', description: 'php function');
  Gist.create(snippet: @python, lang: 'python', description: 'python example');

  Gist.create(snippet: @css, lang: 'html', description: 'html example');

end