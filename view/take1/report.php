<div class="container">

<h1>Redovisningar</h1>
<ul>
    <li><a href="#kmom01">kmom01</a>
    <li><a href="#kmom02">kmom02</a>
    <li><a href="#kmom03">kmom03</a>
    <li><a href="#kmom04">kmom04</a>
    <li><a href="#kmom05">kmom05</a>
    <li><a href="#kmom06">kmom06</a>
    <li><a href="#kmom10">kmom07-10</a>
</ul>
<h2 id="kmom01">Kmom01</h2>

<em>Guess the number</em>
<p>Jag är inte säker på varför, men det har tagit lång tid att bli klar med denna uppgift. Har känt mig okoncentrerad på grund av andra saker än skolan, något som förmodligen har bidragit. Det blev mycket repetition av html-formulär med $_POST och $_GET. Att hantera sessions var inte så svårt, det som gjorde övningen svår, tyckte jag, var dess krav på att hantera sessionen i en klass. Jag försökte länge förstå hur det var tänkt att resultatet skulle se ut. Det blev lite för mycket trial and error, frustrerande, men skönt att komma i mål till slut. </p>

<p>Försöker komma ihåg vad nytt jag har lärt. En sak var att session_start() startar en ny session men att den om en session redan är startad, fortsätter denna session. Något annat var att för att skapa en reset-knapp som anropar en funktion, så behöver ’type’ på input-knappen vara ’submit’. Då sänds värdet och man kan fånga upp det i $_POST.</p>

<p>Generellt så kändes det krångligare att använda klasser för att wrappa det som sändes från formuläret. Klassen måste ju skapas på nytt vid varje sidomladdning. Även när man använder $_SESSION måste en instans av klassen Session ju startas om. Jag antar att detta är finurligt och nödvändigt att kunna, men för mig kändes det som om poängen med att använda $_SESSION gick lite förlorad när man vid varje sidomladdning på nytt måste wrappa sessionen i en klass.</p>

<p>Som extrauppgift lade jag till styling för att snygga till det.</p>
<p><a href="http://www.student.bth.se/~magi16/dbwebb-kurser/oophp/me/kmom01/guess/index.php">Guess the number - game</a></p>

<em>Me-sida i Anax-lite</em>
<p>Detta gick betydligt fortare, men mest med tanke på att jag hade jobbat mig igenom den långa övningen
på förhand. Det gäller mest att hålla reda på var någonstans man behöver ändra och lägga till. Ju mer
man jobbar med systemet ju snabbare hittar man rätt.
Jag gjorde egen grid-aktig styling med starka kontrasterande färger.
Som extrauppgift har jag lagt till Cimage, det funkar bra.</p>

<h2 id="kmom02">Kmom02</h2>
<h2 id="kmom03">Kmom03</h2>
<h2 id="kmom04">Kmom04</h2>
<h2 id="kmom05">Kmom05</h2>
<h2 id="kmom06">Kmom06</h2>
<h2 id="kmom10">Kmom07-10</h2>
