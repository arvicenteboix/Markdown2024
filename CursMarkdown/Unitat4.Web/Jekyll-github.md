---
# Front matter
# Metainformació del document
title: Creació de pàgines web estàtiques amb markdown.  
titlepage: true
subtitle: Jekyll i github-pages.
author: 
- Ferran Cunyat
- Joan Gerard Camarena
- Jose Alfredo Murcia
lang: ca

# portada
titlepage-rule-height: 2
titlepage-rule-color: AA0000
titlepage-text-color: AA0000
titlepage-background: img/portada.png

# configuració de l'índex
toc-own-page: true
toc-title: Continguts
toc-depth: 2

# capçalera i peu
header-left: \thetitle
header-right: Curs 2021-2022
footer-left: CEFIRE València
footer-right: \thepage/\pageref{LastPage}

# Les figures que apareguen on les definim i centrades
float-placement-figure: H
caption-justification: centering 

# No volem numerar les linies de codi
listings-disable-line-numbers: true

# Configuracions dels paquets de latex
header-includes:

  #  imatges i subfigures
  - \usepackage{graphicx}
  - \usepackage{subfigure}
  - \usepackage{lastpage}
  #  - \usepackage{adjustbox}
  
  # marca d'aigua
  #- \usepackage{draftwatermark}
  #- \SetWatermarkText{\includegraphics{./img/Markdown.png}}
  #- \SetWatermarkText{Per revisar}
  #- \SetWatermarkScale{.5}
  #- \SetWatermarkAngle{20}
   
  # caixes d'avisos 
  - \usepackage{awesomebox}

  # text en columnes
  - \usepackage{multicol}
  - \setlength{\columnseprule}{1pt}
  - \setlength{\columnsep}{1em}

  # pàgines apaïsades
  - \usepackage{pdflscape}
  
  # per a permetre pandoc dins de blocs Latex
  - \newcommand{\hideFromPandoc}[1]{#1}
  - \hideFromPandoc {
      \let\Begin\begin
      \let\End\end
    }
 
# definició de les caixes d'avis
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
...

# Introducció

En este apartat ens centrarem en construir una pàgina web estàtica utilitzant markdown i Jekyll. De nou, l'aspecte de la web vindrà determinat per plantilles, continuant, per tant, en la idea principal del curs, centrar-nos en el contingut i no tant en l'aspecte, que simplement el configurarem una vegada.

Una vegada construït el nostre lloc, l'allotjarem en un repositori de github, per tal que estiga disponible en qualsevol moment simplement accedint a internet.

Abans de començar amb el desenvolupament de l'apartat, explicarem breument què és Jekyll i què és Github.

:::important
Tant git, com github, com jekyll tenen moltes opcions, però ens centrarem sols en la part imprescindible per a allotjar una web senzilla.
:::

## Què és [Jekyll](https://jekyllrb.com/)?

:::note
Jekyll és un generador de llocs web estàtics, pren com a entrada text escrit en markdown i utilitza dissenys predefinits per crear un lloc web estàtic. Podeu modificar l'aspecte del lloc, els enllaços, les dades que es mostren a la pàgina i moltes coses més.
:::

## Què és un sistema de control de versions?

Per a entendre què és Github, necessitem conéixer dos conceptes relacionats:

- Sistema de control de versions
- Git

Un *sistema de control de versions* ajuda els desenvolupadors de contingut a rastrejar i gestionar els canvis que es produïxen en un projecte. És àmpliament utilitzat en el desenvolupament de programari, però el podem aplicar a altres àmbits, com l'àmbit docent, per a gestionar els nostres apunts. 

Anem a veure un exemple ...

Imaginem que som desenvolupadors que col·laborem en el desenvolupament de [WordPress](https://wordpress.com/es/). Si un dels desenvolupadors volgués treballar en una de les parts del codi de WordPress, no seria segur ni eficaç que editra directament el codi font "oficial".

En lloc d'això, el control de versions permet als desenvolupadors treballar amb seguretat mitjançant *ramificacions* i *fusions*.

Amb la ramificació, un desenvolupador duplica el codi font (anomenat repositori) al seu ordinador. Aleshores, el desenvolupador pot fer canvis en aquesta part del codi sense afectar la resta del projecte.

Una vegada el desenvolupador ha provat i aconsegueix que la seua part del codi funcione correctament, pot incloure els seus canvis al projecte, és a dir, fusionar aquest codi amb el codi font principal per fer-lo oficial.

El *sistema de control*, ens permet aleshores veure quins canvis s'han produït, revertir-los, incloure'ls, tornar a una versió anterior, ...

Un altre exemple de control de versions el podem observar en els documents de Google Suite. Per veure les diferents versions que tenim d'un document, podem accedir fent clic a l'enllaç on indica quan s'ha guardat la última modificació que hem fet al document.

![GSuite: obrir control de versions](img/jekyll/control-version-gsuite.png)

Ens apareix una finestra on tenim les diferents versions que s'han anat guardant del document. També podem veure, en verd, què s'ha inclós al document des de les anteriors versions o què s'ha eliminat, esta vegada en verd però amb el text ratllat.

![GSuite: versions de document](img/jekyll/control-version-gsuite-2.png){width=14cm}

### Git

Git és un sistema de control de versions de codi obert creat per Linus Torvalds, el creador del primer kernel de Linux, l'any 2005.

Es diu que Git és un sistema de control de versions distribuït, ja que totes les versions estan disponibles a l'ordinador de cada desenvolupador, cosa que permet ramificar i fusionar molt fàcilment.

Segons una enquesta de desenvolupadors de Stack Overflow, més del 87% dels desenvolupadors utilitzen Git.

## Aleshores, què és [Github](https://github.com/)?

GitHub és una plataforma que ofereix un servei gratuït d'allotjament de repositoris Git basat en núvol. En altres paraules, és una forma d'utilitzar repositoris Git a través de la web.

La interfície de GitHub és molt intuïtiva i fàcil d'utilitzar, i elimina la necessitat d'utilitzar la línia de comandaments per a dur un control de versions. És tan fàcil d'utilitzar, que ha adquirit molta popularitat per a gestionar altres tipus de projectes, com ara escriure llibres, apunts...

Els repositoris que creem a Github poden ser públics i estar disponibles per a qualsevol persona o ser privats, però en aquest cas només seran accessibles pels col·laboradors del repositori.

:::note
Github va entrar en funcionament l'any 2008. 

L'any 2018, Microsoft el va adquirir per 7.500 milions de dòlars.

En Gener del 2020, GitHub tenia més de 40 milions d'usuaris, més de 190 milions de repositoris, 28 milions dels quals són públics.
:::

# Configuració de Github

## Registre d'usuari

En este primer punt, crearem un repositori github per a allotjar la nostra web. 

El primer pas serà registrar-nos a github en cas que no ho estigam ja accedint al següent enllaç [https://github.com/signup?user_email=&source=form-home-signup](https://github.com/signup?user_email=&source=form-home-signup).

:::warning
Fixeu-se que el registre es realitza a través d'un formulari completament integrat en la web amb una estètica molt cuidada
:::

![Registre de github](img/jekyll/github-register.png)

## Creació d'una organització

Una vegada estem registrats a github, iniciem la sessió i creem una nova organització amb el pla gratuït per a allotjar la nostra web. Per fer-ho, a la part de dalt a la dreta tenim l'opció per crear-la.

![Nova organització](img/jekyll/github-new-organization.png)

Per a accedir a les nostres organitzacions en qualsevol moment, ho farem a través del menú de l'usuari.

![Accedir a organització](img/jekyll/github-new-organization-2.png)

:::note
No cal crear una organització per a publicar la pàgina a Github, ja que també es pot publicar com a https://nom_usuari.github.com/nom_repositori. Si preferiu publicar ahí, aneu a l'apartat de *Settings* del repositori i en la pestanya *Pages* ho podreu configurar.
:::

## Creació d'un repositori

Per a crear un repositori, ho fem de forma semblant a la creació d'una organització, però esta vegada seleccionem crear un repositori en compte d'una organització. El fem public i no l'inicialitzem.

:::warning
Fixeu-se que en la creació del repositori ho podem fer sobre el nostre usuari o sobre les nostres organitzacions. Esta vegada utilitzarem la organització que acabem de crear.
:::

![Nou repositori sobre l'organització](img/jekyll/github-new-repository.png)

:::important
Per a poder publicar la nostra web és **imprescindible** que el nom del repositori siga *nom_de_l'organització.github.io*
:::

En l'exemple, l'organització és *proves-jekyll*, per tant, el repositori serà *proves-jekyll.github.io*

## Prova de la publicació

En estos moments ja tindries creada la teua web, però sense contingut. El que podem fer és crear un arxiu index.html per a comprovar que efectivament la nostra web està en funcionament.

Creem un nou document al repositori  que acabem de crear amb el botó *Add file*.

![Afegir document](img/jekyll/create-file.png)

S'obrirà un editor de text on esciurem el contingut que vulgam publicar. Assignem també un nom a l'arxiu.

![Editar index.html](img/jekyll/index.png)

En pocs segons es publicarà la web, a la que podem accedir escrivint a la barra de navegació del navegador web el nom del nostre respositori, *proves-jekyll.github.io* en el cas de l'exemple.

![Prova web](img/jekyll/web-prova.png)

Si la prova ha funcionat, podem eliminar el document *index.html*.

# Creació de la web en local

## Instal·lació de Jekyll i configuració de l'entorn de treball

Per començar instal·larem Jekyll al nostre ordinador.

### Debian, ubuntu i derivats (Lliurex)

Executem sobre l'intèrpret d'ordres els següents comandaments.

```bash
sudo apt-get install ruby-full build-essential
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler
```

Comproveu que *jekyll* s'ha instal·lat correctament:

```code
$ jekyll -v
jekyll 4.2.1
```

### Windows

Per a instal·lar sobre un sistema Windows, tenim disponible un instal·lador a la següent adreça:

[https://rubyinstaller.org/downloads/](https://rubyinstaller.org/downloads/)

Baixeu l'ultima versió que incorpora **Ruby + Devkit** i executeu-la. En l'última pantalla de l'assistent d'instal·lació demana si voleu executar *ridk install*, que per defecte ve marcat per a executar-se. Escolliu l'opció 3 quan vos ho demane per una finestra del *cmd*.

Quan acabe d'instal·lar, obriu un *cmd* i executeu:

```code
gem install jekyll bundler
```

Quan acabe, comproveu que teniu *jekyll* correctament instal·lat.

```code
$ jekyll -v
jekyll 4.2.1
```

### Més informació

Si necessiteu més informació sobre la instal·lació de jekyll, la podeu trobar al següent enllaç [https://jekyllrb.com/docs/installation/](https://jekyllrb.com/docs/installation/)

## Clonació del repositori

El que anem a fer ara és portar el repositori de Github al nostre ordinador per a poder agregar codi, que una vegada provat, tornarem a pujar a Github. 

Per a portar el codi hem de clonar el repositori al nostre disc dur. Utilitzarem la pestanya de control de versions que incorpora el Visual Studio Code per a fer-ho[^1].

[^1]: La clonació també es pot dur a terme amb l'ordre "git clone URL", sempre i quan el git estiga instal·lat al sistema.

![VSCode Clonar Repositori](img/jekyll/clonar-vscode.png){width=3cm}

Ens demanarà el repositori a clonar, ahí peguem la URL del nostre repositori. La podem obtindre del nostre repositori.

\begin{figure}
\centering
\subfigure[Clonar repositori buit]{\includegraphics[width=0.5\linewidth]{./img/jekyll/clonar.png}}
\subfigure[Clonar repositori]{\includegraphics[width=0.3\linewidth]{./img/jekyll/clonar2.png}}
\caption{Clonació de repositoris}
\end{figure}

:::warning
En cas de no tindre git instal·lat, l'opció de clonar el repositori ens apareixerà deshabilitada. 

Es pot instal·lar amb **sudo apt install git** en sistemes basats en Debian.  

En sistemes Windows podeu visitar el següent [enllaç](https://github.com/git-for-windows/git/releases/download/v2.33.1.windows.1/Git-2.33.1-64-bit.exe)
:::

Amb el VSCode obert sobre el directori on tenim clonat el repositori, comprovem que existeix una carpeta oculta `.git`, per exemple fent un `ls -la` a la línia d'ordres.

![Comprovar repositori](img/jekyll/comprovar-repositori.png){width=0.5}

## Posada en funcionament de la web en local

Una vegada comprovat que el repositori està al nostre disc i que el tenim obert al VSCode, anem a crear una pàgina web amb jekyll. Obrim una terminal al VSCode (`Ctrl + \``) i introduim les següents ordres:

```bash
jekyll new .
```

Veureu que a l'explorador del VSCode es crea una estructura de directoris com la de la següent imatge.

![Estructura de directoris Jekyll](img/jekyll/estructura-jekyll.png){width=6cm}

Si volem veure la web al nostre navegador local, executem l'ordre següent. Això ens crea un servidor web al nostre ordinador sobre el port 4000. Accedim a ell fent `Ctrl + clic` sobre el link que ens mostra a la consola o escrivint l'adreça 127.0.0.1:4000 a un navegador web. 

```bash
bundle exec jekyll serve
```

Fem `Ctrl + c` sobre la consola per a parar l'execució del servidor web.

# Publicació a Github

## Afegim arxius al repositori local

Ens queda solament publicar la web que acabem de crear amb jekyll a Github. Per fer això, el que hem de fer és publicar els canvis del repositori local al repositori de github.

El primer pas serà afegir tots els arxius que hem creat amb jekyll al repositori local. Si s'heu fixat a l'explorador del VSCode apareix la lletra U (*untracked*) a l'esquerra de cada arxiu. Això indica que eixe arxiu no està inclòs al repositori. Anem, en la pestanya de l'equerra, a *Source Control* i afegim tots els canvis fent clic a `... -> Changes -> Stage all changes`[^2]. 

[^2]: Si preferiu utilitzar la consola, feu `git add .`.

![Afegim al repositori local](img/jekyll/add.png){width=12cm}

Amb això, veureu que la U ha canviat a A (*added*). En este moment sols ens falta *confirmar* que volem afegir els canvis al repositori. Ho fem fent clic a l'icona de *check* i després escrivim un missatge per a identificar esta confirmació[^3]. 

[^3]: En consola seria `git commit -m "Primera web amb jekyll"`.

![Confirmem els canvis](img/jekyll/commit.png){width=12cm}

Per a evitar que ens fallen els commits, anem a configurar el nostre nom i el nostre correu a la configuració de Git, amb les següents dues ordres, introduint les vostres dades corresponents:

```bash
git config --global user.email "El vostre correu"
git config --global user.name "El vostre nom"
```

Per últim ens falta pujar els arxius a Github.

## Pugem els canvis a Github

Sols ens falta pujar els canvis al repositori en Github per a que la web es publique. Ho fem amb un *Push*[^4].

[^4]: Per als que utilitzeu la consola, seria `git push`.

![Pujar els canvis a Github](img/jekyll/push.png){width=12cm}

El VSCode ens avisarà de que l'extensió Github (ja ve integrada sense necessitat d'instal·lar-la) vol iniciar sessió a Github per a guardar els canvis que hem fet en local. Li donem a permetre i s'iniciarà l'intercanvi del *token* en diversos passos entre el navegador i el VSCode. A partir d'este moment VSCode podrà accedir de forma segura al repositori remot. Si no teniu la sessió iniciada a Github, se us demanarà l'usuari i la contrasenya durant el procés. 

![Registrar-se en Github](img/jekyll/allow.png){width=8cm}

Si tot ha anat bé, veureu en l'apartat de comptes d'usuari (icona de baix a l'esquerra) de VSCode que esteu amb la sessió de Github iniciada i el repositori local s'haurà pujat a Github per a la seua publicació.

![Comptes d'usuari i sessions](img/jekyll/account.png){width=8cm}

Podeu comprovar que els arxius que hem creat en local, estan al nostre respositori web de Github. Aneu a *Settings* i en l'apartat Pages vos indicarà si la pàgina ja està publicada i la seua adreça, que serà **https://nom_organització.github.io**. Comproveu que ja podeu navegar per ella.

:::caution
Els arxius es poden modificar tant per web com en local, però recomanem fer-ho sempre al mateix lloc si no domineu bé el programa de control de versions *git*, ja que poden aparéixer conflictes que s'han de resoldre al modificar en llocs diferents. Si voleu modificar als dos llocs, feu sempre un *Pull* (portar canvia del remot al local) al repositori local abans de fer les modificacions en local i un *Push* (penjar canvis del local al remot) a l'acabar.
:::

\newpage

# Modifiquem el contingut

## Configuració principal

Si s'heu fixat en l'estructura del directori que ens ha creat Jekyll, veureu que té diversos arxius. Anem primer a configurar el lloc a través de l'arxiu **_config.yml**. Us resultarà familiar perquè es tracta d'un arxiu yaml dels que ja hem vist al llarg del curs. Comentarem alguna de les configuracions que hem de modificar, seran:

- title -> (Obligatori) Títol del lloc web
- email -> (Opcional) El vostre correu.
- description -> (Obligatori) Descripció.
- baseurl: "" -> (Obligatori) Ho deixem en blanc si publiquem en una organització, si ho fem a un repositori sobre el nostre usuari, posarem /nom_repositori
- url: "" -> (Obligatori) https://nom_organització.github.io
- twitter_username -> (Opcional) Usuari twitter per als enllaços de xarxessocials.
- github_username -> (Opcional) Usuari Github per als enllaços de xarxessocials

:::note
Per als opcionals podem eliminar la línia, millor que deixar-ho en blanc.
:::

La part del tema recomanem no tocar-la, ja que les nostres pàgines tenen un *layout* ja definit. Si definim als arxius de contingut un layout que no existeix al tema, no es mostrarà res. 

## Tema i *layouts*

El tema mínima ja ve inclòs a Github i instal·lat quan creem una pàgina amb *jekyll new*. La resta de temes disponibles a Github els podeu consultar següent enllaç:  
[https://pages.github.com/themes/](https://pages.github.com/themes/).

- theme: minima

Els layouts són les diferents plantilles per a mostrar els continguts. Mínima inclou els layouts per a *default, home, page i post*. Si voleu canviar alguna cosa dels *layouts* de *minima*, aneu a la [web del tema](https://github.com/jekyll/minima), baixeu el repositori amb *git clone* i copieu-se la carpeta _layouts al vostre repositori. Dins de la carpeta podreu veure i modificar els layouts que ja porta incorporats. Feu les proves sempre en local i després pengeu el resultat final a github.

## Pàgines

Si es fixeu en l'arxiu *about.markdown* veureu que al *front matter* té un layout de pàgina, un títol i un permalink. Això li indica que es renderitzarà utilitzant el layout de pàgina, amb el titol indicat i que el link serà *https://proves-jekyll.github.io/about/* i no *https://proves-jekyll.github.io/about.html*. Després ja ve el contingut, que està en markdown.

Per a crear una nova pàgina, definirem *title:* i *layout: page*. Després insertarem el contingut en format markdown que ja coneixem.

```yaml
---
layout: home
title: Benvinguts a la web del curs de Markdown per a la creació de recursos
---
```

## Posts

A la carpeta _posts és on estan definits els posts. Per crear un post, hem de crear un arxiu amb la següent nomenclatura ANY-MES-DIA-titol.md. Per exemple:

2021-10-28-benvinguts-a-jekyll.markdown

Al front matter definim el títol, el layout, les categoris (opcional) i la data. Després insertem el contingut en markdown.

```yaml
---
layout: post
title:  "Benvingut a Jekyll!"
date:   2021-10-30 10:47:54 +0200
categories: jekyll
---
```

## Enllacem arxius locals a la web

Per a enllaçar arxius i posar-los a disposició dels usuaris de la nostra web utilitzarem les [variables de Jekyll](https://jekyllrb.com/docs/variables/). En este cas la que ens interessa és ***site.url***, però pots utilitzar altres per a diferents usos.

### Pengem arxius per a descàrrega 

Crearem una carpeta on allotjar els fitxers disponibles per a descàrrega i els enllaçarem amb un *link*. En el lloc web d'exemple, hem penjat un arxiu *2021-10-31-arxius-per-a-descarrega.pdf* a la carpeta *download*. Conté el contingut del post però en pdf. Així, per a enllaçar des d'un post o una pàgina quedaria com a continuació:

```md
---
layout: post
title: "Descarreguem arxius!"
date: 2021-10-31 11:31 +0200
categories: jekyll
---

## Descarrega d'arxius en Jekyll

Fes clic [ací]({{ site.url }}/download/2021-10-31-arxius-per-a-descarrega.pdf) per descarregar l'arxiu.
```

### Insertem imatges locals

Per a insertar imatges allotjades a una web simplement posem l'enllaç a la web externa, però si es tracta d'imatges locals, actuarem igual que en l'apartat anterior. Creem una carpeta on allotjar els nostres recursos i l'enllaçarem.

A la web d'exemple, hem creat una estructura de carpetes:

```
.
├── resources
    └── img
```

Hem allotjat dins una imatge i hem creat un post molt simple amb la imatge enllaçada:

```md
---
layout: post
title: "Imatges!"
date: 2021-10-31 11:45 +0200
categories: jekyll
---

## Insertem imatges locals

![Imatge de prova](/resources/img/portada.png)
```

## Canviem l'aspecte

A banda de poder canviar l'aspecte de la web a través del tema , que insistim  en no canviar fins que no dominem més les ferramentes, també podem canviar el fulls d'estils incorporant codi CSS o SASS. Teniu més informació al següent enllaç [https://jekyllrb.com/docs/assets/](https://jekyllrb.com/docs/assets/).


# Construim el lloc web completament

També tenim l'opció de construir un lloc completament funcional per poder-lo penjar a qualsevol altre servidor web, per exemple a Aules o Moodle. Per fer-ho, la única cosa que hem de fer és executar l'ordre:

```bash
jekyll build
```

Quan acabe d'executar-e veureu que jekyll ha creat una carpeta _site. Es tracta d'un lloc completament funcional que podeu penjar. Per fer-ho, comprimiu la carpeta a un arxiu .zip i el pengeu a aules, sense tancar la finestra de pujar l'arxiu, feu clic i a descomprimir. Després definu *index.html* com a arxiu principal[^5].

[^5]Mireu el final del vídeo on s'explica *Hugo* per a veure com es fa si teniu dubtes.

# Formes de treballar

Ja hem vist que construir la web tant en local com a github és molt senzill. Aleshores, recomanem treballar en local, agregar els canvis al repositori local i executar el servidor local. Comprovar que el resultat és el desitjat i en cas de ser-ho, penjar-ho al repositori de Github. Posteriorment, comprovar el resultat a Github. 

Si es tracta solament d'afegir o modificar una pàgina o un post es pot fer directament online perquè és extremadament fàcil i es pot fer des de qualsevol lloc amb accés a internet sense la necessitat de instal·lar res, però recordeu fer un *Pull* abans de començar a treballar en local la següent vegada.

Podeu utilitzar el control de versions per a tirar enrere alguns canvis, provar canvis a noves branques, etc. Esta part quedaria fora de l'abast del curs, però ho pots aprofitar si ja coneixes el funcionament de Git.

Podeu veure la pàgina web que hem creat com a exemple a l'adreça [https://proves-jekyll.github.io/](https://proves-jekyll.github.io/).

També la podreu veure al moodle del cefire (hem pujat _site tal com s'explica a este document i al vídeo de *Hugo*).

\newpage
# Resum

1. Creem usuari a github
2. Creem un lloc local amb `jekyll new`.
3. Servim el lloc construit amb `bundle exec jekyll serve`.
4. Fem les modificacions en local i mirem el resultat a `http://127.0.0.1:4000/`.
5. Pugem els canvis a Github i mirem el resultat en remot a `https://*organització*.github.io/`.ç  
6. Si voleu penjar a aules construim el lloc amb `jekyll build`.  
   1. Comprimim `_site` i el pengem com a arxiu a aules/moodle.
   2. Descomprimim i marquem `index.html` com a arxiu principal.