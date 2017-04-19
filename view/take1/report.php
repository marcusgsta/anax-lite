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

<p><em>Guess the number</em></p>
<p>Jag är inte säker på varför, men det har tagit lång tid att bli klar med denna uppgift. Har känt mig okoncentrerad på grund av andra saker än skolan, något som förmodligen har bidragit. Det blev mycket repetition av html-formulär med $_POST och $_GET. Att hantera sessions var inte så svårt, det som gjorde övningen svår, tyckte jag, var dess krav på att hantera sessionen i en klass. Jag försökte länge förstå hur det var tänkt att resultatet skulle se ut. Det blev lite för mycket trial and error, frustrerande, men skönt att komma i mål till slut. </p>

<p>Försöker komma ihåg vad nytt jag har lärt. En sak var att session_start() startar en ny session men att den om en session redan är startad, fortsätter denna session. Något annat var att för att skapa en reset-knapp som anropar en funktion, så behöver ’type’ på input-knappen vara ’submit’. Då sänds värdet och man kan fånga upp det i $_POST.</p>

<p>Generellt så kändes det krångligare att använda klasser för att wrappa det som sändes från formuläret. Klassen måste ju skapas på nytt vid varje sidomladdning. Även när man använder $_SESSION måste en instans av klassen Session ju startas om. Jag antar att detta är finurligt och nödvändigt att kunna, men för mig kändes det som om poängen med att använda $_SESSION gick lite förlorad när man vid varje sidomladdning på nytt måste wrappa sessionen i en klass.</p>

<p>Som extrauppgift lade jag till styling för att snygga till det.</p>
<p><a href="http://www.student.bth.se/~magi16/dbwebb-kurser/oophp/me/kmom01/guess/index.php">Guess the number - game</a></p>

<p><em>Me-sida i Anax-lite</em></p>
<p>Detta gick betydligt fortare, men mest med tanke på att jag hade jobbat mig igenom den långa övningen
på förhand. Det gäller mest att hålla reda på var någonstans man behöver ändra och lägga till. Ju mer
man jobbar med systemet ju snabbare hittar man rätt.
Jag gjorde egen grid-aktig styling med starka kontrasterande färger.
Som extrauppgift har jag lagt till Cimage, det funkar bra.</p>

<p><em>Navigation i Anax-lite</em></p>
<p>Det gick också fint att omvandla en array till html-kod. Jag lade koden
i mappen navbar1. Jag behöll samtidigt en annan navbar (navbar0) som jag gjort tidigare.
Navbaren som skapas dynamiskt är den som syns längst upp på sidan. Vald sida markeras
med en annan färg på typsnittet.</p>

<p><em>MySQL</em></p>
<p>Jag gjorde första tredjedelen av övningarna, och har inte haft några problem hittills. Har också hållit på med MySQL tidigare i andra kurser.</p>

<p>Känns bra att börja på nästa kursmoment, jag antar det blir lite lättare nu när jag har skapat grunden för anax-lite-sidan,
    och kommit in i både PHP på nytt, och att jobba med klasser i PHP.</p>
<h2 id="kmom02">Kmom02 – OO-programmering i PHP</h2>
<p><em>Integrera klassen Session i Anax-Lite</em></p>
<p>Jag dök in i ramverket igen, det blir lite hoppigt in i olika programspråk och ramverk, men säkert en bra övning.
Artikeln tillsammans med föreläsningen förklarade bra hur man skulle göra. Jag startade min session ifrån index.php,
med hjälp av en klass Session med mitt eget namespace. Jag gjorde routes enligt instruktioner, ökade eller minskade numret och
 körde redirect till 'session' där numret visas. Jag lade till en status-route som skriver ut lite info om $_SESSION, och använde också en
dump- och en destroy-route.  </p>
<p><em>Navbar steg 2</em></p>
<p>Här följde jag Kenneths genomgång och det gick fint. Jag behövde inga view-filer, eftersom jag inne i klassen
Navbar skapar html-koden. Jag använder också en config-fil, config/navbar.php, för att sätta routesen.
Jag använder 2 olika navbar, har inte bestämt mig för om jag ska ta bort den ena. Navbaren som använder en config-fil är den
som ligger till höger med tre stora boxiga länkar i starka färger.</p>

<h2 id="kmom03">Kmom03</h2>
<h2 id="kmom04">Kmom04</h2>
<h2 id="kmom05">Kmom05</h2>
<h2 id="kmom06">Kmom06</h2>
<h2 id="kmom10">Kmom07-10</h2>
