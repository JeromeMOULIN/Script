#!/bin/bash

echo ' '
echo ' '
echo '___________________________________'
echo ' '
echo '  Creation des fichiers de votre SW.'
echo 'Vos fichiers seront crée a l emplacement'
echo '  ou vous vous trouvé actuelement.'
echo '___________________________________'
echo ' '
echo '------------------------------------'
echo ' '
echo 'Entrer le nom de votre SW:'
read "nomdeprojet"
echo ' '
echo '------------------------------------'
echo ' '

mkdir "$nomdeprojet"

mkdir ./"$nomdeprojet"/IMAGES

mkdir ./"$nomdeprojet"/CSS
touch ./"$nomdeprojet"/CSS/style.css
/bin/cat <<EOM >"$nomdeprojet"/CSS/style.css
*{
	padding: 0px;
	margin: 0px;
}

/*  A la fin du css basique ( permet de modifier le site web en fonction de la taille de l écran ) */
@media (max-width: XXXpx) {  /* changer le "XXXpx" par la largeur souhaité */
} 
EOM

mkdir ./"$nomdeprojet"/JAVASCRIPT
touch ./"$nomdeprojet"/JAVASCRIPT/script.js

echo 'Voulez créer un SW avec Boostrap? ((y/n)Non est le choix par defaul en cas de reponse incorrect)'
read bootstrap

if [ "$bootstrap" == y ]
then
	mkdir ./"$nomdeprojet"/HTML
	touch ./"$nomdeprojet"/HTML/index.html
	/bin/cat <<EOM >./"$nomdeprojet"/HTML/index.html
	<!DOCTYPE html>
	<html lang="fr">
	<head>
		<meta charset=UTF-8>
		<meta name="viewport" content="width=device-width, initial-scales=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link href="./style.css" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>"$nomdeprojet"</title>
	</head>
	<body>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="./script.js"></script>
	</body>
	</html>
EOM

else

mkdir ./"$nomdeprojet"/HTML
touch ./"$nomdeprojet"/HTML/index.html
/bin/cat <<EOM >./"$nomdeprojet"/HTML/index.html
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset=UTF-8>
	<meta name="viewport" content="width=device-width, initial-scales=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
   	<link href="./style.css" rel="stylesheet">
	<title>"$nomdeprojet"</title>
</head>
<body>


	<script src="./script.js"></script>
</body>
</html>
EOM

fi

echo '________________________________'
echo ' '
echo 'Vos fichiers ont été crée'
echo '________________________________'
