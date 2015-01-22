<script>
	function doc(id)
	{
		return document.getElementById(id);
	}

	function validaCampos()
	{
		/*Validação de TextBoxs do Formulário*/
		
		var campos = ["title", "description", "expiration_date", "job_local"];
		var	status = ["Ativa", "Desativada", "Cancelada"];
		
		for(c = 0; c <= campos.length; c++)
		{
			if(doc(campos[c]).value == "")
			{
				/*alert("Campo de preenchimento obrigatório!");*/
				doc(campos[c]).setCustomValidity("Campo de preenchimento obrigatório!");
				
				return false;
			}
		}
		
		
		/*Validação de DropDownList do Formulário*/
		
		for(s = 0; s <= status.length; s++)
		{
			if(doc("Status") != status[s])
			{
				/*alert("Preenchimento de campo inválido!");*/
				doc(campos[s]).setCustomValidity("Preenchimento de campo inválido!");
				
				return false;
			}
		}
	}
</script>