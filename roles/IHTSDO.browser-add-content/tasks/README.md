Browser load:

Manual Process (if running on Windows or wishing to run manually):


Get the:

rf2-json project : 

https://github.com/IHTSDO/rf2-to-json-conversion
git@github.com:IHTSDO/rf2-to-json-conversion.git

org.ihtsdo.json.runners.ConfigRunner
Config (xml) files in config folder - sweden?

processInMemory? - depends on how much memory you have
check defaultTermLangCode

set/check defaultTermDescription & defaultTermLanguageRefset - Swedish & Danish no FSN 

normalizeTextIndex - (create text index json file - normalizes) (true for english)
createCompleteConceptsFile (one file or 2 (concepts & index)?) usually false

effectiveTime - creates the mongo table with that name - MUST Set
expirationTime - add a year to the date
outputFolder  where files written to
foldersBaselineLoad - where to find INTL edition to build against
foldersExtensionLoad - where the extension should be loaded from

Will produce 3 files - concepts.json  manifest.json text-index.json

manifest describes what is in the release e.g. effectivetime, what modules etc.


Run config
Java App -
Program args config/config.xml
VM Args -Xms7500m -Xmx7500m

e.g.

java -Xmx8g -jar rf2-to-json-conversion-1.0-SNAPSHOT-jar-with-dependencies.jar config.xml

zip up the files into a single file for transfer.



go to browser.ihtsdotools.org see which back end server - show the console on the browser go to network (on chrome)   look for ipnumber/api/snomed/

e.g. 192.168.0.1/api/snomed/

Get a list of servers/extensions.
sct-browser-frontend 
https://github.com/IHTSDO/sct-browser-frontend/blob/master/index.html
Question - why hard IP numbers? surely better to use names.

ssh into machine (as root or sudo)
get file onto machine e.g. wget from machine/dropbox

mongo - to get into mongo cli


if no space then may need to drop db
> show dbs
> use uk-edition
> db.dropDatabase()

exit


make sure import.sh is executable:

chmod 777 import.sh

copy import.sh to folder where json is:

cp import.sh ./se/se-edition

cd to folder where json is. 

cd se/se-edition

using :

    <databaseName>se-edition</databaseName>
    <effectiveTime>20141130</effectiveTime>

./import.sh se-edition 20141130



107.170.34.200
https://www.dropbox.com/s/h5a1hrq11cpm58b/se-edition.zip?dl=0

https://github.com/termMed/rf2-to-json-conversion

./import.sh database-name release
e.g.
./import.sh en-edition 20140731


<a class="btn btn-primary btn-lg" role="button" onclick="switchRelease('International Edition 20150131', 'en-edition', 'v20150131', '900000000000509007', 'http://107.170.34.200/api/snomed');switchToFullHeight(404684003, 138875005);"><img src="img/box-logo.png" style="height:20px">&nbsp;&nbsp;&nbsp;<span class="i18n"data-i18n-id="i18n_go_browsing">Go browsing...</span><br><span class="small">International edition<br>January 2015</span></a>


C:\Data\te