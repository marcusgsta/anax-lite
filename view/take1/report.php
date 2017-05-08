<div class="container">
    <?= isset($app->user_logged_in) ? $app->user_logged_in : "";?>

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
som ligger till höger med fyra box-länkar i starka färger.</p>

<p><em>Månadskalender</em></p>
<p>Jag gjorde min kalender med klasser och uppfyller de grundläggande kraven.
Klasserna jag avänder är Calendar, Month och Week. Det mesta sköts i Calendar,
vilkas metoder jag anropar från routen calendar, eller ifrån vyn calendar. Om jag
hade jobbat längre på uppgiften skulle jag gärna ha reducerat uträkningarna i vyn i större grad.
 Jag gjorde också den första extrauppgiften, och lade till en ny bild för varje månad. Man kan navigera
mellan månaderna, samtliga datum i månaden visas, de resterande dagarna från tidigare månad är skuggade. Längst
upp visas veckodagarna och med hjälp av CSS gjorde jag söndagarna röda.</p>
<p>Det var en rolig uppgift, och lagom utmanande. Jag visste inte alls hur jag skulle göra, men skrev ner mina funderingar
a la rubber duck - metoden, och då kändes det lite klarare vad jag behövde. Med hjälp av php:s datumfunktioner hämtade jag antal dagar i varje
månad och lagrade dem arrayer i en array för hela året. Vet inte om det var bästa sättet men det gick att arbeta med, och det hela lossnade
efterhand. Jag fixade också så att dagens datum visas i grönt. </p>

<p>Ju mer jag arbetar med ramverket ju mer välbekant blir det, och ju lättare blir det
att hitta rätt bland filer. Jag har blivit bättre på att se ramverkets struktur, och
tycker det går smidigare nu. Jag organiserar mina vyer i kataloger, 'take1' för de grundläggande, 'session',
'navbar1', och 'calendar'. </p>
<p><em>MySQL</em></p>

<p>Jag gjorde uppgifterna 7 - 11 i MySQL. Några nya områden/kommandon för mig,
    som HAVING, att arbeta med vyer, och strängfunktioner.
Jag har använt MySQL tidigare, men känt mig osäker på mer avancerade kommandon. Känns bra att få lära
mig mer här. När man har mer koll på MySQL kan man nog skriva bättre strukturerad kod, då man flyttar över kod ifrån
PHP till MySQL.
</p>

<h2 id="kmom03">Kmom03</h2>
<p><em>Inloggning till Anax_lite</em></p>
<p>Med hjälp av composer installerade jag database-modulen. Denna använde jag tillsammans med session,
och en ny klass som jag kallar Access(). I den sistnämnda samlar jag allt som har med tillgång att göra.
Där finns metoder som sköter ändring av lösenord och att lägga till en ny användare.
Jag skapade en katalog 'login' för vyer och filer som används som har med det samma att göra. Jag behövde också
skapa routes till de nya vyerna. Lösenorden krypteras, och när man är inloggad
kan man se sin profilsida, där man kan ändra lösenord och lägga till en gravatar. Jag
använder tjänsten på Gravatar.com för enkelhetens skull. På profilsidan visas innehållet i en
cookie som sätts i frontcontrollern. SQL-koden för att skapa tabellen user finns
i en fil /sql/setup-user.sql, så att man ska kunna skapa tabellerna på nytt om man
till exempel behöver migrera webbplatsen till ny server. </p>
<p><em>Admin gränssnitt för hantering av användare och konton</em></p>
<p>Äntligen färdig med denna del. Det var en del nya saker, blandat med sånt som jag gjort förut.
Jag sparade SQL-koden i user-admin.sql, utökade tabellen user som jag redan använt med
id för att lättare kunna jämföra databasrader, och role med värdena 0 och 1, för användare / administratör.
När man når admin-sidan visas alla användarkonton, med dess id, namn, eventuell gravatar och roll. Man kan söka
efter användare, ändra, lägga till och ta bort användare. Det blev en del testande och felsökning, för att det skulle fungera både
på server och lokalt. Men smidigt att bara ändra i config-filen när jag byter mellan olika databaser. </p>
<p>Jag använder mig av klasser och har integrerat i ramverket. Det har tagit tid och om jag kunde lägga mer tid på det
så hade jag velat ta kod ifrån vyerna och lägga lite mer i antingen klasserna, frontcontrollern eller routerna. Men
det fungerar och har betydligt bättre strukturerad kod än vad jag kunde åstadkomma för några månader sedan. Nöjd med det.</p>
<p>Jag committade till sist och lade upp koden på Github.</p>

<p><em>MySQL</em></p>
<p>Jag gjorde uppgifterna 12 - XX .</p>

<h2 id="kmom04">Kmom04</h2>
<h2 id="kmom05">Kmom05</h2>
<h2 id="kmom06">Kmom06</h2>
<h2 id="kmom10">Kmom07-10</h2>
