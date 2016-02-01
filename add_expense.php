<?php
session_start();
if (!isset($_SESSION['isLogged'])) {
	header("Location: login.php");
	exit();
}
$errors=array();
$success = false;
require 'expensesDB.php';
?>
<html>
<head>
	<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="js/javascript.js"></script>
	<title></title>
</head>
<body>
	<div class="mymenu">
    </div>
    <div class="add-container">
		<?php if ($_SERVER['REQUEST_METHOD'] == 'POST') : ?>
	        <?php
	            $expense = new ExpensesDB();
	            $errors = $expense->insert($_POST);
	        ?>
	        <?php if (count($errors) == 0) : ?>
	            <?php $success=true ?>
	        <?php endif; ?>
	    <?php endif; ?>

		<form method="post" action="">
			<div class="add-item">
				<label for="type_expense"> Изберете тип разход</label><br>
				<select class="info" name="type_expense">
				    <option value="food"> Храна </option>
				  	<option value="fuel"> Гориво </option>
				  	<option value="entertainment"> Забавление </option>
				  	<option value="education"> Образование </option>
				  	<option value="other"> Други </option>
				</select></br>
				<label  for="value"> Добавете разход </label><br>
				<input  class="info" type="text" name="value" value="<?= isset($_SESSION['value']) ? $_SESSION['value'] : '' ?>"><br>
			 	<?php if (isset($errors['value'])) : ?>
					<p>
	 					<?= $errors['value']; ?>
			       	</p>
		    	<?php endif; ?>
			 	<input class="form-submit" type="submit" value="Добавяне">
			 	<?php if($success): ?>
			 		<p> Успешно добавени </p>
			 	<?php endif; ?>
		    </div>
		</form>
	</div>
</body>
</html>